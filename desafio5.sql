SELECT
	so.title_song AS cancao,
	COUNT(hi.id_song) AS reproducoes
FROM SpotifyClone.songs AS so
INNER JOIN SpotifyClone.history AS hi
	ON so.id_song = hi.id_song
GROUP BY
	hi.id_song
ORDER BY
	COUNT(hi.id_song) DESC, so.title_song ASC
LIMIT 2;