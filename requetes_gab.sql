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




