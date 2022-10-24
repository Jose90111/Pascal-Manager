unit UnitFrameMod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXCalendars, Vcl.Samples.Calendar;

type
  TFrameMod = class(TFrame)
    icone_arquivo: TImage;
    lblNome: TLabel;
    Sbranco: TImage;
    Sverde: TImage;
    Svermelho: TImage;
    Samarelo: TImage;
    Sazul_escuro: TImage;
    Sazul_claro: TImage;
    Smagenta: TImage;
    Srosa: TImage;
    Slaranja: TImage;
    Spreto: TImage;
    edtTipoArq: TEdit;
    lblTipo: TLabel;
    lblData: TLabel;
    lblLocalF: TLabel;
    lblDiretorio: TLabel;
    lblObservacoes: TLabel;
    edtNomeArq: TDBEdit;
    edtDiretorio: TDBEdit;
    memoObservacoes: TDBMemo;
    edtLocalF: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    OpenDialog1: TOpenDialog;
    cbStatus: TDBComboBox;
    calendar: TCalendarView;
    dbedtprazo: TDBEdit;
    painelPesquisa: TPanel;
    edtResponsavel: TDBEdit;
    lblResponsavel: TLabel;
    rgPesquisa: TRadioGroup;
    edtPesquisa: TDBEdit;
    Image1: TImage;
    procedure cbStatus1Change(Sender: TObject);
    procedure edtDiretorioClick(Sender: TObject);
    procedure cbStatusChange(Sender: TObject);
    procedure calendarChange(Sender: TObject);
    procedure dbedtprazoClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  var Diretorio: String;

  end;

implementation

{$R *.dfm}

uses Menu, DMProtocol;



procedure TFrameMod.cbStatusChange(Sender: TObject);

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

procedure TFrameMod.dbedtprazoClick(Sender: TObject);
begin
showmessage('Informe uma data no calendário');
calendar.SetFocus;
end;

procedure TFrameMod.calendarChange(Sender: TObject);
begin
dbedtprazo.Text:=datetostr(calendar.date);


end;

procedure TFrameMod.cbStatus1Change(Sender: TObject);
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

procedure TFrameMod.edtDiretorioClick(Sender: TObject);
begin
opendialog1.Execute;
edtdiretorio.Text:=opendialog1.FileName;
edtTipoArq.Text := ExtractFileExt(edtdiretorio.Text);

end;

end.
