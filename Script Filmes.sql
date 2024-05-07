-- Objetivo
-- Você deverá criar diversas consultas, 
-- com o objetivo de retornar os dados a seguir. Abaixo de cada pedido tem o retorno esperado. 
-- O seu retorno deve ser igual ao da imagem.


--1 Buscar o nome e ano dos filmes
SELECT 
	Nome,
	Ano
FROM Filmes

--2 Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT 
	Nome,
	Ano
FROM Filmes ORDER BY Ano

--3 Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT 
	Nome,
	Ano, 
	Duracao
FROM Filmes WHERE ID like '%28'

--4 Buscar os filmes lançados em 1997
SELECT 
	Nome,
	Ano, 
	Duracao
FROM Filmes WHERE Ano like '1997'

--5 Buscar os filmes lançados APÓS o ano 2000
SELECT 
	Nome,
	Ano, 
	Duracao
FROM Filmes WHERE Ano > 2000

--6 Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT 
	Nome,
	Ano, 
	Duracao
FROM Filmes
WHERE Duracao BETWEEN 100 AND 150
ORDER BY Duracao

--7 Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela quantidade em ordem decrescente
SELECT
	Ano, COUNT(*)
	AS Quantidade
FROM Filmes
GROUP BY Ano
ORDER BY Quantidade DESC

--8 Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT
	*
FROM Atores
WHERE Genero like 'M'

--9 Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT
	*
FROM Atores
WHERE Genero like 'F'
ORDER BY PrimeiroNome ASC

--10 Buscar o nome do filme e o gênero
SELECT
	Filmes.Nome,
	Generos.Genero
FROM ((Filmes
INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.Id)
INNER JOIN Generos ON Filmes.Id = Generos.Id);


--11 Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT
	Filmes.Nome,
	Generos.Genero
FROM Filmes
INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdGenero
INNER JOIN Generos ON Filmes.Id = Generos.Id
WHERE Generos.Genero = 'Mistério' OR Generos.Genero IS NULL

--12 Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT
	Filmes.Nome,
	Atores.PrimeiroNome,
	Atores.UltimoNome,
	ElencoFilme.Papel
FROM Filmes
INNER JOIN Atores ON Filmes.Id = Atores.Id
INNER JOIN ElencoFilme ON Filmes.Id = ElencoFilme.IdAtor

