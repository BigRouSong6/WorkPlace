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
    //2.创建socket对象
  Client := socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
    //3.组装IP和端口信息
  WITH ServerAddr DO
  BEGIN
    sin_family := PF_INET;
    //端口号
    sin_port := StrToInt(EditPort.Text);
    //本机所有可能的IP作为服务器的IP
    sin_addr.S_addr := inet_addr(PAnsiChar(AnsiString(EditAddr.Text)));
  END;

    //4.连接服务器
  ConnectResult := connect(Client, TSockAddr(ServerAddr), SizeOf(ServerAddr));
  IF ConnectResult <> 0 THEN
  BEGIN
    MemoLog.Lines.Add('连接失败！');
    Exit
  END;

  btnConnection.Enabled := False;

  //接受服务器数据
  RecvResult := recv(Client, RecvContent, 1024, 0);
  IF RecvResult > 0 THEN
  BEGIN
    MemoRecord.Lines.Add(RecvContent)
  END;

END;

PROCEDURE TFormClient.FormClose(Sender: TObject; VAR Action: TCloseAction);
BEGIN
     //关闭socket对象
  IF Client <> INVALID_SOCKET THEN
  BEGIN
    closesocket(Client);
  END;
     //清理版本库信息
  IF WSACleanup = SOCKET_ERROR THEN
  BEGIN
    ShowMessage('清理版本库失败');
  END;

END;

PROCEDURE TFormClient.FormCreate(Sender: TObject);
CONST
    //网络库版本号
  WINSOCKET_VERSION = $0202;
VAR
  WSAData: TWSAData;
BEGIN
  //1.初始化网络库
  IF WSAStartup(WINSOCKET_VERSION, WSAData) <> 0 THEN
  BEGIN
    FormClient.Caption := '网络库加载失败';
  END;

END;

END.

