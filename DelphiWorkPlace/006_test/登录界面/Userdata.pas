unit Userdata;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDataModuleUser = class(TDataModule)
    ADOConnectionUser: TADOConnection;
    DataSourceUser: TDataSource;
    ADOTableUser: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleUser: TDataModuleUser;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
