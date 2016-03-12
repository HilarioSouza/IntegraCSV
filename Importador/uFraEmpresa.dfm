object frEmpresa: TfrEmpresa
  Left = 0
  Top = 0
  Width = 293
  Height = 36
  TabOrder = 0
  object Label1: TLabel
    Left = 64
    Top = 0
    Width = 45
    Height = 13
    Caption = 'Empresa:'
  end
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 37
    Height = 13
    AutoSize = False
    Caption = 'C'#243'digo:'
  end
  object dcbEMP: TDBLookupComboBox
    Left = 64
    Top = 15
    Width = 229
    Height = 21
    KeyField = 'CODIGO'
    ListField = 'NOME'
    ListSource = ddsEMP
    TabOrder = 0
    OnCloseUp = dcbEMPCloseUp
    OnExit = dcbEMPExit
  end
  object edtCodEmpresa: TDBEdit
    Left = 2
    Top = 15
    Width = 55
    Height = 21
    TabOrder = 1
    OnChange = edtCodEmpresaChange
    OnExit = edtCodEmpresaExit
  end
  object ddsEMP: TDataSource
    DataSet = fqrEMP
    Left = 180
    Top = 24
  end
  object fqrEMP: TFDQuery
    Connection = dmConnect.fdConn
    SQL.Strings = (
      'select * from emp')
    Left = 204
    Top = 24
  end
end
