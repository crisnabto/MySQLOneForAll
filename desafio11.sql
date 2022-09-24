SELECT
	so.title_song AS nome_musica,
  CASE
		  WHEN so.title_song LIKE '%Bard%' THEN REPLACE("The Bard’s Song", 'Bard', 'QA')
      WHEN so.title_song LIKE '%Amar%' THEN REPLACE('O Medo de Amar é o Medo de Ser Livre', 'Amar', 'Code Review')
      WHEN so.title_song LIKE '%Pais%' THEN REPLACE('Como Nossos Pais', 'Pais', 'Pull Requests')
      WHEN so.title_song LIKE '%SOUL%' THEN REPLACE('BREAK MY SOUL', 'SOUL', 'CODE')
      WHEN so.title_song LIKE '%SUPERSTAR%' THEN REPLACE('ALIEN SUPERSTAR', 'SUPERSTAR', 'SUPERDEV')
      END AS novo_nome
FROM SpotifyClone.songs AS so
WHERE so.title_song 
IN (
'O Medo de Amar é o Medo de Ser Livre', 
"The Bard’s Song", 
'Como Nossos Pais', 
'BREAK MY SOUL', 
'ALIEN SUPERSTAR')
ORDER BY
  nome_musica DESC;