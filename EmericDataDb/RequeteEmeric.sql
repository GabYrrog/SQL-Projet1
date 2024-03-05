-- 1. Donnez la liste de tours les joueurs en présentant : alias, courriel, date d'inscription
-- Emeric requete
SELECT id_alias AS alias,
courriel AS courriel,
date_inscription AS "date d'inscription" FROM Joueur;

-- 4. Pour l'avatar principal, donnez la valeur totale de tous les items qu'ils possède 
-- (les habiletés considérant le niveau et les items considérant la quantité)
-- Emeric Requete
SELECT SUM(SUM) as "Valeur totale de l'avatar principal"
    FROM (   
		SELECT SUM(quantite)
	    FROM item_avatar
	    WHERE avatar ='Virlak*'

        GROUP BY

        SELECT
	        SUM((Habilete.coef1 * Avatar_habilete.niveau_actuel) + 
	        (Habilete.coef2 * Avatar_habilete.niveau_actuel) +
	    	(Habilete.coef3))
	
        FROM
	        Avatar_habilete
        JOIN
	        Habilete ON Avatar_habilete.Id_habilete = Habilete.Id_habilete
	
        WHERE
	        id_nom = 'Virlak*'
)   AS "Valeur Total";

/*Chaque membre de l’équipe doit réaliser une requête pertinente de son cru. Considérant toutes
les requêtes produites par l’équipe, vous devez respecter ces contraintes :
a. il doit avoir au minimum 3, 4 et 5 tables dans l’une de vos requêtes,
b. vous devez utiliser ces clauses: LIMIT, GROUP BY, ORDER BY, HAVING.
À même le script et avant ces requêtes, vous devez ajouter un commentaire expliquant
précisément ce que fait la requête. Le pointage associé à chacune de ces requêtes est autant basé
sur la pertinence que la qualité de la réalisation technique.*/

--  
-- Comprend les tables: joueur, avatar, capsule
 -- Emeric (sans aide)
 -- Fonctionnelle: Oui


WITH TimePerAvatar AS (
    SELECT 
        Capsule.avatar,
        Avatar.alias_joueur,
        SUM(Capsule.duree) AS total_time,
        Joueur.date_naissance,
        RANK() OVER (PARTITION BY Avatar.alias_joueur ORDER BY SUM(Capsule.duree) DESC) AS AvatarPlayedRank
    FROM 
        Capsule
    JOIN
        Avatar ON Capsule.avatar = Avatar.Id_nom
    JOIN
        Joueur ON Joueur.id_alias = Avatar.alias_joueur
    GROUP BY
        Capsule.avatar, Avatar.alias_joueur, Joueur.date_naissance
	HAVING now() - Joueur.date_naissance > INTERVAL '18 years' AND now() - Joueur.date_naissance < INTERVAL '30 years'
	ORDER BY total_time DESC
)
SELECT 
    avatar,
    alias_joueur,
    total_time,
    date_naissance
FROM 
    TimePerAvatar
WHERE 
    AvatarPlayedRank = 1
Limit 10;

