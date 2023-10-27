-- ACESSO --
--docker start daw-mysql-2023
--docker -it exec daw-mysql-2023 /bin/bash
--mysql -uroot -p
--Enter password: root

-- CRIANDO UM BANCO DE DADOS - Banco de Dados: Sistema Bancário --
CREATE DATABASE Banco;

-- Selecionando o banco de dados criado --
USE Banco;

-- Tabela Clientes: dados pessoais dos clientes do banco --
CREATE TABLE clientes(
  nome VARCHAR(50),
  cpf VARCHAR(11),
  data_nascimento DATE, -- Alterado para DATE
  endereco VARCHAR(200),
  telefone VARCHAR(11),

  -- Chave primária: para o cpf do cliente
  CONSTRAINT pk_clientes PRIMARY KEY (cpf)
);

-- Agências: dados das agências pertencentes aos bancos --
CREATE TABLE agencias(
  codigo INT,
  nome VARCHAR(50),
  endereco VARCHAR(200),
  data_criacao DATETIME,

  -- Chave primária: para o código da agência
  CONSTRAINT pk_agencias PRIMARY KEY (codigo)
);

-- Contas: dados das contas bancárias existentes dentro do banco --
CREATE TABLE contas(
  codigo INT,
  saldo DECIMAL(10,2),
  endereco VARCHAR(200),
  datacriacao DATETIME,
  clientes_cpf VARCHAR(11),
  agencias_codigo INT,

  -- Chave primária: para o código da conta
  CONSTRAINT pk_contas PRIMARY KEY (codigo),

  -- Chave estrangeira: referenciando o cpf do cliente
  CONSTRAINT fk_clientes FOREIGN KEY (clientes_cpf) REFERENCES clientes(cpf),

  -- Chave estrangeira: referenciando o código da agência
  CONSTRAINT fk_agencias FOREIGN KEY (agencias_codigo) REFERENCES agencias(codigo)
);

-- Transações: Tipo da transação, conta de origem, valor --
CREATE TABLE transacoes(
  tipo VARCHAR(50),
  conta_origem INT,
  valor DECIMAL(10,2), -- Corrigido para DECIMAL(10,2)

  -- Chave estrangeira: referenciando o código da conta
  CONSTRAINT fk_contas FOREIGN KEY (conta_origem) REFERENCES contas(codigo)
);








-- Inserindo dados fictícios em clientes
INSERT INTO clientes (nome, cpf, data_nascimento, endereco, telefone)
VALUES ('João Silva', '123.456.789-10', '1990-05-15', 'Rua A, 123', '1122334455');

INSERT INTO clientes (nome, cpf, data_nascimento, endereco, telefone)
VALUES ('Maria Santos', '987.654.321-00', '1985-10-20', 'Avenida B, 456', '9988776655');

INSERT INTO clientes (nome, data_nascimento, endereco, telefone)
VALUES ('Pedro Alves', '2000-03-25', 'Praça C, 789', '9988776655');



-- Inserindo dados fictícios em agências
INSERT INTO agencias (codigo, nome, endereco, data_criacao)
VALUES (1, 'Agência A', 'Avenida X, 123', '2022-01-10 09:00:00');

INSERT INTO agencias (codigo, nome, endereco, data_criacao)
VALUES (2, 'Agência B', 'Rua Y, 456', '2022-02-15 10:30:00');



-- Inserindo dados fictícios em contas
INSERT INTO contas (codigo, saldo, endereco, datacriacao, clientes_cpf, agencias_codigo)
VALUES (101, 5000.00, 'Rua D, 789', '2023-10-01 14:45:00', '123.456.789-10', 1);

INSERT INTO contas (codigo, saldo, endereco, datacriacao, clientes_cpf, agencias_codigo)
VALUES (102, 3500.00, 'Avenida E, 567', '2023-10-02 12:30:00', '987.654.321-00', 2);



-- Inserindo dados fictícios de transações
-- Transações relacionadas à conta 101
INSERT INTO transacoes (tipo, conta_origem, valor)
VALUES ('Débito', 101, 200.00);

INSERT INTO transacoes (tipo, conta_origem, valor)
VALUES ('Crédito', 101, 500.00);

-- Transações relacionadas à conta 102
INSERT INTO transacoes (tipo, conta_origem, valor)
VALUES ('Débito', 102, 100.00);

INSERT INTO transacoes (tipo, conta_origem, valor)
VALUES ('Crédito', 102, 300.00);

-- Transações adicionais
-- Transações relacionadas à conta 101
INSERT INTO transacoes (tipo, conta_origem, valor)
VALUES ('Débito', 101, 50.00);

-- Transações relacionadas à conta 102
INSERT INTO transacoes (tipo, conta_origem, valor)
VALUES ('Crédito', 102, 150.00);

-- Transações relacionadas à conta 101
INSERT INTO transacoes (tipo, conta_origem, valor)
VALUES ('Débito', 101, 75.00);

-- Transações relacionadas à conta 102
INSERT INTO transacoes (tipo, conta_origem, valor)
VALUES ('Crédito', 102, 200.00);

-- Transações relacionadas à conta 101
INSERT INTO transacoes (tipo, conta_origem, valor)
VALUES ('Débito', 101, 100.00);

-- Transações relacionadas à conta 102
INSERT INTO transacoes (tipo, conta_origem, valor)
VALUES ('Crédito', 102, 250.00);

  --EXIBINDO--
SELECT * from clientes;
SELECT nome from clientes;
SELECT nome from agencias
WHERE data_criacao > '2020-01-01';
SELECT * from contas  
WHERE tipo == 'Poupança';
SELECT * FROM contas WHERE agencias_codigo = 1;



SELECT * FROM transacoes
WHERE conta_origem IN (SELECT codigo FROM contas WHERE clientes_cpf = '123.456.789-10');

SELECT * FROM transacoes;
SELECT * FROM transacoes;
  
WHERE conta_origem IN (SELECT codigo FROM contas WHERE clientes_cpf = '123.456.789-10')
AND conta_origem IN (SELECT codigo FROM contas WHERE clientes_cpf = '555.111.222-33');

SELECT agencias.codigo, agencias.nome, COUNT(contas.codigo) AS numero_contas
FROM agencias
JOIN contas ON agencias.codigo = contas.agencias_codigo
GROUP BY agencias.codigo, agencias.nome
HAVING numero_contas >= 3;

SELECT contas.codigo, contas.clientes_cpf, COUNT(transacoes.tipo) AS numero_transacoes
FROM contas
LEFT JOIN transacoes ON contas.codigo = transacoes.conta_origem
GROUP BY contas.codigo, contas.clientes_cpf
HAVING numero_transacoes >= 4;

SELECT nome
FROM clientes
WHERE cpf NOT IN (SELECT DISTINCT clientes_cpf FROM contas c JOIN transacoes t ON c.codigo = t.conta_origem)
