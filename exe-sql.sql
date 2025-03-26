DROP DATABASE IF EXISTS profissoes;
CREATE DATABASE profissoes;
USE profissoes;

SHOW SCHEMAS;

-- SELECT * FROM profissoes;

-- Criar a tabela profissoes com as seguintes colunas
-- 	id gerado automaticamente, com PK
--      nome máximo de 50 caracteres, não nulo
--      salario base double
--      quantidade de horas inteiro

CREATE TABLE profissoes (
	id int primary key auto_increment,
    nome varchar(50) not null default "",
    salario_base double,
    quantidades_horas int 
);
-- describe profissoes; # mostrar a tabela
-- Inserir um registro 'Advogado', 'R$ 5000,90', 80
-- Inserir um registro 'Biólogo', 'R$ 3500,00', 220
-- Inserir um registro 'Pedreiro', 'R$ 10000,00', 200
INSERT INTO profissoes(nome, salario_base, quantidades_horas) values("Advogado", "5000.90", "80");
INSERT INTO profissoes(nome, salario_base, quantidades_horas) values("Biólogo", "3500.00", "220");
INSERT INTO profissoes(nome, salario_base, quantidades_horas) values("Pedreiro", "10000.00", "200");

-- Adicionar uma coluna de descrição do tipo texto
-- Gerar uma descrição e preencher para o Advogado
-- Gerar uma descrição e preencher para o Biólogo
-- Gerar uma descrição e preencher para o Pedreiro

alter table profissoes add column descricao varchar(100);

UPDATE profissoes set descricao = "advogado jr descrição" where id = 1; 
update profissoes set descricao = "Biólogo descrição" where id = 2;
update profissoes set descricao = "Pedreiro descrição" where id = 3;

-- Inserir um registro para Motorista, preenchendo todos os campos
-- Inserir um registro para 'Programador', somente preenchendo o nome e descrição
-- Inserir 20 registros com nome, salário, quantidade de horas e descrição (usar IA para gerar)

insert into profissoes(nome, salario_base, quantidades_horas, descricao) values("Motorista" , "1500.00" , "220", "CNH A+B");
insert into profissoes(nome, salario_base, quantidades_horas, descricao) values("Desenvolvedor", 3000.00, "220", "Cargo Jr");
-- Inserir 20 registros na tabela profissoes (sem repetir as profissões já mencionadas)
INSERT INTO profissoes(nome, salario_base, quantidades_horas, descricao) VALUES
("Designer", 2800.00, 180, "Criativo e técnico"),
("Engenheiro Civil", 5000.00, 200, "Construção e planejamento"),
("Médico", 15000.00, 60, "Cuidados e tratamentos médicos"),
("Arquiteto", 7000.00, 180, "Projetos arquitetônicos"),
("Professor", 2500.00, 160, "Educação e ensino"),
("Enfermeiro", 4500.00, 180, "Cuidados com pacientes"),
("Psicólogo", 4000.00, 160, "Aconselhamento e terapia"),
("Cozinheiro", 2000.00, 200, "Preparação de alimentos"),
("Eletricista", 3500.00, 200, "Instalações e manutenção elétrica"),
("Contador", 4000.00, 180, "Consultoria financeira e tributária"),
("Farmacêutico", 5000.00, 180, "Assistência farmacêutica"),
("Cientista de Dados", 8000.00, 200, "Análise e interpretação de dados"),
("Veterinário", 6000.00, 160, "Cuidados com animais"),
("Redator", 2500.00, 160, "Produção de conteúdo"),
("Analista de Sistemas", 4500.00, 180, "Desenvolvimento e manutenção de sistemas"),
("Atendente de Call Center", 1500.00, 220, "Atendimento ao cliente"),
("Assistente Administrativo", 2000.00, 180, "Apoio nas atividades administrativas"),
("Tecnólogo em Logística", 3500.00, 180, "Gestão de processos logísticos"),
("Publicitário", 3500.00, 160, "Criação e gestão de campanhas publicitárias"),
("Gestor de Recursos Humanos", 5500.00, 180, "Gestão de pessoas e processos de recrutamento");


-- Consultar as profissões que começam com 'P'
select nome from profissoes where nome like "p%";

-- Consultar as profissões que o salário base é maior que 2000 e a quantidade de horas é menor que 150

select 
    salario_base, quantidades_horas
    from profissoes
    where
    salario_base > "7000.00" or
	quantidades_horas < "150.0";

-- Consultar as profissões do menor salário base para o maior
select 
	salario_base, nome
    from profissoes
    where salario_base 
    order by salario_base asc, nome asc;
    
-- Consultar as profissões que tem o salário base entre 2500 e 8000
select 
	salario_base, nome
    from profissoes
    where salario_base >= "2500.00" and salario_base <= "8000.00"
    order by salario_base asc, nome asc;


-- Consultar as profissões que não tem o salário base definido , porém todos estão definidos nesse caso.
select 
	salario_base, nome
    from profissoes
    where salario_base is null;

-- Consultar as profissões ordenadas por quantidade de horas do maior para o menor

select 
	nome, quantidades_horas
    from profissoes
    where quantidades_horas
	order by quantidades_horas desc ;

-- Consultar as profissões que tem a quantidade de horas menor ou igual que 100 horas ou maior ou igual que 220
select 
	nome, quantidades_horas
    from profissoes
    where quantidades_horas <= "100" or quantidades_horas >="200"
    order by quantidades_horas asc;

-- Consultar as profissões que contenham 'i' em qualquer parte;
select nome from profissoes where nome like "%I%";

-- Consultar as profissões que não tem a quantidade de horas definidas
select
	 nome, quantidades_horas
     from profissoes
     where quantidades_horas is null;
	
-- Consultar as profissões ordenadas por quantidade de horas do menor para o maior
select 
	nome, quantidades_horas
    from profissoes
    where quantidades_horas
    order by quantidades_horas asc;
	
-- Consultar as profissões que começam com 'M';
select
	nome
    from profissoes
    where nome like  "m%";
    
-- Consultar as profissões listando 5 registros
select id, nome from profissoes limit 5;

-- Consultar as profissões listando 5 registros da primeira página, ordenando por id crescente
select id, nome from profissoes limit 5, 5;

-- Consultar as profissões listando 5 registros da segunda página, ordenando por id crescente
select id, nome from profissoes limit 10, 5;

-- Consultar as profissões listando 5 registros da terceira página, ordenando por id crescente
select id, nome from profissoes limit 15, 5;

-- Consultar as profissões listando 5 registros da quarta página, ordenando por id crescente
select id, nome from profissoes limit 20, 5;

-- Repetir até a última página
select id, nome from profissoes limit 25, 5;  # não há mais registros

-- Consultar as profissões que terminam com 'o';
select 
	nome
    from profissoes
    where nome like "%o";
    
-- Consultar o nome concatenado com sua quantidade de horas
select concat(
	"Profissão, ",
    nome, ", " ,
    quantidades_horas,
    " horas. "
     )as " mensagem "
     from profissoes;

-- Consultar o nome e a quantidade de caracteres
	select 
    nome,
    LENGTH(nome) as "quantidade caracter"
    from profissoes
    order by length(nome) asc;
	
    -- Consultar o nome e a quantidade de caracteres ordenados pela quantidade de caracteres do maior para menor

	select 
    nome,
    LENGTH(nome) as "quantidade caracter"
    from profissoes
    order by length(nome) desc;

-- Consultar o nome da profissão em letras maiúsculas
select upper(nome) from profissoes;

-- Consultar o menor salário base
select min(salario_base) from profissoes;

-- Consultar a soma dos salários base
select 
	sum(salario_base)
    from profissoes;
    
-- Consultar o maior salário
select nome, salario_base
from profissoes
where salario_base = (select max(salario_base) from profissoes);

SELECT nome, salario_base, quantidades_horas
FROM profissoes
WHERE quantidades_horas > 150
ORDER BY salario_base ASC # ordena salario do menor ao maior
LIMIT 1;  # faz pegar o primeiro salario ou seja o menor

-- Consultar a média dos salários em que o salário base é entre R$ 5000,00 e R$ 7000,00
SELECT AVG(salario_base) AS media_salario
FROM profissoes
    WHERE salario_base BETWEEN 5000.00 AND 7000.00;


-- Consultar o nome da profissão em letras minúsculas
select lower(nome) from profissoes;


select * from profissoes;


