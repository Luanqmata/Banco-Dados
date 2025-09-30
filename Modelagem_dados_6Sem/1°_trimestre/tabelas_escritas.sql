
CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20)
);

CREATE TABLE PRATO (
    id_prato INT PRIMARY KEY AUTO_INCREMENT,
    nome_prato VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE INGREDIENTE (
    id_ingrediente INT PRIMARY KEY AUTO_INCREMENT,
    nome_ingrediente VARCHAR(100) NOT NULL
);

CREATE TABLE PEDIDO (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE PEDIDO_PRATO (
    id_pedido_prato INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_prato INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
    FOREIGN KEY (id_prato) REFERENCES PRATO(id_prato)
);

CREATE TABLE PRATO_INGREDIENTE (
    id_prato_ingrediente INT PRIMARY KEY AUTO_INCREMENT,
    id_prato INT,
    id_ingrediente INT,
    FOREIGN KEY (id_prato) REFERENCES PRATO(id_prato),
    FOREIGN KEY (id_ingrediente) REFERENCES INGREDIENTE(id_ingrediente)
);
