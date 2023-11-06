object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = Button1
  Caption = 'Form1'
  ClientHeight = 423
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 376
    Top = 359
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 465
    Height = 113
    DataSource = DataModule1.DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
