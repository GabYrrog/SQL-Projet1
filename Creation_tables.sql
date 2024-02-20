
DROP TABLE IF EXISTS joueur
CREATE TABLE joueur (
    id_alias                 VARCHAR(64)     PRIMARY KEY,
    courriel                VARCHAR(128)    UNIQUE NOT NULL,
    mot_de_passe            VARCHAR(32)     NOT NULL,
    genre                   CHAR,
    date_inscription        DATE NOT NULL DEFAULT CURRENT_DATE,
    date_naissance          DATE            NOT NULL
);
-- ALTER TABLE joueur ADD  CONSTRAINT pk_aliasID PRIMARY KEY (aliasID);
ALTER TABLE joueur ADD CONSTRAINT cc_joueur_genre CHECK(genre IN ('f', 'h', 'x')),
ALTER TABLE joueur ADD  CONSTRAINT date_inscription_check CHECK (date_inscription > '2020-01-01')
ALTER TABLE joueur ADD  CONSTRAINT date_naissance_check CHECK (date_naissance > '1990-01-01')
ALTER TABLE joueur ADD CONSTRAINT age_check CHECK (date_inscription - date_naissance > INTERVAL '13 years')



DROP TABLE IF EXISTS avatar_habilite
CREATE TABLE avatar_habilite (
    id_avatar_habilite         SERIAL     PRIMARY KEY,
    id_avatar               SERIAL,
    id_habilite             SERIAL
);

ALTER TABLE avatar_habilite ADD CONSTRAINT fk_id_avatar_avatar_habilite FOREIGN KEY (id_avatar) REFERENCES avatar(id_avatar),
ALTER TABLE avatar_habilite ADD CONSTRAINT fk_id_habilite_avatar_habilite FOREIGN KEY (id_habilite) REFERENCES habilite(id_habilite)