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
//����Socket����
  Sever := socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
  IF Sever = INVALID_SOCKET THEN
  BEGIN
    ShowMessage('����������ʧ��')
  END;
  MemoLog.Lines.Add('�����������ɹ�');

//��װIP��ַSockAddr
  WITH ServerAddr DO
  BEGIN
    sin_family := PF_INET;
    sin_port := 10086;
    //�������п��ܵ�IP    INADDR_ANY
    sin_addr.S_addr := inet_addr('127.0.0.1')
  END;


//�󶨶˿ں�IP
  IF bind(Sever, TSockAddr(ServerAddr), SizeOf(SockAddr)) <> 0 THEN
  BEGIN
    MemoLog.Lines.Add('�˿ںű�ռ��');
    Exit
  END;
  MemoLog.Lines.Add('�˿ںź�IP�󶨳ɹ�');

//������ǰIP�Ͷ˿��Ƿ��пͻ�������
  IF listen(Sever, SOMAXCONN) <> 0 THEN
  BEGIN
    ShowMessage('����ʧ��');
    Exit
  END;
  MemoLog.Lines.Add('�����ɹ�');

  TThread.CreateAnonymousThread(
    PROCEDURE
    BEGIN
         //������Ϣaccept
      AddrSize := SizeOf(ServerAddr);
      ClientSocket := accept(Sever, @ServerAddr, @AddrSize);
      IF ClientSocket = INVALID_SOCKET THEN
      BEGIN
        CASE ClientSocket OF
          WSAEFAULT:
            MemoLog.Lines.Add('IP��ȡʧ��');
        END;
        MemoLog.Lines.Add('���ӻ�ȡʧ��');
        Exit
      END;
  //���ͻ������ӳɹ�ʱ����ʾһ�¿ͻ��˵�IP
      CustomWinSocket := TCustomWinSocket.Create(ClientSocket);
      MemoLog.Lines.Add('�ͻ��˵�IP�ǣ�' + CustomWinSocket.RemoteAddress);
  //����һ�仰���ͻ���
      Result_Send := send(ClientSocket, '��ӭ����YHY��ֱ����', 1024, 0);
      IF (Result_Send = SOCKET_ERROR) OR (Result_Send <= 0) THEN
      BEGIN
        MemoLog.Lines.Add('���ݷ���ʧ��')
      END;

    END
).Start;

END;

PROCEDURE TForm1.FormCreate(Sender: TObject);

//�����汾��
CONST
  WINSOCKET_VERSION = $0202;
VAR
  WSAData: TWsaData;
BEGIN
  IF WSAStartup(WINSOCKET_VERSION, WSAData) <> 0 THEN
  BEGIN
    ShowMessage('��ʼ��ʧ��');
  END;
  MemoLog.Lines.Add('��ʼ���ɹ�')
END;

END.
