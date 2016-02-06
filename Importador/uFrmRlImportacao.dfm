object FrmRlImport: TFrmRlImport
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio e Importa'#231#245'es'
  ClientHeight = 698
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object rrpMain: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = ddsMain
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = rrpMainBeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 24
      BandType = btHeader
      object lblEmpresa: TRLLabel
        Left = 6
        Top = 2
        Width = 196
        Height = 19
        Caption = 'Listagem de Importa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 62
      Width = 718
      Height = 23
      BandType = btTitle
      object rlbProtocolo: TRLLabel
        Left = 178
        Top = 4
        Width = 56
        Height = 14
        Caption = 'Protocolo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlbDataImportacao: TRLLabel
        Left = 243
        Top = 4
        Width = 69
        Height = 14
        Caption = 'Data Import.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlbCPG: TRLLabel
        Left = 325
        Top = 4
        Width = 85
        Height = 14
        Caption = 'Contas a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlbCRE: TRLLabel
        Left = 422
        Top = 4
        Width = 100
        Height = 14
        Caption = 'Contas a Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlbConvenio: TRLLabel
        Left = 539
        Top = 4
        Width = 70
        Height = 14
        Caption = 'Conv'#234'nio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlbCustasFechadas: TRLLabel
        Left = 616
        Top = 4
        Width = 97
        Height = 14
        Caption = 'Custas Fechadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlbID: TRLLabel
        Left = 8
        Top = 4
        Width = 42
        Height = 14
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel1: TRLLabel
        Left = 72
        Top = 4
        Width = 79
        Height = 14
        Caption = 'Data Cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 21
      BandType = btFooter
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 85
      Width = 718
      Height = 28
      object rdtProtocolo: TRLDBText
        Left = 178
        Top = 3
        Width = 56
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'PROTOCOLO'
        DataSource = ddsMain
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = rlbProtocolo
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object rdtDataImport: TRLDBText
        Left = 243
        Top = 3
        Width = 69
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'IMP_DATA'
        DataSource = ddsMain
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = rlbDataImportacao
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object rdtCPG_Codigo: TRLDBText
        Left = 325
        Top = 3
        Width = 85
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'CPG_CODIGO'
        DataSource = ddsMain
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = rlbCPG
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object rdtCRE_Codigo: TRLDBText
        Left = 422
        Top = 3
        Width = 100
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'CRE_CODIGO'
        DataSource = ddsMain
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = rlbCRE
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object rdtConvenio: TRLDBText
        Left = 539
        Top = 3
        Width = 70
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'CONVENIO'
        DataSource = ddsMain
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = rlbConvenio
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object rdtCustasFechadas: TRLDBText
        Left = 616
        Top = 3
        Width = 97
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'CUSTASFECHADAS'
        DataSource = ddsMain
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = rlbCustasFechadas
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLDBText1: TRLDBText
        Left = 23
        Top = 3
        Width = 12
        Height = 14
        Alignment = taCenter
        DataField = 'ID'
        DataSource = ddsMain
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = rlbID
        ParentFont = False
        Text = ''
      end
      object rdtDataCadastro: TRLDBText
        Left = 72
        Top = 3
        Width = 90
        Height = 14
        Alignment = taCenter
        DataField = 'DATACADASTRO'
        DataSource = ddsMain
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Holder = rdtDataCadastro
        ParentFont = False
        Text = ''
      end
    end
  end
  object ddsMain: TDataSource
    DataSet = fqrMain
    Left = 432
    Top = 352
  end
  object fqrMain: TFDQuery
    Connection = dmConnect.fdConn
    SQL.Strings = (
      'SELECT REG.*, IMP.DATA AS IMP_DATA FROM REG'
      'LEFT JOIN IMP ON IMP.ID = REG.IMP_ID '
      'AND IMP.EMP_CODIGO = REG.EMP_CODIGO ')
    Left = 488
    Top = 376
    object fqrMainEMP_CODIGO: TStringField
      FieldName = 'EMP_CODIGO'
      Origin = 'EMP_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object fqrMainID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fqrMainPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
      Size = 50
    end
    object fqrMainDATACADASTRO: TSQLTimeStampField
      FieldName = 'DATACADASTRO'
      Origin = 'DATACADASTRO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fqrMainDESPACHANTE: TFloatField
      FieldName = 'DESPACHANTE'
      Origin = 'DESPACHANTE'
    end
    object fqrMainDISTRIBUIDOR: TFloatField
      FieldName = 'DISTRIBUIDOR'
      Origin = 'DISTRIBUIDOR'
    end
    object fqrMainVALORCARTORIO: TFloatField
      FieldName = 'VALORCARTORIO'
      Origin = 'VALORCARTORIO'
    end
    object fqrMainDAJ: TFloatField
      FieldName = 'DAJ'
      Origin = 'DAJ'
    end
    object fqrMainVALORTOTALCUSTAS: TFloatField
      FieldName = 'VALORTOTALCUSTAS'
      Origin = 'VALORTOTALCUSTAS'
    end
    object fqrMainCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Origin = 'CONVENIO'
      Size = 50
    end
    object fqrMainCUSTASFECHADAS: TIntegerField
      FieldName = 'CUSTASFECHADAS'
      Origin = 'CUSTASFECHADAS'
      OnGetText = fqrMainCUSTASFECHADASGetText
    end
    object fqrMainVALORXIMENESGESTAO: TFloatField
      FieldName = 'VALORXIMENESGESTAO'
      Origin = 'VALORXIMENESGESTAO'
    end
    object fqrMainVALORXIMENESAUT: TFloatField
      FieldName = 'VALORXIMENESAUT'
      Origin = 'VALORXIMENESAUT'
    end
    object fqrMainVALORXIMENESREC: TFloatField
      FieldName = 'VALORXIMENESREC'
      Origin = 'VALORXIMENESREC'
    end
    object fqrMainVALORXIMENESOUTROS: TFloatField
      FieldName = 'VALORXIMENESOUTROS'
      Origin = 'VALORXIMENESOUTROS'
    end
    object fqrMainREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Origin = 'REPRESENTANTE'
      Size = 50
    end
    object fqrMainVALORXIMENES: TFloatField
      FieldName = 'VALORXIMENES'
      Origin = 'VALORXIMENES'
    end
    object fqrMainIMP_ID: TIntegerField
      FieldName = 'IMP_ID'
      Origin = 'IMP_ID'
    end
    object fqrMainCRE_CODIGO: TStringField
      FieldName = 'CRE_CODIGO'
      Origin = 'CRE_CODIGO'
      Size = 11
    end
    object fqrMainNUMLINHA: TIntegerField
      FieldName = 'NUMLINHA'
      Origin = 'NUMLINHA'
    end
    object fqrMainCPG_CODIGO: TStringField
      FieldName = 'CPG_CODIGO'
      Origin = 'CPG_CODIGO'
      Size = 11
    end
    object fqrMainIMP_DATA: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'IMP_DATA'
      Origin = '"DATA"'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
