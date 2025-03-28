drop database if exists SuperLojaDb;
create database SuperLojaDb;
use SuperLojaDb;
-- default é um valor padrão que será utilizado no insert, caso não seja informado valor para a coluna
create table marcas(
id INT primary key auto_increment,
nome varchar(45) not null,
cnpj varchar(18) default '00.000.000/0000-00', 
data_criacao datetime default now()
);
INSERT INTO marcas (nome, cnpj) VALUES ('Hyundai', '10.394.422/0001-20'); # id 1
INSERT INTO marcas (nome) VALUES ('Volkswagen'); # id 2
INSERT INTO marcas (nome, cnpj) VALUES ('Chevrolet', NULL); # id 3

-- AS é um apelido
select 
ma.id as 'Código', 
ma.nome as 'Marca',
ma.cnpj as 'CNPJ',
ma.data_criacao as 'Data de criação'
from marcas as ma;

create table carros(
id int primary key auto_increment,
modelo varchar(45) not null,
cor varchar(30) not null,
descricao varchar(1000),

id_marca int not null,

data_criacao DATETIME default now(),

-- foreign key (<coluna-da-tabela-atual>) references <tabela-pai>(<coluna-pk-da-tabela-pai>)
foreign key (id_marca) references marcas(id)
);

-- PK -> Primary Key => Chave primária
-- FK -> Foreign Key => Chave estrangeira

-- Uma chave estrangeira serve para relacionar um registro de uma tabela a outra tabela.
-- Obrigatoriamente uma FK tem que estar atrelada a uma PK

insert into carros (id_marca, modelo, cor) values
(2, 'Fusca', 'Azul bebê');

insert into carros (modelo, cor, id_marca) values
('HB20 Sedan', 'Branco', 1);

-- Este insert não funcionará pq a tabela de marcas não contém uma marca com o id 4.
-- insert into carros (modelo, cor, id_marca) values 
-- ('Dolphin', 'Caramelo', 4);

select c.id, c.modelo, c.cor, c.id_marca
from carros as c;

-- nullable => nullo
-- not nullable => não pode ser nulo


select 
m.nome,
c.modelo, 
c.id_marca
from carros as c
inner join marcas as m on(c.id_marca = m.id);
-- inner join <nome-da-outra-tabela> on 
-- 				(<apelido-da-tabela>.<coluna-fk-da-tabela> = <apelido-da-outra-tabela>.<coluna-pk-da-outra-tabela);






create table departamentos (
id int primary key auto_increment,
nome varchar(45) not null
);

drop table if exists funcionarios;
create table funcionarios(
id int primary key auto_increment,
nome varchar(45) not null
);
insert into funcionarios (nome) values ("Judity");
insert into funcionarios (nome) values ("Lucas");

select * from funcionarios;

alter table funcionarios add column cpf varchar(45) default '' not null;

insert into funcionarios (nome, cpf) values ("Fernando", '21923');

insert into funcionarios (nome) values ("Fernanda");
-- update funcionarios set cpf = '213.401.239-10' where id = 1;
-- update funcionarios set cpf = '213.401.239-11' where id = 2;

-- alter table funcionarios modify column cpf varchar(45) not null;


