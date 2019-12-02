--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-12-02 18:03:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 196 (class 1259 OID 41102)
-- Name: id_cliente_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_cliente_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_cliente_sequence OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 41104)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id integer DEFAULT nextval('public.id_cliente_sequence'::regclass) NOT NULL,
    nome character varying(80),
    sobrenome character varying(80),
    sexo character varying(1),
    datacadastro character varying(11),
    situacao integer,
    rg character varying(10),
    cpf character varying(11),
    cnpj character varying(14),
    email character varying(255),
    telefone character varying(20),
    celular character varying(20),
    pais character varying(50),
    uf character varying(50),
    cidade character varying(50),
    bairro character varying(50),
    rua character varying(100),
    numero character varying(10),
    cep character varying(10),
    complemento character varying(50)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 41111)
-- Name: id_fornecedor_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_fornecedor_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_fornecedor_sequence OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 41113)
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedor (
    id integer DEFAULT nextval('public.id_fornecedor_sequence'::regclass) NOT NULL,
    datacadastro character varying(40),
    nome character varying(100),
    situacao integer,
    cnpj character varying(20),
    email character varying,
    telefone character varying(20),
    celular character varying(20),
    pais character varying(40),
    uf character varying(40),
    cidade character varying(40),
    bairro character varying(40),
    rua character varying(100),
    numero character varying(8),
    cep character varying(10),
    complemento character varying(150)
);


ALTER TABLE public.fornecedor OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 41120)
-- Name: id_funcionario_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_funcionario_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_funcionario_sequence OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 41122)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionario (
    id integer DEFAULT nextval('public.id_funcionario_sequence'::regclass) NOT NULL,
    nome character varying(40),
    sobrenome character varying(40),
    rg character varying(15),
    cpf character varying(18),
    sexo character varying(1),
    email character varying(150),
    telefone character varying(20),
    celular character varying(20),
    pais character varying(60),
    uf character varying(200),
    cidade character varying(200),
    rua character varying(100),
    numero character varying(8),
    cep character varying(10),
    complemento character varying(100),
    datacadastro character varying(255),
    situacao integer,
    bairro character varying(100)
);


ALTER TABLE public.funcionario OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 41129)
-- Name: id_itemorcamento_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_itemorcamento_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_itemorcamento_sequence OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 49293)
-- Name: id_itemproduto_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_itemproduto_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_itemproduto_sequence OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 41131)
-- Name: id_material_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_material_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_material_sequence OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 41133)
-- Name: id_orcamento_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_orcamento_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_orcamento_sequence OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 41135)
-- Name: id_produto_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_produto_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_produto_sequence OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 41137)
-- Name: id_usuario_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_usuario_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_usuario_sequence OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 41139)
-- Name: itemorcamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itemorcamento (
    id integer DEFAULT nextval('public.id_itemorcamento_sequence'::regclass) NOT NULL,
    idorcamento integer NOT NULL,
    idproduto integer NOT NULL,
    quantidade integer NOT NULL,
    datainicio character varying(40),
    datafim character varying(40),
    status integer
);


ALTER TABLE public.itemorcamento OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 49499)
-- Name: itemproduto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itemproduto (
    id integer DEFAULT nextval('public.id_cliente_sequence'::regclass) NOT NULL,
    idproduto integer NOT NULL,
    idmaterial integer NOT NULL,
    quantidade numeric(10,4)
);


ALTER TABLE public.itemproduto OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 41143)
-- Name: material; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material (
    id integer DEFAULT nextval('public.id_material_sequence'::regclass) NOT NULL,
    nome character varying(40),
    qtestoque numeric(10,2),
    qtmin numeric(10,2),
    datacadastro character varying(13),
    fornecedor integer,
    situacao integer,
    precounitario numeric(10,4)
);


ALTER TABLE public.material OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 41147)
-- Name: orcamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orcamento (
    id integer DEFAULT nextval('public.id_orcamento_sequence'::regclass) NOT NULL,
    idcliente integer NOT NULL,
    idresponsavel integer NOT NULL,
    relatorio text,
    datainsercao character varying(40),
    datainicio character varying(40),
    dataprevista character varying(40),
    datafim character varying(40),
    totalpago numeric,
    status integer,
    total numeric,
    estoque numeric,
    minestoque numeric
);


ALTER TABLE public.orcamento OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 41154)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    id integer DEFAULT nextval('public.id_produto_sequence'::regclass) NOT NULL,
    nome character varying(60),
    descricao character varying(250),
    preco numeric,
    peso numeric,
    fornecedor character varying,
    largura numeric,
    altura numeric,
    espessura numeric,
    datacadastro character varying(255),
    situacao integer,
    estoqueraz numeric(10,2),
    qtestoque numeric(10,2)
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 41161)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer DEFAULT nextval('public.id_usuario_sequence'::regclass) NOT NULL,
    nome character varying(40),
    senha character varying(40),
    nivel character varying(20)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 2748 (class 2606 OID 41166)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 41168)
-- Name: fornecedor fornecedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 41170)
-- Name: funcionario funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 49504)
-- Name: itemproduto iditem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemproduto
    ADD CONSTRAINT iditem PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 49498)
-- Name: material idmaterial; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT idmaterial PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 41172)
-- Name: itemorcamento itemorcamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemorcamento
    ADD CONSTRAINT itemorcamento_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 41174)
-- Name: orcamento orcamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orcamento
    ADD CONSTRAINT orcamento_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 41176)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 41178)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 41179)
-- Name: material fornecedorfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT fornecedorfk FOREIGN KEY (fornecedor) REFERENCES public.fornecedor(id);


--
-- TOC entry 2768 (class 2606 OID 41184)
-- Name: orcamento idcli; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orcamento
    ADD CONSTRAINT idcli FOREIGN KEY (idcliente) REFERENCES public.cliente(id);


--
-- TOC entry 2771 (class 2606 OID 49510)
-- Name: itemproduto idmat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemproduto
    ADD CONSTRAINT idmat FOREIGN KEY (idmaterial) REFERENCES public.material(id);


--
-- TOC entry 2765 (class 2606 OID 41189)
-- Name: itemorcamento idorc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemorcamento
    ADD CONSTRAINT idorc FOREIGN KEY (idorcamento) REFERENCES public.orcamento(id);


--
-- TOC entry 2770 (class 2606 OID 49505)
-- Name: itemproduto idprod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemproduto
    ADD CONSTRAINT idprod FOREIGN KEY (idproduto) REFERENCES public.produto(id);


--
-- TOC entry 2769 (class 2606 OID 41194)
-- Name: orcamento idresp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orcamento
    ADD CONSTRAINT idresp FOREIGN KEY (idresponsavel) REFERENCES public.usuario(id);


--
-- TOC entry 2766 (class 2606 OID 41199)
-- Name: itemorcamento idrprod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemorcamento
    ADD CONSTRAINT idrprod FOREIGN KEY (idproduto) REFERENCES public.produto(id);


-- Completed on 2019-12-02 18:03:26

--
-- PostgreSQL database dump complete
--

