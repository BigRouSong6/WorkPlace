object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 494
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonSendServer: TButton
    Left = 472
    Top = 448
    Width = 75
    Height = 25
    Caption = #21457#36865
    TabOrder = 0
  end
  object ButtonStartServer: TButton
    Left = 600
    Top = 448
    Width = 75
    Height = 25
    Caption = #21551#21160#26381#21153#22120
    TabOrder = 1
    OnClick = ButtonStartServerClick
  end
  object MemoLog: TMemo
    Left = 8
    Top = 8
    Width = 417
    Height = 225
    TabOrder = 2
  end
end
