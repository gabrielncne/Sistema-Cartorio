CREATE TABLE public.endereco (
    codigo_endereco NUMERIC(20) NOT NULL,
    logradouro VARCHAR(30) NOT NULL,
    numero NUMERIC(5) NOT NULL,
    complemento VARCHAR(50),
    bairro VARCHAR(20) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    cep NUMERIC(8) NOT NULL,
    CONSTRAINT endereco_pk PRIMARY KEY (codigo_endereco)
);

CREATE TABLE public.bancos (
    codigo_banco NUMERIC(10) NOT NULL,
    nome VARCHAR(15) NOT NULL,
    telefone NUMERIC(11) NOT NULL,
    site VARCHAR(30),
    codigo_endereco NUMERIC(20) NOT NULL,
    CONSTRAINT bancos_pk PRIMARY KEY (codigo_banco)
);

CREATE TABLE public.cartorios (
	codigo_cartorio NUMERIC(10) NOT NULL,
	nome VARCHAR(15) NOT NULL,
	tipo VARCHAR(30) NOT NULL,
	nome_tabeliao VARCHAR(30) NOT NULL,
	horario_funcionamento TIME NOT NULL,
	codigo_endereco NUMERIC(20) NOT NULL,
	CONSTRAINT cartorios_pk PRIMARY KEY (codigo_cartorio)
);

CREATE TABLE public.pessoas (
    codigo_pessoa NUMERIC(20) NOT NULL,
    primeiro_nome VARCHAR(15) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo CHAR(1) NOT null check(sexo in ('M', 'F')),
    estado_civil VARCHAR(10) NOT NULL,
    codigo_endereco NUMERIC(20) NOT NULL,
    CONSTRAINT pessoas_pk PRIMARY KEY (codigo_pessoa)    
);

CREATE TABLE public.telefones (
    codigo_pessoa NUMERIC(20) NOT NULL,
    telefones NUMERIC(11) NOT NULL
);

CREATE TABLE public.bens (
    codigo_bens NUMERIC(20) NOT NULL,
    codigo_pessoa NUMERIC(20) NOT NULL,
    nome VARCHAR(15) NOT NULL,
    valor_estimado NUMERIC(10) NOT NULL,
    data_disponibilidade DATE NOT NULL,
    CONSTRAINT bens_pk PRIMARY KEY (codigo_bens)
);

CREATE TABLE public.monetarios (
    codigo_bens NUMERIC(20) NOT NULL,
    valor NUMERIC(10) NOT NULL,
    tipo_moeda VARCHAR(10),
    codigo_banco NUMERIC(10) NOT NULL,
    CONSTRAINT monetarios_pk PRIMARY KEY (codigo_bens)
);

CREATE TABLE public.obras_arte (
    codigo_bens NUMERIC(20) NOT NULL,
    autor VARCHAR(15) NOT NULL,
    ano_criacao DATE NOT NULL,
    CONSTRAINT obras_arte_pk PRIMARY KEY (codigo_bens)
);


CREATE TABLE public.imoveis (
    codigo_bens NUMERIC(20) NOT NULL,
    tamanho NUMERIC(10) NOT NULL,
    tipo VARCHAR(11) NOT null check(tipo in ('residencial', 'terreno', 'comercial')),
    codigo_endereco NUMERIC(20) NOT NULL,
    CONSTRAINT imoveis_pk PRIMARY KEY (codigo_bens)
);

CREATE TABLE public.testamentos (
    codigo_testamento NUMERIC(20) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    data_registro DATE NOT NULL,
    testemunhas VARCHAR(30) NOT NULL,
    numero_registro NUMERIC(15) NOT NULL,
    codigo_pessoa NUMERIC(20) NOT NULL,
    codigo_cartorio NUMERIC(10) NOT NULL,
    CONSTRAINT testamentos_pk PRIMARY KEY (codigo_testamento)
);

CREATE TABLE public.imagens (
    codigo_imagem NUMERIC(20) NOT NULL,
    nome VARCHAR(15) NOT NULL,
    descricao VARCHAR(30) NOT NULL,
    data_registro DATE NOT NULL,
    codigo_cartorio NUMERIC(10) NOT NULL,
    codigo_testamento NUMERIC(20) NOT NULL,
    CONSTRAINT imagens_pk PRIMARY KEY (codigo_imagem)
);

CREATE TABLE public.testemunhas (
    codigo_pessoa NUMERIC(20) NOT NULL,
    codigo_testamento NUMERIC(20) NOT NULL
);

CREATE TABLE public.herdeiros (
    codigo_herdeiros NUMERIC(20) NOT NULL,
    nome VARCHAR(15) NOT NULL,
    telefones NUMERIC(11) NOT NULL,
    estado_civil VARCHAR(10) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(30) NOT NULL,
    sexo CHAR(1) NOT NULL,
    codigo_testamento_ NUMERIC(20) NOT NULL,
    codigo_testamento NUMERIC(20) NOT NULL,
    codigo_endereco NUMERIC(20) NOT NULL,
    CONSTRAINT herdeiros_pk PRIMARY KEY (codigo_herdeiros)
);

ALTER TABLE public.bancos ADD CONSTRAINT endereco_bancos_fk
FOREIGN KEY (codigo_endereco)
REFERENCES public.endereco (codigo_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.imoveis ADD CONSTRAINT endereco_imoveis_fk
FOREIGN KEY (codigo_endereco)
REFERENCES public.endereco (codigo_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pessoas ADD CONSTRAINT endereco_pessoas_fk
FOREIGN KEY (codigo_endereco)
REFERENCES public.endereco (codigo_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.cartorios ADD CONSTRAINT endereco_cartorios_fk
FOREIGN KEY (codigo_endereco)
REFERENCES public.endereco (codigo_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.herdeiros ADD CONSTRAINT endereco_herdeiros__fk
FOREIGN KEY (codigo_endereco)
REFERENCES public.endereco (codigo_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.monetarios ADD CONSTRAINT bancos_monetarios_fk
FOREIGN KEY (codigo_banco)
REFERENCES public.bancos (codigo_banco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.testamentos ADD CONSTRAINT cartorios_testamentos_fk
FOREIGN KEY (codigo_cartorio)
REFERENCES public.cartorios (codigo_cartorio)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.imagens ADD CONSTRAINT cartorios_imagens_fk
FOREIGN KEY (codigo_cartorio)
REFERENCES public.cartorios (codigo_cartorio)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.testamentos ADD CONSTRAINT pessoas_testamentos_fk
FOREIGN KEY (codigo_pessoa)
REFERENCES public.pessoas (codigo_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.bens ADD CONSTRAINT pessoas_bens_fk
FOREIGN KEY (codigo_pessoa)
REFERENCES public.pessoas (codigo_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.telefones ADD CONSTRAINT pessoas_telefones_fk
FOREIGN KEY (codigo_pessoa)
REFERENCES public.pessoas (codigo_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.testemunhas ADD CONSTRAINT pessoas_testemunhas_fk
FOREIGN KEY (codigo_pessoa)
REFERENCES public.pessoas (codigo_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.imoveis ADD CONSTRAINT bens_imoveis_fk
FOREIGN KEY (codigo_bens)
REFERENCES public.bens (codigo_bens)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.obras_arte ADD CONSTRAINT bens_obras_arte_fk
FOREIGN KEY (codigo_bens)
REFERENCES public.bens (codigo_bens)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.monetarios ADD CONSTRAINT bens_monetarios_fk
FOREIGN KEY (codigo_bens)
REFERENCES public.bens (codigo_bens)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.herdeiros ADD CONSTRAINT testamentos_herdeiros__fk
FOREIGN KEY (codigo_testamento)
REFERENCES public.testamentos (codigo_testamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.testemunhas ADD CONSTRAINT testamentos_testemunhas_fk
FOREIGN KEY (codigo_testamento)
REFERENCES public.testamentos (codigo_testamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.imagens ADD CONSTRAINT testamentos_imagens_fk
FOREIGN KEY (codigo_testamento)
REFERENCES public.testamentos (codigo_testamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;