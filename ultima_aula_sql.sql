create database MinhaLoja; 
use MinhaLoja;

create table produtos(
id int primary key auto_increment,
nome varchar(100) not null,
estoque int not null
);

insert into produtos(nome, estoque) values
("Uva", 10),
("Maça", 100);

-- métodos com e sem retorno
-- procedure é método sem retorno
-- function é método com retorno
-- dentro de function/procedures você pode colocar regraras de negocios, fazer ações como insert, update, delete, create..
-- ao invés de colocar no python, java... 

drop procedure if exists somar_numeros;
delimiter $;
create procedure somar_numeros(
	in p_numero1 int,
    in p_numero2 int
)
begin
-- criar variavel para armazenar a soma dos números do tipo inteiro
declare soma int;
-- calcular a soma e  arnazenar na variável soma
	select p_numero1 + p_numero2 into soma;
    select soma;
end $;
delimiter ;


-- aqui é a chamada para executar a procedure
call somar_numeros(40,12);
call somar_numeros(18,28);


-- criar uma procedure calcular_media que recebe 3 notas e apresenta a média

drop procedure if exists calcular_media;
delimiter $;
create procedure calcular_media(
	in numero1 int,
    in numero2 int,
    in numero3 int
)
begin
	select ((numero1 + numero2 + numero3) / 3) as "média";
    end $;
delimiter $;

call calcular_media(5,5,5);





drop procedure if exists atualizar_estoque;

delimiter /;
create procedure atualizar_estoque(
in p_id_produto int,
in p_quantidade_nova int
)
begin 
update produtos set estoque = estoque + p_quantidade_nova where id = p_id_produto;
select * from produtos where id = p_id_produto;
end /;
delimiter ;

call atualizar_estoque(1,10);

select * from produtos;



drop function if exists calcular_imc;
delimiter $fim
create function calcular_imc(p_peso decimal(5,2), p_altura decimal(3,2))
returns decimal(5,2)
deterministic
begin

	declare imc decimal(5,2);
	set imc = p_peso / (p_altura * p_altura);
	return imc;

end $fim
delimiter ;

select calcular_imc(80, 2.00); 


-- determinisctic: retornam sempre o mesmo erro para os mesmos parâmetros, independentemente de qualquer outro fator.
-- 				ex: uma função que soma dois números

-- not determinisctic: podem retornar valores diferente mesmo com os parâmetros, geralmente porque 
-- 		dependem de variáveis do ambiente ( como data/hora atual, dados em outras tabelas que podem mudar, etc.)


drop function if exists saudacao;
delimiter //
create function saudacao()
returns varchar(30)
not deterministic
no sql
begin
	declare	mensagem varchar(30);
	declare data_hora_atual datetime;
    declare hora_atual int;
    
    set data_hora_atual = now(); 
    set hora_atual = hour(data_hora_atual);
    
    if hora_atual >= 5 and hora_atual <= 12 then
    set mensagem = "Bom Dia";
    elseif hora_atual >= 12 and hora_atual <= 18 then
    set mensagem = "Boa Tarde";
    else
    set mensagem = "Boa Noite";
    end if;
    return mensagem;
    end //
    delimiter ;
    select saudacao();
    
    -- criar uma função deterministica chamada calcular_salario_bruto que recebe 
--      parâmetro chamado valor_hora do tipo decimal e outro chamado quantidade_horas
--      criar uma variável para armazenar o salario_bruto
--      calcular o salário bruto armazenando na variável
--      retornar o salário bruto
--      chamar a função

-- criar uma função não deterministica chamada calcular_idade que recebe
--      um parâmetro chamadao p_data_nascimento do tipo date e retorne um inteiro
--      criar uma variável pegando o ano atual
--      criar uma variável pegando o ano da p_data_nascimento 
--      criar uma variável para armazenar a idade
--      retornar a idade
--      chamar a função
    
    
    
    
    
    
    
    
    
    
-- 		exemplo : uma função que usa now() ou consulta alguma tabela para compor o resultado.
