/* Logico: */

CREATE DATABASE psychomango;

USE psychomango;

CREATE TABLE Endereco (
    cep int PRIMARY KEY,
    nm_rua char(100),
    num_residencia int,
    cid_id int
);

CREATE TABLE Cidade (
    cid_id int PRIMARY KEY,
    nm_cidade char(100),
    estd_id int
);

CREATE TABLE Estados (
    estd_id int PRIMARY KEY,
    nm_estado char(100),
    sg_estado char(2),
    pais int
);

CREATE TABLE Produto (
    cod_prod int PRIMARY KEY,
    prod_nm char(100),
    prec_prod int,
    categ_id int,
    car_id int,
    pes_id int,
    email char(100)
);

CREATE TABLE Categoria (
    categ_id int PRIMARY KEY,
    categ_desc char(50)
);

CREATE TABLE pais (
    id_pais int PRIMARY KEY,
    nm_pais char(100)
);

CREATE TABLE Carrinho_Person_Login (
    car_id int,
    pes_id int,
    pes_nome char(30),
    data_nasc date,
    email char(100),
    password char(8),
    username char(100),
    cep int,
    PRIMARY KEY (car_id, pes_id, email)
);
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_2
    FOREIGN KEY (cid_id)
    REFERENCES Cidade (cid_id)
    ON DELETE RESTRICT;
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (estd_id)
    REFERENCES Estados (estd_id)
    ON DELETE RESTRICT;
 
ALTER TABLE Estados ADD CONSTRAINT FK_Estados_2
    FOREIGN KEY (pais)
    REFERENCES pais (id_pais)
    ON DELETE RESTRICT;
 
ALTER TABLE Produto ADD CONSTRAINT FK_Produto_2
    FOREIGN KEY (categ_id)
    REFERENCES Categoria (categ_id)
    ON DELETE RESTRICT;
 
ALTER TABLE Produto ADD CONSTRAINT FK_Produto_3
    FOREIGN KEY (car_id, pes_id, email)
    REFERENCES Carrinho_Person_Login (car_id, pes_id, email)
    ON DELETE RESTRICT;
 
ALTER TABLE Carrinho_Person_Login ADD CONSTRAINT FK_Carrinho_Person_Login_2
    FOREIGN KEY (cep)
    REFERENCES Endereco (cep);