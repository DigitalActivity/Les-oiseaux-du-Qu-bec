-- Fichier DDL pour TP1 les oiseaux du Québec
-- Partie III
-- Szbechek Mc Gurk - Younes Rabdi
-- CREATION DES TABLES


-- Site
CREATE TABLE Site 
  (
	latitude  NUMBER(13, 10) NOT NULL,  -- (ex 120,0123456789)
	longitude NUMBER(13, 10) NOT NULL,
	CONSTRAINT site_pk 
		PRIMARY KEY (latitude, longitude)
  );
  
-- Site_repertorié
CREATE TABLE Site_repertorié
  (
    latitude         NUMBER(13, 10) NOT NULL,
    longitude        NUMBER(13, 10) NOT NULL,
    nom_site         VARCHAR2(25)  NOT NULL,
	description_site VARCHAR2(100) NOT NULL,
	CONSTRAINT Site_rep_nom_pk  UNIQUE (nom_site),
	CONSTRAINT Site_rep_pk 
		PRIMARY KEY (latitude, longitude),
	CONSTRAINT Site_rep_fk 
		FOREIGN KEY (latitude, longitude) 
		REFERENCES Site(latitude, longitude)
  );  
  
-- seq auto increment numero_site non repértorié
CREATE SEQUENCE default_site_norep_seq
MINVALUE 100
START WITH 100
INCREMENT BY 1
CACHE 5; -- specifies how many sequence values will be stored in memory for faster access.

-- Site_non_repertorié
CREATE TABLE Site_non_repertorié
  (
    latitude       NUMBER(13, 10) NOT NULL,
    longitude      NUMBER(13, 10) NOT NULL,
    numero_site    NUMBER(6) ON NULL, -- avec oracle12 il est possible de faire DEFAULT default_site_norep_seq.NEXTVAL,
    mesure_précise CHAR  (1) 	 NOT NULL, -- Boolean : 1 quand la mesure est précise, 0 sinon, (CONSTRAINT plus bas)
	CONSTRAINT site_no_r_num_pk  UNIQUE (numero_site),
	CONSTRAINT site_no_r_pk 
		PRIMARY KEY (latitude, longitude),
	CONSTRAINT site_site_no_r_fk 
		FOREIGN KEY (latitude, longitude) 
		REFERENCES Site(latitude, longitude),
	CONSTRAINT site_norep_mesur_précis_cck CHECK (mesure_précise IN (0,1)),
	CONSTRAINT site_numero_cck  CHECK (numero_site > 0)
  );


-- Espèce
CREATE TABLE Espèce
  (
    nom_espèce         VARCHAR2(25)  NOT NULL,
    espèce_rare        CHAR    (1)   NOT NULL,
    description_espèce VARCHAR2(100) NOT NULL,
    photo 			   BLOB,
    type_espèce        VARCHAR2(15)  DEFAULT 'Espèce_locale',
	CONSTRAINT espèce_pk 
		PRIMARY KEY (nom_espèce),
	CONSTRAINT espèce_type_cck CHECK (type_espèce IN ('Espèce_locale', 'Espèce_migrante')),
	CONSTRAINT espèce_rare_cck CHECK (espèce_rare IN (0,1))
  );
  
-- Espèce_migrante
CREATE TABLE Espèce_migrante
  (
    nom_espèce  VARCHAR2(25)  NOT NULL,
    mois_dèpart NUMBER(2)  NOT NULL,
    mois_retour NUMBER(2)  NOT NULL,
	CONSTRAINT espèce_migrante_pk 
		PRIMARY KEY (nom_espèce),
	CONSTRAINT espèce_espèce_migrante_fk 
		FOREIGN KEY (nom_espèce) 
		REFERENCES Espèce(nom_espèce)
  );

  
-- Membre
CREATE TABLE Membre
  (
    nom_membre    VARCHAR2(25) NOT NULL,
    prénom_membre VARCHAR2(25) NOT NULL,
    téléphone     VARCHAR2(25) NOT NULL,
    date_adhéson  DATE 		   NOT NULL,
    type_membre   VARCHAR2(12) NOT NULL,
	CONSTRAINT membre_pk 
		PRIMARY KEY (nom_membre, prénom_membre, téléphone),
	CONSTRAINT membre_type_cck CHECK (type_membre IN ('Amateur', 'Ornithologue'))
  );
  
  
  -- Participation (Lien (M,N) entre excursion et membre)
  CREATE TABLE Participation
  (
    excursion_numéro NUMBER(9) NOT NULL,
    membre_nom       VARCHAR2(25) NOT NULL,
    membre_prénom    VARCHAR2(25) NOT NULL,
    membre_téléphone VARCHAR2(25) NOT NULL,
	CONSTRAINT participation_pk PRIMARY KEY (excursion_numéro, membre_nom, membre_prénom, membre_téléphone),
	CONSTRAINT excursion_particip_fk 
		FOREIGN KEY (excursion_numéro) 
		REFERENCES Excursion (numéro_excursion),
	CONSTRAINT membre_particip_fk
		FOREIGN KEY (membre_nom, membre_prénom, membre_téléphone) 
		REFERENCES Membre (nom_membre, prénom_membre, téléphone),
  );
  
  
-- seq auto increment numéro_excursion
CREATE SEQUENCE default_excursion_seq
MINVALUE 100
START WITH 100
INCREMENT BY 1
CACHE 5;

-- Excursion
CREATE TABLE Excursion
  (
    numéro_excursion NUMBER(9) NOT NULL, -- Oracle12 possible de faire DEFAULT default_excursion_seq.NEXTVAL,
    durée_excursion  NUMBER(1) NOT NULL,
    date_excursion   DATE NOT NULL,
    site_latitude    NUMBER(13, 10) NOT NULL,
    site_longitude   NUMBER(13, 10) NOT NULL,
	CONSTRAINT excursion_pk 
		PRIMARY KEY (numéro_excursion),
	CONSTRAINT site_excursion_fk 
		FOREIGN KEY (site_latitude, site_longitude) 
		REFERENCES Site(latitude, longitude),
	CONSTRAINT excursion_numero_cck  CHECK (numéro_excursion > 0)
  );

  
-- seq auto increment numéro_bague
CREATE SEQUENCE default_observation_seq
MINVALUE 100
START WITH 100
INCREMENT BY 1
CACHE 5;

-- Observation
CREATE TABLE Observation
  (
    numéro_obeservation          NUMBER(9) NOT NULL UNIQUE, -- DEFAULT default_observation_seq.NEXTVAL,
	étude_sur_groupe             CHAR(1)      DEFAULT 0,
	date_observation             DATE 		  NOT NULL,
	outil_observation            VARCHAR2(10) NOT NULL,
	description                  VARCHAR2(100),
    excursion_numéro   			 NUMBER(9) NOT NULL,
    membre_nom            		 VARCHAR2(25) NOT NULL,
    membre_prénom         		 VARCHAR2(25) NOT NULL,
    membre_téléphone             VARCHAR2(25) NOT NULL,
    espèce_nom            		 VARCHAR2(25) NOT NULL,
	confirme_observ				 NUMBER(9),
	CONSTRAINT observation_pk 	 
		PRIMARY KEY (excursion_numéro, membre_nom, membre_prénom, membre_téléphone, espèce_nom),
	CONSTRAINT excursion_observ_fk 
		FOREIGN KEY (excursion_numéro) 
		REFERENCES Excursion(numéro_excursion),
	CONSTRAINT membre_observ_fk 
		FOREIGN KEY (membre_nom, membre_prénom, membre_téléphone)
		REFERENCES Membre (nom_membre, prénom_membre, téléphone),
	CONSTRAINT espèce_observ_fk 
		FOREIGN KEY (espèce_nom)
		REFERENCES Espèce (nom_espèce),
	CONSTRAINT observ_confirm_fk 
		FOREIGN KEY (confirme_obser)
		REFERENCES Observation (numéro_obeservation),
	CONSTRAINT observation_numero_cck  CHECK (numéro_obeservation > 0),
	CONSTRAINT Observ_étude_groupe_cck CHECK (étude_sur_groupe IN (0,1)),
	CONSTRAINT Observ_outil_cck CHECK (outil_observation IN ('Jumelles', 'Oeil'))
  );
  
  
-- seq auto increment numéro_bague
CREATE SEQUENCE default_bague_seq
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 5;

-- Bague
CREATE TABLE Bague 
(
	numéro_bague 		 NUMBER(9)  NOT NULL, -- DEFAULT default_bague_seq.NEXTVAL
	date_pose            DATE NOT NULL,
    poseur_nom    		 VARCHAR2(25) NOT NULL,
    poseur_prénom 		 VARCHAR2(25) NOT NULL,
    poseur_téléphone     VARCHAR2(25) NOT NULL,
	nom_espèce  		 VARCHAR2(25)  NOT NULL,
	CONSTRAINT bague_numéro_pk 
		PRIMARY KEY(numéro_bague),
	CONSTRAINT membre_bague_fk 
		FOREIGN KEY (poseur_nom, poseur_prénom, poseur_téléphone) 
		REFERENCES Membre(nom_membre, prénom_membre, téléphone),
	CONSTRAINT espèce_bague_fk
		FOREIGN KEY (nom_espèce)
		REFERENCES Espèce_migrante(nom_espèce),
	CONSTRAINT bague_numéro_cck  CHECK (numéro_bague > 0)
);