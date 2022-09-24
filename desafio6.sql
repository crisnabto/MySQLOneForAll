SELECT
	MIN(pl.price_plan) AS faturamento_minimo,
    MAX(pl.price_plan) AS faturamento_maximo,
    ROUND(AVG(pl.price_plan), 2) AS faturamento_medio,
    SUM(pl.price_plan) AS faturamento_total
FROM SpotifyClone.plans AS pl
INNER JOIN SpotifyClone.users AS us
	ON pl.id_plan = us.id_plan;