PROGRAM Projectlogin;

uses
  Vcl.Dialogs,
  Vcl.Forms,
  main in 'main.pas' {mainForm},
  login in 'login.pas' {loginForm},
  Userdata in 'Userdata.pas' {DataModuleUser: TDataModule},
  SupplyFrm in 'SupplyFrm.pas' {Supply},
  ResourcePoolFrm in 'ResourcePoolFrm.pas' {ResourcePool},
  CustomerGroupFrm in 'CustomerGroupFrm.pas' {CustomerGroup},
  ProductOfSaleFrm in 'ProductOfSaleFrm.pas' {ProductOfSale},
  OrderFormFrm in 'OrderFormFrm.pas' {OrderForm},
  RouteFrm in 'RouteFrm.pas' {Route},
  BlackListFrm in 'BlackListFrm.pas' {BlackList},
  StatisticAnalysisFrm in 'StatisticAnalysisFrm.pas' {StatisticAnalysis},
  CategoryFrm in 'CategoryFrm.pas' {Category},
  NumberSegmentFrm in 'NumberSegmentFrm.pas' {NumberSegment},
  SalesBillFrm in 'SalesBillFrm.pas' {SalesBill},
  SettlementBillFrm in 'SettlementBillFrm.pas' {SettlementBill},
  BankConfigurationFrm in 'BankConfigurationFrm.pas' {BankConfiguration},
  InvoiceFrm in 'InvoiceFrm.pas' {Invoice},
  AccountFrm in 'AccountFrm.pas' {Account},
  OperationLogFrm in 'OperationLogFrm.pas' {OperationLog},
  SupplyData in 'SupplyData.pas' {DataModule1: TDataModule};

{$R *.res}

BEGIN
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModuleUser, DataModuleUser);
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TloginForm, loginForm);
  Application.CreateForm(TSupply, Supply);
  Application.CreateForm(TResourcePool, ResourcePool);
  Application.CreateForm(TCustomerGroup, CustomerGroup);
  Application.CreateForm(TProductOfSale, ProductOfSale);
  Application.CreateForm(TOrderForm, OrderForm);
  Application.CreateForm(TRoute, Route);
  Application.CreateForm(TBlackList, BlackList);
  Application.CreateForm(TStatisticAnalysis, StatisticAnalysis);
  Application.CreateForm(TCategory, Category);
  Application.CreateForm(TNumberSegment, NumberSegment);
  Application.CreateForm(TSalesBill, SalesBill);
  Application.CreateForm(TSettlementBill, SettlementBill);
  Application.CreateForm(TBankConfiguration, BankConfiguration);
  Application.CreateForm(TInvoice, Invoice);
  Application.CreateForm(TAccount, Account);
  Application.CreateForm(TOperationLog, OperationLog);
  Application.CreateForm(TDataModule1, DataModule1);
  //  Application.CreateForm(TloginForm, loginForm);
//  Application.Run;

  IF TloginForm.Execute THEN
  BEGIN
//    Application.Initialize;
//    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TmainForm, mainForm);
    Application.Run;
  END
  ELSE
  BEGIN
    Application.Terminate;
  END;

END.

