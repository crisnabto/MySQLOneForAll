SELECT
	COUNT(hi.id_song) AS quantidade_musicas_no_historico
  FROM SpotifyClone.history AS hi
INNER JOIN SpotifyClone.users AS us
	ON hi.id_user = us.id_user
WHERE us.name_user = 'Barbara Liskov'