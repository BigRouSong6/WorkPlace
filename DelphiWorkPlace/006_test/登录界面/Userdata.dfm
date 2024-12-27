object DataModuleUser: TDataModuleUser
  OldCreateOrder = False
  Height = 245
  Width = 655
  object ADOConnectionUser: TADOConnection
    CommandTimeout = 15
    ConnectionString = 
      'Provider=MSDASQL.1;Password=zxc12580;Persist Security Info=True;' +
      'User ID=yhy;Data Source=ServerDatabase;Mode=ReadWrite;Initial Ca' +
      'talog=testyhy'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 72
    Top = 64
  end
  object DataSourceUser: TDataSource
    DataSet = ADOTableUser
    Left = 256
    Top = 64
  end
  object ADOTableUser: TADOTable
    Active = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=zxc12580;Persist Security Info=True;' +
      'User ID=yhy;Data Source=ServerDatabase;Initial Catalog=testyhy'
    CursorType = ctStatic
    TableName = 'usertable'
    Left = 168
    Top = 64
  end
end
