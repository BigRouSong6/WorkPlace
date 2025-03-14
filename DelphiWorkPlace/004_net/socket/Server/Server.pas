UNIT Server;

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

TYPE
  TForm1 = CLASS(TForm)
    ButtonSendServer: TButton;
    ButtonStartServer: TButton;
    MemoLog: TMemo;
    PROCEDURE FormCreate(Sender: TObject);
    PROCEDURE ButtonStartServerClick(Sender: TObject);
  PRIVATE
    { Private declarations }
  PUBLIC
    { Public declarations }
  END;

VAR
  Form1: TForm1;

IMPLEMENTATION

USES
  Winapi.Winsock2, System.Win.ScktComp;

VAR
  Sever: TSocket;

{$R *.dfm}

PROCEDURE TForm1.ButtonStartServerClick(Sender: TObject);
VAR
  ServerAddr: TSockAddrIn;
  AddrSize: Integer;
  ClientSocket: TSocket;
  CustomWinSocket: TCustomWinSocket;
  Result_Send: integer;
BEGIN
//创建Socket对象
  Sever := socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
  IF Sever = INVALID_SOCKET THEN
  BEGIN
    ShowMessage('创建服务器失败')
  END;
  MemoLog.Lines.Add('服务器创建成功');

//组装IP地址SockAddr
  WITH ServerAddr DO
  BEGIN
    sin_family := PF_INET;
    sin_port := 10086;
    //本机所有可能的IP    INADDR_ANY
    sin_addr.S_addr := inet_addr('127.0.0.1')
  END;


//绑定端口和IP
  IF bind(Sever, TSockAddr(ServerAddr), SizeOf(SockAddr)) <> 0 THEN
  BEGIN
    MemoLog.Lines.Add('端口号被占用');
    Exit
  END;
  MemoLog.Lines.Add('端口号和IP绑定成功');

//监听当前IP和端口是否有客户端连接
  IF listen(Sever, SOMAXCONN) <> 0 THEN
  BEGIN
    ShowMessage('监听失败');
    Exit
  END;
  MemoLog.Lines.Add('监听成功');

  TThread.CreateAnonymousThread(
    PROCEDURE
    BEGIN
         //接收信息accept
      AddrSize := SizeOf(ServerAddr);
      ClientSocket := accept(Sever, @ServerAddr, @AddrSize);
      IF ClientSocket = INVALID_SOCKET THEN
      BEGIN
        CASE ClientSocket OF
          WSAEFAULT:
            MemoLog.Lines.Add('IP获取失败');
        END;
        MemoLog.Lines.Add('连接获取失败');
        Exit
      END;
  //当客户端连接成功时，显示一下客户端的IP
      CustomWinSocket := TCustomWinSocket.Create(ClientSocket);
      MemoLog.Lines.Add('客户端的IP是：' + CustomWinSocket.RemoteAddress);
  //发送一句话给客户端
      Result_Send := send(ClientSocket, '欢迎来到YHY的直播间', 1024, 0);
      IF (Result_Send = SOCKET_ERROR) OR (Result_Send <= 0) THEN
      BEGIN
        MemoLog.Lines.Add('数据发送失败')
      END;

    END
).Start;

END;

PROCEDURE TForm1.FormCreate(Sender: TObject);

//网络库版本号
CONST
  WINSOCKET_VERSION = $0202;
VAR
  WSAData: TWsaData;
BEGIN
  IF WSAStartup(WINSOCKET_VERSION, WSAData) <> 0 THEN
  BEGIN
    ShowMessage('初始化失败');
  END;
  MemoLog.Lines.Add('初始化成功')
END;

END.

