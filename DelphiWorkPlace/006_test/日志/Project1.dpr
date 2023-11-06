PROGRAM Project1;

USES
  TConfiguratorUnit,
  Vcl.Forms,
  main IN 'main.pas' {Form1};

{$R *.res}

BEGIN
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  {初始化，读取属性}
  doPropertiesConfiguration('log4delphi.properties');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
END.

