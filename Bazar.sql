-- Bazar 

SELECT * from facture where devis_id =(SELECT id from devis where projet_id = (SELECT id from projet where client_id = (select nom from client where id = projet.client_id))); 