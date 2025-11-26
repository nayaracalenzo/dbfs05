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
-- 2. DROP COLUNA cargo da tabela funcionarios
-- 3. ALTERAR TABELA funcionarios add coluna cargo_id e constraint FK 


