use SuperBiblioteca;

create or replace view vw_livros_comentarios_consolidados as
select 
livros.nome as "livro",
count(livros_comentarios.comentario)"quantidade_comentarios"
from livros_comentarios
inner join livros on (livros_comentarios.id_livro = livros.id)
group by livros_comentarios.id_livro
order by quantidade_comentarios desc, livro asc;
select * from vw_livros_comentarios_consolidados vlcc;



-- criar uma view vw_livros_autores (listar nome do livro, quantidade de paginas, ok nome autor e ok id do autor)
create or replace view vw_livros_autores as
select 
autores.id as "id",
autores.nome as "autor",
livros.nome as "livro",
livros.quantidade_paginas as "quantidade Páginas"
from livros
inner join autores on (livros.id_autor = autores.id)
order by livros.nome asc, autores.nome asc ;

select * from vw_livros_autores;

-- Criar uma view vw_livros_categorias (listar nome da categoria, nome do livro, id da categoria e id do livro)
create or replace view vw_livros_categorias as
select
categorias.id as "id categoria",
categorias.nome as "nome categoria",
livros.id as "id livro",
livros.nome as "livro"
from livros 
join categorias on (livros.id_categoria = categorias.id);
select * from vw_livros_categorias;

-- Criar uma view vw_livros_editoras (listar nome da editora, nome do livro, ordenados por nome de editora)
create or replace view vw_livros_editoras as 
select
editoras.nome as "Editora",
livros.nome as "Livro"
from editoras
join livros on (editoras.id = livros.id)
order by editoras.nome asc;
select * from vw_livros_editoras;

-- Criar uma view vw_livros_editoras_autores 
-- 					 (listar nome do livro, autor, editora onde a quantidade de páginas for maior que 1000)

create or replace view vw_livros_editoras_autores as 
select
livros.nome as "livro",
autores.nome as "autor",
editoras.nome as "editora",
quantidade_paginas as "quantidade de páginas"
from autores
join livros on (livros.id_autor = autores.id)
join editoras on (livros.id_editora = editoras.id)
where quantidade_paginas > "1000";

select quantidade_paginas from livros;
select * from vw_livros_editoras_autores;

-- Criar uma view vw_livros_fantasia (listar nome do livro, quantidade de paginas, descricao) da categoria 'Fantasia'
create or replace view vw_livros_fantasia as 
select
livros.nome as "Livro",
livros.quantidade_paginas as "quantidade páginas",
livros.descricao as "Descrição"
from categorias
join livros on (livros.id_categoria = categorias.id)
where id_categoria = "2";
select count(nome) from livros;
select nome, count(nome) from categorias
group by categorias.nome;


select * from vw_livros_fantasia;

-- Criar uma view vw_livros_autor_tolkien (listar nome do livro, nome do autor) filtrar autor 'J.R.R. Tolkien'


-- Criar uma view vw_livros_por_categoria (listar nome da categoria, quantidade livros) group by necessário


-- Criar uma view vw_paginas_por_autor (listar nome do autor, soma da quantidade de páginas) group by necessário
