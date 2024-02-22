-- Baris 

DROP TABLE IF EXISTS Monde;
DROP TABLE IF EXISTS Habilete;
DROP TABLE IF EXISTS Paire_habilete_et_monde;

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

DROP TABLE IF EXISTS Avatar_habilete;
DROP TABLE IF EXISTS Joueur;

-- Emeric creation table Items

CREATE TABLE Items (
    id_item             SERIAL PRIMARY KEY,
    nom                 VARCHAR(32) NOT NULL UNIQUE,
    sigle               CHAR(4) NOT NULL UNIQUE CHECK(sigle LIKE 'I%'),
    probabilite          NUMERIC(4,3) DEFAULT 0.025 NOT NULL CHECK (probabilite >= 0.000 AND probabilite <= 1.000),
    description         VARCHAR(1024) NULL
);

-- Emeric creation table Avatar

CREATE TABLE Avatar (
    id_nom         VARCHAR(32) PRIMARY KEY,
    couleur				INTEGER,
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
    id_nom           VARCHAR(32) NOT NULL,
    phrase              VARCHAR(64) NOT NULL
);


-- Gabriel

CREATE TABLE Joueur (
    id_alias                 VARCHAR(64)     PRIMARY KEY,
    courriel                VARCHAR(128)    UNIQUE NOT NULL,
    mot_de_passe            VARCHAR(32)     NOT NULL,
    genre                   CHAR,
    date_inscription        TIMESTAMP NOT NULL DEFAULT CURRENT_DATE,
    date_naissance          TIMESTAMP            NOT NULL
);


CREATE TABLE Avatar_habilete (
    id_nom_habilete         SERIAL     PRIMARY KEY,
    id_nom               VARCHAR(32),
    id_habilete             SERIAL
);


-- Vincent

CREATE TABLE Activite(
	id_activite	SERIAL 		PRIMARY KEY,
	debut 		TIMESTAMP 	NOT NULL,
	fin 		TIMESTAMP 	NOT NULL,
	duree 		INTEGER		NOT NULL,
	nom_joueur	VARCHAR(32)	NOT NULL
);


CREATE TABLE Capsule(
	id_capsule	SERIAL	PRIMARY KEY,
	duree		INTEGER,
	monde		VARCHAR(16)	NOT NULL,
	avatar		VARCHAR(32) 	NOT NULL,
	activite	INTEGER		NOT NULL
);

	

CREATE TABLE Item_avatar(
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

CREATE TABLE Habilete (
    id_habilete SERIAL PRIMARY KEY,
    nom VARCHAR(32) UNIQUE NOT NULL,
    sigle VARCHAR(3) UNIQUE NOT NULL,
    energie_max DECIMAL(7,3),
    coef1 DOUBLE PRECISION,
    coef2 DOUBLE PRECISION,
    coef3 DOUBLE PRECISION,
    descriptions VARCHAR(24)
);

CREATE TABLE Paire_habilete_et_monde (
    id_paire_habilete_monde SERIAL PRIMARY KEY,
    monde VARCHAR(16),
    habilete INTEGER
    
);

-- Gabriel

ALTER TABLE Joueur ADD CONSTRAINT cc_joueur_genre CHECK(genre IN ('f', 'h', 'x'));
ALTER TABLE Joueur ADD  CONSTRAINT date_inscription_check CHECK (date_inscription > '2020-01-01');
ALTER TABLE Joueur ADD  CONSTRAINT date_naissance_check CHECK (date_naissance > '1990-01-01');
ALTER TABLE Joueur ADD CONSTRAINT age_check CHECK (date_inscription - date_naissance > INTERVAL '13 years');
ALTER TABLE Avatar_habilete ADD CONSTRAINT fk_id_nom_avatar_habilete FOREIGN KEY (id_nom) REFERENCES Avatar(id_nom);
ALTER TABLE Avatar_habilete ADD CONSTRAINT fk_id_habilete_avatar_habilete FOREIGN KEY (id_habilete) REFERENCES habilete(id_habilete);

-- Vincent

ALTER TABLE Activite ADD CONSTRAINT fk_nom_joueur FOREIGN KEY (nom_joueur) REFERENCES Joueur(id_alias);
ALTER TABLE Item_avatar
	ADD CONSTRAINT fk_avatar FOREIGN KEY (avatar) REFERENCES Avatar(id_nom),
	ADD CONSTRAINT fk_item	FOREIGN KEY (item) REFERENCES Items(id_item);
ALTER TABLE Capsule 
	ADD CONSTRAINT fk_monde FOREIGN KEY (monde) REFERENCES Monde(nom),
	ADD CONSTRAINT fk_avatar FOREIGN KEY (avatar) REFERENCES Avatar(id_nom),
	ADD CONSTRAINT fk_activite FOREIGN KEY (activite) REFERENCES Activite(id_activite);

-- Emeric

ALTER TABLE Avatar ADD CONSTRAINT fk_avatar_alias_joueur FOREIGN KEY (alias_joueur) REFERENCES Joueur (id_alias);
ALTER TABLE Items_monde ADD CONSTRAINT fk_items_monde_monde FOREIGN KEY (monde) REFERENCES Monde (nom);
ALTER TABLE Items_monde ADD CONSTRAINT fk_items_monde_items FOREIGN KEY (item) REFERENCES Items (id_item);
ALTER TABLE Phrases ADD CONSTRAINT fk_phrases_id_nom FOREIGN KEY (id_nom) REFERENCES Avatar (id_nom);

-- Baris

ALTER TABLE Paire_habilete_et_monde ADD CONSTRAINT fk_habilete_monde_monde FOREIGN KEY (monde) REFERENCES Monde(nom);
ALTER TABLE Paire_habilete_et_monde  ADD CONSTRAINT fk_habilete_monde_habilete FOREIGN KEY (habilete) REFERENCES Habilete(id_habilete);
-- ALTER TABLE Monde ADD CONSTRAINT fk_monde_paire_habilete_et_monde FOREIGN KEY (nom) REFERENCES Paire_habilete_et_monde(monde);
 -- ALTER TABLE Habilete ADD CONSTRAINT fk_habiletes_paire_habilete_et_monde FOREIGN KEY (id_habilete) REFERENCES Paire_habilete_et_monde (habilete);

