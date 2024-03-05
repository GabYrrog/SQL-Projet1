-- Requête 2 : Requête pour obtenir la liste des avatars d'un joueur avec des détails
-- Baris
SELECT 
    A.id_nom AS nom,
    (A.couleur / 65536) AS rouge, 
    ((A.couleur % 65536) / 256) AS vert, 
    (A.couleur % 256) AS bleu, 
    TO_CHAR(A.date_creation, 'YYYY | MM | DD') AS date_creation_formattee,
    A.mox
FROM 
    Avatar AS A
JOIN 
    Joueur AS J ON A.alias_joueur = J.id_alias
WHERE 
    J.id_alias = 'Baris';

-- 3
/*Pour l’avatar principal, donnez toutes les habiletés qu’il possède en présentant : le sigle et le nom
entre crochets dans la même colonne, la date d’obtention, le niveau courant, la valeur en moX
du niveau courant et le coût en moX pour acheter le prochain niveau*/

INSERT INTO Avatar_habilete (id_nom, id_habilete, date_obtention, niveau_actuel)
VALUES ('Virlak*','1', '2024-02-26 8:10:00', 1),
		('Virlak*','2', '2024-02-28 12:40:00', 2),
		('Virlak*','3', '2024-02-29 20:30:00', 3);

SELECT '[ ' || hab.sigle || ' , ' || hab.nom || ' ]' AS "Habilete", 
        avhab.date_obtention, 
        avhab.niveau_actuel,
        hab.coef1 * ((avhab.niveau_actuel ^ 2) + hab.coef2) * (avhab.niveau_actuel + hab.coef3)  AS "Cout niveau courant",
        hab.coef1 * (((avhab.niveau_actuel + 1) ^ 2) + hab.coef2) * ((avhab.niveau_actuel + 1) + hab.coef3) AS "Cout niveau suivant"
        FROM Avatar_habilete as avhab
            INNER JOIN Habilete as hab
                ON avhab.id_habilete = hab.id_habilete
            WHERE avhab.id_nom = 'Virlak*';

-- Gabriel
-- 5. Pour le joueur principal, donnez le nombre total d’heures passées dans chaque jeu joué. 
-- Gabriel (sans aide)
-- fonctionnelle: oui

SELECT capsule.monde AS "Monde",
       SUM(capsule.duree) AS "Total Duree"
FROM avatar
JOIN capsule ON avatar.id_nom = capsule.avatar
WHERE avatar.alias_joueur LIKE 'Viken%'
GROUP BY capsule.monde

-- 6. Donnez la liste de tous les avatars qui possèdent plus de 1 item : nom du joueur, nom de l’avatar 
-- et nombre d’items.
-- Gabriel (sans aide)
 -- Fonctionnelle: Oui

SELECT joueur.id_alias AS "Nom du Joueur", -- table 3
         avatar.id_nom AS "Nom Avatar", -- table 2
        COUNT(item_avatar.item) AS "Quantite" -- table 1
FROM item_avatar
INNER JOIN avatar ON item_avatar.avatar = avatar.id_nom 
INNER JOIN joueur ON avatar.alias_joueur = joueur.id_alias
GROUP BY joueur.id_alias, avatar.id_nom
HAVING COUNT(item_avatar.item) > 1
    
-- 7. L'on souhaite récompenser les 3 premiers joueurs inscrits qui ont passé au moins 500 minutes de jeu avec
-- 1 avatar, afin de trouver les items de cet avatar et pouvoir leur offrir un buff temporaire (genre de event récompense) 
-- Comprend les tables: joueur, avatar, capsule, item_avatar
 -- GABRIEL (sans aide)
 -- Fonctionnelle: Oui
SELECT 
    j.id_alias as "Joueur",
    j.date_inscription as "Date",
    a.id_nom as "Avatar",
    i.item as "ItemID"
FROM 
    joueur j
JOIN 
    avatar a ON a.alias_joueur = j.id_alias -- Associe le joueur à son avatar
JOIN 
    (SELECT 
         c.avatar -- Dans la capsule activité, regrouper les avatars qui ont une durée cumulée de plus de 500
     FROM 
         capsule c
     GROUP BY 
         c.avatar
     HAVING 
         SUM(c.duree) > 500) as filtered_avatars ON filtered_avatars.avatar = a.id_nom -- La suite du Join plus haut: 
         -- prend les avatars filtrés dans la table capcule
         -- et les relie aux noms d'avatar de la table avatar
JOIN 
    item_avatar i ON a.id_nom = i.avatar -- Assicue l'item ID à l'avatar
ORDER BY 
    j.date_inscription ASC
LIMIT 3;



-- Baris
-- Requête 7 : Cette requête sélectionne les avatars avec leur nombre total d'items, en les regroupant par avatar, en ordonnant par ordre décroissant du nombre total d'items, en limitant les résultats aux 3 premiers avatars ayant le plus grand nombre d'items, et en excluant les avatars ayant moins de 3 items.
SELECT Avatar.id_nom, COUNT(Item_avatar.item) AS total_items
FROM Avatar
JOIN Joueur ON Avatar.alias_joueur = Joueur.id_alias
JOIN Item_avatar ON Avatar.id_nom = Item_avatar.avatar
JOIN Capsule ON Capsule.avatar = Avatar.id_nom
JOIN Monde ON Capsule.monde = Monde.nom
GROUP BY Avatar.id_nom
HAVING COUNT(Item_avatar.item) >= 3
ORDER BY total_items DESC
LIMIT 3;


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

