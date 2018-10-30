-- SCRIPTES REQUETES


-- Quels sont les sites non r�pertori�s?
SELECT * FROM "SITE_NON_REPERTORI�"


-- Quelles sont les observations faites par les ornithologues?
SELECT * 
FROM OBSERVATION
INNER JOIN MEMBRE
ON OBSERVATION.MEMBRE_NOM=MEMBRE.NOM_MEMBRE 
  AND OBSERVATION.MEMBRE_PR�NOM=MEMBRE.PR�NOM_MEMBRE
  AND OBSERVATION.MEMBRE_T�L�PHONE=MEMBRE.T�L�PHONE
WHERE MEMBRE.TYPE_MEMBRE = 'Ornithologue';


-- Combien d�observations ont �t� faites par des amateurs?
SELECT COUNT(OBSERVATION.MEMBRE_NOM)
FROM OBSERVATION
INNER JOIN MEMBRE
ON OBSERVATION.MEMBRE_NOM=MEMBRE.NOM_MEMBRE 
  AND OBSERVATION.MEMBRE_PR�NOM=MEMBRE.PR�NOM_MEMBRE
  AND OBSERVATION.MEMBRE_T�L�PHONE=MEMBRE.T�L�PHONE
WHERE MEMBRE.TYPE_MEMBRE = 'Amateur';


-- Quelles sont les observations confirm�es?
SELECT confirme_observ
FROM Observation
WHERE confirme_observ != null
GROUP BY confirme_observ;


-- Quels sites ont �t� visit�s en Janvier 2017?
SELECT EXCURSION.SITE_LATITUDE, EXCURSION.SITE_LONGITUDE
FROM EXCURSION
WHERE DATE_EXCURSION >= date '2017-01-01' AND DATE_EXCURSION <= date '2017-01-31' ;


-- Quel site a �t� le plus visit� depuis que nous avons commenc� la collecte des donn�es?
SELECT MAX (Nombre)
FROM (SELECT SITE_LATITUDE, COUNT(SITE_LATITUDE) Nombre
      FROM EXCURSION
      GROUP BY SITE_LATITUDE, SITE_LONGITUDE);


-- Combien de bagues avons-nous d�pos�?
SELECT COUNT(num�ro_bague)
FROM Bague;


-- Quelles sont les esp�ces qui partent au mois d�Octobre de chaque ann�e?
SELECT nom_esp�ce
FROM Esp�ce_migrante
WHERE mois_d�part = 10;


-- Quand ces esp�ces viennent il au Qu�bec?
SELECT nom_esp�ce, mois_retour
FROM Esp�ce_migrante
WHERE mois_d�part = 10;


-- Notre catalogue contient combien d�esp�ces migratrices?
SELECT COUNT(nom_esp�ce)
FROM Esp�ce_migrante

