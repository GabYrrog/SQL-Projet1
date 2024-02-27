-- Vincent
-- Insert Joueur
INSERT INTO Joueur (id_alias, courriel, mot_de_passe, genre, date_inscription, date_naissance)
VALUES ('Viken*','vynxwarrior@hotmail.com', 'BonjourPascal666', 'M','2023-02-25 06:06:06','1995-05-24 02:40:58');

--Insert Avatar
INSERT INTO Avatar (id_nom, couleur,date_creation, mox, alias_joueur)
VALUES ('Virlak*','1666', '2023-02-25 06:06:06', 'Viken*'),
        ('Palstice','4242','2023-02-26 00:00:00', 'Viken*'),
        ('Sephiroth', '8888', '2023-02-28 00:00:00', 'Viken*');

-- Insert 4 activites
INSERT INTO Activite (debut,fin,duree,nom_joueur)
VALUES('2023-02-30 01:00:00','2023-02-30 02:00:00',60,'Viken*'), -- activite 4
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

-- Insert ItemsAvatar
INSERT INTO Item_avatar (avatar, item)
VALUES (3,1),
        (4,3),
        (5,6),
        (6,4),
        (4,2),
        (1,4);
