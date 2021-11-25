-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-06-07 21:43:48.839

-- tables
-- Table: aluno
CREATE TABLE aluno (
    Peso int  NULL,
    IMC int  NULL,
    Massa_esqueletica int  NULL,
    gordura_corporal int  NULL,
    massa_livre_de_gordura int  NULL,
    percentual_de_gordura decimal(3,1)  NULL,
    agua_corporal_total int  NULL,
    metabolismo_basal int  NULL,
    id_aluno int  NOT NULL,
    altura int  NULL,
    plano_aluno int  NOT NULL,
    f_c_repouso int  NULL,
    p_a_repouso int  NULL,
    CONSTRAINT aluno_pk PRIMARY KEY (id_aluno)
);

-- Table: circunferencias
CREATE TABLE circunferencias (
    ombro int  NOT NULL,
    peitoral int  NOT NULL,
    biceps_d_contraido int  NOT NULL,
    biceps_e_contraido int  NOT NULL,
    biceps_d int  NOT NULL,
    biceps_e int  NOT NULL,
    antebraco_d int  NOT NULL,
    antebraco_e int  NOT NULL,
    punho_d int  NOT NULL,
    punho_e int  NOT NULL,
    cintura int  NOT NULL,
    abdome int  NOT NULL,
    quadril int  NOT NULL,
    quadriceps_d int  NOT NULL,
    quadriceps_e int  NOT NULL,
    panturrilha_d int  NOT NULL,
    panturrilha_e int  NOT NULL,
    dono_medidas int  NOT NULL,
    CONSTRAINT circunferencias_pk PRIMARY KEY (dono_medidas)
);

-- Table: compra
CREATE TABLE compra (
    id_compra serial  NOT NULL,
    forma_pagamento varchar(15)  NULL,
    data date  NULL,
    hora time  NOT NULL,
    id_comprador int  NOT NULL,
    id_produto_vendido int  NOT NULL,
    CONSTRAINT compra_pk PRIMARY KEY (id_compra)
);

-- Table: funcionario
CREATE TABLE funcionario (
    salario money  NULL,
    data_de_inicio date  NULL,
    data_recebimento date  NULL,
    login varchar(15)  NULL,
    senha varchar(15)  NULL,
    funcao varchar(20)  NULL,
    pessoa_id_pessoa int  NOT NULL,
    CONSTRAINT funcionario_pk PRIMARY KEY (pessoa_id_pessoa)
);

-- Table: pagamento
CREATE TABLE pagamento (
    id_pagamento int  NOT NULL,
    data date  NULL,
    valor money  NULL,
    forma_de_pagamento varchar(20)  NULL,
    id_aluno serial  NOT NULL,
    CONSTRAINT pagamento_pk PRIMARY KEY (id_pagamento)
);

-- Table: pessoa
CREATE TABLE pessoa (
    nome varchar(30)  NULL,
    cpf varchar(11)  NULL,
    id_pessoa serial  NOT NULL,
    telefone bigint  NULL,
    email varchar(30)  NULL,
    enredeco varchar(40)  NULL,
    sexo char(1)  NOT NULL,
    CONSTRAINT pessoa_pk PRIMARY KEY (id_pessoa)
);

-- Table: plano
CREATE TABLE plano (
    id_plano serial  NOT NULL,
    valor money  NULL,
    descricao varchar(40)  NULL,
    CONSTRAINT plano_pk PRIMARY KEY (id_plano)
);

-- Table: produtos
CREATE TABLE produtos (
    nome varchar(15)  NULL,
    id_produto serial  NOT NULL,
    valor money  NULL,
    estoque int  NULL,
    descricao varchar(30)  NOT NULL,
    CONSTRAINT produtos_pk PRIMARY KEY (id_produto)
);

-- foreign keys
-- Reference: aluno_pessoa (table: aluno)
ALTER TABLE aluno ADD CONSTRAINT aluno_pessoa
    FOREIGN KEY (id_aluno)
    REFERENCES pessoa (id_pessoa)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: aluno_plano (table: aluno)
ALTER TABLE aluno ADD CONSTRAINT aluno_plano
    FOREIGN KEY (plano_aluno)
    REFERENCES plano (id_plano)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: circunferencias_aluno (table: circunferencias)
ALTER TABLE circunferencias ADD CONSTRAINT circunferencias_aluno
    FOREIGN KEY (dono_medidas)
    REFERENCES aluno (id_aluno)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: compra_pessoa (table: compra)
ALTER TABLE compra ADD CONSTRAINT compra_pessoa
    FOREIGN KEY (id_comprador)
    REFERENCES pessoa (id_pessoa)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: compra_produtos (table: compra)
ALTER TABLE compra ADD CONSTRAINT compra_produtos
    FOREIGN KEY (id_produto_vendido)
    REFERENCES produtos (id_produto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: funcionario_pessoa (table: funcionario)
ALTER TABLE funcionario ADD CONSTRAINT funcionario_pessoa
    FOREIGN KEY (pessoa_id_pessoa)
    REFERENCES pessoa (id_pessoa)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: pagamento_aluno (table: pagamento)
ALTER TABLE pagamento ADD CONSTRAINT pagamento_aluno
    FOREIGN KEY (id_aluno)
    REFERENCES aluno (id_aluno)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

