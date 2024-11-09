unit FrmLogin;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.StdCtrls,
  FMX.DateTimeCtrls,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.Objects,
  FMX.TabControl,
  FMX.Layouts,
  System.Actions,
  FMX.ActnList, FMX.Media,
  System.IOUtils;

type
  TFrmLogin1 = class(TForm)
    Layout1: TLayout;
    TabControl1: TTabControl;
    TabLogin: TTabItem;
    Layout2: TLayout;
    Layout5: TLayout;
    Rectangle1: TRectangle;
    RoundRect1: TRoundRect;
    edtLogin: TEdit;
    Rectangle2: TRectangle;
    btnEntrar: TRoundRect;
    Label2: TLabel;
    Rectangle6: TRectangle;
    Label3: TLabel;
    TabCadastro: TTabItem;
    Layout9: TLayout;
    Layout10: TLayout;
    Rectangle7: TRectangle;
    Label4: TLabel;
    Rectangle8: TRectangle;
    Layout11: TLayout;
    Rectangle3: TRectangle;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Rectangle4: TRectangle;
    RoundRect2: TRoundRect;
    edtSenha: TEdit;
    Layout12: TLayout;
    Layout3: TLayout;
    Label1: TLabel;
    Line1: TLine;
    ActionList1: TActionList;
    actLogin: TChangeTabAction;
    actCadastro: TChangeTabAction;
    StyleBook1: TStyleBook;
    Layout14: TLayout;
    Rectangle5: TRectangle;
    RoundRect3: TRoundRect;
    edtCadastroLogin: TEdit;
    Layout15: TLayout;
    Rectangle9: TRectangle;
    RoundRect4: TRoundRect;
    edtCadastroSenha: TEdit;
    Layout16: TLayout;
    Rectangle10: TRectangle;
    RoundRect5: TRoundRect;
    edtConfirmaSenha: TEdit;
    Layout17: TLayout;
    Rectangle12: TRectangle;
    btnCadastro: TRoundRect;
    Label6: TLabel;
    Rectangle11: TRectangle;
    Layout13: TLayout;
    lblAlterarSenha: TLabel;
    TabAlterarSenha: TTabItem;
    Layout18: TLayout;
    Layout19: TLayout;
    Rectangle13: TRectangle;
    Label5: TLabel;
    Rectangle14: TRectangle;
    Layout20: TLayout;
    Layout22: TLayout;
    Rectangle16: TRectangle;
    RoundRect7: TRoundRect;
    edtNovaSenha: TEdit;
    Layout23: TLayout;
    Rectangle17: TRectangle;
    RoundRect8: TRoundRect;
    edtConfirmarNovaSenha: TEdit;
    Layout24: TLayout;
    Rectangle18: TRectangle;
    btnAlterarSenha: TRoundRect;
    Label7: TLabel;
    actAlterarSenha: TChangeTabAction;
    MediaPlayer1: TMediaPlayer;
    procedure Label1Click(Sender: TObject);
    procedure Rectangle8Click(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCadastroClick(Sender: TObject);
    procedure lblAlterarSenhaClick(Sender: TObject);
    procedure btnAlterarSenhaClick(Sender: TObject);
  private
    Qtde: integer;
    procedure PlaySound;
    procedure SetupSound(Som: string);
      { Private declarations }
  public
      { Public declarations }
  end;

var
  FrmLogin1: TFrmLogin1;

implementation

{$R *.fmx}

uses
  dmPrincipal,
  FrmPrincipal;

procedure TFrmLogin1.btnAlterarSenhaClick(Sender: TObject);
begin

  if edtNovaSenha.Text = EmptyStr then
  begin

     // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('O campo Login está vazio.');
    Exit;
  end;

  if edtConfirmarNovaSenha.Text = EmptyStr then
  begin

    // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('O campo Senha está vazio.');
    Exit;
  end;

  if Length(edtNovaSenha.Text) < 6 then
  begin

  // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('A senha é muito curta, Deve ter pelo menos 6 caracteres.');
    Exit;
  end;

  if edtNovaSenha.Text <> edtConfirmarNovaSenha.Text then
  begin

     // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('Senhas diferentes.');
    Exit;
  end;

  dmPrincipal1.VerificarLoginExiste(edtLogin.Text);

  dmPrincipal1.IDLogin := dmPrincipal1.fdtbVerificarLoginExistelog_id.AsInteger;

  if dmPrincipal1.fdtbVerificarLoginExiste.RecordCount <= 0 then
    begin
    // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('Seu Login não existe, Faça um cadastro.');
    actCadastro.Execute;
    Exit;
    end;

  dmPrincipal1.AlterarSenha(edtNovaSenha.Text, dmPrincipal1.IDLogin.ToString);

  edtSenha.Text := edtNovaSenha.Text;
  actLogin.Execute;

  edtNovaSenha.Text          := EmptyStr;
  edtConfirmarNovaSenha.Text := EmptyStr;

  lblAlterarSenha.visible := False;

end;

procedure TFrmLogin1.btnCadastroClick(Sender: TObject);
begin

    //verifica se o campo nao está vazio
  if edtCadastroLogin.Text = EmptyStr then
  begin

    // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('O campo Login está vazio.');
    Exit;
  end;

  if edtCadastroSenha.Text = EmptyStr then
  begin

    // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('O campo Senha está vazio.');
    Exit;
  end;

  if edtConfirmaSenha.Text = EmptyStr then
  begin

     // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('O campo Confirmar Senha está vazio.');
    Exit;
  end;

    //verifica se a senha tem pelo menos 6 caracters
  if Length(edtCadastroSenha.Text) < 6 then
  begin

     // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('A senha é muito curta. Deve ter pelo menos 6 caracteres.');
    Exit;
  end;

    // Verifica se as senhas são diferentes
  if edtCadastroSenha.Text <> edtConfirmaSenha.Text then
  begin
     // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('Senhas diferentes.');
    Exit;
  end;

    // Consulta no banco para verificar se o login já existe
  dmPrincipal1.VerificarLoginExiste(edtCadastroLogin.Text);

    //Varifica se é o mesmo login cadastrodo
  dmPrincipal1.fdtbVerificarLoginExiste.First;
  while not dmPrincipal1.fdtbVerificarLoginExiste.eof do
  begin
    if dmPrincipal1.fdtbVerificarLoginExistelog_login.AsString = edtCadastroLogin.Text then
    begin

        // Toca um som de erro
       SetupSound('error.wav');
       PlaySound;
      ShowMessage('Esse login já existe.');
      Exit;
    end;

    dmPrincipal1.fdtbVerificarLoginExiste.Next;
  end;

    // Caso o login não exista, realiza o cadastro
  dmPrincipal1.CadastarLogin(edtCadastroLogin.Text, edtCadastroSenha.Text);

  edtLogin.text := edtCadastroLogin.Text;
  edtSenha.text := edtCadastroSenha.Text;

  // Realiza a ação de login automaticamente após cadastro (se aplicável)
  actLogin.Execute;

    // Limpa os campos de cadastro após o sucesso
  edtCadastroLogin.Text := EmptyStr;
  edtCadastroSenha.Text := EmptyStr;
  edtConfirmaSenha.Text := EmptyStr;


end;

procedure TFrmLogin1.btnEntrarClick(Sender: TObject);
begin

  if edtLogin.Text = EmptyStr then
  begin

    // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('O campo Login está vazio.');
    Exit;
  end;

  if edtSenha.Text = EmptyStr then
  begin

    // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('O campo Senha está vazio.');
    Exit;
  end;

  dmPrincipal1.BuscarLogin(edtLogin.Text, edtSenha.Text);

  if dmPrincipal1.fdtbLogin.RecordCount < 0 then
  begin

     // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('Login ou Senha invalido.');
    lblAlterarSenha.visible := true;
    Exit;
  end;

  dmPrincipal1.IDLogin := dmPrincipal1.fdtbLoginlog_id.AsInteger;

  Qtde := dmPrincipal1.fdtbLoginlog_Qtde.AsInteger;

  if (dmPrincipal1.fdtbLoginlog_login.AsString = edtLogin.Text) and (dmPrincipal1.fdtbLoginlog_senha.AsString = edtSenha.Text) then
  begin

    dmPrincipal1.fdtbLogin.Edit;
    dmPrincipal1.fdtbLoginlog_Qtde.AsInteger := Qtde + 1;

    dmPrincipal1.QuantidadeLogin(dmPrincipal1.fdtbLoginlog_Qtde.AsString, dmPrincipal1.IDLogin.toString);


    Application.CreateForm(TFrmPrincipal1, FrmPrincipal1);
    FrmPrincipal1.Show;
    // Toca um som de sucesso
    SetupSound('sucesso.wav');
    PlaySound;

  end
  else
  begin
     // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('Login ou Senha invalido.');
    lblAlterarSenha.visible := true;
    Exit;
  end;


end;

procedure TFrmLogin1.SetupSound(Som: string);
var
  Arquivo: string;
begin

{$IFDEF MSWINDOWS}
  Arquivo := System.SysUtils.GetCurrentDir + '\' + Som;
{$ELSE}
  Arquivo := TPath.Combine(TPath.GetDocumentsPath, Som);
{$ENDIF}
  MediaPlayer1.Clear;
  MediaPlayer1.FileName := Arquivo;

end;

procedure TFrmLogin1.PlaySound;
begin

  if MediaPlayer1.State = TMediaState.Playing then
    MediaPlayer1.Stop;

  if MediaPlayer1.Media <> nil then
    MediaPlayer1.Play;

end;

procedure TFrmLogin1.FormCreate(Sender: TObject);
begin
  TabControl1.ActiveTab   := TabLogin;
  lblAlterarSenha.visible := False;
end;

procedure TFrmLogin1.Label1Click(Sender: TObject);
begin
  actCadastro.Execute;
end;

procedure TFrmLogin1.lblAlterarSenhaClick(Sender: TObject);
begin
  actAlterarSenha.Execute;
end;

procedure TFrmLogin1.Rectangle8Click(Sender: TObject);
begin
  actLogin.Execute;
end;

end.
