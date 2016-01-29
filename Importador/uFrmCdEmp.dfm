inherited frmCdEmp: TfrmCdEmp
  Caption = 'Cadastro de Empresas'
  ClientHeight = 560
  ClientWidth = 1003
  ExplicitWidth = 1009
  ExplicitHeight = 588
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnCaptionTela: TPanel
    Width = 993
    ExplicitWidth = 646
  end
  inherited pnTop: TPanel
    Width = 993
    ExplicitWidth = 646
    inherited Panel1: TPanel
      Width = 993
      ExplicitWidth = 646
      ExplicitHeight = 32
    end
  end
  inherited pgCrud: TPageControl
    Width = 1003
    Height = 466
    ExplicitTop = 94
    ExplicitWidth = 656
    ExplicitHeight = 371
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
      object PageControl1: TPageControl
        Left = 0
        Top = 56
        Width = 995
        Height = 382
        ActivePage = TabSheet2
        Align = alBottom
        TabOrder = 2
        object TabSheet1: TTabSheet
          Caption = 'Contas a Receber'
          ExplicitWidth = 285
          ExplicitHeight = 165
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
        end
        object TabSheet2: TTabSheet
          Caption = 'Contas a Pagar'
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitHeight = 285
          object gbxContasaPagar: TGroupBox
            Left = 11
            Top = 3
            Width = 177
            Height = 216
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
              Top = 63
              Width = 108
              Height = 13
              Caption = 'Centro de Resultados:'
            end
            object Label11: TLabel
              Left = 8
              Top = 110
              Width = 40
              Height = 13
              Caption = 'Receita:'
            end
            object Label12: TLabel
              Left = 8
              Top = 157
              Width = 118
              Height = 13
              Caption = 'Fornecedor (CNPJ/CPF):'
            end
            object detEstab: TDBEdit
              Left = 8
              Top = 35
              Width = 145
              Height = 21
              DataField = 'CPG_EST'
              DataSource = dsDados
              TabOrder = 0
            end
            object detCRS: TDBEdit
              Left = 3
              Top = 82
              Width = 145
              Height = 21
              DataField = 'CPG_CRS'
              DataSource = dsDados
              TabOrder = 1
            end
            object detCRD: TDBEdit
              Left = 8
              Top = 129
              Width = 145
              Height = 21
              DataField = 'CPG_CRD'
              DataSource = dsDados
              TabOrder = 2
            end
            object detFRN_CNPJ: TDBEdit
              Left = 8
              Top = 176
              Width = 145
              Height = 21
              DataField = 'CPG_FRN_CNPJ'
              DataSource = dsDados
              TabOrder = 3
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Servi'#231'os'
          ImageIndex = 2
          ExplicitLeft = 3
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
            end
            object detCodModalidade: TDBEdit
              Left = 11
              Top = 79
              Width = 121
              Height = 21
              DataField = 'MDS_CODIGO'
              DataSource = dsDados
              TabOrder = 1
            end
            object detTipoDoc: TDBEdit
              Left = 11
              Top = 123
              Width = 121
              Height = 21
              DataField = 'VDR_TDC_CODIGO'
              DataSource = dsDados
              TabOrder = 2
            end
            object detAgenteCob: TDBEdit
              Left = 11
              Top = 168
              Width = 121
              Height = 21
              DataField = 'VDR_COB_CODIGO'
              DataSource = dsDados
              TabOrder = 3
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
  end
  inherited dsDados: TDataSource
    Left = 552
    Top = 240
  end
end
