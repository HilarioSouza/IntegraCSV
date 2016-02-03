object frmPreferencias: TfrmPreferencias
  Left = 0
  Top = 0
  Caption = 'Prefer'#234'ncias'
  ClientHeight = 553
  ClientWidth = 807
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
    Width = 807
    Height = 517
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 807
      Height = 517
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Conex'#227'o AG'
        object pnlConexaoAG: TPanel
          Left = 8
          Top = 8
          Width = 409
          Height = 140
          BevelOuter = bvNone
          TabOrder = 0
          object lblEnderecoBanco: TLabel
            Left = 0
            Top = 0
            Width = 98
            Height = 13
            Caption = 'Endere'#231'o banco AG:'
          end
          object lblUsuario: TLabel
            Left = 0
            Top = 103
            Width = 40
            Height = 13
            Caption = 'Usu'#225'rio:'
          end
          object lblSenha: TLabel
            Left = 127
            Top = 103
            Width = 34
            Height = 13
            Caption = 'Senha:'
          end
          object detEnderecoBanco: TDBEdit
            Left = 0
            Top = 15
            Width = 409
            Height = 21
            DataField = 'CAMINHOBANCO'
            DataSource = dtsCFG
            TabOrder = 0
          end
          object detUsuarioAG: TDBEdit
            Left = 0
            Top = 119
            Width = 121
            Height = 21
            DataField = 'USUARIO'
            DataSource = dtsCFG
            TabOrder = 2
          end
          object detSenhaAG: TDBEdit
            Left = 127
            Top = 119
            Width = 121
            Height = 21
            DataField = 'SENHA'
            DataSource = dtsCFG
            TabOrder = 3
          end
          object drgServidor: TDBRadioGroup
            Left = 0
            Top = 47
            Width = 233
            Height = 50
            Caption = 'Servidor:'
            Columns = 2
            DataField = 'SERVIDOR'
            DataSource = dtsCFG
            Items.Strings = (
              'MS SQL Server'
              'Firebird')
            TabOrder = 1
            Values.Strings = (
              '0'
              '1')
          end
        end
        object btnTestarConexao: TButton
          Left = 8
          Top = 160
          Width = 121
          Height = 25
          Caption = 'Testar Conex'#227'o'
          TabOrder = 1
          OnClick = btnTestarConexaoClick
        end
      end
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 517
    Width = 807
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object pnlButtons: TPanel
      Left = 649
      Top = 0
      Width = 158
      Height = 36
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnOk: TButton
        Left = 1
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Ok'
        TabOrder = 0
        OnClick = btnOkClick
      end
      object btnCancelar: TButton
        Left = 82
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = btnCancelarClick
      end
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
