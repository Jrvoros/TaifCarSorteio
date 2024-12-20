unit Carro;

interface

type
  TCarro = class
  private
    FID: Integer;
    FModelo: string;
    FAnoLancamento: TDate;
  public
    constructor Create(AID: Integer; AModelo: string; AAnoLancamento: TDate);
    procedure InserirNoBanco;
    property ID: Integer read FID write FID;
    property Modelo: string read FModelo write FModelo;
    property AnoLancamento: TDate read FAnoLancamento write FAnoLancamento;
  end;

implementation

uses
  DatabaseUtils, System.SysUtils;

constructor TCarro.Create(AID: Integer; AModelo: string; AAnoLancamento: TDate);
begin
  FID := AID;
  FModelo := AModelo;
  FAnoLancamento := AAnoLancamento;
end;

procedure TCarro.InserirNoBanco;
var
  SQL: string;
begin
  SQL := Format(
    'INSERT INTO Carros (ID, Modelo, AnoLancamento) VALUES (%d, ''%s'', ''%s'')',
    [FID, FModelo, FormatDateTime('yyyy-mm-dd', FAnoLancamento)]
  );
  InserirDadosBD(SQL);
end;

procedure InserirCarrosFicticios;
var
  Carros: array[1..5] of TCarro;
  I: Integer;
begin
  // Inicializa os objetos com dados fict�cios
  Carros[1] := TCarro.Create(6,  'Gol',   EncodeDate(2021, 5, 1));
  Carros[2] := TCarro.Create(7,  'Fox',   EncodeDate(2021, 6, 1));
  Carros[3] := TCarro.Create(8,  'Golf',  EncodeDate(2021, 7, 1));
  Carros[4] := TCarro.Create(9,  'S10',   EncodeDate(2021, 8, 1));
  Carros[5] := TCarro.Create(10, 'Hilux', EncodeDate(2021, 9, 1));

  for I := Low(Carros) to High(Carros) do
  begin
    Carros[I].InserirNoBanco;
    Carros[I].Free;
  end;

  // Voc� pode repetir o processo conforme necess�rio, ou receber os valores dinamicamente.
end;


end.

