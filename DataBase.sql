CREATE TABLE Utilisateur (
    ID_utilisateur INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(255),
    Prenom VARCHAR(255),
    Email VARCHAR(255),
    Mot_de_passe VARCHAR(255),
    Type ENUM('admin', 'client')
);

CREATE TABLE Categorie (
    ID_categorie INT PRIMARY KEY AUTO_INCREMENT,
    nom_categorie VARCHAR(255)
);

CREATE TABLE evenement (
    ID_evenement INT PRIMARY KEY AUTO_INCREMENT,
    title_evenement VARCHAR(255),
    Description_evenement TEXT,
    Date_de_creation DATE,
    ID_categorie INT,
    FOREIGN KEY (ID_categorie) REFERENCES Categorie(ID_categorie)
);

create table ville (
	ID_local INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(255),
    nom_local VARCHAR(255)
);

CREATE TABLE show_ (
    ID_show INT PRIMARY KEY AUTO_INCREMENT,
    titre_show VARCHAR(255),
    prix INT,
    num_ticket INT,
	Date_show DATE,
    etat ENUM('reporte', 'epuise', 'annule'),
    ID_evenement INT,
    ID_local INT,
    FOREIGN KEY (ID_evenement) REFERENCES evenement(ID_evenement),
	FOREIGN KEY (ID_local) REFERENCES ville(ID_local)
);

CREATE TABLE Reservation (
    ID_reservation INT PRIMARY KEY AUTO_INCREMENT,
    ID_utilisateur INT,
    ID_show INT,
    number_vendu int,
    Date_de_reservation DATETIME,
    mode_de_paiement VARCHAR(255),
    FOREIGN KEY (ID_utilisateur) REFERENCES Utilisateur(ID_utilisateur),
    FOREIGN KEY (ID_show) REFERENCES show_(ID_show)
);

INSERT INTO Utilisateur (Nom, Prenom, Email, Mot_de_passe, Type) VALUES
('Doe', 'John', 'john.doe@example.com', 'motdepasse123', 'admin'),
('Smith', 'Alice', 'alice.smith@example.com', 'password456', 'client'),
('Johnson', 'Bob', 'bob.johnson@example.com', 'securepass789', 'client');

INSERT INTO Categorie (nom_categorie) VALUES
('Musique'),
('Sport'),
('Théâtre');

INSERT INTO evenement (title_evenement, Description_evenement, Date_de_creation, ID_categorie) VALUES
('Concert de jazz', 'Un concert de jazz en direct avec des artistes locaux.', '2024-04-26', 1),
('Match de football', 'Un match de football entre équipes rivales.', '2024-04-25', 2),
('Pièce de théâtre comique', 'Une pièce de théâtre hilarante mettant en vedette des comédiens talentueux.', '2024-04-24', 3);

INSERT INTO ville (region, nom_local) VALUES
('Île-de-France', 'Paris'),
('Auvergne-Rhône-Alpes', 'Lyon'),
('Provence-Alpes-Côte d\'Azur', 'Marseille');

INSERT INTO show_ (titre_show, prix, num_ticket, Date_show, etat, ID_evenement, ID_local) VALUES
('Jazz Night', 20, 100, '2024-05-10', 'reporte', 1, 1),
('Paris vs Lyon', 30, 200, '2024-05-15', 'epuise', 2, 2),
('Comedy Show', 25, 150, '2024-05-20', 'annule', 3, 3);

INSERT INTO Reservation (ID_utilisateur, ID_show, number_vendu, Date_de_reservation, mode_de_paiement) VALUES
(1, 1, 2, '2024-05-05 10:00:00', 'Carte de crédit'),
(2, 2, 3, '2024-05-07 15:30:00', 'PayPal'),
(3, 3, 1, '2024-05-09 12:45:00', 'Espèces');