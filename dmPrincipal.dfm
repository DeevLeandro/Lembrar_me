object dmPrincipal1: TdmPrincipal1
  OnCreate = DataModuleCreate
  Height = 726
  Width = 1188
  PixelsPerInch = 120
  object FDSchemaAdapter1: TFDSchemaAdapter
    Left = 84
    Top = 231
  end
  object EMSFireDACClient1: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter1
    Resource = 'ServerPrincipal'
    Left = 84
    Top = 151
  end
  object fdtbPesquisaPessoa: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaPesquisaPessoa
    StoreDefs = True
    Left = 202
    Top = 252
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
    Top = 170
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 360
    Top = 20
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 190
    Top = 20
  end
  object EMSProvider1: TEMSProvider
    ApiVersion = '2'
    URLHost = 'localhost'
    URLPort = 8080
    Left = 64
    Top = 16
  end
  object RespCadastarLogin: TRESTResponse
    Left = 379
    Top = 593
  end
  object bckCadastarLogin: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmPOST
    Params = <>
    Resource = 'ServerPrincipal'
    ResourceSuffix = 'CadastroLogin'
    Response = RespCadastarLogin
    Left = 381
    Top = 509
  end
  object FDSchemaAdapter2: TFDSchemaAdapter
    Left = 324
    Top = 215
  end
  object EMSFireDACClient2: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter2
    Resource = 'ServerPrincipal'
    Left = 324
    Top = 135
  end
  object fdtbLogin: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaLogin
    StoreDefs = True
    Left = 442
    Top = 236
    object fdtbLoginlog_id: TIntegerField
      FieldName = 'log_id'
      Origin = 'log_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdtbLoginlog_login: TWideStringField
      FieldName = 'log_login'
      Origin = 'log_login'
      Size = 40
    end
    object fdtbLoginlog_senha: TWideStringField
      FieldName = 'log_senha'
      Origin = 'log_senha'
    end
    object fdtbLoginlog_qtde: TIntegerField
      FieldName = 'log_qtde'
      Origin = 'log_qtde'
    end
    object fdtbLoginlog_ativo: TSmallintField
      FieldName = 'log_ativo'
      Origin = 'log_ativo'
    end
  end
  object ftaLogin: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter2
    UpdateTableName = 'Table'
    DatSTableName = 'fdqryLogin'
    Left = 448
    Top = 154
  end
  object FDSchemaAdapter3: TFDSchemaAdapter
    Left = 556
    Top = 199
  end
  object EMSFireDACClient3: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter3
    Resource = 'ServerPrincipal'
    Left = 556
    Top = 119
  end
  object fdtbVerificarLoginExiste: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaVerificarLoginExiste
    StoreDefs = True
    Left = 682
    Top = 252
    object fdtbVerificarLoginExistelog_login: TWideStringField
      FieldName = 'log_login'
      Origin = 'log_login'
      Size = 40
    end
    object fdtbVerificarLoginExistelog_id: TIntegerField
      FieldName = 'log_id'
      Origin = 'log_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object ftaVerificarLoginExiste: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter3
    UpdateTableName = 'Table'
    DatSTableName = 'fdqryVerificarLoginExiste'
    Left = 680
    Top = 162
  end
  object respQuantidadeLogin: TRESTResponse
    Left = 235
    Top = 577
  end
  object bckQuantidadeLogin: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmPOST
    Params = <>
    Resource = 'ServerPrincipal'
    ResourceSuffix = 'QuantidadeLogin'
    Response = respQuantidadeLogin
    Left = 237
    Top = 493
  end
  object RespAlterarSenha: TRESTResponse
    Left = 59
    Top = 585
  end
  object bckAlterarSenha: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmPOST
    Params = <>
    Resource = 'ServerPrincipal'
    ResourceSuffix = 'AlterarSenha'
    Response = RespAlterarSenha
    Left = 61
    Top = 501
  end
  object RespInserirLembrete: TRESTResponse
    Left = 507
    Top = 625
  end
  object bckInserirLembrete: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmPOST
    Params = <>
    Resource = 'ServerPrincipal'
    ResourceSuffix = 'InserirLembrete'
    Response = RespInserirLembrete
    Left = 509
    Top = 541
  end
  object FDSchemaAdapter4: TFDSchemaAdapter
    Left = 844
    Top = 207
  end
  object EMSFireDACClient4: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter4
    Resource = 'ServerPrincipal'
    Left = 844
    Top = 127
  end
  object fdtbPesquisaLembrete: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaPesquisaLembrete
    StoreDefs = True
    Left = 970
    Top = 260
    object fdtbPesquisaLembretelem_id: TIntegerField
      FieldName = 'lem_id'
      Origin = 'lem_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdtbPesquisaLembretelem_data: TSQLTimeStampField
      FieldName = 'lem_data'
      Origin = 'lem_data'
      ProviderFlags = [pfInUpdate]
    end
    object fdtbPesquisaLembretelem_titulo: TWideStringField
      FieldName = 'lem_titulo'
      Origin = 'lem_titulo'
      Size = 60
    end
    object fdtbPesquisaLembretelog_id: TIntegerField
      FieldName = 'log_id'
      Origin = 'log_id'
    end
    object fdtbPesquisaLembretelem_hora: TWideStringField
      FieldName = 'lem_hora'
      Origin = 'lem_hora'
      Size = 10
    end
  end
  object ftaPesquisaLembrete: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter4
    UpdateTableName = 'Table'
    DatSTableName = 'fdqryPesquisaLembrete'
    Left = 968
    Top = 170
  end
  object RespDeletarLembrete: TRESTResponse
    Left = 659
    Top = 649
  end
  object bckDeletarLembrete: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmPOST
    Params = <>
    Resource = 'ServerPrincipal'
    ResourceSuffix = 'DeletarLembrete'
    Response = RespDeletarLembrete
    Left = 653
    Top = 565
  end
  object RespEditarLembrete: TRESTResponse
    Left = 795
    Top = 609
  end
  object bckEditarLembrete: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmPOST
    Params = <>
    Resource = 'ServerPrincipal'
    ResourceSuffix = 'EditarLembrete'
    Response = RespEditarLembrete
    Left = 789
    Top = 525
  end
end
