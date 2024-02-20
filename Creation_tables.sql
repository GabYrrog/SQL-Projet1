-- Emeric drop tables
DROP TABLE IF EXISTS Items;
DROP TABLE IF EXISTS Avatar;
DROP TABLE IF EXISTS PaireItemsEtMonde;

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

);

-- Emeric création table PaireItemsEtMonde