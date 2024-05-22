object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 280
  Width = 596
  object ADOConnectionSupply: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=zxc12580;Persist Security Info=True;' +
      'User ID=yhy;Data Source=ServerDatabase;Initial Catalog=testyhy'
    Left = 48
    Top = 48
  end
  object DataSourceSupply: TDataSource
    DataSet = ADOTableSupply
    Left = 256
    Top = 48
  end
  object ADOTableSupply: TADOTable
    CacheSize = 3
    ConnectionString = 
      'Provider=MSDASQL.1;Password=zxc12580;Persist Security Info=True;' +
      'User ID=yhy;Data Source=ServerDatabase;Initial Catalog=testyhy'
    CursorType = ctStatic
    TableName = 'supplytable'
    Left = 160
    Top = 48
  end
end
