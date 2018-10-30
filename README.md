# Repertorier les oiseaux du Québec
## Base de données pour les ornithologues

- Modélisation Gestion de bases de données
- Cegep Saint-Jean-sur-Richelieu
- 2017/02/02

# Consignes
L’association des ornithologues1 amateurs et professionnels du Québec souhaite mettre sur pied une base de données regroupant les observations des oiseaux du Québec. Cette base de données servira à : 

- répertorier toutes les observations d’oiseaux effectuées par les ornithologues;
- réviser la liste des espèces d’oiseaux peuplant le Québec;
- confirmer les dates de migration des espèces;
- estimer les populations d’oiseaux et leur évolution. 

Le réseau d’ornithologues fonctionne de la manière suivante. Un ensemble de sites d’observations ont été définis et sont répertoriés par leur nom, leurs coordonnées géographiques et une courte description. Les coordonnées géographiques (coordonnée x et coordonnée y) définissent un point géographique qui se trouve au centre de la surface correspondant au site et qui l’identifient. 

Il est aussi possible qu’une excursion soit organisée dans un site non répertorié. Dans ce cas le site sera identifié par un degré de longitude et de latitude précis si le groupe d’observateur possède un système GPS, approximatif sinon (si on utilise une carte et une boussole). On doit garder l’information nous indiquant si la mesure est précise ou approximative. 
Les ornithologues organisent des excursions qui, pour une durée définie (de un à plusieurs jours), regroupent des ornithologues et des amateurs (de un à 5) et visitent l’un des sites d’observation. Les ornithologues et les amateurs sont tous des membres de l’association et il est important de connaître l’ensemble des participants à une excursion et de savoir si une observation donnée a été faite par un amateur ou par un ornithologue.  

Pour chaque membre, on garde la date d’adhésion à l’association. 
Les observateurs disposent également d’un catalogue des espèces d’oiseaux du Québec. Une espèce est toujours définie par un nom, un code indiquant si l’espèce est rare ou commune au Québec, une courte description et une photo.  Pour une espèce qui est migratrice, on connaît le mois correspondant généralement à son départ du Québec et le mois correspondant généralement à son retour. Il faut encore préciser que le nom d’une espèce d’oiseau est unique dans le catalogue des espèces. 

Une observation d’oiseau décrit le fait que lors d’une excursion, un observateur a vu un oiseau appartenant à une espèce identifiée. Cette observation est toujours datée d’un jour précis, est effectuée soit à l’œil nu soit à la jumelle et peut faire l’objet d’une description. Il est aussi important pour les spécialistes de pouvoir indiquer si l’observation a porté sur un individu (oiseau) isolé ou un groupe d’individus. Il se peut qu’une observation vienne confirmer une observation effectuée précédemment, c’est à dire qu’un autre jour, un observateur a observé un oiseau de la même espèc
au même endroit. Cette confirmation doit pouvoir être enregistrée explicitement dans la base de données. Une observation peut venir confirmer une observation déjà confirmée. 

En ce qui concerne les espèces d’oiseaux migrateurs, l’association prévoit de lancer un nouveau programme. Il s’agira de capturer des oiseaux de ces espèces, de leur poser une bague numérotée et de les relâcher. Dans la base de données, les ornithologues souhaitent consigner pour chacune de ces bagues, la date de la pose, le nom de l’ornithologue ayant effectué la pose (la pose ne peut pas être effectuée par un amateur), le site où la capture a eu lieu et l’espèce à laquelle appartient l’oiseau bagué. Lorsqu’une bague est posée sur un oiseau, il faut s’assurer que dans la base de données il existe une observation correspondante. 

# Les requêtes 
Les requêtes que les utilisateurs de la base de données aimeraient pouvoir faire sur ces données sont par exemple : 
- Quels sont les sites non répertoriés? 
- Quelles sont les observations faites par les ornithologues?
- Combien d’observations ont été faites par des amateurs?
- Quelles sont les observations confirmées?
- Quels sites ont été visités en Janvier 2017?
- Quel site a été le plus visité depuis que nous avons commencé la collecte des données?
- Combien de bagues avons-nous déposé?
- Quelles sont les espèces qui partent au mois d’Octobre de chaque année?
- Quand ces espèces viennent il au Québec?
- Notre catalogue contient combien d’espèces migratrices? 
