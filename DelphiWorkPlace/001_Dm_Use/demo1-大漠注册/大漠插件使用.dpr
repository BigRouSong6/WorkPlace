program ��Į���ʹ��;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form1},
  uUtools in 'uUtools.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
