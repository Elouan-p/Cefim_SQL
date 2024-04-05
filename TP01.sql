 -- TP01

-- Suppression si bdd exist
DROP DATABASE invitation;

-- Création de la bdd
CREATE DATABASE invitation;

-- Utilisation de la bdd
USE invitation;

-- Création de la table
CREATE TABLE invPersonne (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR(30) NOT NULL ,
    nom VARCHAR(30) NOT NULL ,
    age TINYINT(1) NOT NULL ,
    inscription DATE NOT NULL,
    status TINYINT(1) NOT NULL DEFAULT 1 ,
    type ENUM('membre', 'non membre') NOT NULL DEFAULT "non membre" ,
    description TEXT NOT NULL ,
    salaire_annuel DECIMAL(12, 2) NOT NULL 
);