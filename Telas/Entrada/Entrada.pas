unit Entrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TframeEntrada = class(TForm)
    Label1: TLabel;
    edtSenha: TEdit;
    Image1: TImage;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frameEntrada: TframeEntrada;

implementation

{$R *.dfm}

uses Menu;


procedure TframeEntrada.Image1Click(Sender: TObject);
begin
  Application.CreateForm(TframePrincipal, framePrincipal);
  framePrincipal.Show;

end;

end.
