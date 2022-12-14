/* Logico: */

CREATE DATABASE psychomango;

USE psychomango;


/* Lógico_1: */

CREATE TABLE Person (
    pes_id char(14) PRIMARY KEY,
    pes_nome char(30),
    data_nasc date,
    email char(100) unique,
    password char(8),
    cep int
);

CREATE TABLE Endereco (
    cep int PRIMARY KEY,
    nm_rua char(100),
    num_residencia int,
    cid_id int
);

CREATE TABLE Cidade (
    cid_id int PRIMARY KEY auto_increment,
    nm_cidade char(100),
    estd_id int
);

CREATE TABLE Estados (
    estd_id int PRIMARY KEY auto_increment,
    nm_estado char(100),
    sg_estado char(2),
    id_pais int
);

CREATE TABLE Produto (
    cod_prod int PRIMARY KEY auto_increment,
    prod_nm char(100),
    prec_prod int,
    categ_id int
);

CREATE TABLE Categoria (
    categ_id int PRIMARY KEY auto_increment,
    categ_desc char(50)
);

CREATE TABLE pais (
    id_pais int PRIMARY KEY auto_increment,
    nm_pais char(100)
);

CREATE TABLE Carrinho (
    car_id int PRIMARY KEY auto_increment,
    cod_prod int,
    pes_id int
);

CREATE TABLE sexo ( 
    sexo_id int PRIMARY KEY auto_increment, 
    desc_sexo char(50) 
);
 
ALTER TABLE Person 
    FOREIGN KEY (cep)
    REFERENCES Endereco (cep)
    ON DELETE RESTRICT;
 
ALTER TABLE Endereco 
    FOREIGN KEY (cid_id)
    REFERENCES Cidade (cid_id)
    ON DELETE RESTRICT;
 
ALTER TABLE Cidade 
    FOREIGN KEY (estd_id)
    REFERENCES Estados (estd_id)
    ON DELETE RESTRICT;
 
ALTER TABLE Estados 
    FOREIGN KEY (id_pais)
    REFERENCES pais (id_pais)
    ON DELETE RESTRICT;
 
ALTER TABLE Produto 
    FOREIGN KEY (categ_id)
    REFERENCES Categoria (categ_id)
    ON DELETE RESTRICT;
 
ALTER TABLE Carrinho 
    FOREIGN KEY (cod_prod)
    REFERENCES Produto (cod_prod)
    ON DELETE RESTRICT;
 
ALTER TABLE Carrinho 
    FOREIGN KEY (pes_id)
    REFERENCES Person (pes_id)
    ON DELETE CASCADE;
    
alter table produto 
MODIFy prec_prod float not null;

ALTER TABLE `person` 
CHANGE `password` 
`password` TEXT CHARACTER
 SET utf8mb4 COLLATE utf8mb4_general_ci 
 NULL DEFAULT NULL;

 ALTER TABLE `produto` ADD `imagem` CHAR(100) 
 NULL DEFAULT NULL AFTER `categ_id`;