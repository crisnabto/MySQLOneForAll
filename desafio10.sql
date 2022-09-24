SELECT
	so.title_song AS nome,
  COUNT(hi.id_song) AS reproducoes
  FROM SpotifyClone.history AS hi
INNER JOIN SpotifyClone.songs AS so
	ON so.id_song = hi.id_song
INNER JOIN SpotifyClone.users AS us
	ON hi.id_user = us.id_user
INNER JOIN SpotifyClone.plans AS pl
	ON pl.id_plan = us.id_plan
WHERE pl.id_plan = 4 OR pl.id_plan = 1
GROUP BY
	so.title_song
ORDER BY
	so.title_song ASC;