object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 280
  Width = 596
  object ADOConnectionSupply: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=yuhuyi94520@;Persist Security Info=T' +
      'rue;User ID=root;Data Source=User;Initial Catalog=supply'
    DefaultDatabase = 'supply'
    Left = 48
    Top = 48
  end
  object DataSourceSupply: TDataSource
    DataSet = ADOTableSupply
    Left = 256
    Top = 48
  end
  object ADOTableSupply: TADOTable
    Active = True
    Connection = ADOConnectionSupply
    CursorType = ctStatic
    TableName = 'supplytable'
    Left = 160
    Top = 48
  end
end
