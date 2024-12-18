-- 2 Excluir vendas que não são dos clientes sorteados (sem usar IN)
DELETE FROM Vendas
WHERE ClienteID NOT IN (
    SELECT CL.ID
    FROM Clientes CL
    JOIN Vendas V ON CL.ID = V.ClienteID
    JOIN Carros C ON V.CarroID = C.ID
    WHERE C.Modelo = 'Marea'
    AND SUBSTR(CL.CPF, 1, 1) = '0' -- Ajustado LEFT para SUBSTR
    AND STRFTIME('%Y', V.DataVenda) = '2021' -- Usando STRFTIME para comparar o ano
    GROUP BY CL.ID
    HAVING COUNT(*) = 1
    ORDER BY CL.DataVenda
    LIMIT 15
);