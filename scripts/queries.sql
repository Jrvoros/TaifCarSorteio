-- 2 Quantidade de vendas do carro Marea
SELECT COUNT(*) AS TotalVendasMarea
FROM Vendas V
JOIN Carros C ON V.CarroID = C.ID
WHERE C.Modelo = 'Marea';

-- 3 Quantidade de vendas do carro Uno por cliente
SELECT CL.Nome, COUNT(*) AS VendasUno
FROM Vendas V
JOIN Carros C ON V.CarroID = C.ID
JOIN Clientes CL ON V.ClienteID = CL.ID
WHERE C.Modelo = 'Uno'
GROUP BY CL.Nome;

-- 4 Quantidade de clientes que não efetuaram vendas
SELECT COUNT(*) AS ClientesSemVenda
FROM Clientes C
LEFT JOIN Vendas V ON C.ID = V.ClienteID
WHERE V.ID IS NULL;

-- 5 Clientes sorteados
SELECT CL.Nome, CL.CPF, V.DataVenda
FROM Clientes CL
JOIN Vendas V ON CL.ID = V.ClienteID
JOIN Carros C ON V.CarroID = C.ID
WHERE C.Modelo = 'Marea'
  AND SUBSTR(CL.CPF, 1, 1) = '0' 
  AND STRFTIME('%Y', V.DataVenda) = '2021'
GROUP BY CL.ID, CL.Nome, CL.CPF, CL.DataVenda 
HAVING COUNT(*) = 1
ORDER BY CL.DataVenda
LIMIT 15;
