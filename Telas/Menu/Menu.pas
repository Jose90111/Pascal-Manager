unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage,
  Data.DB, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.WinXCalendars, Vcl.Buttons,

  ShellAPI;

type
  TframePrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Voltar1: TMenuItem;
    Configuraes1: TMenuItem;
    Abrir2: TMenuItem;
    FileOpenDialog1: TFileOpenDialog;
    OpenDialog1: TOpenDialog;
    ClPrazo: TCalendarView;
    cbStatus: TDBComboBox;
    dbedtprazo: TDBEdit;
    DBGrid1: TDBGrid;
    edtDiretorio: TDBEdit;
    edtLocalF: TDBEdit;
    edtNomeArq: TDBEdit;
    edtResponsavel: TDBEdit;
    icone_arquivo: TImage;
    lblData: TLabel;
    lblDiretorio: TLabel;
    lblLocalF: TLabel;
    lblNome: TLabel;
    lblObservacoes: TLabel;
    lblResponsavel: TLabel;
    lblTipo: TLabel;
    memoObservacoes: TDBMemo;
    painelPesquisa: TPanel;
    imgPesquisa: TImage;
    rgPesquisa: TRadioGroup;
    Samarelo: TImage;
    Sazul_claro: TImage;
    Sazul_escuro: TImage;
    Sbranco: TImage;
    Slaranja: TImage;
    Smagenta: TImage;
    Spreto: TImage;
    Srosa: TImage;
    Sverde: TImage;
    Svermelho: TImage;
    edtPesquisa: TEdit;
    imgClip: TImage;
    edtTipoArq: TDBEdit;
    btnPesquisar: TButton;
    lblDataCadastro: TLabel;
    ClBBlack: TImage;
    ClBWhite: TImage;
    lblStatus: TLabel;
    edtDataCadastro: TDBEdit;
    btnBack: TBitBtn;
    btnNext: TBitBtn;
    btnPlus: TBitBtn;
    btnMinus: TBitBtn;
    btnEdit: TBitBtn;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    btnRefresh: TBitBtn;
    Label1: TLabel;
    btnAbrirArquivo: TBitBtn;
    btnAbrirLocaldoArquivo: TBitBtn;
    lblCategoria: TLabel;
    cbCategoria: TDBComboBox;
    Button1: TButton;
    procedure Voltar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Abrir2Click(Sender: TObject);
    procedure cbStatusChange(Sender: TObject);
    procedure ClPrazoChange(Sender: TObject);
//    procedure edtPesquisaEnter(Sender: TObject);
    procedure CorStatus;  //Ctrl+Shift+C
    procedure edtDiretorioClick(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure cbStatusGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbedtprazoClick(Sender: TObject);
    procedure ClBWhiteClick(Sender: TObject);
    procedure ClBBlackClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure edtNomeArqChange(Sender: TObject);
    procedure imgClipClick(Sender: TObject);
    procedure rgPesquisaClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnMinusClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPlusClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAbrirLocaldoArquivoClick(Sender: TObject);
    procedure btnAbrirArquivoClick(Sender: TObject);
    procedure cbCategoriaKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  framePrincipal: TframePrincipal;
  i : Integer;

implementation

{$R *.dfm}

uses Config, DMProtocol;

procedure TframePrincipal.Abrir2Click(Sender: TObject);
begin
  frameConfig.ShowModal;
end;

procedure TframePrincipal.btnAbrirArquivoClick(Sender: TObject);
var
  diretorio:string;
begin

  diretorio := edtDiretorio.Text;

  ShellExecute(0,
    'open',
    PChar('explorer.exe'),
    PChar('/n, /insert, ' +diretorio),
    nil,  // Se nao funcionar, precisa por o caminho do Windows no parâmetro Directory >> PChar('C:\WINDOWS\'),
    SW_SHOWMAXIMIZED);
end;

procedure TframePrincipal.btnAbrirLocaldoArquivoClick(Sender: TObject);
var
  diretorio:string;
begin

  diretorio := edtDiretorio.Text;

  ShellExecute(0,
    'open',
    PChar('explorer.exe'),
    PChar('/n, /select, ' +diretorio),
    nil,  // Se nao funcionar, precisa por o caminho do Windows no parâmetro Directory >> PChar('C:\WINDOWS\'),
    SW_SHOWMAXIMIZED);

  // /insert Abre o arquivo
  // /select Abre o local do arquivo
end;

procedure TframePrincipal.btnBackClick(Sender: TObject);
begin
 DM.queryarquivos.Prior;
end;

procedure TframePrincipal.btnCancelClick(Sender: TObject);
begin
  if Application.MessageBox('Você deseja CANCELAR esse cadastro?','Confirmação',MB_ICONWARNING+MB_YESNO)= mrYES then
    begin
      btnPlus.Enabled := true;
      btnMinus.Enabled := true;
      btnOk.Enabled := false;
      btnCancel.Enabled := false;

      DM.queryarquivos.Cancel;
    end;
end;

procedure TframePrincipal.btnEditClick(Sender: TObject);
begin
  btnPlus.Enabled := false;
  btnMinus.Enabled := false;
  btnOk.Enabled := true;
  btnCancel.Enabled := true;

  DM.queryarquivos.Edit;
end;

procedure TframePrincipal.btnMinusClick(Sender: TObject);
begin
if Application.MessageBox('Você deseja DELETAR esse cadastro?','Confirmação',MB_ICONWARNING+MB_YESNO)= mrYES then
    begin
      DM.queryarquivos.Delete;
    end;
end;

procedure TframePrincipal.btnNextClick(Sender: TObject);
begin
  DM.queryarquivos.Next;
end;

procedure TframePrincipal.btnOkClick(Sender: TObject);
begin
  btnPlus.Enabled := true;
  btnMinus.Enabled := true;
  btnOk.Enabled := false;
  btnCancel.Enabled := false;

  DM.queryarquivos.Post;
end;

procedure TframePrincipal.btnPesquisarClick(Sender: TObject);
begin
  DM.queryarquivos.Close;
  DM.queryarquivos.SQL.Clear;
  DM.queryarquivos.SQL.Add('SELECT * FROM arquivos WHERE');

  case rgPesquisa.ItemIndex of
  0:DM.queryarquivos.SQL.Add(' nome LIKE :pConsulta');
  1:DM.queryarquivos.SQL.Add(' status LIKE :pConsulta');
  2:DM.queryarquivos.SQL.Add(' dataCadastro LIKE :pConsulta');
  3:DM.queryarquivos.SQL.Add(' responsavel LIKE :pConsulta');
  4:DM.queryarquivos.SQL.Add(' prazo LIKE :pConsulta');
  5:DM.queryarquivos.SQL.Add(' localF LIKE :pConsulta');
  end;

  DM.queryarquivos.Parameters.ParamByName('pConsulta').Value := edtPesquisa.Text+'%';
  DM.queryarquivos.Open;
end;

procedure TframePrincipal.btnPlusClick(Sender: TObject);
begin
  //Muda botões
  btnPlus.Enabled := false;
  btnMinus.Enabled := false;
  btnOk.Enabled := true;
  btnCancel.Enabled := true;

  //Comando SQL
  DM.queryarquivos.Append;


  //Abre o explorador de arquivos
  opendialog1.Execute;
  edtdiretorio.Text:=opendialog1.FileName;
  edtTipoArq.Text := ExtractFileExt(edtdiretorio.Text);

  //Adiciona Data
  edtdataCadastro.Text := DateToStr(Date());
end;

procedure TframePrincipal.btnRefreshClick(Sender: TObject);
begin
  DM.queryarquivos.Refresh;
end;

procedure TframePrincipal.ClBBlackClick(Sender: TObject);
begin
  ClPrazo.Visible := False;
  ClBBlack.Visible := False;
  ClBWhite.Visible := True;

  //ClPrazo.Date := Date();
end;

procedure TframePrincipal.ClBWhiteClick(Sender: TObject);
begin
  ClPrazo.Visible := True;
  ClBWhite.Visible := False;
  ClBBlack.Visible := True;

  ClPrazo.Date := Date();
end;

procedure TframePrincipal.ClPrazoChange(Sender: TObject);
begin
dbedtprazo.Text:=datetostr(ClPrazo.date);
end;

procedure TframePrincipal.cbCategoriaKeyPress(Sender: TObject;
  var Key: Char);
  var replace_cat: Boolean;
  var id_cat: Integer;
begin
  //cbCategoria.Items.Add(cbCategoria.Text);

  if Key <> #$D then exit  ;// Apenas ingressar se for apertada a tecla Enter

  DM.code.Close;
  DM.code.SQL.Clear;

  DM.code.SQL.Add('select id from categoria where nome like :pCategoria' );// Procurar por categoria com o mesmo nome
  DM.code.Parameters.ParamByName('pCategoria').Value := cbCategoria.Text;
  DM.code.Open;

  if DM.code.Eof then
  begin// Se encontrar não encontrar categoria com o mesmo nome, confirmar se o usuário deseja criar uma nova
  NormalizeTopMosts;
  replace_cat := MessageBox('Categoria não encontrada',' Deseja criar uma nova categoria com este nome?',MB_YESNO) = 6;
  RestoreTopMosts;
  if not replace_cat then exit;// Encerrar se o usuário não quiser criar uma nova categoria

  DM.code.Close;
  DM.code.SQL.Clear;

  DM.code.SQL.Add('INSERT INTO categoria (nome) VALUES (:pCategoria)');// Inserir nova categoria no banco de dados
  DM.code.Parameters.ParamByName('pCategoria').Value := cbCategoria.Text;
  if DM.code.ExecSQL <> 1 then begin raise Exception.Create('Erro ao inserir categoria!') exit end;
  DM.code.Close;
  DM.code.SQL.Clear;
  DM.code.SQL.Add('SELECT id FROM categoria WHERE nome = :pCategoria');// Buscar ID da nova categoria inserida
  DM.code.Parameters.ParamByName('pCategoria').Value := cbCategoria.Text;
  DM.code.Open;
  end;
  id_cat := DM.code.Fields[0].AsInteger;// Salvar o valor da categoria após tratamento
  
  //TODO: Inserir o valor da variável "id_cat" no campo "categoria" do arquivo

end;

procedure TframePrincipal.cbStatusChange(Sender: TObject);
begin
 CorStatus;
end;

procedure TframePrincipal.cbStatusGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
CorStatus;
end;

procedure TframePrincipal.edtDiretorioClick(Sender: TObject);
begin
  opendialog1.Execute;
  edtdiretorio.Text:=opendialog1.FileName;
  edtTipoArq.Text := ExtractFileExt(edtdiretorio.Text);
end;

procedure TframePrincipal.edtNomeArqChange(Sender: TObject);
begin
CorStatus();
end;

procedure TframePrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TframePrincipal.imgClipClick(Sender: TObject);
begin
  opendialog1.Execute;
  edtdiretorio.Text:=opendialog1.FileName;
  edtTipoArq.Text := ExtractFileExt(edtdiretorio.Text);
end;

procedure TframePrincipal.rgPesquisaClick(Sender: TObject);
begin

end;

//CorStatus()
procedure TframePrincipal.CorStatus;
begin
   //Aberto
  if cbStatus.ItemIndex=0 then
  begin
    Samarelo.Visible    :=false;
    Sazul_claro.Visible :=false;
    Sazul_escuro.Visible:=false;
    Sbranco.Visible     :=false;
    Slaranja.Visible    :=false;
    Smagenta.Visible    :=false;
    Spreto.Visible      :=false;
    Srosa.Visible       :=false;
    Sverde.Visible      :=true;
    Svermelho.Visible   :=false;
  end;

  //Cancelado
  if cbStatus.ItemIndex=1 then
  begin
    Samarelo.Visible    :=false;
    Sazul_claro.Visible :=false;
    Sazul_escuro.Visible:=false;
    Sbranco.Visible     :=false;
    Slaranja.Visible    :=false;
    Smagenta.Visible    :=false;
    Spreto.Visible      :=false;
    Srosa.Visible       :=false;
    Sverde.Visible      :=false;
    Svermelho.Visible   :=true;
  end;

  //Concluido
  if cbStatus.ItemIndex=2 then
  begin
    Samarelo.Visible    :=false;
    Sazul_claro.Visible :=false;
    Sazul_escuro.Visible:=false;
    Sbranco.Visible     :=false;
    Slaranja.Visible    :=false;
    Smagenta.Visible    :=false;
    Spreto.Visible      :=false;
    Srosa.Visible       :=false;
    Sverde.Visible      :=true;
    Svermelho.Visible   :=false;
  end;

  //Em Andamento
  if cbStatus.ItemIndex=3 then
  begin
    Samarelo.Visible    :=false;
    Sazul_claro.Visible :=true;
    Sazul_escuro.Visible:=false;
    Sbranco.Visible     :=false;
    Slaranja.Visible    :=false;
    Smagenta.Visible    :=false;
    Spreto.Visible      :=false;
    Srosa.Visible       :=false;
    Sverde.Visible      :=false;
    Svermelho.Visible   :=false;
  end;

  //Ignorar
  if cbStatus.ItemIndex=4 then
  begin
    Samarelo.Visible    :=false;
    Sazul_claro.Visible :=false;
    Sazul_escuro.Visible:=false;
    Sbranco.Visible     :=false;
    Slaranja.Visible    :=false;
    Smagenta.Visible    :=false;
    Spreto.Visible      :=false;
    Srosa.Visible       :=true;
    Sverde.Visible      :=false;
    Svermelho.Visible   :=false;
  end;

  //Pausado
  if cbStatus.ItemIndex=5 then
  begin
    Samarelo.Visible    :=false;
    Sazul_claro.Visible :=false;
    Sazul_escuro.Visible:=true;
    Sbranco.Visible     :=false;
    Slaranja.Visible    :=false;
    Smagenta.Visible    :=false;
    Spreto.Visible      :=false;
    Srosa.Visible       :=false;
    Sverde.Visible      :=false;
    Svermelho.Visible   :=false;
  end;

  //Processando
  if cbStatus.ItemIndex=6 then
  begin
    Samarelo.Visible    :=false;
    Sazul_claro.Visible :=false;
    Sazul_escuro.Visible:=false;
    Sbranco.Visible     :=false;
    Slaranja.Visible    :=true;
    Smagenta.Visible    :=false;
    Spreto.Visible      :=false;
    Srosa.Visible       :=false;
    Sverde.Visible      :=false;
    Svermelho.Visible   :=false;
  end;

  //Quarentena
  if cbStatus.ItemIndex=7 then
  begin
    Samarelo.Visible    :=false;
    Sazul_claro.Visible :=false;
    Sazul_escuro.Visible:=false;
    Sbranco.Visible     :=false;
    Slaranja.Visible    :=false;
    Smagenta.Visible    :=false;
    Spreto.Visible      :=true;
    Srosa.Visible       :=false;
    Sverde.Visible      :=false;
    Svermelho.Visible   :=false;
  end;
end;

procedure TframePrincipal.dbedtprazoClick(Sender: TObject);
begin
ClPrazo.Visible := True;
end;

procedure TframePrincipal.DBGrid1CellClick(Column: TColumn);
begin
CorStatus();
end;

procedure TframePrincipal.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
 CorStatus;
end;

procedure TframePrincipal.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  CorStatus;
end;

procedure TframePrincipal.Voltar1Click(Sender: TObject);
begin
framePrincipal.Destroy;
end;

end.
