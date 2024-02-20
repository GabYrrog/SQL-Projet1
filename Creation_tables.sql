-- Table activite
CREATE TABLE Activite(
	id_activite	SERIAL 		PRIMARY KEY,
	debut 		TIMESTAMP 	NOT NULL,
	fin 		TIMESTAMP 	NOT NULL,
	duree 		INT 		NOT NULL,
	nom_joueur	VARCHAR(40)	NOT NULL,
)

ALTER TABLE activite ADD CONSTRAINT fk_nom_joueur FOREIGN KEY (joueur) REFERENCES Joueur(id_alias)

--Table Capsule
CREATE TABLE Capsule(
	id_capsule	SERIAL	PRIMARY KEY,
	duree		INT,
	monde		VARCHAR(16)		NOT NULL,
	avatar		VARCHAR(32) 	NOT NULL,
	activite	INT				NOT NULL
)

ALTER TABLE capsule 
	ADD CONSTRAINT fk_monde FOREIGN KEY (monde) REFERENCES Monde(nom),
	ADD CONSTRAINT fk_avatar FOREIGN KEY (avatar) REFERENCES Avatar(nom),
	ADD CONSTRAINT fk_activite FOREIGN KEY (activite) REFERENCES Activite(id_activite);
	
--Table PaireItemsAvatar
CREATE TABLE Items_avatar(
	id_item_avatar	SERIAL		PRIMARY KEY,
	avatar			VARCHAR(32)	NOT NULL,
	item			INT			NOT NULL
)

ALTER TABLE item_avatar
	ADD CONSTRAINT fk_avatar FOREIGN KEY (avatar) REFERENCES Avatar(nom),
	ADD CONSTRAINT fk_item	FOREIGN KEY (item) REFERENCES Items(id_item)
	