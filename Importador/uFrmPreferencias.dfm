object frmPreferencias: TfrmPreferencias
  Left = 0
  Top = 0
  Caption = 'Prefer'#234'ncias'
  ClientHeight = 603
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlConfigAGLib: TPanel
    Left = 0
    Top = 0
    Width = 796
    Height = 567
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 8
      Top = 8
      Width = 704
      Height = 513
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Conex'#227'o AG'
        object pnlConexaoAG: TPanel
          Left = 8
          Top = 8
          Width = 497
          Height = 202
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 57
            Width = 98
            Height = 13
            Caption = 'Endere'#231'o banco AG:'
          end
          object Label2: TLabel
            Left = 8
            Top = 3
            Width = 45
            Height = 13
            Caption = 'Empresa:'
          end
          object Label3: TLabel
            Left = 8
            Top = 160
            Width = 40
            Height = 13
            Caption = 'Usu'#225'rio:'
          end
          object Label4: TLabel
            Left = 135
            Top = 160
            Width = 34
            Height = 13
            Caption = 'Senha:'
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 72
            Width = 409
            Height = 21
            DataField = 'CAMINHOBANCO'
            DataSource = dtsCFG
            TabOrder = 1
          end
          object detUsuarioAG: TDBEdit
            Left = 8
            Top = 176
            Width = 121
            Height = 21
            DataField = 'USUARIO'
            DataSource = dtsCFG
            TabOrder = 3
          end
          object detSenhaAG: TDBEdit
            Left = 135
            Top = 176
            Width = 121
            Height = 21
            DataField = 'SENHA'
            DataSource = dtsCFG
            TabOrder = 4
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 8
            Top = 104
            Width = 233
            Height = 50
            Caption = 'Servidor:'
            Columns = 2
            DataField = 'SERVIDOR'
            DataSource = dtsCFG
            Items.Strings = (
              'MS SQL Server'
              'Firebird')
            TabOrder = 2
            Values.Strings = (
              '0'
              '1')
          end
          object detEmpresa: TDBEdit
            Left = 8
            Top = 22
            Width = 121
            Height = 21
            DataField = 'EMP_CODIGO'
            DataSource = dtsCFG
            TabOrder = 0
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Ximenes Services'
        ImageIndex = 1
        object pnlXimenesServices: TPanel
          Left = 16
          Top = 16
          Width = 553
          Height = 369
          TabOrder = 0
          object Label5: TLabel
            Left = 0
            Top = -3
            Width = 82
            Height = 13
            Caption = 'Estabelecimento:'
          end
          object Label6: TLabel
            Left = 0
            Top = 46
            Width = 108
            Height = 13
            Caption = 'Centro de Resultados:'
          end
          object Label7: TLabel
            Left = 0
            Top = 95
            Width = 40
            Height = 13
            Caption = 'Receita:'
          end
          object detEstabelecimento: TDBEdit
            Left = 0
            Top = 16
            Width = 121
            Height = 21
            DataField = 'SERVICESEST'
            DataSource = dtsCFG
            TabOrder = 0
          end
          object detCentroResultados: TDBEdit
            Left = 0
            Top = 65
            Width = 121
            Height = 21
            DataField = 'SERVICESCRS'
            DataSource = dtsCFG
            TabOrder = 1
          end
          object detReceita: TDBEdit
            Left = 0
            Top = 114
            Width = 121
            Height = 21
            DataField = 'SERVICESCRD'
            DataSource = dtsCFG
            TabOrder = 2
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Cart'#243'rio Ximenes'
        ImageIndex = 2
        object pnlCartorioXimenes: TPanel
          Left = 16
          Top = 16
          Width = 537
          Height = 361
          TabOrder = 0
          object Label8: TLabel
            Left = 0
            Top = -3
            Width = 82
            Height = 13
            Caption = 'Estabelecimento:'
          end
          object Label9: TLabel
            Left = 0
            Top = 46
            Width = 108
            Height = 13
            Caption = 'Centro de Resultados:'
          end
          object Label10: TLabel
            Left = 0
            Top = 95
            Width = 40
            Height = 13
            Caption = 'Receita:'
          end
          object DBEdit2: TDBEdit
            Left = 0
            Top = 16
            Width = 121
            Height = 21
            DataField = 'CARTORIOEST'
            DataSource = dtsCFG
            TabOrder = 0
          end
          object DBEdit3: TDBEdit
            Left = 0
            Top = 65
            Width = 121
            Height = 21
            DataField = 'CARTORIOCRS'
            DataSource = dtsCFG
            TabOrder = 1
          end
          object DBEdit4: TDBEdit
            Left = 0
            Top = 114
            Width = 121
            Height = 21
            DataField = 'CARTORIOCRD'
            DataSource = dtsCFG
            TabOrder = 2
          end
        end
      end
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 567
    Width = 796
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnOk: TButton
      Left = 637
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancelar: TButton
      Left = 718
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object dtsCFG: TDataSource
    DataSet = qryCFG
    Left = 728
    Top = 16
  end
  object qryCFG: TFDQuery
    Connection = dmConnect.fdConn
    SQL.Strings = (
      'select * from cfg')
    Left = 760
    Top = 16
  end
end
