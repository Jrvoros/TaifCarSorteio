unit Venda;

interface

type
  TVenda = class
  private
    FID: Integer;
    FClienteID: Integer;
    FCarroID: Integer;
    FDataVenda: TDate;
  public
    constructor Create(AID, AClienteID, ACarroID: Integer; ADataVenda: TDate);
    procedure InserirNoBanco;
    property ID: Integer read FID write FID;
    property ClienteID: Integer read FClienteID write FClienteID;
    property CarroID: Integer read FCarroID write FCarroID;
    property DataVenda: TDate read FDataVenda write FDataVenda;
  end;

implementation

uses
  DatabaseUtils, System.SysUtils;

constructor TVenda.Create(AID, AClienteID, ACarroID: Integer; ADataVenda: TDate);
begin
  FID := AID;
  FClienteID := AClienteID;
  FCarroID := ACarroID;
  FDataVenda := ADataVenda;
end;

procedure TVenda.InserirNoBanco;
var
  SQL: string;
begin
  SQL := Format(
    'INSERT INTO Vendas (ID, ClienteID, CarroID, DataVenda) VALUES (%d, %d, %d, ''%s'')',
    [FID, FClienteID, FCarroID, FormatDateTime('yyyy-mm-dd', FDataVenda)]
  );
  InserirDadosBD(SQL);
end;

procedure InserirVendasFicticias;
var
  Vendas: array[1..5] of TVenda;
  I: Integer;
begin
  // Inicializa os objetos com dados fict�cios
  Vendas[1] := TVenda.Create(16, 6, 6,   EncodeDate(2021, 5, 10));
  Vendas[2] := TVenda.Create(17, 7, 7,   EncodeDate(2021, 6, 15));
  Vendas[3] := TVenda.Create(18, 8, 8,   EncodeDate(2021, 7, 20));
  Vendas[4] := TVenda.Create(19, 9, 9,   EncodeDate(2021, 8, 25));
  Vendas[5] := TVenda.Create(20, 10, 10, EncodeDate(2021, 9, 30));

  for I := Low(Vendas) to High(Vendas) do
  begin
    Vendas[I].InserirNoBanco;
    Vendas[I].Free;
  end;

  // Voc� pode repetir o processo conforme necess�rio, ou receber os valores dinamicamente.
end;



end.

