unit Cliente;

interface

type
  TCliente = class
  private
    FID: Integer;
    FNome: string;
    FCPF: string;
  public
    constructor Create(AID: Integer; ANome, ACPF: string);
    procedure InserirNoBanco;
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
  end;

implementation

uses
  DatabaseUtils, System.SysUtils;

constructor TCliente.Create(AID: Integer; ANome, ACPF: string);
begin
  FID := AID;
  FNome := ANome;
  FCPF := ACPF;
end;

procedure TCliente.InserirNoBanco;
var
  SQL: string;
begin
  SQL := Format(
    'INSERT INTO Clientes (ID, Nome, CPF) VALUES (%d, ''%s'', ''%s'')',
    [FID, FNome, FCPF]
  );
  InserirDadosBD(SQL);
end;

procedure InserirClientesFicticios;
var
  Clientes: array[1..5] of TCliente;
  I: Integer;
begin
  // Inicializa os objetos com dados fictícios
  Clientes[1] := TCliente.Create(6,  'Cliente F', '01234567890');
  Clientes[2] := TCliente.Create(7,  'Cliente G', '02345678901');
  Clientes[3] := TCliente.Create(8,  'Cliente H', '03456789012');
  Clientes[4] := TCliente.Create(9,  'Cliente I', '04567890123');
  Clientes[5] := TCliente.Create(10, 'Cliente J', '05678901234');

  for I := Low(Clientes) to High(Clientes) do
  begin
    Clientes[I].InserirNoBanco;
    Clientes[I].Free;
  end;

  // Você pode repetir o processo conforme necessário, ou receber os valores dinamicamente.
end;

end.

