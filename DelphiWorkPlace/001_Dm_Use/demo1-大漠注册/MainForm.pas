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
  mydm: Idmsoft;  //定义了一个大漠类型的对象
BEGIN
  dmhdl := LoadLibrary('dm.dll');
  IF dmhdl < 32 THEN
  BEGIN
    ShowMessage('初始化失败'#13'请检测运行目录中是否含有dm.dll文件');
    Exit
  END
  ELSE
  BEGIN
    mydm := CreateComObjectFromDll(CLASS_dmsoft, dmhdl) AS Idmsoft;
    ShowMessage('初始化成功 插件版本:' + mydm.Ver);
    mydm := nil;
  END;
END;

PROCEDURE TForm1.FormCreate(Sender: TObject);
BEGIN
  OLERegister('./dm.dll', 1); //注册函数，窗体创建注册一次
END;

PROCEDURE TForm1.FormDestroy(Sender: TObject);
BEGIN
  OLERegister('./dm.dll', 1); //注册函数，窗体销毁注册一次
END;

END.

