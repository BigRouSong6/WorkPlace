UNIT MainFrm;

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, UnitHello, UnitHelloFrm;

TYPE
  TForm1 = CLASS(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    PROCEDURE Button1Click(Sender: TObject);
    PROCEDURE Button2Click(Sender: TObject);
    PROCEDURE Button3Click(Sender: TObject);
    PROCEDURE Button4Click(Sender: TObject);
  PRIVATE
    { Private declarations }
  PUBLIC
    { Public declarations }
  END;

VAR
  Form1: TForm1;
  user: Tuse;
  FormHello: TForm;

IMPLEMENTATION

{$R *.dfm}

PROCEDURE TForm1.Button1Click(Sender: TObject);
BEGIN
  HelloWorld('过程调用');
END;

PROCEDURE TForm1.Button2Click(Sender: TObject);
BEGIN
  ShowMessage(GetHelloWorld('函数调用'));
END;

PROCEDURE TForm1.Button3Click(Sender: TObject);
BEGIN
  user := Tuse.Create();
  ShowMessage(user.Add(1, 2).ToString);
END;

PROCEDURE TForm1.Button4Click(Sender: TObject);
BEGIN
  FormHello := TForm2.Create(nil);
  FormHello.Visible := True;
END;

END.

