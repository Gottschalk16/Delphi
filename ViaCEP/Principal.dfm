object frmConsultaCEP: TfrmConsultaCEP
  Left = 0
  Top = 0
  Caption = 'Consulta CEP'
  ClientHeight = 294
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbCEP: TLabel
    Left = 73
    Top = 8
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object lbCidade: TLabel
    Left = 73
    Top = 47
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object lbComplemento: TLabel
    Left = 73
    Top = 88
    Width = 65
    Height = 13
    Caption = 'Complemento'
  end
  object lbBairro: TLabel
    Left = 73
    Top = 129
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object lbLogradouro: TLabel
    Left = 73
    Top = 170
    Width = 55
    Height = 13
    Caption = 'Logradouro'
  end
  object lbUF: TLabel
    Left = 73
    Top = 211
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object edCEP: TEdit
    Left = 72
    Top = 20
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object edCidade: TEdit
    Left = 73
    Top = 61
    Width = 129
    Height = 21
    TabOrder = 1
  end
  object edBairro: TEdit
    Left = 73
    Top = 143
    Width = 129
    Height = 21
    TabOrder = 2
  end
  object edComplemento: TEdit
    Left = 73
    Top = 102
    Width = 129
    Height = 21
    TabOrder = 3
  end
  object edLogradouro: TEdit
    Left = 73
    Top = 184
    Width = 129
    Height = 21
    TabOrder = 4
  end
  object edUF: TEdit
    Left = 73
    Top = 225
    Width = 129
    Height = 21
    TabOrder = 5
  end
  object Button1: TButton
    Left = 93
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Buscar CEP'
    TabOrder = 6
    OnClick = Button1Click
  end
end
