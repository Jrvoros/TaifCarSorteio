program Main;

uses
  Vcl.Forms,
  DatabaseUtils in 'DatabaseUtils.pas',
  Cliente in 'Cliente.pas',
  Venda in 'Venda.pas',
  Carro in 'Carro.pas',
  Sorteio in 'Sorteio.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.