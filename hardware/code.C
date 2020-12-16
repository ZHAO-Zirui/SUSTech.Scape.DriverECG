//手机心电图开发板单片机程序
//测试单片机：STC15W408AS
//下载时工作频率选11.0592MHz


#include "reg51.h"
#include "intrins.h"

#define FOSC    11059200L
#define BAUD    9600

sbit AD8232SDN = P2^5;		  //SDN
sbit AD8232LOL = P2^4;		  //LO+
sbit AD8232LOR = P2^3;		  //LO-

typedef unsigned char BYTE;
typedef unsigned int uint;	
BYTE adcch;// ADC通道
bit fs;	   //是否发送

#define     URMD    0           //0:使用定时器2作为波特率发生器
                                //1:使用定时器1的模式0(16位自动重载模式)作为波特率发生器
                                //2:使用定时器1的模式2(8位自动重载模式)作为波特率发生器

sfr T2H   = 0xd6;               //定时器2高8位
sfr T2L   = 0xd7;               //定时器2低8位


sfr P1M1 = 0x91;    
sfr P1M0 = 0x92;    
sfr P0M1 = 0x93;
sfr P0M0 = 0x94;
sfr P2M1 = 0x95;
sfr P2M0 = 0x96;
sfr P3M1 = 0xB1;
sfr P3M0 = 0xB2;
sfr P4M1 = 0xB3;
sfr P4M0 = 0xB4;
sfr P5M1 = 0xC9;
sfr P5M0 = 0xCA;
sfr P6M1 = 0xCB;
sfr P6M0 = 0xCC;
sfr P7M1 = 0xE1;
sfr P7M0 = 0xE2;

sfr  AUXR       =   0x8e;       //辅助寄存器                              

sfr ADC_CONTR   =   0xBC;           //ADC控制寄存器
sfr ADC_RES     =   0xBD;           //ADC高8位结果
sfr ADC_LOW2    =   0xBE;           //ADC低2位结果
sfr P1ASF       =   0x9D;           //P1口第2功能控制寄存器

#define ADC_POWER   0x80            //ADC电源控制位
#define ADC_FLAG    0x10            //ADC完成标志
#define ADC_START   0x08            //ADC起始控制位
#define ADC_SPEEDLL 0x00            //540个时钟
#define ADC_SPEEDL  0x20            //360个时钟
#define ADC_SPEEDH  0x40            //180个时钟
#define ADC_SPEEDHH 0x60            //90个时钟

void InitUart();
void InitADC();
void SendData(BYTE dat);
BYTE GetADCResult(BYTE ch);
uint GetADC(BYTE ch); 
void Timer0Init();
void Delay(uint n);


void main()
{
    P0M0 = 0x00;
    P0M1 = 0x00;
    P1M0 = 0x00;
    P1M1 = 0x00;
    P2M0 = 0x00;
    P2M1 = 0x00;
    P3M0 = 0x00;
    P3M1 = 0x00;
    P4M0 = 0x00;
    P4M1 = 0x00;
    P5M0 = 0x00;
    P5M1 = 0x00;
    P6M0 = 0x00;
    P6M1 = 0x00;
    P7M0 = 0x00;
    P7M1 = 0x00;

    InitUart();                     //初始化串口
	Timer0Init();				   //初始化定时器0
	
	
    InitADC();                      //初始化ADC
	adcch=0;						//选择ADC通道0，即P1.0
	AD8232SDN=1; 					//SDN=0，AD8232进入休眠状态
	TI=1;

	//主循环作用就是每17毫秒转换一次ADC并通过串口发送，由定时器0计时，要比软件延时精确
    while (1)
    {
		 if(fs){		 
		     fs=0;
			 SendData(GetADCResult(adcch));	//读取ADC结果并发送	  
		 }		 
		 _nop_();_nop_();_nop_();_nop_();	
    }
}




/*----------------------------
读取ADC结果	 只要高8位
----------------------------*/
BYTE GetADCResult(BYTE ch)
{
    ADC_CONTR = ADC_POWER | ADC_SPEEDLL | ch | ADC_START;
    _nop_();                        //等待4个NOP
    _nop_();
    _nop_();
    _nop_();
    while (!(ADC_CONTR & ADC_FLAG));//等待ADC转换完成
    ADC_CONTR &= ~ADC_FLAG;         //Close ADC

    return ADC_RES;                 //返回ADC结果		 只要了高位，相当于8位ADC，0-255
}

/*----------------------------
读取ADC结果	 10位
----------------------------*/
uint GetADC(BYTE ch)
{
    ADC_CONTR = ADC_POWER | ADC_SPEEDLL | ch | ADC_START;
    _nop_();                        //等待4个NOP
    _nop_();
    _nop_();
    _nop_();
    while (!(ADC_CONTR & ADC_FLAG));//等待ADC转换完成
    ADC_CONTR &= ~ADC_FLAG;         //Close ADC

    return ADC_RES*4+ADC_LOW2;                 //返回ADC结果
}

/*----------------------------
初始化串口
----------------------------*/

void InitUart()		//19200bps@11.0592MHz
{
	SCON = 0x50;		//8位数据,可变波特率
	AUXR |= 0x01;		//串口1选择定时器2为波特率发生器
	AUXR |= 0x04;		//定时器2时钟为Fosc,即1T
	T2L = 0x70;		//设定定时初值
	T2H = 0xFF;		//设定定时初值
	AUXR |= 0x10;		//启动定时器2
}



/*----------------------------
初始化ADC
----------------------------*/
void InitADC()
{
    P1ASF = 0xff;  //0xff;                   //设置P1口为AD口
    ADC_RES = 0;                    //清除结果寄存器
    ADC_CONTR = ADC_POWER | ADC_SPEEDLL;
    Delay(2);                       //ADC上电并延时
}



/*----------------------------
发送串口数据
----------------------------*/
void SendData(BYTE dat)
{
    while (!TI);                    //等待前一个数据发送完成
    TI = 0;                         //清除发送标志
	SBUF = dat;                     //发送当前数据    
}



/*----------------------------
定时器0初始化
----------------------------*/
 void Timer0Init()		//17毫秒@11.0592MHz
{
	AUXR &= 0x7F;		//定时器时钟12T模式
	TMOD &= 0xF0;		//设置定时器模式
	TL0 = 0xCD;		//设置定时初值
	TH0 = 0xC2;		//设置定时初值
	TF0 = 0;		//清除TF0标志
	TR0 = 1;		//定时器0开始计时
	ET0 = 1;       //允许定时器0中断
	EA = 1;
}


void tm0_isr() interrupt 1 using 1
{
   //定时器到执行这里
   fs=1;
}

/*----------------------------
软件延时
----------------------------*/
void Delay(uint n)
{
    uint x;

    while (n--)
    {
        x = 5000;
        while (x--);
    }
}