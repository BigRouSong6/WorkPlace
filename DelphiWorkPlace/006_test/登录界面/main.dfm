object mainForm: TmainForm
  Left = 0
  Top = 0
  Caption = #32564#36153#31995#32479
  ClientHeight = 560
  ClientWidth = 1050
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object TabControlMain: TTabControl
    Left = 0
    Top = 0
    Width = 1050
    Height = 560
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    Style = tsFlatButtons
    TabHeight = 25
    TabOrder = 0
    Tabs.Strings = (
      #20379#24212#21830#31471#21475
      #36164#28304
      #23458#25143
      #35746#21333#35814#24773
      #23454#26102#21160#24577
      #20805#20540#21345
      #38144#21806#36134#21333
      #36816#34892#26085#24535)
    TabIndex = 0
    TabWidth = 100
    object DBGridSupply: TDBGrid
      Left = 4
      Top = 31
      Width = 900
      Height = 525
      Align = alClient
      BiDiMode = bdRightToLeftNoAlign
      Constraints.MaxHeight = 900
      Constraints.MaxWidth = 900
      Constraints.MinHeight = 300
      Constraints.MinWidth = 300
      DataSource = DataModule1.DataSourceSupply
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #24494#36719#38597#40657
      TitleFont.Style = []
    end
  end
  object MainMenu1: TMainMenu
    Left = 848
    Top = 56
    object N1: TMenuItem
      Caption = #20379#36135#31649#29702
      object mniSupply: TMenuItem
        Caption = #21830#23478
        OnClick = mniSupplyClick
      end
      object mniResourcePool: TMenuItem
        Caption = #36164#28304#27744
        OnClick = mniResourcePoolClick
      end
    end
    object N4: TMenuItem
      Caption = #23458#25143#31649#29702
      object mniCustomerGroup: TMenuItem
        Caption = #23458#25143#32452
        OnClick = mniCustomerGroupClick
      end
      object mniProductOfSale: TMenuItem
        Caption = #20135#21697#37197#32622
        OnClick = mniProductOfSaleClick
      end
    end
    object N7: TMenuItem
      Caption = #36816#33829#31649#29702
      object mniOrderForm: TMenuItem
        Caption = #35746#21333#35814#24773
        OnClick = mniOrderFormClick
      end
      object mniRoute: TMenuItem
        Caption = #36335#30001#20998#37197
        OnClick = mniRouteClick
      end
      object mniBlackList: TMenuItem
        Caption = #40657#21517#21333
        OnClick = mniBlackListClick
      end
      object mniStatisticAnalysis: TMenuItem
        Caption = #32479#35745#20998#26512
        OnClick = mniStatisticAnalysisClick
      end
    end
    object N12: TMenuItem
      Caption = #19994#21153#37197#32622#31649#29702
      object mniCategory: TMenuItem
        Caption = #20135#21697#31867#30446
        OnClick = mniCategoryClick
      end
      object mniNumberSegment: TMenuItem
        Caption = #21495#27573#24211
        OnClick = mniNumberSegmentClick
      end
    end
    object N15: TMenuItem
      Caption = #36130#21153#31649#29702
      object mniSalesBill: TMenuItem
        Caption = #38144#21806#36134#21333
        OnClick = mniSalesBillClick
      end
      object mniSettlementBill: TMenuItem
        Caption = #32467#31639#36134#21333
        OnClick = mniSettlementBillClick
      end
      object mniBankConfiguration: TMenuItem
        Caption = #38134#34892#37197#32622
        OnClick = mniBankConfigurationClick
      end
      object mniInvoice: TMenuItem
        Caption = #21457#31080
        OnClick = mniInvoiceClick
      end
    end
    object N20: TMenuItem
      Caption = #31995#32479#31649#29702
      object mniAccount: TMenuItem
        Caption = #36134#25143#31649#29702
        object N22: TMenuItem
          Caption = #26032#22686#36134#25143
          OnClick = N22Click
        end
        object N23: TMenuItem
          Caption = #31105#29992#36134#25143
        end
        object N24: TMenuItem
          Caption = #21024#38500#36134#25143
        end
        object N25: TMenuItem
          Caption = #20462#25913#30331#24405#23494#30721
        end
        object N26: TMenuItem
          Caption = #20462#25913#25903#20184#23494#30721
        end
      end
      object mniOperationLog: TMenuItem
        Caption = #36816#34892#26085#24535
        OnClick = mniOperationLogClick
      end
    end
  end
end
