 -- TP01

-- Suppression si bdd exist
DROP DATABASE invitation;

-- Création de la bdd
CREATE DATABASE invitation;

-- Utilisation de la bdd
USE invitation;

-- Création de la table
CREATE TABLE invPersonne (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR(30),
    nom VARCHAR(30),
    age INT,
    date_inscription DATE,
    status BOOLEAN,
    type ENUM('membre', 'non membre'),
    description TEXT,
    salaire_annuel DECIMAL(12, 2)
);