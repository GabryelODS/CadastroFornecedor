object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 284
  Width = 330
  object sqlConexaoFornecedor: TSQLConnection
    ConnectionName = 'OracleConnection'
    DriverName = 'Oracle'
    GetDriverFunc = 'getSQLDriverORACLE'
    LibraryName = 'dbxora.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Oracle'
      'DataBase=xe'
      'User_Name=local'
      'Password=local'
      'RowsetSize=20'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OS Authentication=False'
      'Multiple Transaction=False'
      'Trim Char=False'
      'Decimal Separator=.')
    VendorLib = 'oci.dll'
    Left = 88
    Top = 32
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 144
    object cdsFornecedorCodFornec: TIntegerField
      FieldName = 'CodFornec'
    end
    object cdsFornecedorNome: TStringField
      DisplayWidth = 45
      FieldName = 'Nome'
      Size = 80
    end
    object cdsFornecedorCGC: TIntegerField
      DisplayWidth = 12
      FieldName = 'CGC'
    end
    object cdsFornecedorEndereço: TStringField
      DisplayWidth = 60
      FieldName = 'Endere'#231'o'
      Size = 50
    end
    object cdsFornecedorDataCadastro: TDateField
      DisplayWidth = 14
      FieldName = 'DataCadastro'
    end
  end
  object dtFornecedor: TDataSource
    DataSet = cdsFornecedor
    Left = 88
    Top = 88
  end
end
