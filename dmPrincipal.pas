unit dmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.FMXUI.Wait, IPPeerClient,
  REST.Backend.EMSProvider, FireDAC.Stan.StorageJSON, FireDAC.Stan.Intf,
  FireDAC.Comp.UI, FireDAC.Stan.Option, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Stan.Param, FireDAC.Stan.Error,
  REST.Backend.EMSServices, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Backend.EMSFireDAC, System.DateUtils, REST.Backend.ServiceTypes,
  System.JSON, REST.Client, REST.Backend.EndPoint, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TdmPrincipal1 = class(TDataModule)
    FDSchemaAdapter1: TFDSchemaAdapter;
    EMSFireDACClient1: TEMSFireDACClient;
    fdtbPesquisaPessoa: TFDMemTable;
    ftaPesquisaPessoa: TFDTableAdapter;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    fdtbPesquisaPessoapes_id: TIntegerField;
    fdtbPesquisaPessoapes_nome: TWideStringField;
    fdtbPesquisaPessoapes_cpf_cnpj: TWideStringField;
    fdtbPesquisaPessoapes_cep: TWideStringField;
    fdtbPesquisaPessoapes_bairro: TWideStringField;
    fdtbPesquisaPessoapes_cidade: TWideStringField;
    fdtbPesquisaPessoapes_endereco: TWideStringField;
    fdtbPesquisaPessoapes_numero: TWideStringField;
    EMSProvider1: TEMSProvider;
    RespCadastarLogin: TRESTResponse;
    bckCadastarLogin: TBackendEndpoint;
    FDSchemaAdapter2: TFDSchemaAdapter;
    EMSFireDACClient2: TEMSFireDACClient;
    fdtbLogin: TFDMemTable;
    ftaLogin: TFDTableAdapter;
    fdtbLoginlog_id: TIntegerField;
    fdtbLoginlog_login: TWideStringField;
    fdtbLoginlog_senha: TWideStringField;
    fdtbLoginlog_qtde: TIntegerField;
    fdtbLoginlog_ativo: TSmallintField;
    FDSchemaAdapter3: TFDSchemaAdapter;
    EMSFireDACClient3: TEMSFireDACClient;
    fdtbVerificarLoginExiste: TFDMemTable;
    ftaVerificarLoginExiste: TFDTableAdapter;
    respQuantidadeLogin: TRESTResponse;
    bckQuantidadeLogin: TBackendEndpoint;
    RespAlterarSenha: TRESTResponse;
    bckAlterarSenha: TBackendEndpoint;
    fdtbVerificarLoginExistelog_login: TWideStringField;
    fdtbVerificarLoginExistelog_id: TIntegerField;
    RespInserirLembrete: TRESTResponse;
    bckInserirLembrete: TBackendEndpoint;
    FDSchemaAdapter4: TFDSchemaAdapter;
    EMSFireDACClient4: TEMSFireDACClient;
    fdtbPesquisaLembrete: TFDMemTable;
    ftaPesquisaLembrete: TFDTableAdapter;
    fdtbPesquisaLembretelem_id: TIntegerField;
    fdtbPesquisaLembretelem_data: TSQLTimeStampField;
    fdtbPesquisaLembretelem_titulo: TWideStringField;
    fdtbPesquisaLembretelog_id: TIntegerField;
    fdtbPesquisaLembretelem_hora: TWideStringField;
    RespDeletarLembrete: TRESTResponse;
    bckDeletarLembrete: TBackendEndpoint;
    RespEditarLembrete: TRESTResponse;
    bckEditarLembrete: TBackendEndpoint;
    procedure DataModuleCreate(Sender: TObject);
  private
    FIDLogin: Integer;
    FIDLembrete: Integer;
    procedure SetIDLogin(const Value: Integer);
    procedure SetIDLembrete(const Value: Integer);

    { Private declarations }
  public
   function CadastarLogin(pLogin, pSenha : string):string;
   function AlterarSenha(pSenha,pIDLogin : string):string;
   function VerificarLoginExiste(pLogin : string):string;
   function QuantidadeLogin(pQtdeLogin, pIDLogin : string):string;
   function BuscarLogin(pLogin, pSenha: string): string;
   function InserirLembrete(pIDLogin, pTexto, pData, pHora : string): string;
   function PesquisaLembrete(pIDLogin : string):string;
   function DeletarLembrete(pIDLembrete : string):string;
   function EditarLembrete(pTexto, pData, pHora, pIDLembrete : string): string;

   procedure BuscarPessoa;

   property IDLogin  : Integer read FIDLogin  write SetIDLogin;
   property IDLembrete  : Integer read FIDLembrete   write SetIDLembrete;

    { Public declarations }
  end;

var
  dmPrincipal1: TdmPrincipal1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

function TdmPrincipal1.AlterarSenha(pSenha, pIDLogin: string): string;
var
  DadosJSON: TJSONObject;
begin
  DadosJSON := TJSONObject.Create;
  try
    bckAlterarSenha.Params.Clear;
    bckAlterarSenha.ClearBody;
    DadosJSON.AddPair('Senha', pSenha);
    DadosJSON.AddPair('IDLogin', pIDLogin);
    bckAlterarSenha.AddBody(DadosJSON);
    bckAlterarSenha.Execute;
    Result := TEncoding.UTF8.GetString(RespAlterarSenha.RawBytes);
  finally
    DadosJSON.Free;
  end;
end;

function TdmPrincipal1.BuscarLogin(pLogin, pSenha: string): string;
begin
  fdtbLogin.Close;
  ftaPesquisaPessoa.DatSTableName := 'fdqryLogin';
  EMSFireDACClient2.GetEndpoint.ResourceSuffix := 'PesquisaLogin';
  EMSFireDACClient2.GetEndpoint.Params.Clear;
  EMSFireDACClient2.GetEndpoint.Params.AddItem('login', pLogin);
  EMSFireDACClient2.GetEndpoint.Params.AddItem('senha', pSenha);
  EMSFireDACClient2.GetData;
  fdtbLogin.Open;
  fdtbLogin.RecordCount;

end;


procedure TdmPrincipal1.BuscarPessoa;
begin

    fdtbPesquisaPessoa.Close;
    ftaPesquisaPessoa.DatSTableName := 'fdqryPesquisaPessoa';
    EMSFireDACClient1.GetEndpoint.ResourceSuffix := 'PesquisaPessoa';
    EMSFireDACClient1.GetEndpoint.Params.Clear;
    EMSFireDACClient1.GetData;

    fdtbPesquisaPessoa.Open;
    fdtbPesquisaPessoa.RecordCount;
end;


function TdmPrincipal1.CadastarLogin(pLogin, pSenha : string): string;
var
  DadosJSON: TJSONObject;
begin

  DadosJSON := TJSONObject.Create;
  try
    bckCadastarLogin.Params.Clear;
    bckCadastarLogin.ClearBody;
     DadosJSON.AddPair('Login', pLogin);
     DadosJSON.AddPair('Senha', pSenha);
    bckCadastarLogin.AddBody(DadosJSON);
    bckCadastarLogin.Execute;
  finally
    DadosJSON.Free;
  end;

  Result := TEncoding.UTF8.GetString(RespCadastarLogin.RawBytes);


end;

procedure TdmPrincipal1.DataModuleCreate(Sender: TObject);
begin

//   EMSProvider1.URLHost     := '192.168.0.1';
//   EMSProvider1.URLPort     :=  8080;
//   EMSProvider1.URLProtocol := 'http';

   EMSProvider1.URLHost     := '192.168.0.105';
   EMSProvider1.URLPort     :=  8080;
   EMSProvider1.URLProtocol := 'http';
end;

function TdmPrincipal1.DeletarLembrete(pIDLembrete: string): string;
var
  DadosJSON: TJSONObject;
begin

  DadosJSON := TJSONObject.Create;
  try
    bckDeletarLembrete.Params.Clear;
    bckDeletarLembrete.ClearBody;
     DadosJSON.AddPair('IDLembrete', pIDLembrete);
    bckDeletarLembrete.AddBody(DadosJSON);
    bckDeletarLembrete.Execute;
  finally
    DadosJSON.Free;
  end;

  Result := TEncoding.UTF8.GetString(RespDeletarLembrete.RawBytes);

end;

function TdmPrincipal1.EditarLembrete(pTexto, pData, pHora,
  pIDLembrete: string): string;
var
  DadosJSON: TJSONObject;
begin

  DadosJSON := TJSONObject.Create;
  try
    bckEditarLembrete.Params.Clear;
    bckEditarLembrete.ClearBody;
     DadosJSON.AddPair('Texto', pTexto);
     DadosJSON.AddPair('Data', pData);
     DadosJSON.AddPair('Hora', pHora);
     DadosJSON.AddPair('IDLembrete', pIDLembrete);
    bckEditarLembrete.AddBody(DadosJSON);
    bckEditarLembrete.Execute;
  finally
    DadosJSON.Free;
  end;

  Result := TEncoding.UTF8.GetString(RespEditarLembrete.RawBytes);

end;

function TdmPrincipal1.InserirLembrete(pIDLogin, pTexto, pData,
  pHora: string): string;
var
  DadosJSON: TJSONObject;
begin

  DadosJSON := TJSONObject.Create;
  try
    bckInserirLembrete.Params.Clear;
    bckInserirLembrete.ClearBody;
     DadosJSON.AddPair('IDLogin', pIDLogin);
     DadosJSON.AddPair('Texto', pTexto);
     DadosJSON.AddPair('Data', pData);
     DadosJSON.AddPair('Hora', pHora);
    bckInserirLembrete.AddBody(DadosJSON);
    bckInserirLembrete.Execute;
  finally
    DadosJSON.Free;
  end;

  Result := TEncoding.UTF8.GetString(RespInserirLembrete.RawBytes);

end;

function TdmPrincipal1.PesquisaLembrete(pIDLogin: string): string;
begin

  fdtbPesquisaLembrete.Close;
  ftaPesquisaLembrete.DatSTableName := 'fdqryPesquisaLembrete';
  EMSFireDACClient4.GetEndpoint.ResourceSuffix := 'PesquisaLembrete';
  EMSFireDACClient4.GetEndpoint.Params.Clear;
  EMSFireDACClient4.GetEndpoint.Params.AddItem('IDLogin', pIDLogin);
  EMSFireDACClient4.GetData;

  fdtbPesquisaLembrete.Open;
  fdtbPesquisaLembrete.RecordCount;

end;

function TdmPrincipal1.QuantidadeLogin(pQtdeLogin, pIDLogin: String): String;
var
  DadosJSON: TJSONObject;
begin

  DadosJSON := TJSONObject.Create;
  try
    bckQuantidadeLogin.Params.Clear;
    bckQuantidadeLogin.ClearBody;
     DadosJSON.AddPair('Qtde', pQtdeLogin);
     DadosJSON.AddPair('IDLogin', pIDLogin);
    bckQuantidadeLogin.AddBody(DadosJSON);
    bckQuantidadeLogin.Execute;
  finally
    DadosJSON.Free;
  end;

  Result := TEncoding.UTF8.GetString(RespQuantidadeLogin.RawBytes);

end;

procedure TdmPrincipal1.SetIDLembrete(const Value: Integer);
begin
  FIDLembrete := Value;
end;

procedure TdmPrincipal1.SetIDLogin(const Value: Integer);
begin
  FIDLogin := Value;
end;

function TdmPrincipal1.VerificarLoginExiste(pLogin: string): string;
begin

  fdtbVerificarLoginExiste.Close;
  ftaVerificarLoginExiste.DatSTableName := 'fdqryVerificarLoginExiste';
  EMSFireDACClient3.GetEndpoint.ResourceSuffix := 'VerificarLoginExiste';
  EMSFireDACClient3.GetEndpoint.Params.Clear;
  EMSFireDACClient3.GetEndpoint.Params.AddItem('login', pLogin);
  EMSFireDACClient3.GetData;

  fdtbVerificarLoginExiste.Open;
  fdtbVerificarLoginExiste.RecordCount;

end;

end.
