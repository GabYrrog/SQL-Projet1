-- Requête pour obtenir la liste des avatars d'un joueur avec des détails
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


-- Cette requête récupère les avatars des joueurs avec le nombre total d'items qu'ils possèdent, les groupant par joueur, ordonnés par le nombre total d'items possédés de manière décroissante, limités aux 5 premiers joueurs.
SELECT 
    A.id_nom AS nom_avatar,
    COUNT(IA.item) AS total_items,
    J.id_alias AS joueur,
    AVG(A.mox) AS moyenne_mox
FROM 
    Avatar AS A
JOIN 
    Item_avatar AS IA ON A.id_nom = IA.avatar
JOIN 
    Joueur AS J ON A.alias_joueur = J.id_alias
GROUP BY 
    A.id_nom, J.id_alias
ORDER BY 
    total_items DESC
LIMIT 
    5;

