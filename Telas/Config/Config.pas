unit Config;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TframeConfig = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ColorBox1: TColorBox;
    procedure ColorBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frameConfig: TframeConfig;

implementation

{$R *.dfm}

uses Entrada, Menu;

procedure TframeConfig.ColorBox1Change(Sender: TObject);
var
  CorSelecionada : TColor;
begin

  CorSelecionada := ColorBox1.Selected;
  frameMenu.Color := CorSelecionada;
  frameConfig.Color := CorSelecionada;
  //frameEntrada.Color := CorSelecionada;
  //FrameMod0.Color := CorSelecionada;
end;

end.
