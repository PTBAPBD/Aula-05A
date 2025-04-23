
-- Crie uma tabela pessoa com os campos ID, nome, sobrenome e idade.
-- Crie uma cláusula de checagem para o campo idade, impedindo que valores menores que 0 sejam adicionados.

CREATE TABLE pessoa (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    idade INT,
    CONSTRAINT chk_idade_nonneg CHECK (idade >= 0)
);

--  Altere a tabela pessoa e crie uma restrição utilizando a especificação unique ( A1, A2, …, Am) para os campos ID, nome e sobrenome.
ALTER TABLE pessoa
ADD CONSTRAINT uq_pessoa_identidade UNIQUE (id, nome, sobrenome);

--  Altere a coluna idade da tabela pessoa e garanta que ela não receba valores nulos.
ALTER TABLE pessoa
ALTER COLUMN idade SET NOT NULL;

-- Questão 04. 
-- a) Crie uma tabela endereco com os campos ID e rua. 
CREATE TABLE endereco (
    id INT PRIMARY KEY,
    rua VARCHAR(200)
);

-- b) Adicione o campo endereco na tabela pessoa 
ALTER TABLE pessoa
ADD COLUMN endereco INT;

-- c) Crie uma integridade referencial a partir deste campo com a tabela endereco.
ALTER TABLE pessoa
ADD CONSTRAINT fk_pessoa_endereco
FOREIGN KEY (endereco)
REFERENCES endereco(id);