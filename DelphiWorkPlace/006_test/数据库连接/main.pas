UNIT main;

INTERFACE

USES
  data,Data.Win.ADODB, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

TYPE
  TForm1 = CLASS(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
  PRIVATE
    { Private declarations }
  PUBLIC
    { Public declarations }
  END;

VAR
  Form1: TForm1;
  conn: TADOConnection;

IMPLEMENTATION

{$R *.dfm}

END.

