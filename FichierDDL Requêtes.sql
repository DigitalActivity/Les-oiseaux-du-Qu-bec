-- SCRIPTES REQUETES


-- Quels sont les sites non répertoriés?
SELECT * FROM "SITE_NON_REPERTORIÉ"


-- Quelles sont les observations faites par les ornithologues?
SELECT * 
FROM OBSERVATION
INNER JOIN MEMBRE
ON OBSERVATION.MEMBRE_NOM=MEMBRE.NOM_MEMBRE 
  AND OBSERVATION.MEMBRE_PRÉNOM=MEMBRE.PRÉNOM_MEMBRE
  AND OBSERVATION.MEMBRE_TÉLÉPHONE=MEMBRE.TÉLÉPHONE
WHERE MEMBRE.TYPE_MEMBRE = 'Ornithologue';


-- Combien d’observations ont été faites par des amateurs?
SELECT COUNT(OBSERVATION.MEMBRE_NOM)
FROM OBSERVATION
INNER JOIN MEMBRE
ON OBSERVATION.MEMBRE_NOM=MEMBRE.NOM_MEMBRE 
  AND OBSERVATION.MEMBRE_PRÉNOM=MEMBRE.PRÉNOM_MEMBRE
  AND OBSERVATION.MEMBRE_TÉLÉPHONE=MEMBRE.TÉLÉPHONE
WHERE MEMBRE.TYPE_MEMBRE = 'Amateur';


-- Quelles sont les observations confirmées?
SELECT confirme_observ
FROM Observation
WHERE confirme_observ != null
GROUP BY confirme_observ;


-- Quels sites ont été visités en Janvier 2017?
SELECT EXCURSION.SITE_LATITUDE, EXCURSION.SITE_LONGITUDE
FROM EXCURSION
WHERE DATE_EXCURSION >= date '2017-01-01' AND DATE_EXCURSION <= date '2017-01-31' ;


-- Quel site a été le plus visité depuis que nous avons commencé la collecte des données?
SELECT MAX (Nombre)
FROM (SELECT SITE_LATITUDE, COUNT(SITE_LATITUDE) Nombre
      FROM EXCURSION
      GROUP BY SITE_LATITUDE, SITE_LONGITUDE);


-- Combien de bagues avons-nous déposé?
SELECT COUNT(numéro_bague)
FROM Bague;


-- Quelles sont les espèces qui partent au mois d’Octobre de chaque année?
SELECT nom_espèce
FROM Espèce_migrante
WHERE mois_dèpart = 10;


-- Quand ces espèces viennent il au Québec?
SELECT nom_espèce, mois_retour
FROM Espèce_migrante
WHERE mois_dèpart = 10;


-- Notre catalogue contient combien d’espèces migratrices?
SELECT COUNT(nom_espèce)
FROM Espèce_migrante

