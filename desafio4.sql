SELECT
	us.name_user AS usuario,
  IF (MAX(year(hi.played_in)) >= 2021, 'Usuário ativo', 'Usuário inativo')
  AS status_usuario
FROM SpotifyClone.users AS us
INNER JOIN SpotifyClone.history AS hi
	ON hi.id_user = us.id_user
GROUP BY
	us.name_user
ORDER BY
	us.name_user ASC;