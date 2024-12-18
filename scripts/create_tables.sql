CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF VARCHAR(11),
    DataVenda DATE
);

CREATE TABLE Carros (
    ID INT PRIMARY KEY,
    Modelo VARCHAR(50),
    AnoLancamento INT
);

CREATE TABLE Vendas (
    ID INT PRIMARY KEY,
    ClienteID INT,
    CarroID INT,
    DataVenda DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID),
    FOREIGN KEY (CarroID) REFERENCES Carros(ID)
);
