object Form1: TForm1
  Left = 0
  Top = 0
  HelpType = htKeyword
  BorderStyle = bsDialog
  Caption = 'Principal'
  ClientHeight = 196
  ClientWidth = 363
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 24
  object lblAno: TLabel
    Left = 184
    Top = 38
    Width = 34
    Height = 24
    Caption = 'Ano'
  end
  object lblMes: TLabel
    Left = 24
    Top = 38
    Width = 35
    Height = 24
    Caption = 'M'#234's'
  end
  object Edit2: TEdit
    Left = 24
    Top = 68
    Width = 145
    Height = 32
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 184
    Top = 68
    Width = 145
    Height = 32
    TabOrder = 2
  end
  object btnBuscar: TButton
    Left = 89
    Top = 136
    Width = 185
    Height = 41
    Caption = 'Buscar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnBuscarClick
  end
end
