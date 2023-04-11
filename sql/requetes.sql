-- Afficher la liste des commandes ( la liste doit faire apparaitre la date, les informations du client, le plat et le prix )
SELECT date_commande, nom_client, telephone_client, email_client, adresse_client, plat.libelle, plat.prix
FROM commande
JOIN plat ON plat.id = commande.id_plat

-- Afficher la liste des plats en spécifiant la catégorie
SELECT plat.libelle, categorie.libelle
FROM plat
JOIN categorie ON categorie.id = plat.id_categorie

-- Afficher les catégories et le nombre de plats actifs dans chaque catégorie
SELECT categorie.libelle, count(plat.id_categorie)
FROM categorie
JOIN plat ON plat.id_categorie = categorie.id
WHERE plat.active = "YES"
GROUP BY categorie.libelle

-- Liste des plats les plus vendus par ordre décroissant
SELECT plat.libelle, count(commande.id_plat)
FROM plat
JOIN commande ON commande.id_plat = plat.id
GROUP BY commande.id_plat
ORDER BY count(commande.id_plat) DESC

-- Le plat le plus rémunérateur
SELECT libelle, MAX(prix)
FROM plat

-- Liste des clients et le chiffre d'affaire généré par client (par ordre décroissant)
SELECT nom_client, total
FROM commande
ORDER BY total DESC

-- Ecrivez une requête permettant de supprimer les plats non actif de la base de données
DELETE FROM plat
WHERE active = "NO"

-- Ecrivez une requête permettant de supprimer les commandes avec le statut livré
DELETE FROM commande
WHERE etat = "livré"

-- Ecrivez un script sql permettant d'ajouter une nouvelle catégorie et un plat dans cette nouvelle catégorie.
INSERT INTO categorie
VALUES 
(15, 'nom_cat', 'image_cat.jpg', 'NO')

INSERT INTO plat
VALUES
(18,'nom_plat','une super description',10.00,'image_plat.jpg',15,'NO')

-- Ecrivez une requête permettant d'augmenter de 10% le prix des plats de la catégorie 'Pizza'
UPDATE plat
SET prix = prix+10%
WHERE id_categorie = 4