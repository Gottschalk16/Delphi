object frmAgrupCentroCto: TfrmAgrupCentroCto
  Left = 0
  Top = 0
  Width = 352
  Height = 157
  TabOrder = 0
  object DBAgrupamento: TDBGrid
    Left = 0
    Top = 0
    Width = 352
    Height = 157
    DataSource = DsAgrupamento
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object CdsAgrupamento: TClientDataSet
    PersistDataPacket.Data = {
      5A0000009619E0BD0100000018000000020000000000030000005A000943656E
      74726F43746F01004900000001000557494454480200020006000556616C6F72
      080004000000010007535542545950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 32
    object CdsAgrupamentoCentroCto: TStringField
      DisplayLabel = 'Centro de custos (Pai)'
      DisplayWidth = 25
      FieldName = 'CentroCto'
      Size = 6
    end
    object CdsAgrupamentoValor: TCurrencyField
      DisplayWidth = 26
      FieldName = 'Valor'
    end
  end
  object DsAgrupamento: TDataSource
    DataSet = CdsAgrupamento
    Left = 288
    Top = 32
  end
end
