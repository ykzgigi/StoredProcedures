create database bd_clientes2;     ##criando banco, DDL
use bd_clientes2;

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



CREATE TABLE tbl_clientes2 (
id int not null primary key auto_increment,
nome varchar(100) not null,
idade int not null,
sexo char(1) not null,
email varchar(100) not null,
telefone varchar(15) not null,
endereco varchar(255) not null
);

insert into tbl_clientes2(nome,idade,sexo,email,telefone,endereco)
values
		("Vivian",17,"F","vivian34soars@gmail.com","(21) 98716-3560","Rua João Rodrigues de Souza"),
        ("Sophia",17,"F","sophxxz@gmail.com","(82) 98240-7185","3ª Travessa Dom da Bosco"),
        ("Luiz",72,"M","Luizzvcd@gmail.com","(95) 98611-1827","Rua Monte Belo"),
        ("Caio",12,"M","CaioSouzz@gmail.com","(63) 98750-6914","Rua Henrique Valente"),
        ("Livia",55,"F","Liiv666gvz@gmail.com","(11) 99741-8283","Alameda Lorena");
        
SELECT * FROM tbl_clientes2;

DELIMITER $$
 CREATE PROCEDURE sp_maiores_18(IN idade2 INT)
    BEGIN
    IF idade2 > 18 THEN
    SELECT * FROM tbl_clientes2 WHERE idade > 18;
    ELSEIF idade2 < 18 THEN
    SELECT * FROM tbl_clientes2 WHERE idade < 18;
    END IF;
	END $$
DELIMITER ;

drop procedure sp_maiores_18;

#LISTA MAIORES DE 18
CALL sp_maiores_18 (19);
#LISTA MENORES 18
CALL sp_maiores_18(12);