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
    queryarquivosdata: TDateField;
    queryarquivostipo: TStringField;
    queryarquivosstatus: TStringField;
    queryarquivoslocalf: TStringField;
    queryarquivoscomplemento: TStringField;
    queryarquivosprazo: TDateField;
    queryarquivosresponsavel: TStringField;
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

end.