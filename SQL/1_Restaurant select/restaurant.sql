#------------------------------------------------------------
#  Création de la base restaurant, structure et données
#------------------------------------------------------------

#------------------------------------------------------------
# Table: employes
#------------------------------------------------------------

CREATE TABLE employes(
        idEmploye  Int  Auto_increment  NOT NULL ,
        Nom        Varchar (40) NOT NULL ,
        Prenom     Varchar (40) NOT NULL ,
        Adresse    Varchar (256) ,
        CodePostal Varchar (10) ,
        Ville      Varchar (40) ,
        Telephone  Varchar (24)
	,CONSTRAINT employes_PK PRIMARY KEY (idEmploye)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: typeplats
#------------------------------------------------------------

CREATE TABLE typeplats(
        idType      Int  Auto_increment  NOT NULL ,
        Designation Varchar (40) NOT NULL
	,CONSTRAINT typeplats_PK PRIMARY KEY (idType)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: plats
#------------------------------------------------------------

CREATE TABLE plats(
        idPlat      Int  Auto_increment  NOT NULL ,
        LibellePlat Varchar (80) NOT NULL ,
        PrixVente   Float NOT NULL ,
        idType      Int NOT NULL
	,CONSTRAINT plats_PK PRIMARY KEY (idPlat)

	,CONSTRAINT plats_typeplats_FK FOREIGN KEY (idType) REFERENCES typeplats(idType)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: menus
#------------------------------------------------------------

CREATE TABLE menus(
        idMenu        Int  Auto_increment  NOT NULL ,
        Libelle       Varchar (80) NOT NULL ,
        PrixVente Float NOT NULL
	,CONSTRAINT menus_PK PRIMARY KEY (idMenu)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tables
#------------------------------------------------------------

CREATE TABLE tables(
        idTable     Int  Auto_increment  NOT NULL ,
        NumeroSalle Int NOT NULL
	,CONSTRAINT tables_PK PRIMARY KEY (idTable)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: boissons
#------------------------------------------------------------

CREATE TABLE boissons(
        idBoisson   Int  Auto_increment  NOT NULL ,
        Designation Varchar (80) NOT NULL ,
        PrixVente   Float NOT NULL
	,CONSTRAINT boissons_PK PRIMARY KEY (idBoisson)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: services
#------------------------------------------------------------

CREATE TABLE services(
        idService   Int  Auto_increment  NOT NULL ,
        TypeService Varchar (40)
	,CONSTRAINT services_PK PRIMARY KEY (idService)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: commandes
#------------------------------------------------------------

CREATE TABLE commandes(
        idCommande   Int  Auto_increment  NOT NULL ,
        DateCommande Date ,
        idEmploye    Int NOT NULL ,
        idTable      Int NOT NULL ,
        idService    Int NOT NULL
	,CONSTRAINT commandes_PK PRIMARY KEY (idCommande)

	,CONSTRAINT commandes_employes_FK FOREIGN KEY (idEmploye) REFERENCES employes(idEmploye)
	,CONSTRAINT commandes_tables0_FK FOREIGN KEY (idTable) REFERENCES tables(idTable)
	,CONSTRAINT commandes_services1_FK FOREIGN KEY (idService) REFERENCES services(idService)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: menu_plats
#------------------------------------------------------------

CREATE TABLE menu_plats(
        idPlat Int NOT NULL ,
        idMenu Int NOT NULL
	,CONSTRAINT menu_plats_PK PRIMARY KEY (idPlat,idMenu)

	,CONSTRAINT menu_plats_plats_FK FOREIGN KEY (idPlat) REFERENCES plats(idPlat)
	,CONSTRAINT menu_plats_menus0_FK FOREIGN KEY (idMenu) REFERENCES menus(idMenu)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: commande_boissons
#------------------------------------------------------------

CREATE TABLE commande_boissons(
        idCommande Int NOT NULL ,
        idBoisson  Int NOT NULL ,
        Qte        Int
	,CONSTRAINT commande_boissons_PK PRIMARY KEY (idCommande,idBoisson)

	,CONSTRAINT commande_boissons_commandes_FK FOREIGN KEY (idCommande) REFERENCES commandes(idCommande)
	,CONSTRAINT commande_boissons_boissons0_FK FOREIGN KEY (idBoisson) REFERENCES boissons(idBoisson)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: commande_menus
#------------------------------------------------------------

CREATE TABLE commande_menus(
        idMenu     Int NOT NULL ,
        idCommande Int NOT NULL ,
        Qte        Int
	,CONSTRAINT commande_menus_PK PRIMARY KEY (idMenu,idCommande)

	,CONSTRAINT commande_menus_menus_FK FOREIGN KEY (idMenu) REFERENCES menus(idMenu)
	,CONSTRAINT commande_menus_commandes0_FK FOREIGN KEY (idCommande) REFERENCES commandes(idCommande)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: commande_plats
#------------------------------------------------------------

CREATE TABLE commande_plats(
        idPlat     Int NOT NULL ,
        idCommande Int NOT NULL ,
        Qte        Int
	,CONSTRAINT commande_plats_PK PRIMARY KEY (idPlat,idCommande)

	,CONSTRAINT commande_plats_plats_FK FOREIGN KEY (idPlat) REFERENCES plats(idPlat)
	,CONSTRAINT commande_plats_commandes0_FK FOREIGN KEY (idCommande) REFERENCES commandes(idCommande)
)ENGINE=InnoDB;



#------------------------------------------------------------
# INSERTION DES DONNES DU JEU DE TESTS
#------------------------------------------------------------

INSERT INTO `employes` (`idEmploye`, `Nom`, `Prenom`, `Adresse`, `CodePostal`, `Ville`, `Telephone`) VALUES
(1, 'Wallace', 'Olsen', '641-1173 Laoreet Avenue', '', '', '04 40 96 74 30'),
(2, 'Russell', 'Mcpherson', 'CP 924, 397 Adipiscing Avenue', '', '', '01 97 32 51 21'),
(3, 'Guy', 'Kemp', '4855 Donec Route', '', '', '01 51 63 49 64'),
(4, 'Sonia', ' Knox', 'CP 924, 397 Adipiscing Avenue', '', '', '01 97 32 51 21'),
(5, 'Bree', ' Gardner', '855-9961 Justo. Route', '', '', '04 40 96 74 30'),
(6, 'Hermione', ' Snow', '3248 At, Route', '', '', '01 51 63 49 64'),
(7, 'Brett', ' Spencer', 'Appartement 125-9160 Aliquam Rue', '', '', '02 45 02 99 35'),
(8, 'Dora', ' Horton', 'Appartement 863-1097 Augue Impasse', '', '', '02 45 02 99 35'),
(9, 'Clinton', ' Lambert', 'Appartement 366-2028 Penatibus Rue', '', '', '06 08 87 51 28'),
(10, 'Blair', ' Hurley', '530-5821 Elit Av.', '', '', '06 08 87 51 28');

INSERT INTO `tables` (`idTable`, `NumeroSalle`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2);

INSERT INTO `services` (`idService`, `TypeService`) VALUES
(1, 'Midi'),
(2, 'Soir');

INSERT INTO `typeplats` (`idType`, `Designation`) VALUES
(1, 'Entrée'),
(2, 'Plat'),
(3, 'Dessert');

INSERT INTO `boissons` (`idBoisson`, `Designation`, `PrixVente`) VALUES
(1, 'Eau plate', 3),
(2, 'Eau gazeuse', 3),
(3, 'Perrier rondelle', 3),
(4, 'Coca Cola', 4),
(5, 'Orangina', 4),
(6, 'Jus d''abricot', 3.5),
(7, 'Jus d''orange', 3.5),
(8, 'Jus d''ananas', 3.5),
(9, 'Bière pression', 4),
(10, 'Bière bouteille', 4),
(11, 'Ricard', 4.5),
(12, 'Whisky', 6),
(13, 'Mojito', 6),
(14, 'Kir', 6),
(15, 'Café ', 2),
(16, 'Thé', 2.5);

INSERT INTO `plats` (`idPlat`, `LibellePlat`, `PrixVente`, `idType`) VALUES
(1, 'Salade relevée', 4, 1),
(2, 'Salade du jardin', 9, 1),
(3, 'Foie gras du Sud-Ouest', 19, 1),
(4, 'Cargolade', 9, 1),
(5, 'Anchois à l''ail', 12, 1),
(6, 'Salade de gésiers', 10, 1),
(7, 'Sashimi Maki', 60, 2),
(8, 'Rouget à l''ail', 75, 2),
(9, 'Filet de lieu noir à la bordelaise', 90, 2),
(10, 'Steak frite salade', 25, 2),
(11, 'Steak à cheval', 10, 2),
(12, 'Bavette à l''échalote', 12, 2),
(13, 'Magret de canard', 20, 2),
(14, 'Confit de canard', 25, 2),
(15, 'Bento à la japonaise', 25, 2),
(16, 'Tiramisu', 45, 3),
(17, 'Tarte citron meringuée', 25, 3),
(18, 'Mousse au chocolat', 25, 3),
(19, 'Salade de fruits frais', 20, 3),
(20, 'Café gourmand', 20, 3),
(21, 'Glace au choix', 7, 3),
(22, 'Flan au matcha', 7, 3);

INSERT INTO `menus` (`idMenu`, `Libelle`, `PrixVente`) VALUES
(1, 'Menu du jour', 90),
(2, 'Menu du royal', 160),
(3, 'Menu oriental', 55),
(4, 'Menu du soleil', 88);

INSERT INTO `menu_plats` (`idMenu`, `idPlat`) VALUES
(1, 2),
(1, 10),
(1, 16),
(2, 1),
(2, 3),
(2, 14),
(2, 19),
(3, 7),
(3, 15),
(3, 22),
(4, 5),
(4, 8),
(4, 17);

INSERT INTO `commandes` (`idCommande`, `DateCommande`, `idEmploye`, `idTable`, `idService`) VALUES
(1, '2019-08-22 00:00:00', 10, 6, 1),
(2, '2019-04-19 00:00:00', 10, 6, 1),
(3, '2019-03-07 00:00:00', 3, 4, 1),
(4, '2019-01-26 00:00:00', 10, 1, 1),
(5, '2019-05-30 00:00:00', 8, 8, 1),
(6, '2019-08-21 00:00:00', 4, 5, 1),
(7, '2018-08-13 00:00:00', 10, 4, 1),
(8, '2018-10-21 00:00:00', 8, 4, 1),
(9, '2019-05-16 00:00:00', 8, 8, 1),
(10, '2019-09-20 00:00:00', 2, 7, 1),
(11, '2018-10-07 00:00:00', 8, 5, 1),
(12, '2020-01-23 00:00:00', 2, 10, 1),
(13, '2019-03-20 00:00:00', 4, 4, 1),
(14, '2019-04-11 00:00:00', 4, 1, 1),
(15, '2019-08-01 00:00:00', 3, 9, 1),
(16, '2019-03-06 00:00:00', 3, 10, 1),
(17, '2019-09-25 00:00:00', 2, 8, 1),
(18, '2020-01-14 00:00:00', 2, 3, 1),
(19, '2020-01-10 00:00:00', 9, 10, 1),
(20, '2019-03-24 00:00:00', 5, 3, 1),
(21, '2019-05-05 00:00:00', 2, 9, 1),
(22, '2018-12-05 00:00:00', 2, 6, 1),
(23, '2018-05-13 00:00:00', 3, 10, 1),
(24, '2020-01-13 00:00:00', 8, 4, 1),
(25, '2018-05-12 00:00:00', 10, 10, 1),
(26, '2019-02-01 00:00:00', 1, 10, 1),
(27, '2019-09-26 00:00:00', 2, 5, 1),
(28, '2018-11-08 00:00:00', 3, 6, 1),
(29, '2019-08-06 00:00:00', 2, 7, 1),
(30, '2018-07-01 00:00:00', 10, 9, 1),
(31, '2018-05-06 00:00:00', 3, 4, 1),
(32, '2019-06-16 00:00:00', 9, 3, 1),
(33, '2018-10-28 00:00:00', 4, 6, 1),
(34, '2019-04-12 00:00:00', 2, 5, 1),
(35, '2018-06-13 00:00:00', 3, 1, 1),
(36, '2018-10-17 00:00:00', 8, 5, 1),
(37, '2019-11-16 00:00:00', 1, 4, 1),
(38, '2019-10-09 00:00:00', 5, 1, 1),
(39, '2019-12-13 00:00:00', 1, 1, 1),
(40, '2019-07-30 00:00:00', 3, 1, 1),
(41, '2020-02-08 00:00:00', 3, 4, 1),
(42, '2018-08-21 00:00:00', 5, 8, 1),
(43, '2019-02-09 00:00:00', 5, 8, 1),
(44, '2019-05-09 00:00:00', 8, 10, 1),
(45, '2018-06-17 00:00:00', 5, 1, 1),
(46, '2018-06-30 00:00:00', 3, 9, 1),
(47, '2019-07-07 00:00:00', 5, 5, 1),
(48, '2019-10-19 00:00:00', 3, 2, 1),
(49, '2019-02-14 00:00:00', 4, 9, 1),
(50, '2020-01-04 00:00:00', 4, 5, 1),
(51, '2018-12-29 00:00:00', 5, 1, 2),
(52, '2019-12-21 00:00:00', 8, 1, 2),
(53, '2018-10-18 00:00:00', 3, 2, 2),
(54, '2019-04-27 00:00:00', 5, 3, 2),
(55, '2019-03-21 00:00:00', 9, 8, 2),
(56, '2018-10-21 00:00:00', 1, 3, 2),
(57, '2018-11-22 00:00:00', 3, 1, 2),
(58, '2020-01-17 00:00:00', 3, 4, 2),
(59, '2018-12-22 00:00:00', 5, 7, 2),
(60, '2019-04-14 00:00:00', 5, 9, 2),
(61, '2019-03-11 00:00:00', 10, 8, 2),
(62, '2019-11-05 00:00:00', 9, 2, 2),
(63, '2018-08-12 00:00:00', 8, 7, 2),
(64, '2018-08-29 00:00:00', 5, 2, 2),
(65, '2018-06-07 00:00:00', 5, 7, 2),
(66, '2019-04-17 00:00:00', 9, 4, 2),
(67, '2018-05-17 00:00:00', 5, 9, 2),
(68, '2019-07-19 00:00:00', 8, 7, 2),
(69, '2019-05-04 00:00:00', 9, 2, 2),
(70, '2018-10-21 00:00:00', 8, 3, 2),
(71, '2019-11-12 00:00:00', 5, 10, 2),
(72, '2020-02-11 00:00:00', 3, 9, 2),
(73, '2018-12-13 00:00:00', 3, 5, 2),
(74, '2019-05-16 00:00:00', 3, 8, 2),
(75, '2019-09-12 00:00:00', 2, 6, 2),
(76, '2020-01-10 00:00:00', 1, 4, 2),
(77, '2018-09-10 00:00:00', 4, 5, 2),
(78, '2019-08-26 00:00:00', 1, 6, 2),
(79, '2019-07-26 00:00:00', 8, 7, 2),
(80, '2019-02-25 00:00:00', 1, 4, 2),
(81, '2019-09-29 00:00:00', 2, 10, 2),
(82, '2019-11-18 00:00:00', 9, 2, 2),
(83, '2018-09-05 00:00:00', 4, 8, 2),
(84, '2019-09-12 00:00:00', 4, 8, 2),
(85, '2020-01-30 00:00:00', 2, 7, 2),
(86, '2019-07-07 00:00:00', 3, 5, 2),
(87, '2019-04-30 00:00:00', 10, 10, 2),
(88, '2020-01-20 00:00:00', 9, 8, 2),
(89, '2019-10-11 00:00:00', 9, 6, 2),
(90, '2019-11-02 00:00:00', 10, 9, 2),
(91, '2019-05-02 00:00:00', 4, 5, 2),
(92, '2018-05-21 00:00:00', 4, 2, 2),
(93, '2018-09-17 00:00:00', 4, 9, 2),
(94, '2019-02-15 00:00:00', 5, 5, 2),
(95, '2018-09-11 00:00:00', 10, 8, 2),
(96, '2018-10-11 00:00:00', 4, 6, 2),
(97, '2020-02-07 00:00:00', 10, 10, 2),
(98, '2018-05-15 00:00:00', 9, 2, 2),
(99, '2019-03-29 00:00:00', 8, 5, 2),
(100, '2019-05-27 00:00:00', 4, 2, 2);

INSERT INTO `commande_boissons` (`idBoisson`, `idCommande`) VALUES
(1, 2),
(1, 3),
(1, 5),
(1, 11),
(1, 14),
(1, 20),
(1, 36),
(1, 40),
(1, 57),
(1, 62),
(1, 79),
(1, 96),
(2, 33),
(2, 35),
(2, 37),
(2, 49),
(2, 51),
(2, 57),
(2, 78),
(2, 81),
(3, 8),
(3, 45),
(3, 56),
(3, 65),
(4, 13),
(4, 24),
(4, 33),
(4, 58),
(4, 59),
(4, 89),
(5, 11),
(5, 12),
(5, 14),
(5, 25),
(5, 31),
(5, 40),
(6, 4),
(6, 9),
(6, 12),
(6, 30),
(6, 37),
(6, 45),
(6, 47),
(6, 62),
(6, 64),
(6, 69),
(6, 70),
(6, 73),
(6, 78),
(7, 4),
(7, 7),
(7, 17),
(7, 30),
(7, 31),
(7, 32),
(7, 44),
(7, 49),
(7, 50),
(7, 96),
(9, 18),
(9, 23),
(9, 32),
(9, 34),
(9, 45),
(9, 66),
(9, 82),
(10, 4),
(10, 31),
(10, 40),
(10, 79),
(10, 89),
(10, 90),
(11, 16),
(11, 34),
(11, 70),
(12, 6),
(12, 11),
(12, 70),
(12, 84),
(12, 89),
(14, 10),
(14, 24),
(14, 29),
(14, 41),
(14, 44),
(14, 45),
(14, 54),
(14, 60),
(14, 69),
(14, 75),
(14, 89),
(14, 93),
(14, 99),
(15, 4),
(15, 5),
(15, 45),
(15, 46),
(15, 80),
(16, 28),
(16, 49);

INSERT INTO `commande_menus` (`idCommande`, `idMenu`) VALUES
(2, 1),
(3, 3),
(4, 1),
(5, 2),
(5, 3),
(7, 1),
(7, 3),
(14, 2),
(19, 3),
(20, 1),
(20, 2),
(20, 3),
(22, 1),
(25, 1),
(26, 2),
(30, 3),
(31, 2),
(33, 2),
(33, 3),
(35, 1),
(36, 2),
(40, 1),
(43, 3),
(48, 2),
(50, 2),
(50, 3),
(51, 1),
(54, 1),
(54, 2),
(55, 3),
(56, 1),
(64, 1),
(65, 1),
(65, 3),
(67, 1),
(67, 3),
(68, 2),
(69, 1),
(69, 2),
(70, 2),
(72, 3),
(73, 1),
(74, 2),
(74, 3),
(75, 1),
(76, 2),
(79, 3),
(84, 2),
(87, 2),
(89, 3),
(92, 2),
(92, 3),
(94, 3),
(95, 1),
(95, 2),
(96, 2),
(96, 3),
(99, 3),
(100, 1),
(100, 2);

INSERT INTO `commande_plats` (`idPlat`, `idCommande`) VALUES
(1, 29),
(1, 32),
(1, 33),
(1, 34),
(1, 46),
(1, 55),
(1, 61),
(1, 72),
(1, 77),
(1, 81),
(1, 95),
(1, 99),
(2, 1),
(2, 2),
(2, 8),
(2, 10),
(2, 13),
(2, 24),
(2, 26),
(2, 33),
(2, 36),
(2, 39),
(2, 40),
(2, 42),
(2, 54),
(2, 57),
(2, 70),
(2, 73),
(2, 79),
(2, 80),
(2, 93),
(2, 96),
(3, 6),
(3, 25),
(3, 30),
(3, 31),
(3, 39),
(3, 55),
(3, 63),
(3, 66),
(3, 69),
(3, 71),
(3, 75),
(3, 80),
(3, 85),
(4, 9),
(4, 24),
(4, 32),
(4, 35),
(4, 38),
(4, 40),
(4, 50),
(4, 53),
(4, 57),
(4, 61),
(4, 79),
(4, 81),
(4, 87),
(4, 89),
(4, 98),
(5, 4),
(5, 23),
(5, 26),
(5, 41),
(5, 43),
(5, 48),
(5, 68),
(5, 85),
(5, 90),
(5, 99),
(5, 100),
(6, 1),
(6, 20),
(6, 24),
(6, 30),
(6, 36),
(6, 47),
(6, 58),
(6, 82),
(6, 95),
(7, 2),
(7, 29),
(7, 36),
(7, 42),
(7, 50),
(7, 58),
(8, 3),
(8, 4),
(8, 22),
(8, 46),
(8, 52),
(8, 56),
(8, 67),
(8, 68),
(8, 71),
(8, 83),
(8, 85),
(8, 97),
(9, 2),
(9, 10),
(9, 45),
(9, 52),
(9, 60),
(9, 61),
(9, 66),
(9, 74),
(9, 92),
(10, 5),
(10, 10),
(10, 11),
(10, 13),
(10, 19),
(10, 39),
(10, 41),
(10, 50),
(10, 53),
(10, 60),
(10, 90),
(10, 91),
(11, 1),
(11, 12),
(11, 26),
(11, 28),
(11, 49),
(11, 52),
(11, 64),
(11, 66),
(11, 70),
(11, 85),
(12, 4),
(12, 28),
(12, 40),
(12, 45),
(12, 51),
(12, 54),
(12, 59),
(12, 92),
(13, 18),
(13, 22),
(13, 45),
(13, 54),
(13, 60),
(13, 64),
(13, 73),
(14, 38),
(14, 39),
(14, 45),
(14, 54),
(14, 85),
(14, 91),
(14, 92),
(15, 4),
(15, 14),
(15, 16),
(15, 29),
(15, 33),
(15, 37),
(15, 38),
(15, 43),
(15, 54),
(16, 4),
(16, 19),
(16, 42),
(16, 43),
(16, 50),
(16, 55),
(16, 63),
(16, 76),
(16, 93),
(17, 3),
(17, 5),
(17, 13),
(17, 18),
(17, 29),
(17, 30),
(17, 46),
(17, 49),
(17, 55),
(17, 71),
(17, 72),
(17, 78),
(17, 80),
(17, 82),
(17, 84),
(17, 85),
(17, 89),
(17, 90),
(18, 1),
(18, 22),
(18, 23),
(18, 35),
(18, 53),
(18, 56),
(18, 60),
(18, 61),
(18, 66),
(18, 67),
(18, 70),
(18, 87),
(19, 7),
(19, 21),
(19, 24),
(19, 30),
(19, 32),
(19, 35),
(19, 44),
(19, 51),
(19, 75),
(19, 83),
(19, 87),
(19, 93),
(19, 100),
(20, 5),
(20, 10),
(20, 34),
(20, 35),
(20, 37),
(20, 38),
(20, 52),
(20, 58),
(20, 65),
(20, 70),
(20, 73),
(20, 75),
(20, 93),
(21, 8),
(21, 9),
(21, 57),
(21, 85),
(21, 97),
(22, 2),
(22, 11),
(22, 25),
(22, 34),
(22, 55),
(22, 61),
(22, 63),
(22, 67),
(22, 71),
(22, 77);
