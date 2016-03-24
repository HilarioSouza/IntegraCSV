inherited frmCdEmp: TfrmCdEmp
  Caption = 'Cadastro de Empresas'
  ClientHeight = 560
  ClientWidth = 1003
  ExplicitTop = -45
  ExplicitWidth = 1009
  ExplicitHeight = 588
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton [0]
    Left = 568
    Top = 304
    Width = 23
    Height = 22
  end
  inherited pnCaptionTela: TPanel
    Width = 993
    ExplicitWidth = 993
    inherited Label1: TLabel
      Width = 63
      Caption = 'Empresas'
      ExplicitWidth = 63
    end
    inherited Label2: TLabel
      Width = 256
      Caption = 'Dados de parametriza'#231#227'o com o Fortes Financeiro'
      ExplicitWidth = 256
    end
  end
  inherited pnTop: TPanel
    Width = 993
    ExplicitWidth = 993
    inherited Panel1: TPanel
      Width = 993
      ExplicitWidth = 993
    end
  end
  inherited pgCrud: TPageControl
    Width = 1003
    Height = 466
    ExplicitWidth = 1003
    ExplicitHeight = 466
    inherited tsPsq: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 995
      ExplicitHeight = 438
      inherited gridPsq: TDBGrid
        Width = 995
        Height = 438
      end
    end
    inherited tsCad: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 995
      ExplicitHeight = 438
      object lblNome: TLabel [0]
        Left = 55
        Top = 7
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      inherited pnlCadastro: TPanel
        Width = 995
        Height = 438
        Align = alTop
        ExplicitTop = 0
        ExplicitWidth = 995
        ExplicitHeight = 438
        inherited lblCodigo: TLabel
          Width = 37
          Caption = 'C'#243'digo:'
          ExplicitWidth = 37
        end
        inherited edtID: TDBEdit
          DataField = 'CODIGO'
        end
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
      object pgcEmpresa: TPageControl
        Left = 0
        Top = 50
        Width = 995
        Height = 388
        ActivePage = tshServicos
        TabOrder = 2
        object tshContasaReceber: TTabSheet
          Caption = 'Contas a Receber'
          object gbxXimenesServices: TGroupBox
            Left = 3
            Top = 3
            Width = 140
            Height = 168
            Caption = ' Ximenes Services: '
            TabOrder = 0
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
              OnExit = detEstabelecimentoExit
            end
          end
          object gbxCartorioXimenes: TGroupBox
            Left = 167
            Top = 3
            Width = 139
            Height = 168
            Caption = ' Cart'#243'rio Ximenes: '
            TabOrder = 1
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
            object detEstCartorio: TDBEdit
              Left = 8
              Top = 35
              Width = 121
              Height = 21
              DataField = 'CARTORIOEST'
              DataSource = dsDados
              TabOrder = 0
              OnExit = detEstCartorioExit
            end
            object detCRSCartorio: TDBEdit
              Left = 8
              Top = 84
              Width = 121
              Height = 21
              DataField = 'CARTORIOCRS'
              DataSource = dsDados
              TabOrder = 1
            end
            object detCRDCartorio: TDBEdit
              Left = 8
              Top = 133
              Width = 121
              Height = 21
              DataField = 'CARTORIOCRD'
              DataSource = dsDados
              TabOrder = 2
            end
          end
        end
        object tshContasaPagar: TTabSheet
          Caption = 'Contas a Pagar'
          ImageIndex = 1
          object gbxContasaPagar: TGroupBox
            Left = 11
            Top = 3
            Width = 168
            Height = 286
            Caption = ' Dados: '
            TabOrder = 0
            object Label3: TLabel
              Left = 8
              Top = 16
              Width = 82
              Height = 13
              Caption = 'Estabelecimento:'
            end
            object Label4: TLabel
              Left = 8
              Top = 56
              Width = 108
              Height = 13
              Caption = 'Centro de Resultados:'
            end
            object Label11: TLabel
              Left = 8
              Top = 96
              Width = 45
              Height = 13
              Caption = 'Despesa:'
            end
            object Label12: TLabel
              Left = 8
              Top = 137
              Width = 118
              Height = 13
              Caption = 'Fornecedor (CNPJ/CPF):'
            end
            object lblCPG_CON: TLabel
              Left = 8
              Top = 187
              Width = 85
              Height = 13
              Caption = 'Conta Financeira:'
              FocusControl = detCPG_CON
            end
            object lblCPG_TDC: TLabel
              Left = 8
              Top = 237
              Width = 96
              Height = 13
              Caption = 'Tipo de Documento:'
              FocusControl = detCPG_TDC
            end
            object detEstabCPG: TDBEdit
              Left = 8
              Top = 32
              Width = 145
              Height = 21
              DataField = 'CPG_EST'
              DataSource = dsDados
              TabOrder = 0
              OnExit = detEstabCPGExit
            end
            object detCRS: TDBEdit
              Left = 8
              Top = 72
              Width = 145
              Height = 21
              DataField = 'CPG_CRS'
              DataSource = dsDados
              TabOrder = 1
            end
            object detCRD: TDBEdit
              Left = 8
              Top = 112
              Width = 145
              Height = 21
              DataField = 'CPG_CRD'
              DataSource = dsDados
              TabOrder = 2
            end
            object detFRN_CNPJ: TDBEdit
              Left = 8
              Top = 156
              Width = 145
              Height = 21
              DataField = 'CPG_FRN_CNPJ'
              DataSource = dsDados
              TabOrder = 3
            end
            object detCPG_CON: TDBEdit
              Left = 8
              Top = 206
              Width = 145
              Height = 21
              DataField = 'CPG_CON_CODIGO'
              DataSource = dsDados
              TabOrder = 4
              OnExit = detCPG_CONExit
            end
            object detCPG_TDC: TDBEdit
              Left = 8
              Top = 252
              Width = 145
              Height = 21
              DataField = 'CPG_TDC_CODIGO'
              DataSource = dsDados
              TabOrder = 5
              OnExit = detCPG_TDCExit
            end
          end
          object gbxLAN_BVP: TGroupBox
            Left = 193
            Top = 3
            Width = 160
            Height = 150
            Caption = ' Lan'#231'amentos das baixas: '
            TabOrder = 1
            object lblReceitaDescBVP: TLabel
              Left = 8
              Top = 16
              Width = 103
              Height = 13
              Caption = 'Receita de Desconto:'
              FocusControl = detReceitaDescBVP
            end
            object lblDespJurosBVP: TLabel
              Left = 8
              Top = 56
              Width = 89
              Height = 13
              Caption = 'Despesa de Juros:'
              FocusControl = detDespesaJurosBVP
            end
            object lblContaFinBVP: TLabel
              Left = 8
              Top = 96
              Width = 80
              Height = 13
              Caption = 'Conta Finaneira:'
              FocusControl = detContaBaixaBVP
            end
            object detReceitaDescBVP: TDBEdit
              Left = 8
              Top = 32
              Width = 134
              Height = 21
              DataField = 'BVP_CRD_DESC'
              DataSource = dsDados
              TabOrder = 0
            end
            object detDespesaJurosBVP: TDBEdit
              Left = 8
              Top = 72
              Width = 134
              Height = 21
              DataField = 'BVP_CRD_JUROS'
              DataSource = dsDados
              TabOrder = 1
            end
            object detContaBaixaBVP: TDBEdit
              Left = 8
              Top = 112
              Width = 134
              Height = 21
              DataField = 'BVP_CON_CODIGO'
              DataSource = dsDados
              TabOrder = 2
              OnExit = detContaBaixaBVPExit
            end
          end
        end
        object tshServicos: TTabSheet
          Caption = 'Servi'#231'os'
          ImageIndex = 2
          object GroupBox1: TGroupBox
            Left = 3
            Top = 3
            Width = 142
            Height = 198
            Caption = ' Dados: '
            TabOrder = 0
            object lblServico: TLabel
              Left = 11
              Top = 20
              Width = 39
              Height = 13
              Caption = 'Servi'#231'o:'
            end
            object lblModalidade: TLabel
              Left = 11
              Top = 65
              Width = 58
              Height = 13
              Caption = 'Modalidade:'
            end
            object lblTipoDoc: TLabel
              Left = 11
              Top = 108
              Width = 96
              Height = 13
              Caption = 'Tipo de Documento:'
            end
            object lblAgenteCob: TLabel
              Left = 11
              Top = 153
              Width = 87
              Height = 13
              Caption = 'Agente Cobrador:'
            end
            object detCodServico: TDBEdit
              Left = 11
              Top = 35
              Width = 121
              Height = 21
              DataField = 'SER_CODIGO'
              DataSource = dsDados
              TabOrder = 0
              OnExit = detCodServicoExit
            end
            object detCodModalidade: TDBEdit
              Left = 11
              Top = 79
              Width = 121
              Height = 21
              DataField = 'MDS_CODIGO'
              DataSource = dsDados
              TabOrder = 1
              OnExit = detCodModalidadeExit
            end
            object detTipoDoc: TDBEdit
              Left = 11
              Top = 123
              Width = 121
              Height = 21
              DataField = 'VDR_TDC_CODIGO'
              DataSource = dsDados
              TabOrder = 2
              OnExit = detTipoDocExit
            end
            object detAgenteCob: TDBEdit
              Left = 11
              Top = 168
              Width = 121
              Height = 21
              DataField = 'VDR_COB_CODIGO'
              DataSource = dsDados
              TabOrder = 3
              OnExit = detAgenteCobExit
            end
          end
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
      DisplayLabel = 'C'#243'd. Empresa AG'
      FieldName = 'CODIGO'
      Size = 4
    end
    object qryMainNOME: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'NOME'
      Size = 100
    end
    object qryMainCARTORIOEST: TStringField
      DisplayLabel = 'Estab. Cart'#243'rio'
      FieldName = 'CARTORIOEST'
      Origin = 'CARTORIOEST'
      Size = 4
    end
    object qryMainCARTORIOCRD: TStringField
      DisplayLabel = 'Receita Cart'#243'rio'
      FieldName = 'CARTORIOCRD'
      Origin = 'CARTORIOCRD'
      Size = 10
    end
    object qryMainCARTORIOCRS: TStringField
      DisplayLabel = 'Centro Result. Cart'#243'rio'
      FieldName = 'CARTORIOCRS'
      Origin = 'CARTORIOCRS'
      Size = 10
    end
    object qryMainSERVICESEST: TStringField
      DisplayLabel = 'Estab. Services'
      FieldName = 'SERVICESEST'
      Origin = 'SERVICESEST'
      Size = 4
    end
    object qryMainSERVICESCRD: TStringField
      DisplayLabel = 'Receita Services'
      FieldName = 'SERVICESCRD'
      Origin = 'SERVICESCRD'
      Size = 10
    end
    object qryMainSERVICESCRS: TStringField
      DisplayLabel = 'Centro Result. Services'
      FieldName = 'SERVICESCRS'
      Origin = 'SERVICESCRS'
      Size = 10
    end
    object qryMainCPG_EST: TStringField
      DisplayLabel = 'Estab. Contas a Pagar'
      FieldName = 'CPG_EST'
      Origin = 'CPG_EST'
      Size = 4
    end
    object qryMainCPG_CRD: TStringField
      DisplayLabel = 'Despesa Contas a Pagar'
      FieldName = 'CPG_CRD'
      Origin = 'CPG_CRD'
      Size = 10
    end
    object qryMainCPG_CRS: TStringField
      DisplayLabel = 'Centro Result. Contas a Pagar'
      FieldName = 'CPG_CRS'
      Origin = 'CPG_CRS'
      Size = 10
    end
    object qryMainVDR_COB_CODIGO: TStringField
      DisplayLabel = 'Agente Cobrador'
      FieldName = 'VDR_COB_CODIGO'
      Origin = 'VDR_COB_CODIGO'
      Size = 4
    end
    object qryMainSER_CODIGO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'SER_CODIGO'
      Origin = 'SER_CODIGO'
      Size = 4
    end
    object qryMainVDR_TDC_CODIGO: TStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'VDR_TDC_CODIGO'
      Origin = 'VDR_TDC_CODIGO'
      Size = 3
    end
    object qryMainMDS_CODIGO: TStringField
      DisplayLabel = 'Modalidade'
      FieldName = 'MDS_CODIGO'
      Origin = 'MDS_CODIGO'
      Size = 2
    end
    object qryMainCPG_FRN_CNPJ: TStringField
      DisplayLabel = 'Forn. CNPJ'
      FieldName = 'CPG_FRN_CNPJ'
      Origin = 'CPG_FRN_CNPJ'
      Size = 14
    end
    object qryMainCPG_CON_CODIGO: TStringField
      FieldName = 'CPG_CON_CODIGO'
      Origin = 'CPG_CON_CODIGO'
      Size = 4
    end
    object qryMainCPG_TDC_CODIGO: TStringField
      FieldName = 'CPG_TDC_CODIGO'
      Origin = 'CPG_TDC_CODIGO'
      Size = 3
    end
    object qryMainBVP_CRD_DESC: TStringField
      FieldName = 'BVP_CRD_DESC'
      Origin = 'BVP_CRD_DESC'
      Size = 10
    end
    object qryMainBVP_CRD_JUROS: TStringField
      FieldName = 'BVP_CRD_JUROS'
      Origin = 'BVP_CRD_JUROS'
      Size = 10
    end
    object qryMainBVP_CON_CODIGO: TStringField
      FieldName = 'BVP_CON_CODIGO'
      Origin = 'BVP_CON_CODIGO'
      Size = 4
    end
  end
  inherited dsDados: TDataSource
    Left = 552
    Top = 240
  end
end
