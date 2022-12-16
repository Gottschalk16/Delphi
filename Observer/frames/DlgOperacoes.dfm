object frmOperacoes: TfrmOperacoes
  Left = 0
  Top = 0
  Width = 398
  Height = 393
  TabOrder = 0
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 51
    Height = 13
    Caption = 'Opera'#231#227'o:'
  end
  object Label2: TLabel
    Left = 16
    Top = 46
    Width = 51
    Height = 13
    Caption = 'Categoria:'
  end
  object lblValor: TLabel
    Left = 39
    Top = 77
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object btnGravar: TButton
    Left = 304
    Top = 24
    Width = 75
    Height = 41
    Caption = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnGravarClick
  end
  object cbOperacao: TComboBox
    Left = 72
    Top = 16
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 1
    Text = 'Cr'#233'dito'
    Items.Strings = (
      'Cr'#233'dito'
      'D'#233'bito')
  end
  object cbCategoria: TComboBox
    Left = 72
    Top = 43
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 2
    Text = 'Supermercado'
    Items.Strings = (
      'Supermercado'
      'Farm'#225'cia'
      'Combust'#237'vel'
      'Alimenta'#231#227'o'
      'Sal'#225'rio'
      'Aluguel'
      'Freelancing')
  end
  object eValor: TEdit
    Left = 72
    Top = 74
    Width = 145
    Height = 21
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 123
    Width = 393
    Height = 270
    DataSource = DsOperacoes
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cdsOperacoes: TClientDataSet
    PersistDataPacket.Data = {
      760000009619E0BD0100000018000000030000000000030000007600074F7065
      7263616F010049000000010005574944544802000200C8000943617465676F72
      6961010049000000010005574944544802000200C8000556616C6F7208000400
      0000010007535542545950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Opercao'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Categoria'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 344
    Top = 88
    object cdsOperacoesOpercao: TStringField
      DisplayWidth = 19
      FieldName = 'Opercao'
      Size = 200
    end
    object cdsOperacoesCategoria: TStringField
      DisplayWidth = 21
      FieldName = 'Categoria'
      Size = 200
    end
    object cdsOperacoesValor: TCurrencyField
      DisplayWidth = 16
      FieldName = 'Valor'
    end
  end
  object DsOperacoes: TDataSource
    DataSet = cdsOperacoes
    Left = 296
    Top = 88
  end
end
