CREATE TABLE monde (
    nom VARCHAR(16) PRIMARY KEY,
    sigle VARCHAR(6) UNIQUE NOT NULL,
    descriptions VARCHAR(2048)
);

CREATE TABLE habilités (
    id_habilité SERIAL PRIMARY KEY,
    nom VARCHAR(32) UNIQUE NOT NULL,
    sigle VARCHAR(3) UNIQUE NOT NULL,
    energie_max DECIMAL(7,3),
    coef1 DOUBLE PRECISION,
    coef2 DOUBLE PRECISION,
    coef3 DOUBLE PRECISION,
    descriptions VARCHAR(24)
);

CREATE TABLE paire_habilité_et_monde (
    id_paire_habilite_monde SERIAL PRIMARY KEY,
    monde VARCHAR(16),
    habilite INTEGER,
    FOREIGN KEY (monde) REFERENCES monde(nom),
    FOREIGN KEY (habilite) REFERENCES habilités(id_habilité)
);

-- Ajouter une clé étrangère à la table "paire_habilité_et_monde"
ALTER TABLE paire_habilité_et_monde
ADD CONSTRAINT fk_paire_habilité_et_monde_monde
FOREIGN KEY (monde)
REFERENCES monde (nom);

ALTER TABLE paire_habilité_et_monde
ADD CONSTRAINT fk_paire_habilité_et_monde_habilités
FOREIGN KEY (habilite)
REFERENCES habilités (id_habilité);

-- Ajouter une clé étrangère à la table "monde"
ALTER TABLE monde
ADD CONSTRAINT fk_monde_paire_habilité_et_monde
FOREIGN KEY (nom)
REFERENCES paire_habilité_et_monde (monde);

-- Ajouter une clé étrangère à la table "habilités"
ALTER TABLE habilités
ADD CONSTRAINT fk_habilités_paire_habilité_et_monde
FOREIGN KEY (id_habilité)
REFERENCES paire_habilité_et_monde (habilite);
