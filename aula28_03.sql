-- Se a tabela já existir, ela é removida
DROP TABLE IF EXISTS pedidos;

-- Criação da tabela "pedidos" com a coluna nome_cliente
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    data_pedido DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- Inserts na tabela "pedidos" utilizando nomes dos clientes
INSERT INTO pedidos (nome_cliente, data_pedido, valor) VALUES
('João',  '2023-01-05', 150.00),
('João',  '2023-02-10', 200.00),
('João',  '2022-12-20', 100.00),  -- Pedido anterior a 2023 para testar o WHERE
('João',  '2023-03-15', 250.00),
('João',  '2023-04-22', 300.00),
('João',  '2023-05-30', 180.00),

('Maria', '2023-01-12', 120.00),
('Maria', '2023-03-03', 140.00),
('Maria', '2022-11-28', 160.00),  -- Pedido anterior a 2023

('Pedro', '2023-02-17', 200.00),
('Pedro', '2023-03-19', 210.00),
('Pedro', '2023-04-01', 220.00),
('Pedro', '2023-04-05', 230.00),
('Pedro', '2023-05-10', 240.00),
('Pedro', '2023-06-15', 250.00),
('Pedro', '2023-07-20', 260.00),

('Ana',   '2023-02-08', 300.00),
('Ana',   '2023-03-11', 320.00),
('Ana',   '2022-12-30', 340.00),  -- Pedido anterior a 2023
('Ana',   '2023-04-12', 360.00);

-- select filtrando os registros antes de agrupar

select nome_cliente, sum(valor)
from pedidos
where year(data_pedido) = 2023
group by nome_cliente;


select nome_cliente, sum(valor) as "total_pedidos"
from pedidos
group by nome_cliente
having total_pedidos > 1000;

-- apresentar pouco estoque a qauntidade for inferior a 50, muito estoque quando for 50 ou mais
select 
produtos.nome,
produtos.quantidade_estoque,
if(produtos.quantidade_estoque < 50, "Baixo estoque", "Alto estoque") as "status"
from produtos
order by status;

-- uma alternativa seria utilizar  case
select
produtos.nome,
produtos.quantidade_estoque,
case
	when produtos.quantidade_estoque > 100 then "Absurdo de estoque"
	when produtos.quantidade_estoque > 50 then "Alto estoque"
	else "Baixo estoque"
end as status
from produtos
order by status;

-- filtrar os produtos que tem o preço entre 5 e 11
select  * from produtos  where preco >=5 and preco <= 11;

-- alternativa : between

select * from produtos where preco between 5 and 11;

-- filtrar os produtos que tem o nome "Toddy" ou "Chocolate Belga" ou "Coca"
select * from produtos where nome = "Toddy" or nome = "Chocolate Belga" or nome = "Coca";
-- alternativa in:
select * from produtos where nome in ("Toddy", "Chocolate Belga", "Coca");


-- collate é um conjunto de regas que determina como os dados de texto são comparados e ordenados.

-- essas regras definem, po exemplo, se as comparações entre letras devem levar em consideração 
-- diferenças entre maiúsculas e minúsculas , acentos e outros aspectos específicos de um idioma.
-- collate: utf8mb4_general_ci, onde "ci" siginfica case insensitive (não se importa com maiúsculas ou minúsculas)
-- collate: utf8mb4_bin: realiza a comparação onde importa maiúsculas ou minúsculas

-- como saber o collate de uma tabela
show create table produtos;
-- como alterar o collate de uma tabela
alter table produtos
convert to character set utf8mb4
collate utf8mb4_general_ci;





















