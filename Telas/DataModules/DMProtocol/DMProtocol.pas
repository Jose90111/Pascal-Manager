unit DMProtocol;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Data.Win.ADODB;

type
  TDM = class(TDataModule)
    conexao: TADOConnection;
    queryarquivos: TADOQuery;
    dsarquivos: TDataSource;
    queryarquivosid: TAutoIncField;
    queryarquivosnome: TStringField;
    queryarquivosdiretorio: TStringField;
    queryarquivostipo: TStringField;
    queryarquivosstatus: TStringField;
    queryarquivoslocalf: TStringField;
    queryarquivoscomplemento: TStringField;
    queryarquivosprazo: TDateField;
    queryarquivosresponsavel: TStringField;
    queryarquivosdataCadastro: TStringField;
    dsCode: TDataSource;
    code: TADOQuery;
    queryarquivoscategoria: TIntegerField;
    codenome: TStringField;
    procedure queryarquivosAfterScroll(DataSet: TDataSet);
    procedure queryarquivosAfterRefresh(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Menu;

{$R *.dfm}

procedure TDM.queryarquivosAfterRefresh(DataSet: TDataSet);
begin
  Menu.framePrincipal.CorStatus;
end;

procedure TDM.queryarquivosAfterScroll(DataSet: TDataSet);
begin

  Menu.framePrincipal.CorStatus();

  if queryarquivos.EoF then
    begin
      Menu.framePrincipal.btnNext.Enabled := false ;
    end
  else
    begin
      Menu.framePrincipal.btnNext.Enabled := true ;
    end;

  if queryarquivos.BoF then
    begin
      Menu.framePrincipal.btnBack.Enabled := false ;
    end
  else
    begin
      Menu.framePrincipal.btnBack.Enabled := true ;
    end;


end;

end.
