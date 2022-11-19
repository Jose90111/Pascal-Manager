object DM: TDM
  OldCreateOrder = False
  Height = 78
  Width = 377
  object conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=Pasca' +
      'lManager_Database'
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object queryarquivos: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    AfterScroll = queryarquivosAfterScroll
    AfterRefresh = queryarquivosAfterRefresh
    Parameters = <
      item
        Name = 'pConsulta'
        DataType = ftString
        Direction = pdInputOutput
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from arquivos'
      'inner join categoria on arquivos.categoria=categoria.id')
    Left = 88
    Top = 16
    object queryarquivosid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object queryarquivosnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object queryarquivosdiretorio: TStringField
      FieldName = 'diretorio'
      Size = 255
    end
    object queryarquivostipo: TStringField
      FieldName = 'tipo'
      Size = 8
    end
    object queryarquivosstatus: TStringField
      FieldName = 'status'
    end
    object queryarquivoslocalf: TStringField
      FieldName = 'localf'
    end
    object queryarquivoscomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object queryarquivosprazo: TDateField
      FieldName = 'prazo'
    end
    object queryarquivosresponsavel: TStringField
      FieldName = 'responsavel'
      Size = 40
    end
    object queryarquivosdataCadastro: TStringField
      FieldName = 'dataCadastro'
    end
    object queryarquivoscategoria: TIntegerField
      FieldName = 'categoria'
    end
    object queryarquivosnome_1: TStringField
      FieldName = 'nome_1'
      LookupDataSet = code
      ReadOnly = True
      Size = 40
    end
  end
  object dsarquivos: TDataSource
    DataSet = queryarquivos
    Left = 160
    Top = 16
  end
  object dsCode: TDataSource
    DataSet = code
    Left = 328
    Top = 16
  end
  object code: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    DataSource = dsarquivos
    Parameters = <
      item
        Name = 'pCategoria'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdOutput
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from categoria')
    Left = 280
    Top = 16
    object codenome: TStringField
      FieldName = 'nome'
      LookupDataSet = queryarquivos
      Size = 40
    end
  end
end
