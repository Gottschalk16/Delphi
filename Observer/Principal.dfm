object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 395
  ClientWidth = 755
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
  inline frmOperacoes1: TfrmOperacoes
    Left = 0
    Top = 0
    Width = 398
    Height = 393
    TabOrder = 0
  end
  inline frmBalancoFinanceiro1: TfrmBalancoFinanceiro
    Left = 400
    Top = 0
    Width = 352
    Height = 97
    TabOrder = 1
    ExplicitLeft = 400
  end
  inline frmAgrupamento1: TfrmAgrupamento
    Left = 399
    Top = 103
    Width = 352
    Height = 174
    TabOrder = 2
    ExplicitLeft = 399
    ExplicitTop = 103
  end
  inline frmLogs1: TfrmLogs
    Left = 399
    Top = 280
    Width = 352
    Height = 113
    TabOrder = 3
    ExplicitLeft = 399
    ExplicitTop = 280
  end
end
