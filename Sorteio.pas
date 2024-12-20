unit Sorteio;

interface

procedure ExecutarSorteio;

implementation

uses
  System.SysUtils, DatabaseUtils;

procedure ExecutarSorteio;
begin
  // Consultar clientes elegíveis para o sorteio
  ExecutarSql(
    'SELECT CL.Nome, CL.CPF, V.DataVenda            ' +
    'FROM Clientes CL                               ' +
    'JOIN Vendas V ON CL.ID = V.ClienteID           ' +
    'JOIN Carros C ON V.CarroID = C.ID              ' +
    'WHERE C.Modelo = ''Marea''                     ' +
    '  AND SUBSTR(CL.CPF, 1, 1) = ''0''             ' +
    '  AND STRFTIME(''%Y'', V.DataVenda) = ''2021'' ' +
    'GROUP BY CL.ID, CL.Nome, CL.CPF, CL.DataVenda  ' +
    'HAVING COUNT(*) = 1                            ' +
    'ORDER BY CL.DataVenda                          ' +
    'LIMIT 15;                                      '
  );
end;

end.

