-- Emeric drop tables
DROP TABLE IF EXISTS Items;
DROP TABLE IF EXISTS Avatar;
DROP TABLE IF EXISTS Items_monde;
DROP TABLE IF EXISTS Phrases;

-- Emeric création table Items
CREATE TABLE Items (
    id_item             SERIAL PRIMARY KEY,
    nom                 VARCHAR(32) NOT NULL UNIQUE,
    sigle               CHAR(4) NOT NULL UNIQUE CHECK(sigle LIKE 'I%'),
    probablite          NUMERIC(4,3) DEFAULT 0.025 NOT NULL CHECK (probablite >= 0.000 AND probabilite <= 1.000),
    description         VARCHAR(1024) NULL
);

-- Emeric création table Avatar

CREATE TABLE Avatar (
    id_nom              VARCHAR(32) PRIMARY KEY,
    couleur_1
    couleur_2
    couleur_3            
    date_creation       DATE DEFAULT CURRENT_DATE NOT NULL,
    mox                 INTEGER DEFAULT 0 NOT NULL CHECK(mox BETWEEN -1000000000 AND 1000000000),
    alias_joueur        VARCHAR(32) NOT NULL            
);

-- Emeric création table Items_monde

CREATE TABLE Items_monde (
    id_items_monde      SERIAL PRIMARY KEY,
    monde               VARCHAR(16) NOT NULL,
    item                INTEGER NOT NULL
);

-- Emeric création table Phrases
CREATE TABLE Phrases (
    id_phrase           SERIAL PRIMARY KEY,
    id_avatar           VARCHAR(32) NOT NULL,
    phrase              VARCHAR(64) NOT NULL
);


-- ALTER TABLE pour foreign keys emeric
ALTER TABLE Avatar ADD FOREIGN KEY (alias_joueur) REFERENCES Joueur (alias);
ALTER TABLE Items_monde ADD FOREIGN KEY (monde) REFERENCES Monde (nom);
ALTER TABLE Items_monde ADD FOREIGN KEY (item) REFERENCES Items (id_items_monde);
ALTER TABLE Phrases ADD FOREIGN KEY (id_avatar) REFERENCES Avatar (id_nom);
