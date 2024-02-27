
-- Gabriel
-- Insert Joueur
INSERT INTO Joueur (id_alias, courriel, mot_de_passe, genre, date_inscription, date_naissance)
VALUES ('GabYrrog', 'sk8er_gaby007@hotmail.com', '123meilleurpassword', 'h', '2023-02-23 00:00:00', '1990-06-14 00:00:00');
-- Insert Avatar
INSERT INTO Avatar (id_nom, couleur, date_creation, mox, alias_joueur)
VALUES ('Chuck', '3840', '2023-02-23 00:00:00', 48, 'GabYrrog');


-- Insert Monde Gabriel
INSERT INTO Monde (nom, sigle, descriptions)
VALUES ('SpaceX', 'Elo', 'Un monde ressemblant etrangement a mars');


-- Emeric insert table monde de FreeZoneXTM
INSERT INTO Monde 
        VALUES  ('FreeZoneX', 'FZX', 'This is the world mister bezos wants to make');

-- BARIS Insérer les jeux et leurs habiletés
INSERT INTO Monde (nom, sigle, descriptions)
VALUES ('DeepHorizonX', 'DHX', 'Jeu de science-fiction futuriste');



-- 3 habiletes

INSERT INTO Habilete (nom, sigle, energie_max, coef1, coef2, coef3, descriptions)
VALUES ('Relentir le temps', 'RT', 100.000, 1.5, 0.75, 0.25, 'Tout passe moins vite...');

INSERT INTO Habilete (nom, sigle, energie_max, coef1, coef2, coef3, descriptions)
VALUES ('Bouclier de proximite', 'BP', 80.500, 2.0, 1.0, 0.5, 'Augmente la defense quand on est proche dun ennemi');

INSERT INTO Habilete (nom, sigle, energie_max, coef1, coef2, coef3, descriptions)
VALUES ('Backstab', 'BST', 60.250, 0.5, 1.5, 2.0, 'Tu las pas vu venir');

-- 3 activites
INSERT INTO Activite (debut, fin, duree, nom_joueur)
VALUES ('2024-02-23 14:00:00', '2024-02-23 15:00:00', 60, 'GabYrrog');

INSERT INTO Activite (debut, fin, duree, nom_joueur)
VALUES ('2024-02-24 10:00:00', '2024-02-24 10:30:00', 30, 'GabYrrog');

INSERT INTO Activite (debut, fin, duree, nom_joueur)
VALUES ('2024-02-26 10:00:00', '2024-02-26 10:30:00', 30, 'GabYrrog');


-- 3 capsules   REVISER LES INT ACTIVITE pour que ca fitte avec les bons serials
INSERT INTO Capsule (duree, monde, avatar, activite)
VALUES (30, 'SpaceX', 'Chuck', 3);

INSERT INTO Capsule (duree, monde, avatar, activite)
VALUES (45, 'DeepHorizonX', 'Chuck', 2);

INSERT INTO Capsule (duree, monde, avatar, activite)
VALUES (60, 'FreeZoneX', 'Chuck', 1);


-- 3 avatar_habiletes
INSERT INTO Avatar_habilete (id_nom, id_habilete, date_obtention, niveau_actuel)
VALUES ('Chuck','1', '2024-02-26 10:10:00', 2);
INSERT INTO Avatar_habilete (id_nom, id_habilete, date_obtention, niveau_actuel)
VALUES ('Chuck','2', '2024-02-26 10:01:00', 4);
INSERT INTO Avatar_habilete (id_nom, id_habilete, date_obtention, niveau_actuel)
VALUES ('Chuck','3', '2024-02-26 10:09:00', 2);
-- VALIDER si les serial fittent avec mes habiletes

-- Vincent

-- Insert Joueur
INSERT INTO Joueur (id_alias, courriel, mot_de_passe, genre, date_inscription, date_naissance)
VALUES ('Viken*','vynxwarrior@hotmail.com', 'BonjourPascal666', 'h','2023-02-25 06:06:06','1995-05-24 02:40:58');

--Insert Avatar
INSERT INTO Avatar (id_nom, couleur,date_creation, mox, alias_joueur)
VALUES ('Virlak*','1666', '2023-02-25 06:06:06',200, 'Viken*'),
        ('Palstice','4242','2023-02-26 00:00:00',400, 'Viken*'),
        ('Sephiroth', '8888', '2023-02-28 00:00:00',1000, 'Viken*');

-- Insert 4 activites
INSERT INTO Activite (debut,fin,duree,nom_joueur)
VALUES('2023-02-28 01:00:00','2023-02-28 02:00:00',60,'Viken*'), -- activite 4
        ('2023-03-02 05:00:00', '2023-03-02 15:00:00',600,'Viken*'),  -- activite 5
        ('2023-03-05 18:00:00','2023-03-05 22:00:00',240,'Viken*'),  -- activite 6
        ('2023-03-10 22:00:00','2023-03-11 02:00:00',240,'Viken*');  -- activite 7

-- Insert 10 capsule
INSERT INTO Capsule (duree, monde, avatar, activite)
VALUES (30,'DeepHorizonX','Virlak*', 4),
        (30,'SpaceX','Palstice',4),
        (120,'SpaceX','Virlak*',5),
        (120,'FreeZoneX','Virlak*',5),
        (120,'DeepHorizonX','Virlak*',5),
        (240,'DeepHorizonX','Sephiroth',5),
        (60,'SpaceX','Virlak*',6),
        (60,'FreeZoneX','Virlak*',6),
        (120,'DeepHorizonX','Virlak*',6),
        (240,'FreeZoneX','Virlak*',7);

-- Insert 6 items globaux
INSERT INTO Items (nom, sigle, probabilite, description)
VALUES ('Trousse de soin','ITS', 0.05, 'Une trousse de premier soin qui permet de soigner jusqu"aux blessures les plus graves'),
        ('Plume de pheonix','IPP',0.005,'Permet de ressuscitu un camarae tombe au combat'),
        ('Pierre de teleportation','IPT',0.02,'Permet de se teleporter vers le dernier lieu de repos rencontrer'),
        ('ArmaGideon','IAG', 0.001,'Arme de destruction massive permet de d"anihiler toute vie dans un rayon de 2km'),
        ('Chickiriko','ICH',0.01,'Poule qui quand lancer sur un enemi fait apparaitre une armada de poules vengeuses'),
        ('Oppenglamer','IOP',0.001,'Entoure votre personnage d"un halo lumineux lui conferant une augmentation de charisme importante');




-- Emeric
-- NOTE voir Table Avatar alias_joueur et Table Joueur id_nom n'ont pas le même nombre dans le varchar

-- Emeric insert joueur Emeric
INSERT INTO Joueur
        VALUES  ('Emeric','emeric_rivard@hotmail.com','JeffreyBezosTM','h', DEFAULT, '1997-01-28');

-- Emeric insert 1 avatar changer le color value
INSERT INTO Avatar
        VALUES  ('Jeff',10,DEFAULT, DEFAULT, 'Emeric');


-- Emeric insert 3 capsules d'activité
INSERT INTO Activite (debut, fin, duree, nom_joueur)
        VALUES  (
            now(),
            now() + INTERVAL '555 minutes',
            555,
            'Emeric');

INSERT INTO Capsule(duree,monde,avatar,activite)
        VALUES  (300, 'FreeZoneX', 'Jeff',8);


INSERT INTO Capsule(duree,monde,avatar,activite)
        VALUES  (200, 'FreeZoneX', 'Jeff',8);


INSERT INTO Capsule(duree,monde,avatar,activite)
        VALUES  (55, 'FreeZoneX', 'Jeff',8);

-- Baris

-- Insérer les joueurs
INSERT INTO Joueur (id_alias, courriel, mot_de_passe, genre, date_inscription, date_naissance)
VALUES ('Baris', 'baris@email.com', 'motdepasse123', 'h', '2022-02-22', '2000-01-01');

-- Insérer l'avatar de Baris
INSERT INTO Avatar (id_nom, couleur, date_creation, mox, alias_joueur)
VALUES ('BarisAvatar1', 1, '2022-01-15', 500, 'Baris');


INSERT INTO Habilete (nom, sigle, energie_max, coef1, coef2, coef3, descriptions)
VALUES ('Auto Guérison', 'AGU', 100, 0.5, 0.3, 0.2, 'Récupérer santé automatiquement');

INSERT INTO Habilete (nom, sigle, energie_max, coef1, coef2, coef3, descriptions)
VALUES ('Implant Zoom Oculaire', 'IZO', 50, 0.7, 0.2, 0.1, 'Implant permettant de zoomer');

INSERT INTO Paire_habilete_et_monde (monde, habilete)
VALUES ('DeepHorizonX', (SELECT id_habilete FROM Habilete WHERE sigle = 'AGU')),
       ('DeepHorizonX', (SELECT id_habilete FROM Habilete WHERE sigle = 'IZO'));


INSERT INTO Activite (debut, fin, duree, nom_joueur)
VALUES ('2022-03-01 08:00:00', '2022-03-01 09:00:00', 3600, 'Baris'),
       ('2022-03-02 10:00:00', '2022-03-02 12:00:00', 7200, 'Baris'),
       ('2022-03-03 14:00:00', '2022-03-03 15:30:00', 5400, 'Baris');


-- Insérer les capsules d'activité pour Baris 
INSERT INTO Capsule (duree, monde, avatar, activite)
VALUES (3600, 'DeepHorizonX', 'BarisAvatar1', 9),
       (7200, 'DeepHorizonX', 'BarisAvatar1', 10),
       (5400, 'DeepHorizonX', 'BarisAvatar1', 11);

INSERT INTO Phrases (id_nom, phrase)
VALUES ('BarisAvatar1', 'GG EZ'),
       ('BarisAvatar1', 'Toujours prêt à défendre le monde.'),
       ('BarisAvatar1', 'En avant vers la victoire!');


-- Vincent Insert ItemsAvatar
INSERT INTO Item_avatar (avatar, item, quantite)
VALUES ('Jeff',1,3),
        ('Palstice',3,4),
        ('Sephiroth',6,1),
        ('Virlak*',4,9),
        ('Chuck',2,3),
        ('BarisAvatar1',4,2);
