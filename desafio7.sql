SELECT
	ar.name_artist AS artista,
  al.title_album AS album,
  COUNT(fl.id_artist) AS seguidores
FROM SpotifyClone.artists AS ar
INNER JOIN SpotifyClone.albums AS al
	ON ar.id_artist = al.id_artist
INNER JOIN SpotifyClone.following AS fl
	ON ar.id_artist = fl.id_artist
GROUP BY
	ar.name_artist, al.title_album
ORDER BY
	COUNT(fl.id_artist) DESC, ar.name_artist ASC, al.title_album ASC;