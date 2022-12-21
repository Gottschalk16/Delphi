object frmOperacoes: TfrmOperacoes
  Left = 0
  Top = 0
  Width = 352
  Height = 317
  TabOrder = 0
  object lblCentroCustos: TLabel
    Left = 8
    Top = 17
    Width = 96
    Height = 13
    Caption = 'Centro custos (Pai):'
  end
  object lblCentroCtoFilho: TLabel
    Left = 122
    Top = 17
    Width = 104
    Height = 13
    Caption = 'Centro custos (Filho):'
  end
  object lblVlrOrcamento: TLabel
    Left = 236
    Top = 17
    Width = 82
    Height = 13
    Caption = 'Valor or'#231'amento:'
  end
  object btnGravar: TButton
    Left = 138
    Top = 70
    Width = 75
    Height = 33
    Caption = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnGravarClick
  end
  object eCentroCto: TEdit
    Left = 8
    Top = 36
    Width = 104
    Height = 21
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 0
    OnExit = eCentroCtoExit
    OnKeyDown = eCentroCtoKeyDown
  end
  object eCentroCtoFilho: TEdit
    Left = 122
    Top = 36
    Width = 104
    Height = 21
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 1
    OnExit = eCentroCtoFilhoExit
    OnKeyDown = eCentroCtoFilhoKeyDown
  end
  object DBOperacoes: TDBGrid
    Left = 0
    Top = 120
    Width = 352
    Height = 196
    TabStop = False
    DataSource = DsOperacoes
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object eVlrOperacao: TEdit
    Left = 236
    Top = 36
    Width = 104
    Height = 21
    TabOrder = 2
    OnKeyDown = eVlrOperacaoKeyDown
  end
  object CdsOperacoes: TClientDataSet
    PersistDataPacket.Data = {
      5A0000009619E0BD0100000018000000020000000000030000005A000943656E
      74726F43746F01004900000001000557494454480200020006000556616C6F72
      080004000000010007535542545950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CentroCto'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 216
    Top = 96
    object CdsOperacoesCentroCto: TStringField
      DisplayLabel = 'Centro de custos'
      DisplayWidth = 25
      FieldName = 'CentroCto'
      Size = 6
    end
    object CdsOperacoesValor: TCurrencyField
      DisplayWidth = 26
      FieldName = 'Valor'
    end
  end
  object DsOperacoes: TDataSource
    DataSet = CdsOperacoes
    Left = 272
    Top = 96
  end
end
