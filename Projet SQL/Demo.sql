 -- Commentaire
# Commentaire
 -- Norme d'écriture
 -- nom des tables
 -- nom des champs
 
 -- Snake case
 -- ma_super_bdd

 -- Camel case
 -- maSuperBdd

 -- Pascal case : nom des classes
 -- MaSuperBdd

 -- Kebab case
 -- ma-super-page.html

 --Create DATABASE ma_base;

CREATE DATABASE videotheque CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

 -- DROP DATABASE ma_data_base

-- je selectionne ma database : videotheque
USE videotheque;
# creation table film;
CREATE TABLE film (
  id int NOT NULL AUTO_INCREMENT,
  titre VARCHAR(255) NOT NULL,
  sortie DATE NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Suppression si bdd exist
DROP DATABASE invitation;

-- Création de la bdd
CREATE DATABASE invitation;

-- Utilisation de la bdd
USE invitation;

-- Création de la table
CREATE TABLE invPersonne (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR(50),
    nom VARCHAR(50),
    age INT,
    date_inscription DATE,
    status BOOLEAN,
    type ENUM('membre', 'non membre'),
    description TEXT,
    salaire_annuel DECIMAL(10, 2)
);