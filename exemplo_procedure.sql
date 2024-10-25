create database bd_clientes;     ##criando banco, DDL
use bd_clientes;

create table tbl_clientes (                ##criando a tabela dentro do banco bd_clientes
codigo int not null primary key auto_increment,      ##DDL (o que cria)   
nome varchar(40) not null,
sexo char(1) not null
);

insert into tbl_clientes(nome,sexo)     ##DML          ##inserindo(insert) valores aos segmentos da tabela
values("Finneas O'conel", "M"),                ##valores que serão inseridos na tabela
("Billie Eilish P. Baird O'connel", "F"),
("Bruno Mars", "M");

select * from tbl_clientes;      ##DML          ##exibe o resultado do código mostrando a tabela com os valores




DELIMITER $$
CREATE PROCEDURE sp_lista_clientes(IN opcao INT)
BEGIN
    IF opcao = 0 THEN
         SELECT * FROM tbl_clientes WHERE sexo = 'F';
    ELSEIF opcao = 1 THEN
		 SELECT * FROM tbl_clientes WHERE sexo = 'M';
	ELSE
		 SELECT * FROM tbl_clientes;
    END IF;
END$$ 

DELIMITER ;

SHOW PROCEDURE STATUS;


##Lista de sexo feminino:
call sp_lista_clientes(0);
##Lista de sexo masculino
call sp_lista_clientes(1);
##Lista de todos
call sp_lista_clientes(2);



##exemplo 2 stored procedure

DELIMITER $$

CREATE PROCEDURE sp_busca_cliente_por_nome
                                     (IN nome_parcial VARCHAR(100))
BEGIN
     SELECT * FROM tbl_clientes
     WHERE nome LIKE concat('%', nome_parcial, '%');
     
END$$

DELIMITER $$
