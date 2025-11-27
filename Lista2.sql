-- Lista 2 - Banco de Dados

-- Exercício 1

-- 1. Crie um banco de dados chamando Cidade_Estado, com duas tabelas: Cidades e Estados.
-- 1.1 Insira dados dos estados e das cidades. Na tabela "Cidades" insira pelo menos dois municípios em cada estado.
-- 2. Faça as consultas pedidas
-- 2.1. Liste as cidades (nomes das cidades) e os estados (nomes dos estados) armazenados no banco
-- 2.2. Liste as cidades, os estados e suas siglas armazenados no banco
-- 2.3. Liste as cidades e os estados armazenados no banco cujas siglas começam com "A"
-- 2.4. Liste as cidades e os estados armazenados no banco cujas siglas começam com "A" e com "M"
-- 2.5. Liste as siglas dos estados que possuem mais de duas cidades armazenadas na tabela Cidades
-- 2.6. Liste o nome dos Estados e o número da cidades para os estados que possuem mais de três cidades armazenadas na tabela Cidades. (cont..) 
-- (cont.) Defina a coluna do número de cidades com "Número de Cidades no Banco".
-- 2.7. Mostre o nome do estado e sua sigla para o(s) estado(s) que possui(em) cidades cujo nome começa com "Belo"
-- 2.8. Caso ainda não tenha a cidade "Belo Monte" do estado de Alagoas, insira-a. Após a inserção, repita a consulta anterior. Espera-se agora que apareçam pelo menos duas cidades na consulta.
-- 2.9. Repita a consulta anterior, agora mostrando a Cidade também.


-- 1. Crie um banco de dados chamando Cidade_Estado, com duas tabelas: Cidades e Estados.
CREATE DATABASE Cidade_Estado;
USE Cidade_Estado;

CREATE TABLE Estados (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sigla CHAR(2),
    Estado VARCHAR(20)
);

-- Criação da Tabela Cidades
CREATE TABLE Cidades (
    C_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    UF CHAR(2),
    Cidade VARCHAR(40)
);

-- Inserção de dados na tabela Estados
INSERT INTO Estados (sigla, Estado) VALUES
('AC', 'Acre'),
('AL', 'Alagoas'),
('AM', 'Amazonas'),
('AP', 'Amapá'),
('BA', 'Bahia'),
('CE', 'Ceará'),
('DF', 'Distrito Federal'),
('ES', 'Espírito Santo'),
('GO', 'Goiás'),
('MA', 'Maranhão'),
('MG', 'Minas Gerais'),
('MS', 'Mato Grosso do Sul'),
('MT', 'Mato Grosso'),
('PA', 'Pará'),
('PB', 'Paraíba'),
('PE', 'Pernambuco'),
('PI', 'Piauí'),
('PR', 'Paraná'),
('RJ', 'Rio de Janeiro'),
('RN', 'Rio Grande do Norte'),
('RO', 'Rondônia'),
('RR', 'Roraima'),
('RS', 'Rio Grande do Sul'),
('SC', 'Santa Catarina'),
('SE', 'Sergipe'),
('SP', 'São Paulo'),
('TO', 'Tocantins');

-- Inserção de dados na tabela Cidades
INSERT INTO Cidades (UF, Cidade) VALUES
('AC', 'Rio Branco'),
('AC', 'Cruzeiro do Sul'),
('AL', 'Maceió'),
('AL', 'Arapiraca'),
('AM', 'Manaus'),
('AM', 'Parintins'),
('AP', 'Macapá'),
('AP', 'Santana'),
('BA', 'Salvador'),
('BA', 'Feira de Santana'),
('CE', 'Fortaleza'),
('CE', 'Caucaia'),
('DF', 'Brasília'),
('DF', 'Taguatinga'),
('ES', 'Vitória'),
('ES', 'Vila Velha'),
('GO', 'Goiânia'),
('GO', 'Aparecida de Goiânia'),
('MA', 'São Luís'),
('MA', 'Imperatriz'),
('MG', 'Belo Horizonte'),
('MG', 'Contagem'),
('MS', 'Campo Grande'),
('MS', 'Dourados'),
('MT', 'Cuiabá'),
('MT', 'Várzea Grande'),
('PA', 'Belém'),
('PA', 'Ananindeua'),
('PB', 'João Pessoa'),
('PB', 'Campina Grande'),
('PE', 'Recife'),
('PE', 'Olinda'),
('PI', 'Teresina'),
('PI', 'Parnaíba'),
('PR', 'Curitiba'),
('PR', 'Londrina'),
('RJ', 'Rio de Janeiro'),
('RJ', 'Niterói'),
('RN', 'Natal'),
('RN', 'Mossoró'),
('RO', 'Porto Velho'),
('RO', 'Ji-Paraná'),
('RR', 'Boa Vista'),
('RR', 'Caracaraí'),
('RS', 'Porto Alegre'),
('RS', 'Caxias do Sul'),
('SC', 'Florianópolis'),
('SC', 'Joinville'),
('SE', 'Aracaju'),
('SE', 'Nossa Senhora do Socorro'),
('SP', 'São Paulo'),
('SP', 'Campinas'),
('TO', 'Palmas'),
('TO', 'Araguaína');

-- CONSULTAS INICIAIS DO EXERCÍCIO 1

-- 2.1. Liste as cidades (nomes das cidades) e os estados (nomes dos estados) armazenados no banco
SELECT
	Cidades.Cidade, 
	Estados.Estado 
FROM 
	Cidades 
JOIN 
	Estados ON Cidades.UF = Estados.sigla;

-- 2.2. Liste as cidades, os estados e suas siglas armazenados no banco
SELECT
	Cidades.Cidade,
	Estados.Estado,
	Estados.sigla
FROM
	Cidades
JOIN
	Estados ON Cidades.UF = Estados.sigla;

-- 2.3. Liste as cidades e os estados armazenados no banco cujas siglas começam com "A"
SELECT
	Cidades.Cidade,
    Estados.Estado
FROM
    Cidades
JOIN
    Estados ON Cidades.UF = Estados.sigla
WHERE
    Estados.sigla LIKE 'A%';

-- 2.4. Liste as cidades e os estados armazenados no banco cujas siglas começam com "A" e com "M"
SELECT
    Cidades.Cidade,
    Estados.Estado
FROM
    Cidades
JOIN
    Estados ON Cidades.UF = Estados.sigla
WHERE
    Estados.sigla LIKE 'A%' OR Estados.sigla LIKE 'M%';

-- 2.5. Liste as siglas dos estados que possuem mais de duas cidades armazenadas na tabela Cidades
SELECT
    Estados.sigla,
    COUNT(Cidades.C_id) AS TotalCidades
FROM
    Estados
JOIN
    Cidades ON Cidades.UF = Estados.sigla
GROUP BY
    Estados.sigla
HAVING
    COUNT(Cidades.C_id) > 2;
    
-- 2.6. Liste o nome dos Estados e o número da cidades para os estados que possuem mais de três cidades armazenadas na tabela Cidades. 
-- Defina a coluna do número de cidades com "Número de Cidades no Banco". Veja um exemplo de resultado dessa consulta.
SELECT
	Estados.Estado,
	COUNT(Cidades.Cidade) AS TotalCidades
FROM
	Estados
JOIN
	Cidades ON Cidades.UF = Estados.sigla
GROUP BY
	Estados.Estado
HAVING
	COUNT(Cidades.Cidade) > 3;
    
-- 2.7. Mostre o nome do estado e sua sigla para o(s) estado(s) que possui(em) cidades cujo nome começa com "Belo"
SELECT
	Estados.Estado,
	Estados.sigla
FROM
	Estados
JOIN
	Cidades ON Cidades.UF = Estados.sigla
WHERE Cidades.Cidade LIKE 'Belo%';

-- 2.8. Caso ainda não tenha a cidade "Belo Monte" do estado de Alagoas, insira-a. Após a inserção, repita a consulta anterior. Espera-se agora que apareçam pelo menos duas cidades na consulta.
INSERT INTO Cidades (UF, Cidade)
VALUES ('AL', 'Belo Monte');

-- 2.9. Repita a consulta anterior, agora mostrando a Cidade também.
SELECT
    Cidades.Cidade,
    Estados.Estado,
    Estados.sigla
FROM
    Estados
JOIN
    Cidades ON Cidades.UF = Estados.sigla
WHERE
    Cidades.Cidade LIKE 'Belo%';

--
-- Exercício 2

-- 1. Ainda usando o banco Cidade_Estado acrescente um nova tabela para informar as regiões de cada estado.
CREATE TABLE Regioes (
    R_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    UF VARCHAR(2) NOT NULL,
    Regiao VARCHAR(30) NOT NULL
);

-- 2. Acrescente a informação para alguns (apenas alguns) estados.
INSERT INTO Regioes (UF, Regiao) VALUES
('AC', 'Norte'),
('AM', 'Norte'),
('BA', 'Nordeste'),
('AL', 'Nordeste'),
('MG', 'Sudeste'),
('SP', 'Sudeste'),
('RG', 'Sul'), -- Este valor esta errado propositalmente, pois haverá atividade posterior com ênfase nele!
('MT', 'Centro-Oeste');

-- 3. Liste as cidades, com seus estados e regiões para todos os estados que tenham informação de sua região na tabela "Regiões".
SELECT
	Cidades.Cidade,
    Estados.Estado,
    Regioes.Regiao
FROM
    Cidades
JOIN
    Estados ON Cidades.UF = Estados.sigla
JOIN
    Regioes ON Cidades.UF = Regioes.UF;
    
-- 4. Liste todas as regiões armazenadas na tabela Regiões e as Cidades (com seus respectivos) estados que possuem informação de região.
SELECT
    Regioes.Regiao,
    Estados.Estado,
    Cidades.Cidade
FROM
    Regioes
LEFT JOIN
    Estados ON Regioes.UF = Estados.sigla
LEFT JOIN
    Cidades ON Regioes.UF = Cidades.UF;


-- ATENÇÃO! REGIÃO SUL ESTÁ COM A SIGLA 'RG', CONSERTAR PARA 'RS'
UPDATE Regiões SET UF = 'RS' WHERE UF='RG';

-- 5. Para verificarmos a consulta novamente, considere que temos duas siglas erradas. Para isso, altere a tabela como dado abaixo:
UPDATE Regioes SET UF = 'RG' WHERE UF='RS';
UPDATE Regioes SET UF = 'MM' WHERE UF='MG';

-- 6. Liste todas as cidades, mostrando o nome da cidade, seu estado e sua região. Aquelas cidades que não possuem região informada, a consulta deve mostrar NULL. 
-- Ordene ascendente pelo UF da cidade

SELECT
    Cidades.Cidade,
    Estados.Estado,
    Regioes.Regiao
FROM
    Cidades
JOIN
    Estados ON Cidades.UF = Estados.sigla
LEFT JOIN
    Regioes ON Cidades.UF = Regioes.UF
ORDER BY
    Cidades.UF ASC;

-- FIM















































-- Referência da lista de Exercícios - http://galileu.coltec.ufmg.br/fantini/hp/CursoBD/Curso/Estudo_Orientado_02_ListaExercicios_02.html