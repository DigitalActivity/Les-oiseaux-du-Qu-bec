-- Creation jeu de données

-- Site
INSERT INTO Site
VALUES (10.122, 9.505);

INSERT INTO Site
VALUES (11.155, 100.505);

INSERT INTO Site
VALUES (110.12, 89.5);

INSERT INTO Site
VALUES (10.15, 19.99);

INSERT INTO Site
VALUES (40.15, 50.98);

INSERT INTO Site
VALUES (30.15, 20.99);


-- Site_repertorié
INSERT INTO Site_repertorié
VALUES (10.122, 9.505, 'Park National xyz', 'Centre dans le park xyz');

INSERT INTO Site_repertorié
VALUES (11.155, 100.505, 'Park National klm', 'Centre dans le park abc');

INSERT INTO Site_repertorié
VALUES (110.12, 89.5, 'Park National zzz', 'Centre dans le park zzz');


-- Site_non_repertorié
INSERT INTO Site_non_repertorié
VALUES ( 
10.15, 19.99, default_site_norep_seq.NEXTVAL, 1
);

INSERT INTO Site_non_repertorié
VALUES ( 
40.15, 50.98, default_site_norep_seq.NEXTVAL, 0
);

INSERT INTO Site_non_repertorié
VALUES ( 
30.15, 20.99, default_site_norep_seq.NEXTVAL, 1
);


-- Espèce
INSERT INTO Espèce
VALUES ( 
'Moineau', 1, 'Oiseau rural petite tete', null, 'Espèce_locale'
);

INSERT INTO Espèce
VALUES ( 
'Canarion', 1, 'Oiseau rural petite tete', null, null
);

INSERT INTO Espèce
VALUES ( 
'Pigeon', 0, 'Oiseau rural', null, 'Espèce_migrante'
);

-- Espèce_migrante
INSERT INTO Espèce_migrante
VALUES ( 
'Albatros', 10, 4
);
INSERT INTO Espèce_migrante
VALUES ( 
'Coco', 9, 6
);
INSERT INTO Espèce_migrante
VALUES ( 
'Bobo', 11, 5
);


-- Membre
INSERT INTO Membre
VALUES ( 
'Szbechek', 'mc', '450545544', '2016-04-12', 'Ornithologue'
);
INSERT INTO Membre
VALUES ( 
'Rabdi', 'younes', '450545050', '2016-04-1', 'Amateur'
);
INSERT INTO Membre
VALUES ( 
'alice', 'merveille', '450548080', '2016-05-11', 'Ornithologue'
);


-- Excursion
INSERT INTO Excursion
VALUES ( 
default_excursion_seq.NEXTVAL, 3, '2017-05-05', 10.122, 9.505
);
INSERT INTO Excursion
VALUES ( 
default_excursion_seq.NEXTVAL, 5, '2017-10-05', 40.15, 50.98
);
INSERT INTO Excursion
VALUES ( 
default_excursion_seq.NEXTVAL, 2, '2017-2-05', 10.122, 9.505
);

-- Participation
INSERT INTO Participation
VALUES ( 
100, 'Rabdi', 'younes', '450545050'
);

INSERT INTO Participation
VALUES ( 
101, 'Rabdi', 'younes', '450545050'
);


-- Observation
INSERT INTO Observation
VALUES ( 
default_observation_seq.NEXTVAL, 1, '2017-05-05', 'Jumelles', 'Observation desc optionel',
100, 'Rabdi', 'younes', '450545050', 'Albatros'
);

INSERT INTO Observation
VALUES ( 
default_observation_seq.NEXTVAL, 0, '2017-06-06', 'Oeil', 'Observation desc optionel',
100, 'Szbechek', 'mc', '45054554', 'Coco'
);


-- Bague
INSERT INTO Bague
VALUES ( 
default_bague_seq.NEXTVAL, '2017-06-06', 'Szbechek', 'mc',	'45054554', 'Coco'
);















