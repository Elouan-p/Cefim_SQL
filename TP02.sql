-- insérer les valeurs dans la table film
INSERT INTO invpersonne VALUES ("1","Brad","PITT","60","1970-01-01","1","non membre","lorem ipsum","2000000"), 
("2","George","CLOONEY","62","1999-01-01","1","membre","juste beau","4000000"),
 ("3","Jean","DUJARDIN","51","1994-01-01","0","membre","brice de nice","1000000")

 -- Afficher le salaire Max
SELECT MAX(`salaire_annuel`) AS Plus_Gros FROM invpersonne; 

-- Afficher le plus petit chiffre d'affaire
SELECT MIN(salaire_annuel) AS plus_petit_CA FROM invPersonne;

-- Afficher le nom de la personne du plus petit CA
SELECT nom FROM invPersonne WHERE salaire_annuel = (SELECT MIN(salaire_annuel) FROM invPersonne);

-- Afficher le nom de la personne du plus gros CA
SELECT nom FROM invPersonne WHERE salaire_annuel = (SELECT MAX(salaire_annuel) FROM invPersonne);

-- Afficher le CA moyen
SELECT AVG(salaire_annuel) AS CA_moyen FROM invPersonne;

-- Afficher le nombre de clients
SELECT COUNT() AS nombre_de_clients FROM invPersonne;

-- Requête avec BETWEEN pour afficher les personnes dont le CA est entre 800000 et 1500000
SELECT FROM invPersonne WHERE salaire_annuel BETWEEN 800000 AND 1500000;

-- Requête avec UCASE(), UPPER(), LCASE(), LOWER() pour afficher les noms en majuscules et minuscules
SELECT UCASE(prenom) AS prenom_majuscule, LCASE(prenom) AS prenom_minuscule FROM invPersonne;

-- Requête avec LIKE '%..%' pour afficher les personnes dont le nom contient "lo"
SELECT * FROM invPersonne WHERE nom LIKE '%lo%';

-- Requête pour tri par âge décroissant
SELECT * FROM invPersonne ORDER BY age DESC;