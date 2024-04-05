 -- TP03
 -- Creation BDD
 CREATE DATABASE TP03 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE TP03;

 -- On supprime les tables si elles existent
DELETE FROM client;
DELETE FROM projet;
DELETE FROM devis;
DELETE FROM facture;

 -- Création des tables
CREATE TABLE client ( 
	id int AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(255) Not Null);

CREATE TABLE projet ( 
	id int AUTO_INCREMENT PRIMARY KEY,
    client_id int NOT Null,
    Constraint client_id FOREIGN KEY(id)
    REFERENCES client (id),
	nom VARCHAR(255) Not Null);

CREATE TABLE devis ( 
	id int AUTO_INCREMENT PRIMARY KEY,
    version int Not Null,
    reference VARCHAR(10) Not Null,
    prix Float Not Null,
    projet_id int NOT Null,
    Constraint projet_id FOREIGN KEY(id)
	REFERENCES projet (id));

CREATE TABLE facture ( 
	id int AUTO_INCREMENT PRIMARY KEY,
    reference VARCHAR(10) Not Null,
    info VARCHAR(10) Not Null,
    total Float Not Null,
    date_crea Date Not Null,
    date_paiement Date,
    devis_id int NOT Null,
    Constraint devis_id FOREIGN KEY(id)
	REFERENCES devis (id));

 -- On insère les valeurs
INSERT INTO client (nom) VALUES 
	('Mairie de Rennes'),
	('Neo Soft'),
	('Sopra'),
	('Accenture'),
	('Amazon');

INSERT INTO projet (nom, client_id) VALUES
	('Création de site internet', 1),
	('Creationde site internet', 1),
	('Logiciel CRM', 2),
	('Logiciel de devis', 3),
	('Site internet e-commerce', 4),
	('Logiciel ERP', 2),
	('Logicielgestion de stock',4);

    
INSERT INTO devis (version,reference, prix, projet_id) VALUES
	('1','DEV2100A', 3000, 1),
	('2','DEV2100B', 5000, 2),
	('1','DEV2100C', 5000, 3),
	('1','DEV2100D', 3000, 4),
	('1','DEV2100E', 5000, 5),
	('1','DEV2100F', 2000, 6),
	('1','DEV2100G', 1000, 7);

INSERT INTO facture (reference,info,total,devis_id,date_crea,date_paiement)	
    VALUES
	('FA001', 'site internet partie 1', 1500, 1, '2023-09-01','2023-10-01'),
	('FA002', 'site internet partie 2', 1500, 1, '2023-09-20',null),
	('FA003', 'logiciel CRM', 5000, 2, '2024-02-01',null),
	('FA004', 'logiciel devis', 3000, 3, '2024-03-03','2024-04-03'),
	('FA005', 'site ecommerce', 5000, 4, '2024-04-01',null),
	('FA006', 'logiciel ERP', 2000, 2, '2024-04-01',null);


 -- Requetes

 -- Factures avec les noms de clients
 SELECT f.id,f.reference,f.info,f.total,f.date_crea,f.date_paiement,f.devis_id,client.nom as cn from facture as f INNER JOIN devis ON f.devis_id = devis.id INNER JOIN projet ON devis.projet_id = projet.id INNER Join client ON projet.client_id=client.id; 

 --Nombre de factures par client
 SELECT c.nom as cn, COUNT(f.id) from client as c LEFT Join projet as p ON p.client_id=c.id LEFT JOIN devis as d ON p.id = d.projet_id LEFT JOIN facture as f ON d.id = f.devis_id GROUP BY c.nom

 -- afficher le chiffre d'affaire par client
 SELECT c.nom as cn, SUM(f.total) from client as c LEFT Join projet as p ON p.client_id=c.id LEFT JOIN devis as d ON p.id = d.projet_id LEFT JOIN facture as f ON d.id = f.devis_id GROUP BY c.nom

 -- afficher le CA total
 SELECT SUM(f.total) from facture as f;

 -- afficher la somme des factures en attente de paiement
 SELECT SUM(f.total) from facture as f where f.date_paiement is Null;

 -- afficher les factures en retard de paiment 30 jours max avec le nombre de jours de retard
 SELECT f.reference, f.info, f.total, DATEDIFF(f.date_crea,Curdate()) from facture as f where f.date_paiement AND DATEDIFF(CURDATE(), f.date_paiement) > 30;

 -- Code pour le modèle relationnel
 Table client {
  id INT [primary key]
  nom varchar(255) [not null]
}

Table projet {
  id INT [primary key]
  client_id INT [not null] 
  nom varchar(255)
}

Table devis {
  id INT [primary key]
  version INT [not null]
  reference varchar(10) [not null]
  prix float [not null]
  projet_id INT [not null]
}

Table facture {
  id INT [primary key]
  reference varchar(10) [not null]
  info varchar(255) [not null]
  total float [not null]
  date_crea date [not null]
  date_paiement date
  devis_id INT [not null]
}

Ref: client.id < projet.client_id

Ref: projet.id < devis.projet_id

Ref: devis.id < facture.devis_id  