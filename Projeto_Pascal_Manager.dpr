program Projeto_Pascal_Manager;

uses
  Vcl.Forms,
  Entrada in 'Telas\Entrada\Entrada.pas' {frameEntrada},
  Menu in 'Telas\Menu\Menu.pas' {framePrincipal},
  Config in 'Telas\Config\Config.pas' {frameConfig},
  DMProtocol in 'Telas\DataModules\DMProtocol\DMProtocol.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TframePrincipal, framePrincipal);
  Application.CreateForm(TframeConfig, frameConfig);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
