-- Requête 2 : Requête pour obtenir la liste des avatars d'un joueur avec des détails
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


