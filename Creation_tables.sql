CREATE TABLE monde (
    nom VARCHAR(16) PRIMARY KEY,
    sigle VARCHAR(6) UNIQUE NOT NULL,
    descriptions VARCHAR(2048)
);

CREATE TABLE habilites (
    id_habilite SERIAL PRIMARY KEY,
    nom VARCHAR(32) UNIQUE NOT NULL,
    sigle VARCHAR(3) UNIQUE NOT NULL,
    energie_max DECIMAL(7,3),
    coef1 DOUBLE PRECISION,
    coef2 DOUBLE PRECISION,
    coef3 DOUBLE PRECISION,
    descriptions VARCHAR(24)
);

CREATE TABLE paire_habilite_et_monde (
    id_paire_habilite_monde SERIAL PRIMARY KEY,
    monde VARCHAR(16),
    habilite INTEGER,
    FOREIGN KEY (monde) REFERENCES monde(nom),
    FOREIGN KEY (habilite) REFERENCES habilites(id_habilite)
);

-- Ajouter une clé étrangère à la table "paire_habilite_et_monde"
ALTER TABLE paire_habilite_et_monde
ADD CONSTRAINT fk_paire_habilite_et_monde_monde
FOREIGN KEY (monde)
REFERENCES monde (nom);

ALTER TABLE paire_habilite_et_monde
ADD CONSTRAINT fk_paire_habilite_et_monde_habilites
FOREIGN KEY (habilite)
REFERENCES habilites (id_habilite);

-- Ajouter une clé étrangère à la table "monde"
ALTER TABLE monde
ADD CONSTRAINT fk_monde_paire_habilite_et_monde
FOREIGN KEY (nom)
REFERENCES paire_habilite_et_monde (monde);

-- Ajouter une clé étrangère à la table "habilités"
ALTER TABLE habilites
ADD CONSTRAINT fk_habilites_paire_habilite_et_monde
FOREIGN KEY (id_habilite)
REFERENCES paire_habilite_et_monde (habilite);
