unit FrmPrincipal;

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
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.DateTimeCtrls,
  FMX.Objects,
  FMX.Layouts,
  System.Notification,
  FMX.TabControl,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  System.Actions,
  FMX.ActnList,
  FMX.Media,
  System.IOUtils,
  DateUtils,
  FMX.DialogService,
  FMX.Dialogs,
  System.Rtti,
  FMX.Grid.Style,
  FMX.Grid,
  Data.Bind.EngExt,
  FMX.Bind.DBEngExt,
  FMX.Bind.Grid,
  System.Bindings.Outputs,
  FMX.Bind.Editors,
  Data.Bind.Components,
  Data.Bind.Grid,
  Data.Bind.DBScope,
  System.Generics.Collections,
  Generics.Collections,
  FremListaLembranca,
  System.TypInfo;

type
  TFrmPrincipal1 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    NotificationCenter1: TNotificationCenter;
    StyleBook1: TStyleBook;
    Rectangle1: TRectangle;
    RoundRect1: TRoundRect;
    edtLembrete: TEdit;
    RoundRect2: TRoundRect;
    DtNova: TDateEdit;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Rectangle3: TRectangle;
    Label1: TLabel;
    btnSalvar: TRoundRect;
    Label2: TLabel;
    Layout8: TLayout;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    ActionList1: TActionList;
    actPrincipal: TChangeTabAction;
    actLista: TChangeTabAction;
    MediaPlayer1: TMediaPlayer;
    Layout12: TLayout;
    Rectangle10: TRectangle;
    RoundRect3: TRoundRect;
    Label5: TLabel;
    edtHora: TTimeEdit;
    btnVisualizar: TRoundRect;
    Label7: TLabel;
    TabItem3: TTabItem;
    Layout7: TLayout;
    Layout14: TLayout;
    RoundRect4: TRoundRect;
    Rectangle4: TRectangle;
    Label8: TLabel;
    Layout15: TLayout;
    actNovaLista: TChangeTabAction;
    Rectangle5: TRectangle;
    vbsListaLembrete: TVertScrollBox;
    Circle1: TCircle;
    Label3: TLabel;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    btnFechar: TRectangle;
    Rectangle8: TRectangle;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure Rectangle9Click(Sender: TObject);
    procedure MemoLogDblClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Rectangle8Click(Sender: TObject);
  private
    FFramesXLembrete: TDictionary<Integer, TFrameListaLembraca>;
    procedure PlaySound;
    procedure SetupSound(Som: string);
    procedure ShowNotificationComHora(Task: string; Deadline: TDateTime; HoraNotificacao: TTime);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure AdicionarTarefa(Task: string; PrazoCompleto: TDateTime);
    procedure AddListaLembrete(pStatus, pEditar, pExcluir: Integer);
    procedure ClearVertScrollBox(VSBox: TVertScrollBox; Index: Integer = - 1);

      { Private declarations }
  public
      { Public declarations }
  end;

var
  FrmPrincipal1: TFrmPrincipal1;

implementation

{$R *.fmx}

uses
  dmPrincipal, FrmLogin;

  { TFrmPrincipal1 }

procedure TFrmPrincipal1.AddListaLembrete(pStatus, pEditar, pExcluir: Integer);
var //Lista de Produtos
  frame   : TFrameListaLembraca;
  i       : Integer;
  jaCriado: TDictionary<Integer, Boolean>;
begin

  if pStatus = 0 then
  begin

      //===========================================
      //Alinha os itens da lista
    vbsListaLembrete.BeginUpdate;
    if not FFramesXLembrete.TryGetValue(dmPrincipal1.fdtbPesquisaLembretelem_id.AsInteger, frame) then
    begin
      frame            := TFrameListaLembraca.create(nil);
      frame.position.Y := 9999999999;
      frame.Align      := TAlignLayout.Top;
      FFramesXLembrete.Add(dmPrincipal1.fdtbPesquisaLembretelem_id.AsInteger, frame);
    end;

  end;

    //atualiza o frame
  if pEditar = 1 then
  begin
    if not jaCriado.ContainsKey(dmPrincipal1.fdtbPesquisaLembretelem_id.AsInteger) then
    begin
      frame            := TFrameListaLembraca.create(nil);
      frame.position.Y := 9999999999;
      frame.Align      := TAlignLayout.Top;
      FFramesXLembrete.Add(dmPrincipal1.fdtbPesquisaLembretelem_id.AsInteger, frame);
      jaCriado.Add(dmPrincipal1.fdtbPesquisaLembretelem_id.AsInteger, True);
    end;

  end;

      //atualiza o frame
  if pExcluir = 2 then
  begin
      frame            := TFrameListaLembraca.create(nil);
      frame.position.Y := 9999999999;
      frame.Align      := TAlignLayout.Top;
  end;


  frame.lblLembrete.Text := dmPrincipal1.fdtbPesquisaLembretelem_titulo.AsString;
  frame.lblHora.Text     := 'Horario: ' + dmPrincipal1.fdtbPesquisaLembretelem_hora.AsString;
  frame.lblData.Text     := 'Data:' + DateToStr(dmPrincipal1.fdtbPesquisaLembretelem_data.AsDateTime);

  frame.IDLembrete := dmPrincipal1.fdtbPesquisaLembretelem_id.AsInteger;
  frame.IDLogin    := dmPrincipal1.IDLogin;
  frame.NomeLembrete := dmPrincipal1.fdtbPesquisaLembretelem_titulo.AsString;

  frame.btnExcluir.OnClick := btnExcluirClick;
  frame.btnEditar.OnClick  := btnEditarClick;

  vbsListaLembrete.AddObject(frame);
  if Odd(frame.Index) then
    frame.recFundo.Fill.Color := $FFEDEDED;

   if pExcluir = 2 then
   vbsListaLembrete.AddObject(frame)
   else
  vbsListaLembrete.EndUpdate;

end;

procedure TFrmPrincipal1.ClearVertScrollBox(VSBox: TVertScrollBox; Index: Integer = - 1);
var //exclui os itens
  i    : Integer;
  frame: TFrame;
begin
  try
    VSBox.BeginUpdate;

    if Index >= 0 then
      TFrame(VSBox.Content.Children[ Index ]).DisposeOf
    else
      for i := VSBox.Content.ChildrenCount - 1 downto 0 do
        if VSBox.Content.Children[ i ] is TFrame then
          TFrame(VSBox.Content.Children[ i ]).DisposeOf;

  finally
    VSBox.EndUpdate;
  end;

end;

procedure TFrmPrincipal1.btnEditarClick(Sender: TObject);
var
  frame    : TFrameListaLembraca;
  btnEditar: TRectangle;
  rect     : TRectangle;
begin
    // pega o frame selecionadado
  btnEditar := TRectangle(Sender);
  rect      := btnEditar.Parent as TRectangle;

  if (Sender as TComponent).Owner is TFrameListaLembraca then
    frame := (Sender as TComponent).Owner as TFrameListaLembraca
  else
    Exit;

  dmPrincipal1.IDLembrete := frame.IDLembrete;
  edtLembrete.Text        := frame.lblLembrete.Text;
  edtHora.Text            := frame.lblHora.Text;
  DtNova.Text             := frame.lblData.Text;

  actPrincipal.Execute;

end;

procedure TFrmPrincipal1.btnExcluirClick(Sender: TObject);
var
  frame     : TFrameListaLembraca;
  btnExcluir: TRectangle;
  rect      : TRectangle;
begin

    // pega o frame selecionadado
  btnExcluir := TRectangle(Sender);
  rect       := btnExcluir.Parent as TRectangle;

  if (Sender as TComponent).Owner is TFrameListaLembraca then
    frame := (Sender as TComponent).Owner as TFrameListaLembraca
  else
    Exit;

    // Usando TDialogService para uma caixa de diálogo de confirmação
  TDialogService.MessageDialog('Deseja realmente excluir a Lembrete "' + frame.NomeLembrete + '"?', TMsgDlgType.mtConfirmation,
    [ TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo ], TMsgDlgBtn.mbNo, 0,
      procedure(const AResult: TModalResult)
    begin
      if AResult = mrYes then
      begin
        dmPrincipal1.fdtbPesquisaLembrete.First;
        while not dmPrincipal1.fdtbPesquisaLembrete.Eof do
        begin
          FFramesXLembrete.Remove(frame.IDLembrete);
          dmPrincipal1.DeletarLembrete(frame.IDLembrete.ToString);



          dmPrincipal1.fdtbPesquisaLembrete.Next;
        end;

        ShowMessage('Lembrança excluida com sucesso.');


         // Toca um som de excluir
          SetupSound('excluir.wav');
          PlaySound;

        ClearVertScrollBox(vbsListaLembrete, frame.Index);
         //Pesquisa o lembrete
        dmPrincipal1.PesquisaLembrete(dmPrincipal1.IDLogin.ToString);

        dmPrincipal1.fdtbPesquisaLembrete.First;
        while not (dmPrincipal1.fdtbPesquisaLembrete.Eof) do
        begin

          AddListaLembrete(0, 0, 2);
          dmPrincipal1.fdtbPesquisaLembrete.Next;

        end;
      end;
    end);

end;

procedure TFrmPrincipal1.btnSalvarClick(Sender: TObject);
var
  Task              : string;
  Deadline          : TDateTime;
  HorarioNotificacao: TTime;
  PrazoCompleto     : TDateTime; // Variável para combinar data e hora
begin
  Task               := edtLembrete.Text;
  Deadline           := DtNova.DateTime; // Pegando apenas a data do DateEdit
  HorarioNotificacao := edtHora.Time; // Pegando o horário do TimeEdit

    // Combina a data e o horário em uma única variável de DateTime
  PrazoCompleto := Deadline + HorarioNotificacao;

    // Verifica se o campo de tarefa está vazio
  if Task = '' then
  begin
    // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('Por favor, insira o Lembrete.');
    Exit;
  end;

    //se o id nao esta zerdo ele entra
  if dmPrincipal1.IDLembrete <> 0 then
  begin
      // salva a terefa editada
    dmPrincipal1.EditarLembrete(Task, DateTimeToStr(Deadline), TimeToStr(HorarioNotificacao), dmPrincipal1.IDLembrete.ToString);

      // Exibe a notificação local com o horário personalizado
    ShowNotificationComHora(Task, Deadline, HorarioNotificacao);


      // Toca um som de sucesso
    SetupSound('sucesso.wav');
    PlaySound;

    btnVisualizarClick(Sender);

      // Feedback visual para o usuário
    ShowMessage('Lembrança "' + Task + '" Editada com sucesso!');
    dmPrincipal1.IDLembrete := 0;

    // Limpa o campo de entrada de tarefa
    edtLembrete.Text := EmptyStr;
    DtNova.DateTime := Now;
    edtHora.Time := Now;
    Exit;
  end;

    // Verifica se a data e hora estão no passado
  if PrazoCompleto < Now then
  begin
        // Toca um som de erro
    SetupSound('error.wav');
    PlaySound;
    ShowMessage('O prazo não pode ser no passado.');
    Exit;
  end;

    //grava tarefa no servidor
  dmPrincipal1.InserirLembrete(dmPrincipal1.IDLogin.ToString, Task, DateTimeToStr(Deadline), TimeToStr(HorarioNotificacao));

    // Exibe a notificação local com o horário personalizado
  ShowNotificationComHora(Task, Deadline, HorarioNotificacao);


    // Toca um som de sucesso
  SetupSound('sucesso.wav');
  PlaySound;

    // Feedback visual para o usuário
  ShowMessage('Lembrança "' + Task + '" salva com sucesso!');

    // Limpa o campo de entrada de tarefa
  edtLembrete.Text := EmptyStr;

    //Pesquisa o lembrete
  dmPrincipal1.PesquisaLembrete(dmPrincipal1.IDLogin.ToString);

    // Adiciona a tarefa na lista visual
  dmPrincipal1.fdtbPesquisaLembrete.First;
  while not (dmPrincipal1.fdtbPesquisaLembrete.Eof) do
  begin

    AddListaLembrete(0, 0, 0);
    dmPrincipal1.fdtbPesquisaLembrete.Next;

  end;

    // Atualiza a lista de tarefas
  actNovaLista.Execute;

end;

procedure TFrmPrincipal1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FFramesXLembrete.Free;
end;

procedure TFrmPrincipal1.FormCreate(Sender: TObject);
begin

  TabControl1.ActiveTab := TabItem1;
  DtNova.DateTime       := Now;
  edtHora.Time          := Now;

  FFramesXLembrete := TDictionary<Integer, TFrameListaLembraca>.create;

end;

procedure TFrmPrincipal1.MemoLogDblClick(Sender: TObject);
begin
  actLista.Execute;
end;

procedure TFrmPrincipal1.btnFecharClick(Sender: TObject);
begin

 FrmLogin1.Close;
 FrmPrincipal1.Close;

end;

procedure TFrmPrincipal1.Rectangle8Click(Sender: TObject);
begin
actPrincipal.Execute;
end;

procedure TFrmPrincipal1.Rectangle9Click(Sender: TObject);
begin
  FrmPrincipal1.Close;
end;

procedure TFrmPrincipal1.btnVisualizarClick(Sender: TObject);
begin
    //  actLista.Execute;

  dmPrincipal1.PesquisaLembrete(dmPrincipal1.IDLogin.ToString);

  dmPrincipal1.fdtbPesquisaLembrete.First;
  while not (dmPrincipal1.fdtbPesquisaLembrete.Eof) do
  begin

    AddListaLembrete(0, 0, 0);
    dmPrincipal1.fdtbPesquisaLembrete.Next;

  end;

  actNovaLista.Execute;
end;

procedure TFrmPrincipal1.Button1Click(Sender: TObject);
begin
  dmPrincipal1.BuscarPessoa;
end;

procedure TFrmPrincipal1.ShowNotificationComHora(Task: string; Deadline: TDateTime; HoraNotificacao: TTime);
var
  MyNotification     : TNotification;
  NotificacaoAgendada: TDateTime;
begin
    // Combina a data do deadline com o horário selecionado
  NotificacaoAgendada := RecodeTime(Deadline, HourOf(HoraNotificacao), MinuteOf(HoraNotificacao), 0, 0);

  MyNotification := NotificationCenter1.CreateNotification;
  try
    MyNotification.Name      := 'Lembrar-Me';
    MyNotification.Title     := 'Lembrete de Tarefa';
    MyNotification.AlertBody := 'Lembrança: "' + Task + '" - Prazo: ' + DateTimeToStr(Deadline);
    MyNotification.FireDate  := NotificacaoAgendada;

    NotificationCenter1.ScheduleNotification(MyNotification);
  finally
    MyNotification.Free;
  end;
end;

procedure TFrmPrincipal1.AdicionarTarefa(Task: string; PrazoCompleto: TDateTime);
begin
    // Centraliza toda a lógica de adição de tarefas aqui
  ShowNotificationComHora(Task, PrazoCompleto, PrazoCompleto);
end;

procedure TFrmPrincipal1.SetupSound(Som: string);
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

procedure TFrmPrincipal1.PlaySound;
begin

  if MediaPlayer1.State = TMediaState.Playing then
    MediaPlayer1.Stop;

  if MediaPlayer1.Media <> nil then
    MediaPlayer1.Play;

end;

end.
