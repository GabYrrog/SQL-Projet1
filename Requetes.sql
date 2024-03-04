-- Requête 3
/*Pour l’avatar principal, donnez toutes les habiletés qu’il possède en présentant : le sigle et le nom
entre crochets dans la même colonne, la date d’obtention, le niveau courant, la valeur en moX
du niveau courant et le coût en moX pour acheter le prochain niveau*/
-- Auteur: Vincent
-- Fonctionnelle: Oui

INSERT INTO Avatar_habilete (id_nom, id_habilete, date_obtention, niveau_actuel)
VALUES ('Virlak*','4', '2024-02-26 8:10:00', 1),
		('Virlak*','5', '2024-02-28 12:40:00', 2),
		('Virlak*','4', '2024-02-29 20:30:00', 3);

SELECT '[ ' || hab.sigle || ' , ' || hab.nom || ' ]' AS "Habilete", 
        avhab.date_obtention, 
        avhab.niveau_actuel,
        hab.coef1 * ((avhab.niveau_actuel ^ 2) + hab.coef2) * (avhab.niveau_actuel + hab.coef3)  AS "Cout niveau courant",
        hab.coef1 * (((avhab.niveau_actuel + 1) ^ 2) + hab.coef2) * ((avhab.niveau_actuel + 1) + hab.coef3) AS "Cout niveau suivant"
        FROM Avatar_habilete as avhab
            INNER JOIN Habilete as hab
                ON avhab.id_habilete = hab.id_habilete
            WHERE avhab.id_nom = 'Virlak*';



-- Requête 7
/*Chaque membre de l’équipe doit réaliser une requête pertinente de son cru. Considérant toutes
les requêtes produites par l’équipe, vous devez respecter ces contraintes :
    a. il doit avoir au minimum 3, 4 et 5 tables dans l’une de vos requêtes,
    b. vous devez utiliser ces clauses: LIMIT, GROUP BY, ORDER BY, HAVING.
À même le script et avant ces requêtes, vous devez ajouter un commentaire expliquant
précisément ce que fait la requête. Le pointage associé à chacune de ces requêtes est autant basé
sur la pertinence que la qualité de la réalisation technique.*/
-- Auteur: Vincent
-- Fonctionnelle: Oui

-- Compte pour chaque avatar le nombre d'habiletées unique de chaque monde et garde ceux ayant un minimum de 2 habiletées par monde puis affiche les trois avatars ayant le plus d'habiletées dans un monde
SELECT av.id_nom AS "Avatar",
        monde.nom AS "Monde",
        COUNT(avhab.id_habilete) AS "Nombre d'habiletées"
        FROM Avatar av
            JOIN Avatar_habilete avhab ON av.id_nom = avhab.id_nom
            JOIN Habilete hab ON avhab.id_habilete = hab.id_habilete
            JOIN Paire_habilete_et_monde habmonde ON hab.id_habilete = habmonde.habilete
            JOIN Monde monde ON habmonde.monde = monde.nom
            GROUP BY av.id_nom, monde.nom
            HAVING COUNT(avhab.niveau_actuel) > 2
            ORDER BY av.id_nom, monde.nom
            LIMIT 3;

-- Ajouter pour meilleur représentation
INSERT INTO Paire_habilete_et_monde (monde, habilete)
VALUES ('FreeZoneX',1),
		('FreeZoneX',2),
		('SpaceX',3);
INSERT INTO Avatar_habilete (id_nom, id_habilete, date_obtention, niveau_actuel)
VALUES ('Sephiroth','1', '2024-02-26 10:10:00', 10),
		('Sephiroth','2', '2024-02-26 10:01:00', 4),
		('Sephiroth','4', '2024-02-26 10:09:00', 3),
		('Sephiroth','5', '2024-02-26 10:09:00', 6);

-- Requête 8
/*[Boni] On désire modifier la structure de prix pour deux des habiletes de façon à avoir les montants
indiqués plus bas selon le niveau associé :
    References pdf page 6
Pour chaque structure de prix, faites une requête permettant de modifier la structure de prix des
habiletes 1 et 2 que vous avez créée initialement.*/
-- Auteur: Vincent
-- Fonctionnelle:

-- Structure de prix 1
UPDATE Habilete
SET coef1 = -2, coef2 = 44.5, coef3 = 0
WHERE id_habilete = 1;

-- Structure de prix 2
UPDATE Habilete
SET coef1 = -0.15, coef2 = 31.5, coef3 = -1.35
WHERE id_habilete = 2;
