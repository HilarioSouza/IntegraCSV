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
          Left = 11
          Top = 3
          Width = 446
          Height = 262
          BevelOuter = bvNone
          TabOrder = 0
          object lblEnderecoBanco: TLabel
            Left = 0
            Top = 48
            Width = 98
            Height = 13
            Caption = 'Endere'#231'o banco AG:'
          end
          object lblUsuario: TLabel
            Left = 0
            Top = 151
            Width = 40
            Height = 13
            Caption = 'Usu'#225'rio:'
          end
          object lblSenha: TLabel
            Left = 127
            Top = 151
            Width = 34
            Height = 13
            Caption = 'Senha:'
          end
          object sbtCaminhoArquivo: TSpeedButton
            Left = 414
            Top = 63
            Width = 23
            Height = 21
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555FFFFFFFFFF55555000000000055555577777777775FFFF00B8B8B8B8B0
              0000775F5555555777770B0B8B8B8B8B0FF07F75F555555575F70FB0B8B8B8B8
              B0F07F575FFFFFFFF7F70BFB0000000000F07F557777777777570FBFBF0FFFFF
              FFF07F55557F5FFFFFF70BFBFB0F000000F07F55557F777777570FBFBF0FFFFF
              FFF075F5557F5FFFFFF750FBFB0F000000F0575FFF7F777777575700000FFFFF
              FFF05577777F5FF55FF75555550F00FF00005555557F775577775555550FFFFF
              0F055555557F55557F755555550FFFFF00555555557FFFFF7755555555000000
              0555555555777777755555555555555555555555555555555555}
            NumGlyphs = 2
            OnClick = sbtCaminhoArquivoClick
          end
          object detEnderecoBanco: TDBEdit
            Left = 0
            Top = 63
            Width = 409
            Height = 21
            DataField = 'CAMINHOBANCO'
            DataSource = dtsCFG
            TabOrder = 0
          end
          object detUsuarioAG: TDBEdit
            Left = 0
            Top = 167
            Width = 121
            Height = 21
            DataField = 'USUARIO'
            DataSource = dtsCFG
            TabOrder = 2
          end
          object detSenhaAG: TDBEdit
            Left = 127
            Top = 167
            Width = 121
            Height = 21
            DataField = 'SENHA'
            DataSource = dtsCFG
            TabOrder = 3
          end
          object drgServidor: TDBRadioGroup
            Left = 0
            Top = 95
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
            TabStop = True
            Values.Strings = (
              '0'
              '1')
          end
          object btnTestarConexao: TButton
            Left = 0
            Top = 197
            Width = 121
            Height = 25
            Caption = 'Testar Conex'#227'o'
            TabOrder = 4
            OnClick = btnTestarConexaoClick
          end
          inline frEmpresa1: TfrEmpresa
            Left = 0
            Top = 6
            Width = 293
            Height = 36
            TabOrder = 5
            ExplicitTop = 6
            inherited edtCodEmpresa: TDBEdit
              DataField = 'EMP_Codigo'
              DataSource = dtsCFG
            end
          end
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
