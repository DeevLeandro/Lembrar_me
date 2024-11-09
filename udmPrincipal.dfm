object dmPrincipal: TdmPrincipal
  OnCreate = DataModuleCreate
  Height = 564
  Width = 810
  PixelsPerInch = 120
  object EMSProvider1: TEMSProvider
    ApiVersion = '1'
    AppSecret = 'DE1BA56B-43C5-469D-9BD2-4EB146EB8473'
    URLHost = 'localhost'
    URLPort = 8080
    Left = 50
    Top = 68
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 360
    Top = 68
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 190
    Top = 68
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    Left = 76
    Top = 263
  end
  object EMSFireDACClient1: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter1
    Resource = 'ServerPrincipal'
    Left = 76
    Top = 183
  end
  object fdtbPesquisaPessoa: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaPesquisaPessoa
    StoreDefs = True
    Left = 194
    Top = 284
    object fdtbPesquisaPessoapes_id: TIntegerField
      FieldName = 'pes_id'
      Origin = 'pes_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdtbPesquisaPessoapes_nome: TWideStringField
      FieldName = 'pes_nome'
      Origin = 'pes_nome'
      Size = 60
    end
    object fdtbPesquisaPessoapes_cpf_cnpj: TWideStringField
      FieldName = 'pes_cpf_cnpj'
      Origin = 'pes_cpf_cnpj'
      Size = 18
    end
    object fdtbPesquisaPessoapes_cep: TWideStringField
      FieldName = 'pes_cep'
      Origin = 'pes_cep'
      Size = 10
    end
    object fdtbPesquisaPessoapes_bairro: TWideStringField
      FieldName = 'pes_bairro'
      Origin = 'pes_bairro'
      Size = 30
    end
    object fdtbPesquisaPessoapes_cidade: TWideStringField
      FieldName = 'pes_cidade'
      Origin = 'pes_cidade'
      Size = 30
    end
    object fdtbPesquisaPessoapes_endereco: TWideStringField
      FieldName = 'pes_endereco'
      Origin = 'pes_endereco'
      Size = 80
    end
    object fdtbPesquisaPessoapes_numero: TWideStringField
      FieldName = 'pes_numero'
      Origin = 'pes_numero'
      Size = 10
    end
  end
  object ftaPesquisaPessoa: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter1
    UpdateTableName = 'Table'
    DatSTableName = 'fdqryPesquisaPessoa'
    Left = 208
    Top = 202
  end
end
