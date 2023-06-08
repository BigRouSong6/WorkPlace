program ProjectSever;

uses
  Vcl.Forms,
  severFrm in 'severFrm.pas' {FormServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormServer, FormServer);
  Application.Run;
end.
