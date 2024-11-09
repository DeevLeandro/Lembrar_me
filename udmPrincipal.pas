unit udmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.FMXUI.Wait,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.Intf, FireDAC.Comp.UI,
  REST.Backend.EMSProvider, FireDAC.Stan.Option, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Stan.Param,
  FireDAC.Stan.Error, REST.Backend.EMSServices, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, REST.Backend.EMSFireDAC;

type
  TdmPrincipal = class(TDataModule)
    EMSProvider1: TEMSProvider;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDSchemaAdapter1: TFDSchemaAdapter;
    EMSFireDACClient1: TEMSFireDACClient;
    fdtbPesquisaPessoa: TFDMemTable;
    ftaPesquisaPessoa: TFDTableAdapter;
    fdtbPesquisaPessoapes_id: TIntegerField;
    fdtbPesquisaPessoapes_nome: TWideStringField;
    fdtbPesquisaPessoapes_cpf_cnpj: TWideStringField;
    fdtbPesquisaPessoapes_cep: TWideStringField;
    fdtbPesquisaPessoapes_bairro: TWideStringField;
    fdtbPesquisaPessoapes_cidade: TWideStringField;
    fdtbPesquisaPessoapes_endereco: TWideStringField;
    fdtbPesquisaPessoapes_numero: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private

    { Private declarations }
  public
   procedure BuscarPessoa;
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }



end.
