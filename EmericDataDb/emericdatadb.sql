-- NOTE voir Table Avatar alias_joueur et Table Joueur id_nom n'ont pas le même nombre dans le varchar

-- Emeric insert joueur Emeric
INSERT INTO Joueur
        VALUES  ('Emeric','emeric_rivard@hotmail.com','JeffreyBezosTM','h', DEFAULT, '1997-01-28');

-- Emeric insert 1 avatar changer le color value
INSERT INTO Avatar
        VALUES  ('Jeff',10,DEFAULT, DEFAULT, 'Emeric');

-- Emeric insert table monde de FreeZoneXTM
INSERT INTO Monde 
        VALUES  ('FreeZoneXTM', 'JFZXTM', 'This is the world mister bezos wants to make');

-- Emeric insert 3 capsules d'activité
INSERT INTO Activite (debut, fin, duree, nom_joueur)
        VALUES  (
            now(),
            now() + INTERVAL '55 minutes',
            555,
            'Emeric');

INSERT INTO Capsule(duree,monde,avatar,activite)
        VALUES  (300, 'FreeZoneXTM', 'Jeff', 
        SELECT id_activite, duree
        FROM Activite
        WHERE id_activite = 1);