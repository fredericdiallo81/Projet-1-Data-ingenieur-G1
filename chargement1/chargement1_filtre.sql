--  Activer l’extension dblink (nécessaire pour les connexions distantes)
CREATE EXTENSION IF NOT EXISTS dblink;


-- Connexion à la base source
SELECT dblink_connect('src', 'dbname=macrobus_production user=postgres password=2002 host=localhost');

-- dim_clients
INSERT INTO dim_clients (id_client, nom, prenom, email, telephone, region, pays)
SELECT *
FROM dblink('src',
  $$SELECT DISTINCT id_client, nom, prenom, email, telephone, region, pays
    FROM clients
    WHERE nom IS NOT NULL AND prenom IS NOT NULL
    AND email LIKE '%@%' AND email NOT LIKE '%@%@%'
    AND telephone ~ '^[0-9]{7,}$'$$
) AS t(id_client INT, nom TEXT, prenom TEXT, email TEXT, telephone TEXT, region TEXT, pays TEXT);

-- dim_regions
INSERT INTO dim_regions (id_region, nom_region, pays)
SELECT *
FROM dblink('src',
  'SELECT DISTINCT id_region, nom_region, pays FROM regions'
) AS t(id_region INT, nom_region TEXT, pays TEXT);

-- dim_produits
INSERT INTO dim_produits (id_produit, nom_produit, categorie, prix)
SELECT *
FROM dblink('src',
  'SELECT DISTINCT id_produit, nom_produit, categorie, prix FROM produits WHERE prix IS NOT NULL AND prix > 0'
) AS t(id_produit INT, nom_produit TEXT, categorie TEXT, prix NUMERIC);

-- dim_commerciaux
INSERT INTO dim_commerciaux (id_commercial, nom, prenom, email, id_region)
SELECT *
FROM dblink('src',
  $$SELECT DISTINCT c.id_commercial, c.nom, c.prenom, c.email, c.id_region
    FROM commerciaux c
    JOIN regions r ON c.id_region = r.id_region
    WHERE c.nom IS NOT NULL AND c.prenom IS NOT NULL
    AND c.email LIKE '%@%'$$
) AS t(id_commercial INT, nom TEXT, prenom TEXT, email TEXT, id_region INT);

-- dim_temps
INSERT INTO dim_temps (id_date, jour, mois, trimestre, annee)
SELECT *
FROM dblink('src',
  $$SELECT DISTINCT
        date_commande,
        EXTRACT(DAY FROM date_commande),
        EXTRACT(MONTH FROM date_commande),
        CEIL(EXTRACT(MONTH FROM date_commande)::numeric / 3.0),
        EXTRACT(YEAR FROM date_commande)
    FROM commandes
    WHERE date_commande IS NOT NULL$$
) AS t(id_date DATE, jour INT, mois INT, trimestre INT, annee INT);

-- faits_commandes
INSERT INTO faits_commandes (
    id_commande, id_client, id_produit, id_commercial,
    id_date, id_region, quantite, montant_total
)
SELECT *
FROM dblink('src',
  $$SELECT
        c.id_commande,
        c.id_client,
        c.id_produit,
        c.id_commercial,
        TO_CHAR(c.date_commande, 'YYYYMMDD')::DATE AS id_date,
        r.id_region,
        c.quantite,
        c.montant_total
   FROM commandes c
   JOIN clients cl ON c.id_client = cl.id_client
   JOIN regions r ON cl.region = r.nom_region
   WHERE c.quantite > 0 AND c.montant_total > 0$$
) AS t(
    id_commande INT,
    id_client INT,
    id_produit INT,
    id_commercial INT,
    id_date DATE,
    id_region INT,
    quantite INT,
    montant_total NUMERIC
);
-- Déconnexion propre
SELECT dblink_disconnect('src');