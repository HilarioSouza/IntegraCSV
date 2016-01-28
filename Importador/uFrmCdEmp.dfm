inherited frmCdEmp: TfrmCdEmp
  Caption = 'Cadastro de Empresas'
  ClientHeight = 465
  ClientWidth = 656
  ExplicitWidth = 662
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnCaptionTela: TPanel
    Width = 646
  end
  inherited pnTop: TPanel
    Width = 646
    inherited Panel1: TPanel
      Width = 646
      ExplicitHeight = 32
    end
  end
  inherited pgCrud: TPageControl
    Width = 656
    Height = 371
    ExplicitTop = 94
    ExplicitHeight = 301
    inherited tsPsq: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 609
      ExplicitHeight = 273
      inherited gridPsq: TDBGrid
        Width = 648
        Height = 343
      end
    end
    inherited tsCad: TTabSheet
      ExplicitLeft = 3
      ExplicitTop = 24
      ExplicitWidth = 648
      ExplicitHeight = 343
      inherited lblCodigo: TLabel
        Width = 37
        Caption = 'C'#243'digo:'
        ExplicitWidth = 37
      end
      object lblNome: TLabel [1]
        Left = 55
        Top = 7
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      inherited edtID: TDBEdit
        DataField = 'CODIGO'
      end
      object edtNome: TDBEdit
        Left = 55
        Top = 22
        Width = 311
        Height = 21
        DataField = 'NOME'
        DataSource = dsDados
        TabOrder = 1
      end
      object gbxCartorioXimenes: TGroupBox
        Left = 175
        Top = 57
        Width = 139
        Height = 168
        Caption = ' Cart'#243'rio Ximenes: '
        TabOrder = 3
        object Label8: TLabel
          Left = 8
          Top = 16
          Width = 82
          Height = 13
          Caption = 'Estabelecimento:'
        end
        object Label9: TLabel
          Left = 8
          Top = 65
          Width = 108
          Height = 13
          Caption = 'Centro de Resultados:'
        end
        object Label10: TLabel
          Left = 8
          Top = 114
          Width = 40
          Height = 13
          Caption = 'Receita:'
        end
        object DBEdit2: TDBEdit
          Left = 8
          Top = 35
          Width = 121
          Height = 21
          DataField = 'CARTORIOEST'
          DataSource = dsDados
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 8
          Top = 84
          Width = 121
          Height = 21
          DataField = 'CARTORIOCRS'
          DataSource = dsDados
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 133
          Width = 121
          Height = 21
          DataField = 'CARTORIOCRD'
          DataSource = dsDados
          TabOrder = 2
        end
      end
      object gbxXimenesServices: TGroupBox
        Left = 3
        Top = 57
        Width = 140
        Height = 168
        Caption = ' Ximenes Services: '
        TabOrder = 2
        object Label7: TLabel
          Left = 8
          Top = 114
          Width = 40
          Height = 13
          Caption = 'Receita:'
        end
        object Label6: TLabel
          Left = 8
          Top = 65
          Width = 108
          Height = 13
          Caption = 'Centro de Resultados:'
        end
        object Label5: TLabel
          Left = 8
          Top = 16
          Width = 82
          Height = 13
          Caption = 'Estabelecimento:'
        end
        object detReceita: TDBEdit
          Left = 8
          Top = 133
          Width = 121
          Height = 21
          DataField = 'SERVICESCRD'
          DataSource = dsDados
          TabOrder = 2
        end
        object detCentroResultados: TDBEdit
          Left = 8
          Top = 87
          Width = 121
          Height = 21
          DataField = 'SERVICESCRS'
          DataSource = dsDados
          TabOrder = 1
        end
        object detEstabelecimento: TDBEdit
          Left = 8
          Top = 35
          Width = 121
          Height = 21
          DataField = 'SERVICESEST'
          DataSource = dsDados
          TabOrder = 0
        end
      end
      object gbxContasaPagar: TGroupBox
        Left = 344
        Top = 57
        Width = 177
        Height = 216
        Caption = ' Contas a Pagar: '
        TabOrder = 4
        object Label3: TLabel
          Left = 16
          Top = 24
          Width = 82
          Height = 13
          Caption = 'Estabelecimento:'
        end
        object Label4: TLabel
          Left = 16
          Top = 73
          Width = 108
          Height = 13
          Caption = 'Centro de Resultados:'
        end
        object Label11: TLabel
          Left = 16
          Top = 122
          Width = 40
          Height = 13
          Caption = 'Receita:'
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 43
          Width = 121
          Height = 21
          DataField = 'CPG_EST'
          DataSource = dsDados
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 16
          Top = 92
          Width = 121
          Height = 21
          DataField = 'CPG_CRS'
          DataSource = dsDados
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 16
          Top = 141
          Width = 121
          Height = 21
          DataField = 'CPG_CRD'
          DataSource = dsDados
          TabOrder = 2
        end
        object DBEdit7: TDBEdit
          Left = 16
          Top = 176
          Width = 121
          Height = 21
          DataField = 'CPG_FRN_CNPJ'
          DataSource = dsDados
          TabOrder = 3
        end
      end
    end
  end
  inherited qryMain: TFDQuery
    Connection = dmConnect.fdConn
    SQL.Strings = (
      'SELECT * FROM EMP')
    Left = 552
    Top = 288
    object qryMainCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 4
    end
    object qryMainNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qryMainCARTORIOEST: TStringField
      FieldName = 'CARTORIOEST'
      Origin = 'CARTORIOEST'
      Size = 4
    end
    object qryMainCARTORIOCRD: TStringField
      FieldName = 'CARTORIOCRD'
      Origin = 'CARTORIOCRD'
      Size = 10
    end
    object qryMainCARTORIOCRS: TStringField
      FieldName = 'CARTORIOCRS'
      Origin = 'CARTORIOCRS'
      Size = 10
    end
    object qryMainSERVICESEST: TStringField
      FieldName = 'SERVICESEST'
      Origin = 'SERVICESEST'
      Size = 4
    end
    object qryMainSERVICESCRD: TStringField
      FieldName = 'SERVICESCRD'
      Origin = 'SERVICESCRD'
      Size = 10
    end
    object qryMainSERVICESCRS: TStringField
      FieldName = 'SERVICESCRS'
      Origin = 'SERVICESCRS'
      Size = 10
    end
    object qryMainCPG_EST: TStringField
      FieldName = 'CPG_EST'
      Origin = 'CPG_EST'
      Size = 4
    end
    object qryMainCPG_CRD: TStringField
      FieldName = 'CPG_CRD'
      Origin = 'CPG_CRD'
      Size = 10
    end
    object qryMainCPG_CRS: TStringField
      FieldName = 'CPG_CRS'
      Origin = 'CPG_CRS'
      Size = 10
    end
    object qryMainVDR_COB_CODIGO: TStringField
      FieldName = 'VDR_COB_CODIGO'
      Origin = 'VDR_COB_CODIGO'
      Size = 4
    end
    object qryMainSER_CODIGO: TStringField
      FieldName = 'SER_CODIGO'
      Origin = 'SER_CODIGO'
      Size = 4
    end
    object qryMainVDR_TDC_CODIGO: TStringField
      FieldName = 'VDR_TDC_CODIGO'
      Origin = 'VDR_TDC_CODIGO'
      Size = 3
    end
    object qryMainMDS_CODIGO: TStringField
      FieldName = 'MDS_CODIGO'
      Origin = 'MDS_CODIGO'
      Size = 2
    end
    object qryMainCPG_FRN_CNPJ: TStringField
      FieldName = 'CPG_FRN_CNPJ'
      Origin = 'CPG_FRN_CNPJ'
      Size = 14
    end
  end
  inherited dsDados: TDataSource
    Left = 552
    Top = 240
  end
end
