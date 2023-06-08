UNIT ClientFrm;

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

TYPE
  TFormClient = CLASS(TForm)
    btnConnection: TButton;
    mmoConteny: TMemo;
    MemoRecord: TMemo;
    MemoLog: TMemo;
    GroupBox1: TGroupBox;
    ButtonSend: TButton;
    EditAddr: TEdit;
    EditPort: TEdit;
    LabelAddr: TLabel;
    LabelPort: TLabel;
    PROCEDURE btnConnectionClick(Sender: TObject);
    PROCEDURE FormCreate(Sender: TObject);
    PROCEDURE FormClose(Sender: TObject; VAR Action: TCloseAction);
  PRIVATE
    { Private declarations }
  PUBLIC
    { Public declarations }
  END;

VAR
  FormClient: TFormClient;

IMPLEMENTATION

USES
  Winapi.Winsock2, System.Win.ScktComp;

VAR
  ConnectResult, Client: TSocket;
{$R *.dfm}

PROCEDURE TFormClient.btnConnectionClick(Sender: TObject);
VAR
  ServerAddr: TSockAddrIn;
  RecvContent: ARRAY[0..1023] OF Char;
  RecvResult: Integer;
BEGIN
    //2.����socket����
  Client := socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
    //3.��װIP�Ͷ˿���Ϣ
  WITH ServerAddr DO
  BEGIN
    sin_family := PF_INET;
    //�˿ں�
    sin_port := StrToInt(EditPort.Text);
    //�������п��ܵ�IP��Ϊ��������IP
    sin_addr.S_addr := inet_addr(PAnsiChar(AnsiString(EditAddr.Text)));
  END;

    //4.���ӷ�����
  ConnectResult := connect(Client, TSockAddr(ServerAddr), SizeOf(ServerAddr));
  IF ConnectResult <> 0 THEN
  BEGIN
    MemoLog.Lines.Add('����ʧ�ܣ�');
    Exit
  END;

  btnConnection.Enabled := False;

  //���ܷ���������
  RecvResult := recv(Client, RecvContent, 1024, 0);
  IF RecvResult > 0 THEN
  BEGIN
    MemoRecord.Lines.Add(RecvContent)
  END;

END;

PROCEDURE TFormClient.FormClose(Sender: TObject; VAR Action: TCloseAction);
BEGIN
     //�ر�socket����
  IF Client <> INVALID_SOCKET THEN
  BEGIN
    closesocket(Client);
  END;
     //����汾����Ϣ
  IF WSACleanup = SOCKET_ERROR THEN
  BEGIN
    ShowMessage('����汾��ʧ��');
  END;

END;

PROCEDURE TFormClient.FormCreate(Sender: TObject);
CONST
    //�����汾��
  WINSOCKET_VERSION = $0202;
VAR
  WSAData: TWSAData;
BEGIN
  //1.��ʼ�������
  IF WSAStartup(WINSOCKET_VERSION, WSAData) <> 0 THEN
  BEGIN
    FormClient.Caption := '��������ʧ��';
  END;

END;

END.

