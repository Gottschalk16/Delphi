object frmAgrupamento: TfrmAgrupamento
  Left = 0
  Top = 0
  Width = 352
  Height = 174
  TabOrder = 0
  object lblAgrupamento: TLabel
    Left = 144
    Top = 5
    Width = 65
    Height = 13
    Caption = 'Agrupamento'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 24
    Width = 352
    Height = 150
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
      5A0000009619E0BD0100000018000000020000000000030000005A0009436174
      65676F726961010049000000010005574944544802000200C80005546F74616C
      080004000000010007535542545950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Categoria'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Total'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 264
    Top = 8
    object CdsAgrupamentoCategoria: TStringField
      DisplayWidth = 32
      FieldName = 'Categoria'
      Size = 200
    end
    object CdsAgrupamentoTotal: TCurrencyField
      DisplayWidth = 20
      FieldName = 'Total'
    end
  end
  object DsAgrupamento: TDataSource
    DataSet = CdsAgrupamento
    Left = 304
    Top = 8
  end
end
