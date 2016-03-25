object frmImportacao: TfrmImportacao
  Left = 0
  Top = 0
  Caption = 'Importador'
  ClientHeight = 689
  ClientWidth = 1105
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 1018
    Height = 689
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlGrid: TPanel
      Left = 0
      Top = 78
      Width = 1018
      Height = 611
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object pgcIMP: TPageControl
        Left = 0
        Top = 0
        Width = 1018
        Height = 611
        ActivePage = tshIMP
        Align = alClient
        TabOrder = 0
        object tshIMP: TTabSheet
          Caption = 'Importa'#231#245'es'
          object dgrIMP: TDBGrid
            Left = 0
            Top = 0
            Width = 1010
            Height = 583
            Align = alClient
            DataSource = ddsIMP
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
      end
    end
    object pnlArquivo: TPanel
      Left = 0
      Top = 0
      Width = 1018
      Height = 78
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object sbtCaminhoArquivo: TSpeedButton
        Left = 378
        Top = 16
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
      object lblImportacao: TLabel
        Left = 450
        Top = 42
        Width = 65
        Height = 13
        Caption = 'lblImportacao'
        Visible = False
      end
      object btnImportar: TButton
        Left = 8
        Top = 43
        Width = 75
        Height = 25
        Caption = 'Importar'
        TabOrder = 1
        OnClick = btnImportarClick
      end
      object edtCaminhoArquivo: TLabeledEdit
        Left = 8
        Top = 16
        Width = 368
        Height = 21
        EditLabel.Width = 99
        EditLabel.Height = 13
        EditLabel.Caption = 'Caminho do arquivo:'
        TabOrder = 0
      end
      object pgbImportacao: TProgressBar
        Left = 112
        Top = 48
        Width = 332
        Height = 17
        TabOrder = 2
        Visible = False
      end
    end
  end
  object pnlButtons: TPanel
    Left = 1018
    Top = 0
    Width = 87
    Height = 689
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object btnDesfazerIMP: TButton
      Left = 6
      Top = 70
      Width = 75
      Height = 25
      Caption = 'Desfazer'
      TabOrder = 0
      Visible = False
      OnClick = btnDesfazerIMPClick
    end
    object btnSair: TButton
      Left = 6
      Top = 133
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
    object btnListarImp: TButton
      Left = 6
      Top = 102
      Width = 75
      Height = 25
      Caption = 'Listar'
      TabOrder = 2
      OnClick = btnListarImpClick
    end
  end
  inline frEmpresa1: TfrEmpresa
    Left = 407
    Top = 0
    Width = 293
    Height = 36
    TabOrder = 2
    ExplicitLeft = 407
  end
  object ddsIMP: TDataSource
    DataSet = fqrIMP
    Left = 704
    Top = 32
  end
  object fqrIMP: TFDQuery
    Connection = dmConnect.fdConn
    SQL.Strings = (
      'select * from imp')
    Left = 712
    Top = 24
    object fqrIMPEMP_CODIGO: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMP_CODIGO'
      Origin = 'EMP_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object fqrIMPID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fqrIMPDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
  end
end
