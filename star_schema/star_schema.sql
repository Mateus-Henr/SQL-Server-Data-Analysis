CREATE TABLE dim_cliente (
    id_cliente INT PRIMARY KEY,
    regiao VARCHAR(45),
    estado VARCHAR(45),
    cidade VARCHAR(45),
    telefone VARCHAR(45),
    celular VARCHAR(45),
    sexo CHAR(1),
    cep CHAR(9),
    data_nasc DATE
);

CREATE TABLE dim_montadora (
    id_montadora INT PRIMARY KEY,
    nome VARCHAR(45),
    pais_origem VARCHAR(45)
);

CREATE TABLE dim_modelo (
    id_modelo INT PRIMARY KEY,
    nome VARCHAR(45)
);

CREATE TABLE dim_carro (
    id_carro INT PRIMARY KEY,
    cor VARCHAR(45),
    valor_compra DOUBLE,
    data_compra DATE
);

CREATE TABLE dim_sinistro (
    id_sinistro INT PRIMARY KEY,
    data_sinistro DATE,
    valor DOUBLE
);

CREATE TABLE fato_sinistro (
    id_sinistro INT,
    cliente_id_cliente INT,
    seguro_id_seguro INT,
    carro_id_carro INT,
    modelo_id_modelo INT,
    montadora_id_montadora INT,
    data_sinistro DATE,
    valor DOUBLE,
    PRIMARY KEY (id_sinistro),
    FOREIGN KEY (cliente_id_cliente) REFERENCES dim_cliente(id_cliente),
    FOREIGN KEY (seguro_id_seguro) REFERENCES dim_seguro(id_seguro),
    FOREIGN KEY (carro_id_carro) REFERENCES dim_carro(id_carro),
    FOREIGN KEY (modelo_id_modelo) REFERENCES dim_modelo(id_modelo),
    FOREIGN KEY (montadora_id_montadora) REFERENCES dim_montadora(id_montadora)
);