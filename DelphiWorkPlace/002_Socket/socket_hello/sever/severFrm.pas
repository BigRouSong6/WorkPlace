UNIT severFrm;

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

TYPE
  TFormServer = CLASS(TForm)
    MemoContent: TMemo;
    btnstart: TButton;
    MemoLog: TMemo;
    MemoRecord: TMemo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EditAddr: TEdit;
    EditPort: TEdit;
    ButtonSend: TButton;
    PROCEDURE FormCreate(Sender: TObject);
    PROCEDURE btnstartClick(Sender: TObject);
    PROCEDURE FormClose(Sender: TObject; VAR Action: TCloseAction);
  PRIVATE
    { Private declarations }
  PUBLIC
    { Public declarations }
  END;

VAR
  FormServer: TFormServer;

IMPLEMENTATION

USES
  Winapi.Winsock2, System.Win.ScktComp;

VAR
  Server: TSocket;

{$R *.dfm}

PROCEDURE TFormServer.btnstartClick(Sender: TObject);
VAR
  ServerAddr: TSockAddrIn;
  AddrSize: Integer;
  ClientSocket: TSocket;
  CustomWinSocket: TCustomWinSocket;
  SendResult: Integer;
BEGIN
     //创建服务器对象
  Server := socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
  IF Server = INVALID_SOCKET THEN
  BEGIN
    MemoLog.Lines.Add('服务器创建失败');
    Exit
  END;
  MemoLog.Lines.Add('服务器创建成功');

  //给服务器指定的IP和端口
  //组装信息
  WITH ServerAddr DO
  BEGIN
    sin_family := PF_INET;
    //端口号
    sin_port := StrToInt(EditPort.Text);
    //本机所有有可能的ip作为服务器端的ip
    //sin_addr.S_addr := Inaddr_any;
    sin_addr.S_addr := inet_addr(PAnsiChar(AnsiString(EditAddr.Text)));

  END;

  IF bind(Server, TSockAddr(ServerAddr), SizeOf(ServerAddr)) = SOCKET_ERROR THEN
  BEGIN
    MemoLog.Lines.Add('端口号被占用');
    Exit
  END;
  MemoLog.Lines.Add('IP和端口绑定成功');

  //监听当前IP和端口号是否有客户端连接
  IF listen(Server, SOMAXCONN) = SOCKET_ERROR THEN
  BEGIN
    MemoLog.Lines.Add('监听失败');
    Exit
  END;
  MemoLog.Lines.Add('监听成功');
  btnstart.Enabled := False;

  TThread.CreateAnonymousThread(
    PROCEDURE
    BEGIN
             //获取客户端连接对象
     //当连接失败的时候，我们需要进行处理
      AddrSize := SizeOf(ServerAddr);
      ClientSocket := accept(Server, @ServerAddr, @AddrSize);
      IF ClientSocket = INVALID_SOCKET THEN
      BEGIN
        CASE ClientSocket OF
          WSAEFAULT:
            MemoLog.Lines.Add('IP获取失败')
        END;
        MemoLog.Lines.Add('获取连接失败');
        Exit

      END;

    // 当上面的Result返回0时表明有客户端成功连接到当前服务器
     //当客户端连接成功时，显示一下客户端的IP
      CustomWinSocket := TCustomWinSocket.Create(ClientSocket);
      MemoLog.Lines.Add('客户端的IP是：' + CustomWinSocket.RemoteAddress);
      //发送一句话返回客户端
      SendResult := send(ClientSocket, '欢迎你来到YHY直播间', 1024, 0);
      IF (SendResult = SOCKET_ERROR) OR (SendResult <= 0) THEN
      BEGIN
        MemoLog.Lines.Add('数据发送失败')
      END;

    END).Start;

END;

PROCEDURE TFormServer.FormClose(Sender: TObject; VAR Action: TCloseAction);
BEGIN
     //关闭socket对象
  IF Server <> INVALID_SOCKET THEN
  BEGIN
    Closesocket(Server);
  END;
  //Socket的清理工作
  IF WSACleanup = SOCKET_ERROR THEN
  BEGIN
    ShowMessage('清理版本库失败');
  END;

END;

PROCEDURE TFormServer.FormCreate(Sender: TObject);
//初始化
CONST
  WINSOCKET_VERSION = $0202;  //网络库的版本号
VAR
  WSAData: TWSAData;
BEGIN
        //定义当前使用的网络库版本
  IF WSAStartup(WINSOCKET_VERSION, WSAData) <> 0 THEN
  BEGIN
    ShowMessage('初始化失败');
  END;
  MemoLog.Lines.Add('网络库初始化成功')
END;

END.

