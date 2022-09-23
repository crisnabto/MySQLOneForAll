SELECT
	us.name_user AS usuario,
    COUNT(hi.id_song) AS qt_de_musicas_ouvidas,
    ROUND(sum(so.length_song / 60), 2) AS total_minutos
FROM SpotifyClone.users AS us
LEFT JOIN SpotifyClone.history AS hi
	ON us.id_user = hi.id_user
LEFT JOIN SpotifyClone.songs AS so
	ON hi.id_song = so.id_song
GROUP BY
	us.name_user
ORDER BY
	us.name_user ASC;