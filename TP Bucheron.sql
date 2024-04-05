-- TP Bucheron

-- Code dbdiagram.io
CREATE SCHEMA `location_skis`;

CREATE TABLE `location_skis`.`clients` (
  `noCLI` INT PRIMARY KEY NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30),
  `adresse` varchar(120),
  `cpo` varchar(5) NOT NULL,
  `ville` varchar(80) NOT NULL
);

CREATE TABLE `location_skis`.`fiches` (
  `noFIC` INT PRIMARY KEY,
  `noCLI` INT NOT NULL,
  `DateCrea` datetime NOT NULL,
  `DatePaye` datetime,
  `etat` enum(EC,SO) NOT NULL
);

CREATE TABLE `location_skis`.`lignesfic` (
  `NOFIC` INT,
  `NOLIG` INT NOT NULL,
  `refart` char(8) NOT NULL,
  `depart` datetime NOT NULL,
  `retour` datetime,
  PRIMARY KEY (`NOFIC`, `NOLIG`)
);

CREATE TABLE `location_skis`.`articles` (
  `refart` char(5) PRIMARY KEY NOT NULL,
  `designation` varchar(80) NOT NULL,
  `CodeGam` Char(5),
  `CodeCate` Char(5)
);

CREATE TABLE `location_skis`.`grilletarifs` (
  `CodeGam` Char(5) NOT NULL,
  `CodeCate` Char(5) NOT NULL,
  `codeTarif` char(5),
  PRIMARY KEY (`CodeGam`, `CodeGate`)
);

CREATE TABLE `location_skis`.`tarifs` (
  `codeTarif` char(5) PRIMARY KEY NOT NULL,
  `libelle` VarChar(30) NOT NULL,
  `prixjour` Decimal(5) NOT NULL
);

CREATE TABLE `location_skis`.`categories` (
  `CodeCate` Char(5) PRIMARY KEY NOT NULL,
  `libelle` Varchar(30) NOT NULL
);

CREATE TABLE `location_skis`.`gammes` (
  `CodeGam` Char(5) PRIMARY KEY NOT NULL,
  `libelle` Varchar(45) NOT NULL
);

ALTER TABLE `location_skis`.`fiches` ADD FOREIGN KEY (`noCLI`) REFERENCES `location_skis`.`clients` (`noCLI`);

ALTER TABLE `location_skis`.`lignesfic` ADD FOREIGN KEY (`NOFIC`) REFERENCES `location_skis`.`fiches` (`noFIC`);

ALTER TABLE `location_skis`.`articles` ADD FOREIGN KEY (`refart`) REFERENCES `location_skis`.`lignesfic` (`refart`);

ALTER TABLE `location_skis`.`grilletarifs` ADD FOREIGN KEY (`CodeGam`) REFERENCES `location_skis`.`articles` (`CodeGam`);

ALTER TABLE `location_skis`.`grilletarifs` ADD FOREIGN KEY (`CodeCate`) REFERENCES `location_skis`.`articles` (`CodeCate`);

ALTER TABLE `location_skis`.`gammes` ADD FOREIGN KEY (`CodeGam`) REFERENCES `location_skis`.`grilletarifs` (`CodeGam`);

ALTER TABLE `location_skis`.`categories` ADD FOREIGN KEY (`CodeCate`) REFERENCES `location_skis`.`grilletarifs` (`CodeCate`);

ALTER TABLE `location_skis`.`tarifs` ADD FOREIGN KEY (`codeTarif`) REFERENCES `location_skis`.`grilletarifs` (`codeTarif`);



-- -----------------------------------------------------
-- Data for table `location_skis`.`clients`
-- -----------------------------------------------------
START TRANSACTION;
USE `location_skis`;
INSERT INTO `location_skis`.`clients` (`noCli`, `nom`, `prenom`, `adresse`, `cpo`, `ville`) VALUES (1, 'Albert', 'Anatole', 'Rue des accacias', '61000', 'Amiens');
INSERT INTO `location_skis`.`clients` (`noCli`, `nom`, `prenom`, `adresse`, `cpo`, `ville`) VALUES (2, 'Bernard', 'Barnabé', 'Rue du bar', '1000', 'Bourg en Bresse');
INSERT INTO `location_skis`.`clients` (`noCli`, `nom`, `prenom`, `adresse`, `cpo`, `ville`) VALUES (3, 'Dupond', 'Camille', 'Rue Crébillon', '44000', 'Nantes');
INSERT INTO `location_skis`.`clients` (`noCli`, `nom`, `prenom`, `adresse`, `cpo`, `ville`) VALUES (4, 'Desmoulin', 'Daniel', 'Rue descendante', '21000', 'Dijon');
INSERT INTO `location_skis`.`clients` (`noCli`, `nom`, `prenom`, `adresse`, `cpo`, `ville`) VALUES (5, 'Ernest', 'Etienne', 'Rue de l’échaffaud', '42000', 'Saint Étienne');
INSERT INTO `location_skis`.`clients` (`noCli`, `nom`, `prenom`, `adresse`, `cpo`, `ville`) VALUES (6, 'Ferdinand', 'François', 'Rue de la convention', '44100', 'Nantes');
INSERT INTO `location_skis`.`clients` (`noCli`, `nom`, `prenom`, `adresse`, `cpo`, `ville`) VALUES (9, 'Dupond', 'Jean', 'Rue des mimosas', '75018', 'Paris');
INSERT INTO `location_skis`.`clients` (`noCli`, `nom`, `prenom`, `adresse`, `cpo`, `ville`) VALUES (14, 'Boutaud', 'Sabine', 'Rue des platanes', '75002', 'Paris');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location_skis`.`fiches`
-- -----------------------------------------------------
START TRANSACTION;
USE `location_skis`;
INSERT INTO `location_skis`.`fiches` (`noFic`, `noCli`, `dateCrea`, `datePaye`, `etat`) VALUES (1001, 14,  DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY),'SO');
INSERT INTO `location_skis`.`fiches` (`noFic`, `noCli`, `dateCrea`, `datePaye`, `etat`) VALUES (1002, 4,  DATE_SUB(NOW(),INTERVAL  13 DAY), NULL, 'EC');
INSERT INTO `location_skis`.`fiches` (`noFic`, `noCli`, `dateCrea`, `datePaye`, `etat`) VALUES (1003, 1,  DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY),'SO');
INSERT INTO `location_skis`.`fiches` (`noFic`, `noCli`, `dateCrea`, `datePaye`, `etat`) VALUES (1004, 6,  DATE_SUB(NOW(),INTERVAL  11 DAY), NULL, 'EC');
INSERT INTO `location_skis`.`fiches` (`noFic`, `noCli`, `dateCrea`, `datePaye`, `etat`) VALUES (1005, 3,  DATE_SUB(NOW(),INTERVAL  10 DAY), NULL, 'EC');
INSERT INTO `location_skis`.`fiches` (`noFic`, `noCli`, `dateCrea`, `datePaye`, `etat`) VALUES (1006, 9,  DATE_SUB(NOW(),INTERVAL  10 DAY),NULL ,'RE');
INSERT INTO `location_skis`.`fiches` (`noFic`, `noCli`,  `dateCrea`,`datePaye`, `etat`) VALUES (1007, 1,  DATE_SUB(NOW(),INTERVAL  3 DAY), NULL, 'EC');
INSERT INTO `location_skis`.`fiches` (`noFic`, `noCli`,  `dateCrea`,`datePaye`, `etat`) VALUES (1008, 2,  DATE_SUB(NOW(),INTERVAL  0 DAY), NULL, 'EC');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location_skis`.`tarifs`
-- -----------------------------------------------------
START TRANSACTION;
USE `location_skis`;
INSERT INTO `location_skis`.`tarifs` (`codeTarif`, `libelle`, `prixJour`) VALUES ('T1', 'Base', 10);
INSERT INTO `location_skis`.`tarifs` (`codeTarif`, `libelle`, `prixJour`) VALUES ('T2', 'Chocolat', 15);
INSERT INTO `location_skis`.`tarifs` (`codeTarif`, `libelle`, `prixJour`) VALUES ('T3', 'Bronze', 20);
INSERT INTO `location_skis`.`tarifs` (`codeTarif`, `libelle`, `prixJour`) VALUES ('T4', 'Argent', 30);
INSERT INTO `location_skis`.`tarifs` (`codeTarif`, `libelle`, `prixJour`) VALUES ('T5', 'Or', 50);
INSERT INTO `location_skis`.`tarifs` (`codeTarif`, `libelle`, `prixJour`) VALUES ('T6', 'Platine', 90);

COMMIT;


-- -----------------------------------------------------
-- Data for table `location_skis`.`gammes`
-- -----------------------------------------------------
START TRANSACTION;
USE `location_skis`;
INSERT INTO `location_skis`.`gammes` (`codeGam`, `libelle`) VALUES ('PR', 'Matériel Professionnel');
INSERT INTO `location_skis`.`gammes` (`codeGam`, `libelle`) VALUES ('HG', 'Haut de gamme');
INSERT INTO `location_skis`.`gammes` (`codeGam`, `libelle`) VALUES ('MG', 'Moyenne gamme');
INSERT INTO `location_skis`.`gammes` (`codeGam`, `libelle`) VALUES ('EG', 'Entrée de gamme');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location_skis`.`categories`
-- -----------------------------------------------------
START TRANSACTION;
USE `location_skis`;
INSERT INTO `location_skis`.`categories` (`codeCate`, `libelle`) VALUES ('MONO', 'Monoski');
INSERT INTO `location_skis`.`categories` (`codeCate`, `libelle`) VALUES ('SURF', 'Surf');
INSERT INTO `location_skis`.`categories` (`codeCate`, `libelle`) VALUES ('PA', 'Patinette');
INSERT INTO `location_skis`.`categories` (`codeCate`, `libelle`) VALUES ('FOA', 'Ski de fond alternatif');
INSERT INTO `location_skis`.`categories` (`codeCate`, `libelle`) VALUES ('FOP', 'Ski de fond patineur');
INSERT INTO `location_skis`.`categories` (`codeCate`, `libelle`) VALUES ('SA', 'Ski alpin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location_skis`.`grilletarifs`
-- -----------------------------------------------------
START TRANSACTION;
USE `location_skis`;
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('EG', 'MONO', 'T1');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('MG', 'MONO', 'T2');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('EG', 'SURF', 'T1');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('MG', 'SURF', 'T2');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('HG', 'SURF', 'T3');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('PR', 'SURF', 'T5');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('EG', 'PA', 'T1');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('MG', 'PA', 'T2');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('EG', 'FOA', 'T1');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('MG', 'FOA', 'T2');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('HG', 'FOA', 'T4');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('PR', 'FOA', 'T6');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('EG', 'FOP', 'T2');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('MG', 'FOP', 'T3');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('HG', 'FOP', 'T4');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('PR', 'FOP', 'T6');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('EG', 'SA', 'T1');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('MG', 'SA', 'T2');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('HG', 'SA', 'T4');
INSERT INTO `location_skis`.`grilletarifs` (`codeGam`, `codeCate`, `codeTarif`) VALUES ('PR', 'SA', 'T6');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location_skis`.`articles`
-- -----------------------------------------------------
START TRANSACTION;
USE `location_skis`;
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F01', 'Fischer Cruiser', 'EG', 'FOA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F02', 'Fischer Cruiser', 'EG', 'FOA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F03', 'Fischer Cruiser', 'EG', 'FOA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F04', 'Fischer Cruiser', 'EG', 'FOA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F05', 'Fischer Cruiser', 'EG', 'FOA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F10', 'Fischer Sporty Crown', 'MG', 'FOA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F20', 'Fischer RCS Classic GOLD', 'PR', 'FOA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F21', 'Fischer RCS Classic GOLD', 'PR', 'FOA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F22', 'Fischer RCS Classic GOLD', 'PR', 'FOA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F23', 'Fischer RCS Classic GOLD', 'PR', 'FOA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F50', 'Fischer SOSSkating VASA', 'HG', 'FOP');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F60', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F61', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F62', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F63', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('F64', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('P01', 'Décathlon Allegre junior 150', 'EG', 'PA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('P10', 'Fischer mini ski patinette', 'MG', 'PA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('P11', 'Fischer mini ski patinette', 'MG', 'PA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('S01', 'Décathlon Apparition', 'EG', 'SURF');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('S02', 'Décathlon Apparition', 'EG', 'SURF');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('S03', 'Décathlon Apparition', 'EG', 'SURF');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('A01', 'Salomon 24X+Z12', 'EG', 'SA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('A02', 'Salomon 24X+Z12', 'EG', 'SA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('A03', 'Salomon 24X+Z12', 'EG', 'SA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('A04', 'Salomon 24X+Z12', 'EG', 'SA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('A05', 'Salomon 24X+Z12', 'EG', 'SA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('A10', 'Salomon Pro Link Equipe 4S', 'PR', 'SA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('A11', 'Salomon Pro Link Equipe 4S', 'PR', 'SA');
INSERT INTO `location_skis`.`articles` (`refart`, `designation`, `codeGam`, `codeCate`) VALUES ('A21', 'Salomon 3V RACE JR+L10', 'PR', 'SA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location_skis`.`lignesfic`
-- -----------------------------------------------------
START TRANSACTION;
USE `location_skis`;
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1001, 1, 'F05', DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY));
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1001, 2, 'F50', DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  14 DAY));
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1001, 3, 'F60', DATE_SUB(NOW(),INTERVAL  13 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY));
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1002, 1, 'A03', DATE_SUB(NOW(),INTERVAL  13 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY));
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1002, 2, 'A04', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  7 DAY));
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1002, 3, 'S03', DATE_SUB(NOW(),INTERVAL  8 DAY), NULL);
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1003, 1, 'F50', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY));
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1003, 2, 'F05', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY));
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1004, 1, 'P01', DATE_SUB(NOW(),INTERVAL  6 DAY), NULL);
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1005, 1, 'F05', DATE_SUB(NOW(),INTERVAL  9 DAY), DATE_SUB(NOW(),INTERVAL  5 DAY));
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1005, 2, 'F10', DATE_SUB(NOW(),INTERVAL  4 DAY), NULL);
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1006, 1, 'S01', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY));
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1006, 2, 'S02', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY));
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1006, 3, 'S03', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY));
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1007, 1, 'F50', DATE_SUB(NOW(),INTERVAL  3 DAY), DATE_SUB(NOW(),INTERVAL  2 DAY));
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1007, 3, 'F60', DATE_SUB(NOW(),INTERVAL  1 DAY), NULL);
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1007, 2, 'F05', DATE_SUB(NOW(),INTERVAL  3 DAY), NULL);
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1007, 4, 'S02', DATE_SUB(NOW(),INTERVAL  0 DAY), NULL);
INSERT INTO `location_skis`.`lignesfic` (`noFic`, `noLig`, `refart`, `depart`, `retour`) VALUES (1008, 1, 'S01', DATE_SUB(NOW(),INTERVAL  0 DAY), NULL);

COMMIT;

-- Requêtes --

-- Clients dont le nom commence par D
SELECT * from clients where nom LIKE ('D%'); 

--Nom et prenom de tout les clients
SELECT nom,prenom from clients; 

-- Liste des fiches, noms, prenom des clients qui habitent en loire atlantique(44)
SELECT noFIC,etat,c.nom,c.prenom from clients as c natural join fiches where cpo LIKE('44%'); 

-- Détail de la fiche 1002
SELECT f.noFIC,c.nom,c.prenom,a.refart,a.designation,l.depart,l.retour,t.prixjour, DATEDIFF(l.retour, l.depart) * t.prixjour AS montant 
from clients as c 
INNER join fiches as f on c.noCLI = f.noCLI 
INNER JOIN lignesfic as l on f.noFIC = l.NOFIC 
INNER JOIN articles as a on l.refart = a.refart
inner JOIN grilletarifs as g on a.CodeGam = g.CodeGam and a.CodeCate = g.CodeCate
INNER join tarifs as t on g.codeTarif = t.codeTarif 
where f.noFIC ="1002"; 

-- prix journalier moyen de location de gamme
SELECT g.libelle, AVG(t.prixjour) from gammes as g left join grilletarifs as gt on g.codeGam = gt.CodeGam left join tarifs as t on gt.codeTarif = t.codeTarif GROUP by g.libelle; 

-- liste des articles qui ont été loués au moins trois fois
SELECT a.refart, a.designation from articles as a 
left join lignesfic as l on a.refart = l.refart 
GROUP by a.refart HAVING COUNT(l.refart) >=3; 

-- Détail de la fiche 1002 avec le total
SELECT f.noFic, c.nom, c.prenom, l.refart, a.designation, l.depart, COALESCE(l.retour, CURDATE()) AS retour,
       t.prixjour,
       DATEDIFF(COALESCE(l.retour, CURDATE()), l.depart) * t.prixjour AS montant,
       (SELECT SUM(DATEDIFF(COALESCE(l.retour, CURDATE()), l.depart) * t.prixjour)
        FROM location_skis.lignesfic l
        JOIN location_skis.articles a ON l.refart = a.refart
        JOIN location_skis.grilletarifs gt ON a.codeGam = gt.codeGam AND a.codeCate = gt.codeCate
        JOIN location_skis.tarifs t ON gt.codeTarif = t.codeTarif
        WHERE l.noFic = f.noFic) AS total
FROM location_skis.fiches f
JOIN location_skis.clients c ON f.noCli = c.noCli
JOIN location_skis.lignesfic l ON f.noFic = l.noFic
JOIN location_skis.articles a ON l.refart = a.refart
JOIN location_skis.grilletarifs gt ON a.codeGam = gt.codeGam AND a.codeCate = gt.codeCate
JOIN location_skis.tarifs t ON gt.codeTarif = t.codeTarif
WHERE f.noFic = 1002;


-- Requetes Facultatives

-- h. Grille des tarifs
SELECT gt.codeGam, gt.codeCate, gt.codeTarif, t.libelle AS libelle_tarif, t.prixjour
FROM location_skis.grilletarifs gt
JOIN location_skis.tarifs t ON gt.codeTarif = t.codeTarif;

-- i. Liste des locations de la catégorie SURF
SELECT f.noFic, l.refart, a.designation, l.depart, l.retour
FROM location_skis.fiches f
JOIN location_skis.lignesfic l ON f.noFic = l.noFic
JOIN location_skis.articles a ON l.refart = a.refart
JOIN location_skis.categories c ON a.codeCate = c.codeCate
WHERE c.libelle = 'SURF';

-- j. Calcul du nombre moyen d’articles loués par fiche de location
SELECT AVG(nb_articles) AS nombre_moyen_articles_par_fiche
FROM (SELECT noFic, COUNT(*) AS nb_articles FROM location_skis.lignesfic GROUP BY noFic) AS subquery;

-- k. Calcul du nombre de fiches de location établies pour les catégories de location Ski alpin, Surf et Patinette
SELECT c.libelle AS categorie, COUNT(*) AS nombre_fiches
FROM location_skis.fiches f
JOIN location_skis.lignesfic l ON f.noFic = l.noFic
JOIN location_skis.articles a ON l.refart = a.refart
JOIN location_skis.categories c ON a.codeCate = c.codeCate
WHERE c.libelle IN ('Ski alpin', 'SURF', 'Patinette')
GROUP BY c.libelle;

-- l. Calcul du montant moyen des fiches de location
SELECT AVG(total_montant) AS montant_moyen_fiche
FROM (
    SELECT f.noFic, SUM(DATEDIFF(l.retour, l.depart) * t.prixjour) AS total_montant
    FROM location_skis.fiches f
    JOIN location_skis.lignesfic l ON f.noFic = l.noFic
    JOIN location_skis.articles a ON l.refart = a.refart
    JOIN location_skis.grilletarifs gt ON a.codeGam = gt.codeGam AND a.codeCate = gt.codeCate
    JOIN location_skis.tarifs t ON gt.codeTarif = t.codeTarif
    GROUP BY f.noFic
) AS subquery;

-- Liste des clients ayant au moins 1 fiche de location en cours
Select c.nom,c.prenom,c.cpo,c.ville,c.adresse from clients c INNER JOIN fiches f on c.noCLI = f.noCLI WHERE f.DatePaye is NULL; 

--Détail de la fiche de location de Jean Dupond de Paris
Select a.refart, a.designation,l.depart,l.retour, ct.libelle 
from categories ct inner JOIN grilletarifs g on ct.CodeCate = g.CodeCate 
INNER JOIN articles a on g.CodeGam = a.CodeGam and g.CodeCate = a.CodeCate 
INNER JOIN lignesfic l on a.refart = l.refart 
INNER JOIN fiches f on l.NOFIC = f.noFIC 
INNER JOIN clients c on f.noCLI = c.noCLI 
WHERE c.nom = "Dupond" and c.prenom = "Jean" and c.ville = "Paris";

-- Liste de tout les articles dont le libelle contient ski
Select DISTINCT a.refart, a.designation, ct.libelle from articles a inner JOIN grilletarifs g on a.CodeCate = g.CodeCate and a.CodeCate = g.CodeCate INNER JOIN categories ct on g.CodeCate = ct.CodeCate WHERE ct.libelle LIKE ("%ski%"); 

-- Calcul du montant de chaque fiche soldée et du montant total des fiches
SELECT f.noFic, SUM(DATEDIFF(l.retour, l.depart) * t.prixjour) AS montant_fiche
FROM location_skis.fiches f
JOIN location_skis.lignesfic l ON f.noFic = l.noFic
JOIN location_skis.articles a ON lf.refart = a.refart
JOIN location_skis.grilletarifs gt ON a.codeGam = gt.codeGam AND a.codeCate = gt.codeCate
JOIN location_skis.tarifs t ON gt.codeTarif = t.codeTarif
GROUP BY f.noFic WITH ROLLUP;

-- Calcul du nombre d’articles actuellement en cours de location
SELECT COUNT(a.refart) 
from articles a 
INNER JOIN lignesfic l on a.refart = l.refart 
INNER JOIN fiches f on l.NOFIC = f.noFIC 
WHERE f.DatePaye is Null;

-- Calcul du nombre d’articles loués, par client.
SELECT COUNT(a.refart), c.nom, c.prenom
from articles a 
INNER JOIN lignesfic l on a.refart = l.refart 
INNER JOIN fiches f on l.NOFIC = f.noFIC 
INNER JOIN clients c on f.noCLI = c.noCLI
GROUP BY c.prenom,c.nom;

-- Liste des clients qui ont effectué (ou sont en train d’effectuer) plus de 200€ de location
SELECT c.nom, c.prenom, SUM(DATEDIFF(COALESCE(l.retour, CURDATE()), l.depart) * t.prixjour) AS montant 
From clients c join fiches f on c.noCLI = f.noCLI
JOIN lignesfic l on f.noFIC = l.NOFIC
JOIN articles a on l.refart = a.refart
JOIN grilletarifs gt on a.CodeCate = gt.CodeCate and a.CodeGam = gt.CodeGam
JOIN tarifs t on gt.codeTarif = t.codeTarif
GROUP BY nom,prenom
HAVING SUM(DATEDIFF(COALESCE(l.retour, CURDATE()), l.depart) * t.prixjour)> 200;

--Liste de tous les articles (loués au moins une fois) et le nombre de fois où ils ont été loués, triés du plus loué au moins loué.
SELECT a.*, COUNT(lf.refart) AS nombre_locations
FROM location_skis.articles a
JOIN location_skis.lignesfic lf ON a.refart = lf.refart
GROUP BY a.refart, a.designation
ORDER BY nombre_locations DESC;

-- Liste des fiches (n°, nom, prénom) de moins de 150€.
SELECT f.noFic, c.nom, c.prenom
FROM location_skis.fiches f
JOIN location_skis.clients c ON f.noCli = c.noCli
JOIN location_skis.lignesfic l ON f.noFic = l.noFic
JOIN location_skis.articles a ON l.refart = a.refart
JOIN location_skis.grilletarifs gt ON a.codeGam = gt.codeGam AND a.codeCate = gt.codeCate
JOIN location_skis.tarifs t ON gt.codeTarif = t.codeTarif
GROUP BY f.noFic, c.nom, c.prenom
HAVING SUM(DATEDIFF(COALESCE(l.retour, CURDATE()), l.depart) * t.prixjour) < 150;

-- Calcul de la moyenne des recettes de location de surf (combien peut-on espérer gagner pour une location d'un surf ?).
SELECT AVG(DATEDIFF(COALESCE(l.retour, CURDATE()), l.depart)) AS moyenne_recettes_surf
FROM location_skis.lignesfic l
JOIN location_skis.articles a ON l.refart = a.refart
JOIN location_skis.grilletarifs gt ON a.codeGam = gt.codeGam AND a.codeCate = gt.codeCate
JOIN location_skis.tarifs t ON gt.codeTarif = t.codeTarif
JOIN location_skis.categories c ON a.codeCate = c.codeCate
WHERE c.libelle = 'SURF';

-- Calcul de la durée moyenne d'une location d'une paire de skis (en journées entières).
SELECT FLOOR(AVG(DATEDIFF(COALESCE(l.retour, CURDATE()), l.depart))) AS duree_moyenne_location_skis
FROM location_skis.lignesfic l
JOIN location_skis.articles a ON l.refart = a.refart
JOIN location_skis.grilletarifs gt ON a.codeGam = gt.codeGam AND a.codeCate = gt.codeCate
JOIN location_skis.tarifs t ON gt.codeTarif = t.codeTarif
JOIN location_skis.categories c ON a.codeCate = c.codeCate
WHERE c.libelle LIKE '%ski%';