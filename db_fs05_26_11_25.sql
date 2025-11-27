CREATE TABLE funcionarios (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cargo VARCHAR(50) NOT NULL,
  salario DECIMAL(10,2) CHECK (salario >= 1500),
  email VARCHAR(50) UNIQUE NOT NULL,
  ativo BOOLEAN DEFAULT TRUE
);

SELECT * FROM funcionarios;

-- Criar tabela de departamentos com as coluna id e nome.
-- nome não pode ser nulo 

CREATE TABLE departamentos (
 id SERIAL PRIMARY KEY,
 nome VARCHAR(100) NOT NULL
);

ALTER TABLE funcionarios ADD COLUMN departamento_id INT;

ALTER TABLE funcionarios DROP COLUMN departamento_id;

-- criando constraint FK e nomeando
ALTER TABLE funcionarios ADD COLUMN departamento_id INT, 
ADD CONSTRAINT fk_departamento_id FOREIGN KEY (departamento_id)
REFERENCES departamentos(id);

-- criando constraint FK sem nomear 
ALTER TABLE funcionarios ADD COLUMN departamento_id INT, 
ADD FOREIGN KEY (departamento_id) REFERENCES departamentos(id);

-- DROP TABLE funcionarios; (para deletar a tabela)



-- 1. CRIAR TABELA CARGOS (id, nome)
CREATE TABLE cargos (
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL
);

-- 2. DROP COLUNA cargo da tabela funcionarios

ALTER TABLE funcionarios DROP COLUMN cargo;

-- 3. ALTERAR TABELA funcionarios add coluna cargo_id e constraint FK 

ALTER TABLE funcionarios ADD COLUMN cargo_id INT, 
ADD FOREIGN KEY (cargo_id) REFERENCES cargos(id);


-- Inserir dados na tabela 

INSERT INTO cargos (nome) VALUES ('psicologo'), ('professor'), ('atendente'); 

SELECT * FROM cargos;


INSERT INTO departamentos (nome) VALUES ('Recursos Humanos'), ('Financeiro'),
('Atendimento ao Cliente'), ('Acadêmico');

SELECT * FROM departamentos;

-- Deletando dados na tabela

-- DELETE FROM departamentos WHERE nome = 'Recursos Humanos';
DELETE FROM departamentos WHERE id = 1;


INSERT INTO funcionarios (nome, salario, email, departamento_id, cargo_id)
VALUES ('Rodrigo Medeiros', 10000.00, 'rodrigo@mail.com', 4, 2);

INSERT INTO funcionarios (nome, salario, email, departamento_id, cargo_id)
VALUES ('Nayara Calenzo', 5000.00, 'nayara@mail.com', 4, 2), 
('Vanessa', 2500.00, 'vanessa@mail.com', 3, 3),
('Sarah', 3000.00, 'sarah@mail.com', 2, 3);

SELECT * FROM funcionarios;


-- selects com filtro (WHERE)
SELECT * FROM funcionarios WHERE salario > 3000;

SELECT * FROM funcionarios WHERE email = 'nayara@mail.com';

-- select com filtro (LIKE) 
-- % antes (termina com..)
-- % depois (começa com..)
-- % antes e depois (pode começar ou terminar com..)
SELECT * FROM funcionarios WHERE email LIKE '%nayara%';

-- alterando dados da tabela
UPDATE funcionarios SET email = 'nayara@email.com' WHERE id = 2;

-- select com ordenação (ORDER BY - DESC/ASC) 
SELECT * FROM funcionarios ORDER BY salario DESC;

SELECT nome, salario FROM funcionarios ORDER BY salario ASC;


-- como renomear uma coluna (AS) 
SELECT nome AS nome_usuario FROM funcionarios WHERE ativo = true;






