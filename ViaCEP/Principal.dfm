object frmConsultaCEP: TfrmConsultaCEP
  Left = 0
  Top = 0
  Caption = 'Consulta CEP'
  ClientHeight = 336
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridCEP: TDBGrid
    Left = 0
    Top = 88
    Width = 437
    Height = 248
    Align = alBottom
    DataSource = DSCep
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnConsultarCEP: TButtonGradient
    Left = 286
    Top = 19
    Width = 143
    Height = 41
    Caption = 'Consultar CEP'
    Style = bsCommandLink
    TabOrder = 1
    OnClick = btnConsultarCEPClick
  end
  object edCEP: TLabeledEdit
    Left = 48
    Top = 31
    Width = 121
    Height = 21
    EditLabel.Width = 29
    EditLabel.Height = 13
    EditLabel.Caption = 'CEP'
    LabelPosition = lpLeft
    TabOrder = 2
    OnKeyDown = edCEPKeyDown
  end
  object CDSCep: TClientDataSet
    PersistDataPacket.Data = {
      400100009619E0BD01000000180000000B000000000003000000400103434550
      0100490000000100055749445448020002000A00064369646164650200490000
      00010005574944544802000200F4010A4C6F677261646F75726F020049000000
      010005574944544802000200F4010B436F6D706C656D656E746F020049000000
      010005574944544802000200F4010642616972726F0200490000000100055749
      44544802000200F4010A4C6F63616C6964616465020049000000010005574944
      544802000200F401025546010049000000010005574944544802000200020004
      4942474501004900000001000557494454480200020014000347494101004900
      00000100055749445448020002000A0003444444010049000000010005574944
      5448020002000300055349414649010049000000010005574944544802000200
      0A000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 32
    object CDSCepCEP: TStringField
      DisplayWidth = 11
      FieldName = 'CEP'
      OnChange = CDSCepCEPChange
      Size = 10
    end
    object CDSCepUF: TStringField
      DisplayWidth = 2
      FieldName = 'UF'
      Size = 2
    end
    object CDSCepCidade: TStringField
      DisplayWidth = 5
      FieldName = 'Cidade'
      OnChange = CDSCepCidadeChange
      Size = 200
    end
    object CDSCepLogradouro: TStringField
      DisplayWidth = 9
      FieldName = 'Logradouro'
      OnChange = CDSCepLogradouroChange
      Size = 500
    end
    object CDSCepComplemento: TStringField
      DisplayWidth = 10
      FieldName = 'Complemento'
      OnChange = CDSCepComplementoChange
      Size = 500
    end
    object CDSCepBairro: TStringField
      DisplayWidth = 4
      FieldName = 'Bairro'
      OnChange = CDSCepBairroChange
      Size = 500
    end
    object CDSCepIBGE: TStringField
      DisplayWidth = 5
      FieldName = 'IBGE'
      OnChange = CDSCepIBGEChange
    end
    object CDSCepGIA: TStringField
      DisplayWidth = 3
      FieldName = 'GIA'
      OnChange = CDSCepGIAChange
      Size = 10
    end
    object CDSCepDDD: TStringField
      DisplayWidth = 3
      FieldName = 'DDD'
      Size = 3
    end
    object CDSCepSIAFI: TStringField
      DisplayWidth = 4
      FieldName = 'SIAFI'
      OnChange = CDSCepSIAFIChange
      Size = 10
    end
  end
  object DSCep: TDataSource
    DataSet = CDSCep
    Left = 336
    Top = 32
  end
end
