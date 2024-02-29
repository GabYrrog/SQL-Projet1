-- 3
/*Pour l’avatar principal, donnez toutes les habiletés qu’il possède en présentant : le sigle et le nom
entre crochets dans la même colonne, la date d’obtention, le niveau courant, la valeur en moX
du niveau courant et le coût en moX pour acheter le prochain niveau*/

INSERT 

SELECT '[ ' || hab.sigle || hab.nom || ' ]' AS "Habilete", 
        avhab.date_obtention, 
        avhab.niveau_actuel,
        hab.coef1 * ((avhab.niveau_actuel ^ 2) + hab.coef2) * (avhab.niveau_actuel + hab.coef3)  AS "Cout niveau courant",
        hab.coef1 * (((avhab.niveau_actuel + 1) ^ 2) + hab.coef2) * ((avhab.niveau_actuel + 1) + hab.coef3) AS "Cout niveau suivant"
        FROM Avatar_habilete as avhab
            INNER JOIN Habilete as hab
                ON avhab.id_habilete = hab.id_habilete
            WHERE avhab.id_nom = "Virlak*";



-- 7
/*Chaque membre de l’équipe doit réaliser une requête pertinente de son cru. Considérant toutes
les requêtes produites par l’équipe, vous devez respecter ces contraintes :
    a. il doit avoir au minimum 3, 4 et 5 tables dans l’une de vos requêtes,
    b. vous devez utiliser ces clauses: LIMIT, GROUP BY, ORDER BY, HAVING.
À même le script et avant ces requêtes, vous devez ajouter un commentaire expliquant
précisément ce que fait la requête. Le pointage associé à chacune de ces requêtes est autant basé
sur la pertinence que la qualité de la réalisation technique.*/


-- 8
/*[Boni] On désire modifier la structure de prix pour deux des items de façon à avoir les montants
indiqués plus bas selon le niveau associé :
    References pdf page 6
Pour chaque structure de prix, faites une requête permettant de modifier la structure de prix des
items 1 et 2 que vous avez créée initialement.*/

