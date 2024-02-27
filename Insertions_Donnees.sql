-- Gabriel
-- Insert Joueur
INSERT INTO Joueur (id_alias, courriel, mot_de_passe, genre, date_inscription, date_naissance)
VALUES ('GabYrrog', 'sk8er_gaby007@hotmail.com', '123meilleurpassword', 'M', '2023-02-23 00:00:00', '1990-06-14 00:00:00');
-- Insert Avatar
INSERT INTO Avatar (id_nom, couleur, date_creation, mox, alias_joueur)
VALUES ('Chuck', '3840', '2023-02-23 00:00:00', '48', 'GabYrrog');


-- Insert Monde
INSERT INTO Monde (nom, sigle, descriptions)
VALUES ('SpaceX', 'Elon', 'Un monde ressemblant etrangement a mars');

-- 3 habiletes

INSERT INTO Habilete (nom, sigle, energie_max, coef1, coef2, coef3, descriptions)
VALUES ('Relentir le temps', 'RT', 100.000, 1.5, 0.75, 0.25, 'Tout passe moins vite...');

INSERT INTO Habilete (nom, sigle, energie_max, coef1, coef2, coef3, descriptions)
VALUES ('Bouclier de proximite', 'BP', 80.500, 2.0, 1.0, 0.5, 'Augmente la defense quand on est proche dun ennemi');

INSERT INTO Habilete (nom, sigle, energie_max, coef1, coef2, coef3, descriptions)
VALUES ('Backstab', 'BSTB', 60.250, 0.5, 1.5, 2.0, 'Tu las pas vu venir');


-- 3 capsules   REVISER LES INT ACTIVITE pour que ca fitte avec les bons serials
INSERT INTO Capsule (duree, monde, avatar, activite)
VALUES (30, 'SpaceX', 'Chuck', 3);

INSERT INTO Capsule (duree, monde, avatar, activite)
VALUES (45, 'DeepHorizonX', 'Chuck', 2);

INSERT INTO Capsule (duree, monde, avatar, activite)
VALUES (60, 'FreeZoneX', 'Chuck', 1);


-- 2 activites
INSERT INTO Activite (debut, fin, duree, nom_joueur)
VALUES ('2024-02-23 14:00:00', '2024-02-23 15:00:00', 60, 'GabYrrog');

INSERT INTO Activite (debut, fin, duree, nom_joueur)
VALUES ('2024-02-24 10:00:00', '2024-02-24 10:30:00', 30, 'GabYrrog');

INSERT INTO Activite (debut, fin, duree, nom_joueur)
VALUES ('2024-02-26 10:00:00', '2024-02-26 10:30:00', 30, 'GabYrrog');

-- 3 avatar_habiletes
INSERT INTO Avatar_habilete (id_nom, id_habilete, )
VALUES ('Chuck','1');
INSERT INTO Avatar_habilete (id_nom, id_habilete)
VALUES ('Chuck','2');
INSERT INTO Avatar_habilete (id_nom, id_habilete)
VALUES ('Chuck','3');
-- VALIDER si les serial fittent avec mes habiletes