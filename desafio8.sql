SELECT
	ar.name_artist AS artista,
    al.title_album AS album
FROM SpotifyClone.artists AS ar
INNER JOIN SpotifyClone.albums AS al
	ON ar.id_artist = al.id_artist
WHERE ar.name_artist = 'Elis Regina';