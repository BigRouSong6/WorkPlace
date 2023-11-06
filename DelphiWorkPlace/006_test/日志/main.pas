UNIT main;

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, TLoggerUnit;

TYPE
  TForm1 = CLASS(TForm)
    Button1: TButton;
    PROCEDURE Button1Click(Sender: TObject);
  PRIVATE
    { Private declarations }
  PUBLIC
    { Public declarations }
  END;

VAR
  Form1: TForm1;

IMPLEMENTATION

{$R *.dfm}

PROCEDURE TForm1.Button1Click(Sender: TObject);
BEGIN
  ShowMessage('按钮被点击了');
  TLogger. GetInstance.Debug('按钮被点击了@');
END;

END.

