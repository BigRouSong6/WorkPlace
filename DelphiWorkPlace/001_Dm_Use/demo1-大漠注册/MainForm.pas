UNIT MainForm;

INTERFACE

USES
  Dm_TLB, uUtools, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls;

TYPE
  TForm1 = CLASS(TForm)
    btn1: TButton;
    PROCEDURE btn1Click(Sender: TObject);
    PROCEDURE FormCreate(Sender: TObject);
    PROCEDURE FormDestroy(Sender: TObject);
  PRIVATE
    { Private declarations }
  PUBLIC
    { Public declarations }
  END;

VAR
  Form1: TForm1;

IMPLEMENTATION

{$R *.dfm}

PROCEDURE TForm1.btn1Click(Sender: TObject);
VAR
  dmhdl: THandle;
  mydm: Idmsoft;  //������һ����Į���͵Ķ���
BEGIN
  dmhdl := LoadLibrary('dm.dll');
  IF dmhdl < 32 THEN
  BEGIN
    ShowMessage('��ʼ��ʧ��'#13'��������Ŀ¼���Ƿ���dm.dll�ļ�');
    Exit
  END
  ELSE
  BEGIN
    mydm := CreateComObjectFromDll(CLASS_dmsoft, dmhdl) AS Idmsoft;
    ShowMessage('��ʼ���ɹ� ����汾:' + mydm.Ver);
    mydm := nil;
  END;
END;

PROCEDURE TForm1.FormCreate(Sender: TObject);
BEGIN
  OLERegister('./dm.dll', 1); //ע�ắ�������崴��ע��һ��
END;

PROCEDURE TForm1.FormDestroy(Sender: TObject);
BEGIN
  OLERegister('./dm.dll', 1); //ע�ắ������������ע��һ��
END;

END.

