unit FremListaLembranca;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects;

type
  TFrameListaLembraca = class(TFrame)
    recFundo: TRectangle;
    lblHora: TLabel;
    lblData: TLabel;
    lblLembrete: TLabel;
    imgFoto: TRectangle;
    btnEditar: TRectangle;
    Label3: TLabel;
    btnExcluir: TRectangle;
    Label1: TLabel;
  private
    FIDLogin: Integer;
    FIDLembrete: Integer;
    FNomeLembrete: string;
    procedure SetIDLogin(const Value: Integer);
    procedure SetIDLembrete(const Value: Integer);
    procedure SetNomeLembrete(const Value: string);
    { Private declarations }
  public
  property IDLogin: Integer read FIDLogin write SetIDLogin;
  property IDLembrete: Integer read FIDLembrete write SetIDLembrete;
   property NomeLembrete: string read FNomeLembrete write SetNomeLembrete;
    { Public declarations }
  end;

implementation

{$R *.fmx}

{ TFrameListaLembraca }

procedure TFrameListaLembraca.SetIDLembrete(const Value: Integer);
begin
  FIDLembrete := Value;
end;

procedure TFrameListaLembraca.SetIDLogin(const Value: Integer);
begin
  FIDLogin := Value;
end;

procedure TFrameListaLembraca.SetNomeLembrete(const Value: string);
begin
  FNomeLembrete := Value;
end;

end.
