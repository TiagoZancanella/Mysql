drop database if exists supermercado_db;
create database supermercado_db;
use supermercado_db;

create table categorias (
	id int primary key auto_increment,
	nome varchar(75) not null unique
);

insert into categorias (nome) values 
('Mercearia'),
('Padaria'),
('Higiene'),
('Hortifruti'),
('Limpeza'), -- Sem produto
('Bebidas');

select * from categorias;

create table produtos (
	id int primary key auto_increment,
	nome varchar(50) not null unique,
	preco double not null,
	quantidade_estoque int not null,
	
	id_categoria int,
	foreign key (id_categoria) references categorias(id)
);

select id, nome from categorias;


insert into produtos (nome, preco, quantidade_estoque, id_categoria) values
('Pão Francês', 0.70, 50, 2),
('Bolo de Chocolate', 16.00, 5, 2),
('Toddy', 5.00, 4, 6),
('Coca', 8.00, 200, 6),
('Sabonete Dove', 3.50, 100, 3),
('Uva', 1.50, 20, (select id from categorias where nome = 'Hortifruti')),
('Maçã', 1.20, 75, 4),
('Feijão', 10.55, 33, 1),
('Arroz', 6.50, 17, 1),
('Vinagre', 4.00, 10, 1);

insert into produtos (nome, preco, quantidade_estoque, id_categoria) values
("Chocolate Belga", 150.00, 2, null);

select 
categorias.nome,
produtos.nome
from produtos 
inner join categorias on (produtos.id_categoria = categorias.id)
order by categorias.nome, produtos.nome; 
select count(id) from produtos;


-- innersjoin retornar todos as categorias com ou sem produtos relacionados
Select 
categorias.nome as "categorias",
produtos.nome as "Produtos"
from produtos
inner join categorias on (produtos.id_categoria = categorias.id)
order by categorias.nome, produtos.nome;



-- left join retornar todos as categorias com ou sem produtos relacionados
Select 
categorias.nome as "categorias",
produtos.nome as "Produtos"
from produtos
left join categorias on (produtos.id_categoria = categorias.id)
order by categorias.nome, produtos.nome;


-- right join retornar todos as categorias com ou sem produtos relacionados
Select 
categorias.nome as "categorias",
produtos.nome as "Produtos"
from produtos
right join categorias on (produtos.id_categoria = categorias.id)
order by categorias.nome, produtos.nome;

-- consultar a quantidade de produtos que tenho por categoria
select categorias.nome , count(produtos.nome)
from produtos
inner join categorias on (produtos.id_categoria = categorias.id)
group by produtos.id_categoria;
-- group by agrupa ps requisitos por categorias
-- count contabiliza a quantidade total de produtos daquela categoria


-- consultar a quantidade todal de estoque que temos por categorias
select categorias.nome, sum(produtos.quantidade_estoque)
from produtos
inner join categorias on (produtos.id_categoria = categorias.id)
group by produtos.id_categoria;

-- colsultar a média de preços por categorias, dos produtos que contém o preço maior que 4
select categorias.nome, avg(produtos.preco) as "preço"
from produtos
right join categorias on ( produtos.id_categoria = categorias.id)
where preco > 4
group by categorias.id
order by categorias.nome;


-- consultar a média de preços por categorias, das médias que são superiores a 4
select categorias.nome, avg(produtos.preco) as "preço"
from produtos
right join categorias on ( produtos.id_categoria = categorias.id)
group by categorias.id
having preço > 4
order by categorias.nome;



