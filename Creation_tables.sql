-- Baris 
DROP TABLE IF EXISTS Monde;
DROP TABLE IF EXISTS Habilites;
DROP TABLE IF EXISTS Paire_habilite_et_monde;

-- Emeric drop tables
DROP TABLE IF EXISTS Items;
DROP TABLE IF EXISTS Avatar;
DROP TABLE IF EXISTS Items_monde;
DROP TABLE IF EXISTS Phrases;


-- Vincent
DROP TABLE IF EXISTS Activite;
DROP TABLE IF EXISTS Capsule;
DROP TABLE IF EXISTS Item_avatar;

-- Gabriel
DROP TABLE IF EXISTS Avatar_habilite;
DROP TABLE IF EXISTS Joueur;

-- Emeric creation table Items
CREATE TABLE Items (
    id_item             SERIAL PRIMARY KEY,
    nom                 VARCHAR(32) NOT NULL UNIQUE,
    sigle               CHAR(4) NOT NULL UNIQUE CHECK(sigle LIKE 'I%'),
    probablite          NUMERIC(4,3) DEFAULT 0.025 NOT NULL CHECK (probablite >= 0.000 AND probabilite <= 1.000),
    description         VARCHAR(1024) NULL
);

-- Emeric creation table Avatar

CREATE TABLE Avatar (
    id_nom              VARCHAR(32) PRIMARY KEY,
    couleur_1
    couleur_2
    couleur_3            
    date_creation       DATE DEFAULT CURRENT_DATE NOT NULL,
    mox                 INTEGER DEFAULT 0 NOT NULL CHECK(mox BETWEEN -1000000000 AND 1000000000),
    alias_joueur        VARCHAR(32) NOT NULL            
);

-- Emeric creation table Items_monde

CREATE TABLE Items_monde (
    id_items_monde      SERIAL PRIMARY KEY,
    monde               VARCHAR(16) NOT NULL,
    item                INTEGER NOT NULL
);

-- Emeric creation table Phrases
CREATE TABLE Phrases (
    id_phrase           SERIAL PRIMARY KEY,
    id_avatar           VARCHAR(32) NOT NULL,
    phrase              VARCHAR(64) NOT NULL
);


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
	duree 		INTEGER		NOT NULL,
	nom_joueur	VARCHAR(40)	NOT NULL
);


CREATE TABLE Capsule(
	id_capsule	SERIAL	PRIMARY KEY,
	duree		INTEGER,
	monde		VARCHAR(16)	NOT NULL,
	avatar		VARCHAR(32) 	NOT NULL,
	activite	INTEGER		NOT NULL
);

	

CREATE TABLE Items_avatar(
	id_item_avatar	SERIAL			PRIMARY KEY,
	avatar			VARCHAR(32)	NOT NULL,
	item			INTEGER		NOT NULL
);

-- Baris
CREATE TABLE Monde (
    nom VARCHAR(16) PRIMARY KEY,
    sigle VARCHAR(6) UNIQUE NOT NULL,
    descriptions VARCHAR(2048)
);

CREATE TABLE Habilites (
    id_habilite SERIAL PRIMARY KEY,
    nom VARCHAR(32) UNIQUE NOT NULL,
    sigle VARCHAR(3) UNIQUE NOT NULL,
    energie_max DECIMAL(7,3),
    coef1 DOUBLE PRECISION,
    coef2 DOUBLE PRECISION,
    coef3 DOUBLE PRECISION,
    descriptions VARCHAR(24)
);

CREATE TABLE Paire_habilite_et_monde (
    id_paire_habilite_monde SERIAL PRIMARY KEY,
    monde VARCHAR(16),
    habilite INTEGER
    
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

-- Emeric
ALTER TABLE Avatar ADD CONSTRAINT fk_avatar_alias_joueur FOREIGN KEY (alias_joueur) REFERENCES Joueur (alias);
ALTER TABLE Items_monde ADD CONSTRAINT fk_items_monde_monde FOREIGN KEY (monde) REFERENCES Monde (nom);
ALTER TABLE Items_monde ADD CONSTRAINT fk_items_monde_items FOREIGN KEY (item) REFERENCES Items (id_items_monde);
ALTER TABLE Phrases ADD CONSTRAINT fk_phrases_id_avatar FOREIGN KEY (id_avatar) REFERENCES Avatar (id_nom);

-- Baris
ALTER TABLE Paire_habilite_et_monde ADD CONSTRAINT fk_habilite_monde_monde FOREIGN KEY (monde) REFERENCES Monde(nom);
ALTER TABLE Paire_habilite_et_monde  ADD CONSTRAINT fk_habilite_monde_habilite FOREIGN KEY (habilite) REFERENCES Habilites(id_habilite);
ALTER TABLE Monde ADD CONSTRAINT fk_monde_paire_habilite_et_monde FOREIGN KEY (nom) REFERENCES Paire_habilite_et_monde(monde);
ALTER TABLE Habilites ADD CONSTRAINT fk_habilites_paire_habilite_et_monde FOREIGN KEY (id_habilite) REFERENCES Paire_habilite_et_monde (habilite);

