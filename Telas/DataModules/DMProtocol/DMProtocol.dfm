object DM: TDM
  OldCreateOrder = False
  Height = 72
  Width = 210
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
    Active = True
    Connection = conexao
    CursorType = ctStatic
    AfterScroll = queryarquivosAfterScroll
    AfterRefresh = queryarquivosAfterRefresh
    Parameters = <
      item
        Name = 'pConsulta'
        DataType = ftString
        Direction = pdInputOutput
        Size = 16
        Value = ''
      end>
    SQL.Strings = (
      'select * from arquivos')
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
    object queryarquivoscategoria: TStringField
      FieldName = 'categoria'
      Size = 30
    end
  end
  object dsarquivos: TDataSource
    DataSet = queryarquivos
    Left = 160
    Top = 16
  end
end
