//�ֻ��ĵ�ͼ�����嵥Ƭ������
//���Ե�Ƭ����STC15W408AS
//����ʱ����Ƶ��ѡ11.0592MHz


#include "reg51.h"
#include "intrins.h"

#define FOSC    11059200L
#define BAUD    9600

sbit AD8232SDN = P2^5;		  //SDN
sbit AD8232LOL = P2^4;		  //LO+
sbit AD8232LOR = P2^3;		  //LO-

typedef unsigned char BYTE;
typedef unsigned int uint;	
BYTE adcch;// ADCͨ��
bit fs;	   //�Ƿ���

#define     URMD    0           //0:ʹ�ö�ʱ��2��Ϊ�����ʷ�����
                                //1:ʹ�ö�ʱ��1��ģʽ0(16λ�Զ�����ģʽ)��Ϊ�����ʷ�����
                                //2:ʹ�ö�ʱ��1��ģʽ2(8λ�Զ�����ģʽ)��Ϊ�����ʷ�����

sfr T2H   = 0xd6;               //��ʱ��2��8λ
sfr T2L   = 0xd7;               //��ʱ��2��8λ


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

sfr  AUXR       =   0x8e;       //�����Ĵ���                              

sfr ADC_CONTR   =   0xBC;           //ADC���ƼĴ���
sfr ADC_RES     =   0xBD;           //ADC��8λ���
sfr ADC_LOW2    =   0xBE;           //ADC��2λ���
sfr P1ASF       =   0x9D;           //P1�ڵ�2���ܿ��ƼĴ���

#define ADC_POWER   0x80            //ADC��Դ����λ
#define ADC_FLAG    0x10            //ADC��ɱ�־
#define ADC_START   0x08            //ADC��ʼ����λ
#define ADC_SPEEDLL 0x00            //540��ʱ��
#define ADC_SPEEDL  0x20            //360��ʱ��
#define ADC_SPEEDH  0x40            //180��ʱ��
#define ADC_SPEEDHH 0x60            //90��ʱ��

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

    InitUart();                     //��ʼ������
	Timer0Init();				   //��ʼ����ʱ��0
	
	
    InitADC();                      //��ʼ��ADC
	adcch=0;						//ѡ��ADCͨ��0����P1.0
	AD8232SDN=1; 					//SDN=0��AD8232��������״̬
	TI=1;

	//��ѭ�����þ���ÿ17����ת��һ��ADC��ͨ�����ڷ��ͣ��ɶ�ʱ��0��ʱ��Ҫ��������ʱ��ȷ
    while (1)
    {
		 if(fs){		 
		     fs=0;
			 SendData(GetADCResult(adcch));	//��ȡADC���������	  
		 }		 
		 _nop_();_nop_();_nop_();_nop_();	
    }
}




/*----------------------------
��ȡADC���	 ֻҪ��8λ
----------------------------*/
BYTE GetADCResult(BYTE ch)
{
    ADC_CONTR = ADC_POWER | ADC_SPEEDLL | ch | ADC_START;
    _nop_();                        //�ȴ�4��NOP
    _nop_();
    _nop_();
    _nop_();
    while (!(ADC_CONTR & ADC_FLAG));//�ȴ�ADCת�����
    ADC_CONTR &= ~ADC_FLAG;         //Close ADC

    return ADC_RES;                 //����ADC���		 ֻҪ�˸�λ���൱��8λADC��0-255
}

/*----------------------------
��ȡADC���	 10λ
----------------------------*/
uint GetADC(BYTE ch)
{
    ADC_CONTR = ADC_POWER | ADC_SPEEDLL | ch | ADC_START;
    _nop_();                        //�ȴ�4��NOP
    _nop_();
    _nop_();
    _nop_();
    while (!(ADC_CONTR & ADC_FLAG));//�ȴ�ADCת�����
    ADC_CONTR &= ~ADC_FLAG;         //Close ADC

    return ADC_RES*4+ADC_LOW2;                 //����ADC���
}

/*----------------------------
��ʼ������
----------------------------*/

void InitUart()		//19200bps@11.0592MHz
{
	SCON = 0x50;		//8λ����,�ɱ䲨����
	AUXR |= 0x01;		//����1ѡ��ʱ��2Ϊ�����ʷ�����
	AUXR |= 0x04;		//��ʱ��2ʱ��ΪFosc,��1T
	T2L = 0x70;		//�趨��ʱ��ֵ
	T2H = 0xFF;		//�趨��ʱ��ֵ
	AUXR |= 0x10;		//������ʱ��2
}



/*----------------------------
��ʼ��ADC
----------------------------*/
void InitADC()
{
    P1ASF = 0xff;  //0xff;                   //����P1��ΪAD��
    ADC_RES = 0;                    //�������Ĵ���
    ADC_CONTR = ADC_POWER | ADC_SPEEDLL;
    Delay(2);                       //ADC�ϵ粢��ʱ
}



/*----------------------------
���ʹ�������
----------------------------*/
void SendData(BYTE dat)
{
    while (!TI);                    //�ȴ�ǰһ�����ݷ������
    TI = 0;                         //������ͱ�־
	SBUF = dat;                     //���͵�ǰ����    
}



/*----------------------------
��ʱ��0��ʼ��
----------------------------*/
 void Timer0Init()		//17����@11.0592MHz
{
	AUXR &= 0x7F;		//��ʱ��ʱ��12Tģʽ
	TMOD &= 0xF0;		//���ö�ʱ��ģʽ
	TL0 = 0xCD;		//���ö�ʱ��ֵ
	TH0 = 0xC2;		//���ö�ʱ��ֵ
	TF0 = 0;		//���TF0��־
	TR0 = 1;		//��ʱ��0��ʼ��ʱ
	ET0 = 1;       //������ʱ��0�ж�
	EA = 1;
}


void tm0_isr() interrupt 1 using 1
{
   //��ʱ����ִ������
   fs=1;
}

/*----------------------------
������ʱ
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