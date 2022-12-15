object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 84
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnPapagaio: TButton
    Left = 56
    Top = 24
    Width = 81
    Height = 33
    Caption = 'Papagaio'
    TabOrder = 0
    OnClick = btnPapagaioClick
  end
  object btnPinguim: TButton
    Left = 152
    Top = 24
    Width = 81
    Height = 33
    Caption = 'Pinguim'
    TabOrder = 1
    OnClick = btnPinguimClick
  end
end
