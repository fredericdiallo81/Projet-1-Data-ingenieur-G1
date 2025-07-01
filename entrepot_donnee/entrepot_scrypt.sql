-- Schéma propre (optionnel)
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

-- dim_clients
CREATE TABLE dim_clients (
    id_client INT PRIMARY KEY,
    nom TEXT,
    prenom TEXT,
    email TEXT,
    telephone TEXT,
    region TEXT,
    pays TEXT
);

-- dim_produits
CREATE TABLE dim_produits (
    id_produit INT PRIMARY KEY,
    nom_produit TEXT,
    categorie TEXT,
    prix NUMERIC(10,2)
);

-- dim_regions
CREATE TABLE dim_regions (
    id_region INT PRIMARY KEY,
    nom_region TEXT,
    pays TEXT
);

-- dim_commerciaux
CREATE TABLE dim_commerciaux (
    id_commercial INT PRIMARY KEY,
    nom TEXT,
    prenom TEXT,
    email TEXT,
    id_region INT
);

-- dim_temps
CREATE TABLE dim_temps (
    id_date DATE PRIMARY KEY,
    jour INTEGER,
    mois INTEGER,
    trimestre INTEGER,
    annee INTEGER
);

-- faits_commandes
CREATE TABLE faits_commandes (
    id_commande INT PRIMARY KEY,
    id_client INT,
    id_produit INT,
    id_commercial INT,
    id_region INT,
    id_date DATE,
    quantite INTEGER,
    montant_total NUMERIC(18,2)
);