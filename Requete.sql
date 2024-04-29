SELECT SUM(number_vendu * prix) AS Chiffre_d_affaires
FROM reservation
inner join show_ on reservation.ID_show = show_.ID_show
WHERE YEAR(Date_show) = '2024-05-05 10:00:00';


SELECT title_evenement, SUM(number_vendu * prix) AS Chiffre_d_affaires
FROM reservation
inner join show_ on reservation.ID_show = show_.ID_show
INNER JOIN evenement ON show_.ID_evenement = evenement.ID_evenement
GROUP BY title_evenement;


SELECT *
FROM show_
INNER JOIN evenement ON show_.ID_evenement = evenement.ID_evenement
WHERE  evenement.title_evenement = 'Match de football';


SELECT SUM(number_vendu) AS Nombre_de_personnes_presentes
FROM reservation
INNER JOIN show_ ON reservation.ID_show = show_.ID_show
WHERE show_.ID_evenement = '2';


SELECT *
FROM evenement
WHERE ID_categorie = '2';