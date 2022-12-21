object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Principal'
  ClientHeight = 317
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline frmOperacoes: TfrmOperacoes
    Left = 0
    Top = 0
    Width = 352
    Height = 317
    TabOrder = 0
    inherited DBOperacoes: TDBGrid
      Height = 167
    end
  end
  inline frmBalancoCentroCto: TfrmBalancoCentroCto
    Left = 0
    Top = 288
    Width = 352
    Height = 28
    TabOrder = 1
    ExplicitTop = 288
  end
  inline frmAgrupCentroCto: TfrmAgrupCentroCto
    Left = 352
    Top = 0
    Width = 352
    Height = 157
    TabOrder = 2
    ExplicitLeft = 352
  end
  inline frmAgrupCentroCtoFilho: TfrmAgrupCentroCtoFilho
    Left = 352
    Top = 159
    Width = 352
    Height = 157
    TabOrder = 3
    ExplicitLeft = 352
    ExplicitTop = 159
  end
end
