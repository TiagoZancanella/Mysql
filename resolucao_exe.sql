drop database if exists exercicio; 
create database exercicio;
use exercicio;

create table estados(
id int primary key auto_increment,
nome varchar(50),
sigla varchar(4)
);

create table cidades(
id int primary key auto_increment,
nome varchar(50),
quantidades_habitantes double,
id_estados int not null,
    foreign key (id_estados) references estados(id)
);

create table bairros(
id int primary key auto_increment,
nome varchar(50),
id_cidade int not null,
    foreign key (id_cidade) references cidades(id)
);
create table endereco(
id int primary key auto_increment,
logradouro varchar(100),
numero double,
cep varchar(11),
id_bairro int not null,
foreign key (id_bairro) references bairros(id)
);

insert into estados(nome, sigla) values ("Santa Catarina", "SC");
insert into estados(nome, sigla) values ("São Paulo", "SP");

insert into cidades(nome, quantidades_habitantes, id_estados) values ("Gaspar", "72570.00", 1);
insert into cidades(nome, quantidades_habitantes, id_estados) values ("Blumenau", "361161.00", 1);

insert into bairros(nome, id_cidade) values ("Coloninha" , 1) , ("Centro" , 1); 
insert into bairros(nome, id_cidade) values ("Victor Konder", 2), ("Itoupava Seca" , 2);

insert into endereco(logradouro, numero, cep, id_bairro) values ("25 de junho", "60" , "89112-326", 1), ("Mario Vanzuita", "50", "89114-442", 1); 
insert into endereco(logradouro, numero, cep, id_bairro) values ("Oscar Gross", "100" , "89030-118", 2), ("Antônio da veiga", "80", "89012-500", 2); 
select nome from bairros;
select sigla from estados;
select logradouro from endereco;

-- Consulta endereco, bairro  
select 
    endereco.logradouro as "endereço",
    bairros.nome as "bairro"
    from bairros
    inner join endereco on (endereco.id_bairro = bairros.id);

-- Consulta estado, cidade 
select 
cidades.nome as "Cidades",
estados.nome as "Estados"
from estados
inner join cidades on (cidades.id_estados = estados.id);
    
-- Consulta cidade, bairro
select 
bairros.nome as "Bairro",
cidades.nome as "Cidades"
From cidades
inner join bairros on (bairros.id_cidade = cidades.id);

-- Consulta estado, cidade, bairro
select 
bairros.nome as "Bairro",
cidades.nome as "Cidade",
estados.nome as "Estados"
from estados
inner join cidades on (cidades.id_estados = estados.id)
inner join bairros on(bairros.id_cidade = cidades.id);

-- Consutla cidade, bairro, endereco

select
endereco.logradouro as "Rua",
bairros.nome as "Bairro",
cidades.nome as "Cidades"
from cidades
inner join bairros on (bairros.id_cidade = cidades.id)
inner join endereco on (endereco.id_bairro = bairros.id);

-- Consutla estado, cidade, bairro, endereco

select
endereco.logradouro as "Rua",
bairros.nome as "Bairro",
cidades.nome as "Cidade",
estados.nome as "Estado"
From estados
inner join cidades on (cidades.id_estados = estados.id)
inner join bairros on (bairros.id_cidade = cidades.id)
inner join endereco on (endereco.id_bairro = bairros.id);

-- Consulta cidade, bairro, endereco do estado com a sigla 'SC'

select 
estados.sigla as "UF",
estados.nome as "Estado",
cidades.nome as "Cidade",
bairros.nome as "Bairro",
endereco.logradouro as "Rua"
from estados
inner join cidades on (cidades.id_estados = estados.id)
inner join bairros on (bairros.id_cidade = cidades.id)
inner join endereco on (endereco.id_bairro = bairros.id);



    -- inner join <nome-da-outra-tabela> on 
-- 				(<apelido-da-tabela>.<coluna-fk-da-tabela> = <apelido-da-outra-tabela>.<coluna-pk-da-outra-tabela);
    
    
    
    
    