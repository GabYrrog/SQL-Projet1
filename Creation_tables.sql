-- Vincent
DROP TABLE IF EXISTS Activite;
DROP TABLE IF EXISTS Capsule;
DROP TABLE IF EXISTS Item_avatar;

-- Gabriel
DROP TABLE IF EXISTS Avatar_habilite;
DROP TABLE IF EXISTS Joueur;


-- Gabriel
CREATE TABLE Joueur (
    id_alias                 VARCHAR(64)     PRIMARY KEY,
    courriel                VARCHAR(128)    UNIQUE NOT NULL,
    mot_de_passe            VARCHAR(32)     NOT NULL,
    genre                   CHAR,
    date_inscription        DATE NOT NULL DEFAULT CURRENT_DATE,
    date_naissance          DATE            NOT NULL
);


CREATE TABLE Avatar_habilite (
    id_avatar_habilite         SERIAL     PRIMARY KEY,
    id_avatar               SERIAL,
    id_habilite             SERIAL
);


-- Vincent

CREATE TABLE Activite(
	id_activite	SERIAL 		PRIMARY KEY,
	debut 		TIMESTAMP 	NOT NULL,
	fin 		TIMESTAMP 	NOT NULL,
	duree 		INT 		NOT NULL,
	nom_joueur	VARCHAR(40)	NOT NULL
);


CREATE TABLE Capsule(
	id_capsule	SERIAL	PRIMARY KEY,
	duree		INT,
	monde		VARCHAR(16)		NOT NULL,
	avatar		VARCHAR(32) 	NOT NULL,
	activite	INT				NOT NULL
);

	

CREATE TABLE Items_avatar(
	id_item_avatar	SERIAL		PRIMARY KEY,
	avatar			VARCHAR(32)	NOT NULL,
	item			INT			NOT NULL
);

-- Gabriel
ALTER TABLE Joueur ADD CONSTRAINT cc_joueur_genre CHECK(genre IN ('f', 'h', 'x'));
ALTER TABLE Joueur ADD  CONSTRAINT date_inscription_check CHECK (date_inscription > '2020-01-01');
ALTER TABLE Joueur ADD  CONSTRAINT date_naissance_check CHECK (date_naissance > '1990-01-01');
ALTER TABLE Joueur ADD CONSTRAINT age_check CHECK (date_inscription - date_naissance > INTERVAL '13 years');
ALTER TABLE Avatar_habilite ADD CONSTRAINT fk_id_avatar_avatar_habilite FOREIGN KEY (id_avatar) REFERENCES Avatar(id_avatar);
ALTER TABLE Avatar_habilite ADD CONSTRAINT fk_id_habilite_avatar_habilite FOREIGN KEY (id_habilite) REFERENCES Habilite(id_habilite);

-- Vincent
ALTER TABLE Activite ADD CONSTRAINT fk_nom_joueur FOREIGN KEY (Joueur) REFERENCES Joueur(id_alias);
ALTER TABLE Item_avatar
	ADD CONSTRAINT fk_avatar FOREIGN KEY (Avatar) REFERENCES Avatar(nom),
	ADD CONSTRAINT fk_item	FOREIGN KEY (Item) REFERENCES Items(id_item);
ALTER TABLE Capsule 
	ADD CONSTRAINT fk_monde FOREIGN KEY (Monde) REFERENCES Monde(nom),
	ADD CONSTRAINT fk_avatar FOREIGN KEY (Avatar) REFERENCES Avatar(nom),
	ADD CONSTRAINT fk_activite FOREIGN KEY (Activite) REFERENCES Activite(id_activite);