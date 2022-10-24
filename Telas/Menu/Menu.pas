unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage,
  Data.DB, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.WinXCalendars;

type
  TframeMenu = class(TForm)
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
    DBNavigator1: TDBNavigator;
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
    Label1: TLabel;
    ClBBlack: TImage;
    ClBWhite: TImage;
    Label2: TLabel;
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
    procedure cbStatusMouseEnter(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbedtprazoClick(Sender: TObject);
    procedure ClBWhiteClick(Sender: TObject);
    procedure ClBBlackClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure edtNomeArqChange(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frameMenu: TframeMenu;
  i : Integer;

implementation

{$R *.dfm}

uses Config, DMProtocol;


//Pesquisa Switch Case

//Erro ao cancelar diretorio
//Problema com inserção da Data
//Problema com atualização do icone dee Status


procedure TframeMenu.Abrir2Click(Sender: TObject);
begin
  frameConfig.ShowModal;
end;

procedure TframeMenu.btnPesquisarClick(Sender: TObject);
begin
  DM.queryarquivos.Close;
  DM.queryarquivos.SQL.Clear;
  DM.queryarquivos.SQL.Add('SELECT * FROM arquivos WHERE');

  case rgPesquisa.ItemIndex of
  0:DM.queryarquivos.SQL.Add(' nome LIKE :pConsulta');
  1:DM.queryarquivos.SQL.Add(' status LIKE :pConsulta');
  2:DM.queryarquivos.SQL.Add(' responsavel LIKE :pConsulta');
  3:DM.queryarquivos.SQL.Add(' data LIKE :pConsulta');
  4:DM.queryarquivos.SQL.Add(' localf LIKE :pConsulta');
  end;

  DM.queryarquivos.Parameters.ParamByName('pConsulta').Value := edtPesquisa.Text+'%';
  DM.queryarquivos.Open;
end;

procedure TframeMenu.ClBBlackClick(Sender: TObject);
begin
  ClPrazo.Visible := False;
  ClBBlack.Visible := False;
  ClBWhite.Visible := True;

  //ClPrazo.Date := Date();
end;

procedure TframeMenu.ClBWhiteClick(Sender: TObject);
begin
  ClPrazo.Visible := True;
  ClBWhite.Visible := False;
  ClBBlack.Visible := True;

  ClPrazo.Date := Date();
end;

procedure TframeMenu.ClPrazoChange(Sender: TObject);
begin
dbedtprazo.Text:=datetostr(ClPrazo.date);
end;

procedure TframeMenu.cbStatusChange(Sender: TObject);
begin
 CorStatus;
end;

procedure TframeMenu.cbStatusGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
CorStatus;
end;

procedure TframeMenu.cbStatusMouseEnter(Sender: TObject);
begin

end;

//Erro ao cancelar diretorio
procedure TframeMenu.edtDiretorioClick(Sender: TObject);
begin
  opendialog1.Execute;
  edtdiretorio.Text:=opendialog1.FileName;
  edtTipoArq.Text := ExtractFileExt(edtdiretorio.Text);
end;

procedure TframeMenu.edtNomeArqChange(Sender: TObject);
begin
CorStatus();
end;

procedure TframeMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

//CorStatus()
procedure TframeMenu.CorStatus;
begin
   //Em Andamento
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

  //Processando
  if cbStatus.ItemIndex=1 then
  begin
    Samarelo.Visible    :=false;
    Sazul_claro.Visible :=false;
    Sazul_escuro.Visible:=false;
    Sbranco.Visible     :=false;
    Slaranja.Visible    :=false;
    Smagenta.Visible    :=true;
    Spreto.Visible      :=false;
    Srosa.Visible       :=false;
    Sverde.Visible      :=false;
    Svermelho.Visible   :=false;
  end;

  //Aberto
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

  //Pausado
  if cbStatus.ItemIndex=3 then
  begin
    Samarelo.Visible    :=true;
    Sazul_claro.Visible :=false;
    Sazul_escuro.Visible:=false;
    Sbranco.Visible     :=false;
    Slaranja.Visible    :=false;
    Smagenta.Visible    :=false;
    Spreto.Visible      :=false;
    Srosa.Visible       :=false;
    Sverde.Visible      :=false;
    Svermelho.Visible   :=false;
  end;

  //Cancelado
  if cbStatus.ItemIndex=4 then
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

  //Ignorar
  if cbStatus.ItemIndex=6 then
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

procedure TframeMenu.dbedtprazoClick(Sender: TObject);
begin
ClPrazo.Visible := True;
end;

procedure TframeMenu.DBGrid1CellClick(Column: TColumn);
begin
CorStatus();
end;

procedure TframeMenu.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
 CorStatus;
end;

procedure TframeMenu.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  CorStatus;
end;

procedure TframeMenu.Voltar1Click(Sender: TObject);
begin
frameMenu.Destroy;
end;

end.
