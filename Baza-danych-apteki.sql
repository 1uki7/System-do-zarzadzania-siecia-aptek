-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: database-1.ct6skksyahra.eu-north-1.rds.amazonaws.com    Database: siec_aptek
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Temporary view structure for view `aktualny_stan_magazynu`
--

DROP TABLE IF EXISTS `aktualny_stan_magazynu`;
/*!50001 DROP VIEW IF EXISTS `aktualny_stan_magazynu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `aktualny_stan_magazynu` AS SELECT 
 1 AS `apteka`,
 1 AS `lek`,
 1 AS `numer_serii`,
 1 AS `data_waznosci`,
 1 AS `ilosc_dostepna`,
 1 AS `cena_sprzedazy`,
 1 AS `wartosc_magazynu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `analiza_sprzedazy`
--

DROP TABLE IF EXISTS `analiza_sprzedazy`;
/*!50001 DROP VIEW IF EXISTS `analiza_sprzedazy`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `analiza_sprzedazy` AS SELECT 
 1 AS `lek`,
 1 AS `liczba_sprzedanych`,
 1 AS `wartosc_sprzedazy`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `apteki`
--

DROP TABLE IF EXISTS `apteki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apteki` (
  `id_apteki` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `adres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `godziny_pracy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'czynna',
  `data_utworzenia` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_apteki`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apteki`
--

LOCK TABLES `apteki` WRITE;
/*!40000 ALTER TABLE `apteki` DISABLE KEYS */;
INSERT INTO `apteki` VALUES (11,'Apteka Pod Gryfem','ul. Rynek 1, Strzyżów','08:00-20:00','czynna','2026-03-30 21:20:05'),(12,'Apteka Słoneczna','ul. Krakowska 10, 31-062 Kraków','08:00-22:00','czynna','2026-03-31 04:51:29'),(13,'Apteka DOZ','ul. Marszałkowska 50, 00-544 Warszawa','07:00-23:00','czynna','2026-03-31 04:51:29'),(14,'Apteka Różana','ul. Grunwaldzka 15, 80-236 Gdańsk','02:00-03:00','czynna','2026-03-31 04:51:29');
/*!40000 ALTER TABLE `apteki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dostawcy`
--

DROP TABLE IF EXISTS `dostawcy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dostawcy` (
  `id_dostawcy` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_dostawcy`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dostawcy`
--

LOCK TABLES `dostawcy` WRITE;
/*!40000 ALTER TABLE `dostawcy` DISABLE KEYS */;
INSERT INTO `dostawcy` VALUES (11,'NEUCA S.A.','8790017162','ul. Szosa Bydgoska 58, 87-100 Toruń'),(12,'PGF S.A. (Polska Grupa Farmaceutyczna)','7280000958','ul. Zbąszyńska 3, 91-342 Łódź'),(13,'Farmacol Logistics','6342623351','ul. Szopienicka 77, 40-431 Katowice');
/*!40000 ALTER TABLE `dostawcy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dostawy`
--

DROP TABLE IF EXISTS `dostawy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dostawy` (
  `id_dostawy` int NOT NULL AUTO_INCREMENT,
  `id_apteki_docelowej` int NOT NULL,
  `id_dostawcy` int NOT NULL,
  `data_zamowienia` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_dostawy` datetime DEFAULT NULL,
  `status` enum('oczekująca','w_drodze','dostarczona','anulowana') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'oczekująca',
  `nr_dokumentu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uwagi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_dostawy`),
  KEY `id_apteki_docelowej` (`id_apteki_docelowej`),
  KEY `id_dostawcy` (`id_dostawcy`),
  CONSTRAINT `dostawy_ibfk_1` FOREIGN KEY (`id_apteki_docelowej`) REFERENCES `apteki` (`id_apteki`),
  CONSTRAINT `dostawy_ibfk_2` FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawcy` (`id_dostawcy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dostawy`
--

LOCK TABLES `dostawy` WRITE;
/*!40000 ALTER TABLE `dostawy` DISABLE KEYS */;
/*!40000 ALTER TABLE `dostawy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faktury`
--

DROP TABLE IF EXISTS `faktury`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faktury` (
  `id_faktury` int NOT NULL AUTO_INCREMENT,
  `typ` enum('zakup','sprzedaż') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `numer_faktury` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_wystawienia` date DEFAULT NULL,
  `kwota_brutto` decimal(10,2) DEFAULT NULL,
  `id_dostawcy` int DEFAULT NULL,
  `id_apteki` int DEFAULT NULL,
  PRIMARY KEY (`id_faktury`),
  KEY `id_dostawcy` (`id_dostawcy`),
  KEY `id_apteki` (`id_apteki`),
  CONSTRAINT `faktury_ibfk_1` FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawcy` (`id_dostawcy`),
  CONSTRAINT `faktury_ibfk_2` FOREIGN KEY (`id_apteki`) REFERENCES `apteki` (`id_apteki`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktury`
--

LOCK TABLES `faktury` WRITE;
/*!40000 ALTER TABLE `faktury` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktury` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `historia_pracownikow`
--

DROP TABLE IF EXISTS `historia_pracownikow`;
/*!50001 DROP VIEW IF EXISTS `historia_pracownikow`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `historia_pracownikow` AS SELECT 
 1 AS `imie`,
 1 AS `nazwisko`,
 1 AS `apteka`,
 1 AS `data_od`,
 1 AS `data_do`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `historia_pracownikow_status`
--

DROP TABLE IF EXISTS `historia_pracownikow_status`;
/*!50001 DROP VIEW IF EXISTS `historia_pracownikow_status`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `historia_pracownikow_status` AS SELECT 
 1 AS `imie`,
 1 AS `nazwisko`,
 1 AS `apteka`,
 1 AS `data_od`,
 1 AS `status_zatrudnienia`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `leki`
--

DROP TABLE IF EXISTS `leki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leki` (
  `id_leku` int NOT NULL AUTO_INCREMENT,
  `nazwa_handlowa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `substancja_czynna` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postac` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dawka` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` decimal(4,2) DEFAULT '8.00',
  PRIMARY KEY (`id_leku`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leki`
--

LOCK TABLES `leki` WRITE;
/*!40000 ALTER TABLE `leki` DISABLE KEYS */;
INSERT INTO `leki` VALUES (103,'Apap','Paracetamolum','tabletki powlekane','500 mg',8.00),(104,'Ibuprom','Ibuprofenum','tabletki powlekane','200 mg',8.00),(105,'Euthyrox N 25','Levothyroxinum natricum','tabletki','25 mcg',8.00),(106,'Euthyrox N 50','Levothyroxinum natricum','tabletki','50 mcg',8.00),(107,'Euthyrox N 100','Levothyroxinum natricum','tabletki','100 mcg',8.00),(108,'Amotaks','Amoxicillinum','granulat do sporz. zawiesiny','500 mg/5 ml',8.00),(109,'Augmentin','Amoxicillinum + Acidum clavulanicum','tabletki powlekane','875 mg + 125 mg',8.00),(110,'Xarelto','Rivaroxabanum','tabletki powlekane','20 mg',8.00),(111,'Eliquis','Apixabanum','tabletki powlekane','5 mg',8.00),(112,'Areplex','Clopidogrelum','tabletki powlekane','75 mg',8.00),(113,'Bisocard','Bisoprololi fumaras','tabletki powlekane','5 mg',8.00),(114,'Concor COR 2.5','Bisoprololi fumaras','tabletki powlekane','2,5 mg',8.00),(115,'Polpril','Ramiprilum','tabletki','5 mg',8.00),(116,'Vivace','Ramiprilum','tabletki','10 mg',8.00),(117,'Tritace 5','Ramiprilum','tabletki','5 mg',8.00),(118,'Amlopin','Amlodipinum','tabletki','5 mg',8.00),(119,'Norvasc','Amlodipinum','tabletki','10 mg',8.00),(120,'Atoris','Atorvastatinum','tabletki powlekane','20 mg',8.00),(121,'Roswera','Rosuvastatinum','tabletki powlekane','10 mg',8.00),(122,'Zahron','Rosuvastatinum','tabletki powlekane','20 mg',8.00),(123,'Metformax 500','Metformini hydrochloridum','tabletki','500 mg',8.00),(124,'Metformax 850','Metformini hydrochloridum','tabletki','850 mg',8.00),(125,'Glucophage 1000','Metformini hydrochloridum','tabletki powlekane','1000 mg',8.00),(126,'Glucophage XR','Metformini hydrochloridum','tabletki o przedłużonym uwalnianiu','750 mg',8.00),(127,'Jardiance','Empagliflozinum','tabletki powlekane','10 mg',8.00),(128,'Forxiga','Dapagliflozinum','tabletki powlekane','10 mg',8.00),(129,'Victoza','Liraglutidum','roztwór do wstrzykiwań w penie','6 mg/ml',8.00),(130,'Ozempic','Semaglutidum','roztwór do wstrzykiwań w penie','0,5 mg',8.00),(131,'Berodual N','Ipratropii bromidum + Fenoteroli hydrobromidum','aerozol wziewny','20 mcg + 50 mcg',8.00),(132,'Ventolin','Salbutamolum','aerozol wziewny','100 mcg/dawkę',8.00),(133,'Miflonide Breezhaler','Budesonidum','proszek do inhalacji w kaps.','400 mcg',8.00),(134,'Fostex','Beclometasoni dipropionas + Formoteroli fumaras dihydricus','aerozol wziewny','100 mcg + 6 mcg',8.00),(135,'Salmex','Salmeterolum + Fluticasoni propionas','proszek do inhalacji','50 mcg + 500 mcg',8.00),(136,'Controloc 20','Pantoprazolum','tabletki dojelitowe','20 mg',8.00),(137,'Controloc 40','Pantoprazolum','tabletki dojelitowe','40 mg',8.00),(138,'ipp 20','Pantoprazolum','tabletki dojelitowe','20 mg',8.00),(139,'Helicides 20','Omeprazolum','kapsułki dojelitowe twarde','20 mg',8.00),(140,'Emanera','Esomeprazolum','kapsułki dojelitowe twarde','40 mg',8.00),(141,'Debretin','Trimebutini maleas','tabletki powlekane','100 mg',8.00),(142,'Tribux Forte','Trimebutini maleas','tabletki','200 mg',8.00),(143,'Kreon 25000','Pancreatinum','kapsułki dojelitowe','25000 j. Ph.Eur.',8.00),(144,'Sanprobi Barrier','Probiotyk','kapsułki','brak',8.00),(145,'Ketonal Forte','Ketoprofenum','tabletki powlekane','100 mg',8.00),(146,'Ketonal Active','Ketoprofenum','kapsułki twarde','50 mg',8.00),(147,'Dexak','Dexketoprofenum','tabletki','25 mg',8.00),(148,'Nimesil','Nimesulidum','granulat do sporz. zawiesiny doustnej','100 mg',8.00),(149,'Diclac 75 Duo','Diclofenacum natricum','tabletki o zmodyf. uwalnianiu','75 mg',8.00),(150,'Olfen 75','Diclofenacum natricum','roztwór do wstrzykiwań','75 mg/2 ml',8.00),(151,'Skudexa','Tramadoli hydrochloridum + Dexketoprofenum','tabletki powlekane','75 mg + 25 mg',8.00),(152,'Tramal Retard 100','Tramadoli hydrochloridum','tabletki o przedłużonym uwalnianiu','100 mg',8.00),(153,'Doreta','Tramadoli hydrochloridum + Paracetamolum','tabletki powlekane','37,5 mg + 325 mg',8.00),(154,'Poltram Combo','Tramadoli hydrochloridum + Paracetamolum','tabletki powlekane','37,5 mg + 325 mg',8.00),(155,'Mydocalm Forte','Tolperisoni hydrochloridum','tabletki powlekane','150 mg',8.00),(156,'Sirdalud','Tizanidinum','tabletki','4 mg',8.00),(157,'Baclofen Polpharma','Baclofenum','tabletki','10 mg',8.00),(158,'Milgamma 100','Benfotiaminum + Pyridoxini hydrochloridum','tabletki drażowane','100 mg + 100 mg',8.00),(159,'Neurovit','Vitamina B1 + B6 + B12','tabletki powlekane','100 mg + 200 mg + 0,2 mg',8.00),(160,'Magnerot','Magnesii orotas dihydricus','tabletki','500 mg',8.00),(161,'Magne B6','Magnesii lactas dihydricus + Pyridoxini hydrochloridum','tabletki powlekane','470 mg + 5 mg',8.00),(162,'Vigantol','Cholecalciferolum','krople doustne, roztwór','500 j.m./kroplę',8.00),(163,'Devikap','Cholecalciferolum','krople doustne, roztwór','15000 j.m./ml',8.00),(164,'Calperos 1000','Calcii carbonas','kapsułki twarde','400 mg jonów wapnia',8.00),(165,'Furagina Forte','Furazidinum','tabletki','100 mg',8.00),(166,'Uro-Vaxom','Lysatum escherichia coli bacteriale vivum','kapsułki twarde','6 mg',8.00),(167,'Monural','Fosfomycinum','granulat do sporz. roztworu doustnego','3 g',8.00),(168,'Cipronex','Ciprofloxacinum','tabletki powlekane','500 mg',8.00),(169,'Xifaxan','Rifaximinum','tabletki powlekane','200 mg',8.00),(170,'Metronidazol Polpharma','Metronidazolum','tabletki','250 mg',8.00),(171,'Heviran','Aciclovirum','tabletki powlekane','400 mg',8.00),(172,'Infectoscab 5%','Permethrinum','krem','50 mg/g',8.00),(173,'Davercin','Erythromycinum cyclocarbonas','żel','25 mg/g',8.00),(174,'Dalacin T','Clindamycinum','emulsja na skórę','10 mg/ml',8.00),(175,'Bedicort G','Betamethasonum + Gentamicinum','maść','0,5 mg + 1 mg',8.00),(176,'Triderm','Betamethasonum + Clotrimazolum + Gentamicinum','maść','0,5 mg + 10 mg + 1 mg',8.00),(177,'Maxitrol','Dexamethasonum + Neomycinum + Polymyxinum B','krople do oczu','1 mg + 3500 j.m. + 6000 j.m.',8.00),(178,'Tobradex','Tobramycinum + Dexamethasonum','krople do oczu','3 mg + 1 mg',8.00),(179,'Lotemax 0.5%','Loteprednolum','krople do oczu, zawiesina','5 mg/g',8.00),(180,'Hylo-Comod','Natrii hyaluronas','krople do oczu','1 mg/ml',8.00),(181,'Systane Ultra','Glikol polietylenowy + Glikol propylenowy','krople do oczu','4 mg + 3 mg',8.00),(182,'Nasometin','Mometasoni furoas','aerozol do nosa','50 mcg/dawkę',8.00),(183,'Avamys','Fluticasoni furoas','aerozol do nosa','27,5 mcg/dawkę',8.00),(184,'Otrivin','Xylometazolini hydrochloridum','aerozol do nosa','1 mg/ml',8.00),(185,'Sinupret Extract','Zagęszczony ekstrakt roślinny','tabletki drażowane','160 mg',8.00),(186,'Cirrus Duo','Pseudoephedrini hydrochloridum + Cetirizini dihydrochloridum','tabletki o przedłużonym uwalnianiu','120 mg + 5 mg',8.00),(187,'Clatra','Bilastinum','tabletki','20 mg',8.00),(188,'Hitaxa','Desloratadinum','tabletki ulegające rozpadowi w j. ustnej','5 mg',8.00),(189,'Zyrtec','Cetirizini dihydrochloridum','tabletki powlekane','10 mg',8.00),(190,'Allegra','Fexofenadini hydrochloridum','tabletki powlekane','120 mg',8.00),(191,'Hydroxyzinum VP','Hydroxyzini hydrochloridum','tabletki powlekane','25 mg',8.00),(192,'Relanium','Diazepamum','tabletki','5 mg',8.00),(193,'Xanax','Alprazolamum','tabletki','0,5 mg',8.00),(194,'Pramolan','Opipramoli dihydrochloridum','tabletki powlekane','50 mg',8.00),(195,'Asertin 50','Sertralinum','tabletki powlekane','50 mg',8.00),(196,'Symescital','Escitalopramum','tabletki powlekane','10 mg',8.00),(197,'Ketrel','Quetiapinum','tabletki powlekane','25 mg',8.00),(198,'Pregabalin Sandoz','Pregabalinum','kapsułki twarde','75 mg',8.00),(199,'Memantine Accord','Memantini hydrochloridum','tabletki powlekane','20 mg',8.00),(200,'Madopar 125','Levodopum + Benserazidum','kapsułki','100 mg + 25 mg',8.00),(201,'Polvertic','Betahistini dihydrochloridum','tabletki','24 mg',8.00),(202,'Vicebrol','Vinpocetinum','tabletki','5 mg',8.00);
/*!40000 ALTER TABLE `leki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_aktywnosci`
--

DROP TABLE IF EXISTS `log_aktywnosci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_aktywnosci` (
  `id_logu` int NOT NULL AUTO_INCREMENT,
  `id_pracownika` int DEFAULT NULL,
  `data_operacji` datetime DEFAULT CURRENT_TIMESTAMP,
  `akcja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabela_dotyczy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_logu`),
  KEY `id_pracownika` (`id_pracownika`),
  CONSTRAINT `log_aktywnosci_ibfk_1` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownicy` (`id_pracownika`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_aktywnosci`
--

LOCK TABLES `log_aktywnosci` WRITE;
/*!40000 ALTER TABLE `log_aktywnosci` DISABLE KEYS */;
INSERT INTO `log_aktywnosci` VALUES (4,21,'2026-03-28 09:12:05','Zmiana stanu partii 62: 1 -> 15','magazyn_apteki'),(5,22,'2026-03-28 10:45:12','Zmiana stanu partii 63: 30 -> 28','magazyn_apteki'),(6,23,'2026-03-28 14:02:30','Zmiana stanu partii 62: 15 -> 14','magazyn_apteki'),(7,21,'2026-03-29 08:30:00','Aktualizacja parametrów systemowych','parametry_systemu'),(8,23,'2026-03-29 11:40:22','Zmiana stanu partii 1: 200 -> 195','magazyn_apteki'),(9,22,'2026-03-29 15:05:10','Przyjęcie nowej dostawy - partia 65','dostawy'),(10,21,'2026-03-30 07:15:30','Zmiana stanu partii 62: 15 -> 8','magazyn_apteki'),(11,21,'2026-03-30 09:42:11','Zmiana stanu partii 62: 8 -> 15','magazyn_apteki'),(12,21,'2026-03-30 11:42:14','Zmiana stanu partii 62: 15 -> 5','magazyn_apteki'),(13,21,'2026-03-30 14:44:56','Zmiana stanu partii 62: 5 -> 15','magazyn_apteki'),(14,21,'2026-03-30 16:45:00','Zmiana stanu partii 62: 15 -> 5','magazyn_apteki'),(15,21,'2026-03-31 06:45:18','Zmiana stanu partii 62: 5 -> 30','magazyn_apteki'),(16,21,'2026-03-31 07:45:30','Zmiana stanu partii 62: 30 -> 5','magazyn_apteki'),(17,21,'2026-03-31 08:25:23','Zmiana stanu partii 62: 5 -> 30','magazyn_apteki'),(18,21,'2026-03-31 09:25:30','Zmiana stanu partii 62: 30 -> 5','magazyn_apteki'),(19,21,'2026-03-31 10:33:04','Zmiana stanu partii 62: 5 -> 30','magazyn_apteki'),(20,21,'2026-03-31 11:33:22','Zmiana stanu partii 62: 30 -> 5','magazyn_apteki'),(21,21,'2026-03-31 09:57:43','Zmiana stanu partii 62: 5 -> 3','magazyn_apteki');
/*!40000 ALTER TABLE `log_aktywnosci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `log_aktywnosci_rozszerzony`
--

DROP TABLE IF EXISTS `log_aktywnosci_rozszerzony`;
/*!50001 DROP VIEW IF EXISTS `log_aktywnosci_rozszerzony`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `log_aktywnosci_rozszerzony` AS SELECT 
 1 AS `id_logu`,
 1 AS `imie`,
 1 AS `nazwisko`,
 1 AS `data_operacji`,
 1 AS `akcja`,
 1 AS `tabela_dotyczy`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `log_systemowy`
--

DROP TABLE IF EXISTS `log_systemowy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_systemowy` (
  `id_logu` int NOT NULL AUTO_INCREMENT,
  `id_uzytkownika` int DEFAULT NULL,
  `data_zdarzenia` datetime DEFAULT CURRENT_TIMESTAMP,
  `opis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poziom` enum('info','ostrzeżenie','błąd') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'info',
  PRIMARY KEY (`id_logu`),
  KEY `id_uzytkownika` (`id_uzytkownika`),
  CONSTRAINT `log_systemowy_ibfk_1` FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownicy` (`id_uzytkownika`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_systemowy`
--

LOCK TABLES `log_systemowy` WRITE;
/*!40000 ALTER TABLE `log_systemowy` DISABLE KEYS */;
INSERT INTO `log_systemowy` VALUES (1,21,'2026-03-31 10:05:06','OSTRZEŻENIE: Krytyczny stan leku \"Ozempic 0,5 mg\" w lokalizacji: Apteka Różana.','ostrzeżenie'),(2,21,'2026-03-31 09:05:06','OSTRZEŻENIE: Krytyczny stan leku \"Insulina NovoMix\" w lokalizacji: Apteka Różana.','ostrzeżenie'),(3,21,'2026-03-31 07:05:06','OSTRZEŻENIE: Krytyczny stan leku \"Xarelto 20 mg\" w lokalizacji: Apteka Słoneczna.','ostrzeżenie'),(4,21,'2026-03-31 05:05:06','BŁĄD: Krytyczny stan leku \"Euthyrox N 100\" w lokalizacji: Apteka Pod Gryfem.','błąd');
/*!40000 ALTER TABLE `log_systemowy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magazyn_apteki`
--

DROP TABLE IF EXISTS `magazyn_apteki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magazyn_apteki` (
  `id_magazynu` int NOT NULL AUTO_INCREMENT,
  `id_apteki` int NOT NULL,
  `id_partii` int NOT NULL,
  `ilosc_dostepna` int DEFAULT '0',
  PRIMARY KEY (`id_magazynu`),
  UNIQUE KEY `unikalny_stan` (`id_apteki`,`id_partii`),
  KEY `id_partii` (`id_partii`),
  CONSTRAINT `magazyn_apteki_ibfk_1` FOREIGN KEY (`id_apteki`) REFERENCES `apteki` (`id_apteki`),
  CONSTRAINT `magazyn_apteki_ibfk_2` FOREIGN KEY (`id_partii`) REFERENCES `partie_lekow` (`id_partii`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magazyn_apteki`
--

LOCK TABLES `magazyn_apteki` WRITE;
/*!40000 ALTER TABLE `magazyn_apteki` DISABLE KEYS */;
INSERT INTO `magazyn_apteki` VALUES (185,11,62,3),(186,11,63,30),(187,12,66,10),(188,13,68,5);
/*!40000 ALTER TABLE `magazyn_apteki` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `trg_after_magazyn_update` AFTER UPDATE ON `magazyn_apteki` FOR EACH ROW BEGIN
    -- Reaguj tylko, gdy faktycznie zmieniła się liczba sztuk
    IF OLD.ilosc_dostepna <> NEW.ilosc_dostepna THEN
        INSERT INTO log_aktywnosci (id_pracownika, akcja, tabela_dotyczy, data_operacji)
        VALUES (
            @current_user_id, 
            CONCAT('Zmiana stanu partii ', NEW.id_partii, ': ', OLD.ilosc_dostepna, ' -> ', NEW.ilosc_dostepna),
            'magazyn_apteki',
            NOW()
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `niskie_stany_magazynowe`
--

DROP TABLE IF EXISTS `niskie_stany_magazynowe`;
/*!50001 DROP VIEW IF EXISTS `niskie_stany_magazynowe`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `niskie_stany_magazynowe` AS SELECT 
 1 AS `apteka`,
 1 AS `lek`,
 1 AS `ilosc_dostepna`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `parametry_systemu`
--

DROP TABLE IF EXISTS `parametry_systemu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametry_systemu` (
  `id_parametru` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wartosc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_parametru`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametry_systemu`
--

LOCK TABLES `parametry_systemu` WRITE;
/*!40000 ALTER TABLE `parametry_systemu` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametry_systemu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partie_lekow`
--

DROP TABLE IF EXISTS `partie_lekow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partie_lekow` (
  `id_partii` int NOT NULL AUTO_INCREMENT,
  `id_leku` int NOT NULL,
  `numer_serii` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_waznosci` date DEFAULT NULL,
  `cena_zakupu` decimal(10,2) DEFAULT NULL,
  `cena_sprzedazy` decimal(10,2) DEFAULT NULL,
  `ilosc` int DEFAULT '0',
  PRIMARY KEY (`id_partii`),
  KEY `id_leku` (`id_leku`),
  CONSTRAINT `partie_lekow_ibfk_1` FOREIGN KEY (`id_leku`) REFERENCES `leki` (`id_leku`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partie_lekow`
--

LOCK TABLES `partie_lekow` WRITE;
/*!40000 ALTER TABLE `partie_lekow` DISABLE KEYS */;
INSERT INTO `partie_lekow` VALUES (62,103,'SER-AP-001','2027-12-31',8.50,12.99,200),(63,104,'SER-IB-002','2028-05-20',10.20,15.50,150),(64,105,'SER-EU-25','2027-03-15',12.00,18.00,100),(65,109,'SER-AU-875','2026-11-10',25.00,38.90,50),(66,110,'SER-XA-20','2028-01-01',85.00,120.00,30),(67,113,'SER-BI-5','2027-09-30',9.80,14.50,120),(68,130,'SER-OZ-05','2026-12-24',320.00,450.00,15),(69,136,'SER-CO-20','2027-10-10',18.00,29.00,100),(70,171,'SER-HE-400','2027-02-01',19.00,31.00,110),(71,193,'SER-XA-05','2027-12-12',35.00,58.00,25);
/*!40000 ALTER TABLE `partie_lekow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownicy`
--

DROP TABLE IF EXISTS `pracownicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pracownicy` (
  `id_pracownika` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nazwisko` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `haslo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stanowisko` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_zatrudnienia` date DEFAULT NULL,
  `pesel` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rola` enum('administrator','kierownik','farmaceuta','technik') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'farmaceuta',
  `aktywny` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_pracownika`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownicy`
--

LOCK TABLES `pracownicy` WRITE;
/*!40000 ALTER TABLE `pracownicy` DISABLE KEYS */;
INSERT INTO `pracownicy` VALUES (21,'Adam','Nowak','anowak','haslo123','Kierownik Regionalny','2020-01-15','85011501234','a.nowak@siecaptek.pl','administrator',1),(22,'Beata','Kowalska','bkowalska','haslo123','Kierownik Apteki','2021-03-10','90031005678','b.kowalska@siecaptek.pl','kierownik',1),(23,'Cezary','Wiśniewski','cwiśniewski','haslo123','Magister Farmacji','2022-06-01','92060109876','c.wisniewski@siecaptek.pl','farmaceuta',1),(24,'Dorota','Wójcik','dwójcik','haslo123','Magister Farmacji','2023-02-20','95022003456','d.wojcik@siecaptek.pl','farmaceuta',1),(25,'Elżbieta','Mazur','emazur','haslo123','Technik Farmaceutyczny','2021-11-12','88111207654','e.mazur@siecaptek.pl','technik',1),(26,'Filip','Lewandowski','flewandowski','haslo123','Młodszy Farmaceuta','2024-01-05','98010502134','f.lewandowski@siecaptek.pl','farmaceuta',1);
/*!40000 ALTER TABLE `pracownicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przydzial_apteka`
--

DROP TABLE IF EXISTS `przydzial_apteka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `przydzial_apteka` (
  `id_przydzialu` int NOT NULL AUTO_INCREMENT,
  `id_pracownika` int NOT NULL,
  `id_apteki` int NOT NULL,
  `data_od` date NOT NULL,
  `data_do` date DEFAULT NULL,
  PRIMARY KEY (`id_przydzialu`),
  KEY `id_pracownika` (`id_pracownika`),
  KEY `id_apteki` (`id_apteki`),
  CONSTRAINT `przydzial_apteka_ibfk_1` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownicy` (`id_pracownika`),
  CONSTRAINT `przydzial_apteka_ibfk_2` FOREIGN KEY (`id_apteki`) REFERENCES `apteki` (`id_apteki`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przydzial_apteka`
--

LOCK TABLES `przydzial_apteka` WRITE;
/*!40000 ALTER TABLE `przydzial_apteka` DISABLE KEYS */;
INSERT INTO `przydzial_apteka` VALUES (21,22,11,'2021-03-10',NULL),(22,23,11,'2022-06-01',NULL),(23,24,12,'2023-02-20',NULL);
/*!40000 ALTER TABLE `przydzial_apteka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `raport_finansowy_aptek`
--

DROP TABLE IF EXISTS `raport_finansowy_aptek`;
/*!50001 DROP VIEW IF EXISTS `raport_finansowy_aptek`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `raport_finansowy_aptek` AS SELECT 
 1 AS `apteka`,
 1 AS `przychod`,
 1 AS `koszt_zakupu`,
 1 AS `wynik_finansowy`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `raporty`
--

DROP TABLE IF EXISTS `raporty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raporty` (
  `id_raportu` int NOT NULL AUTO_INCREMENT,
  `typ` enum('sprzedaż','magazyn','personel','finanse') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_generacji` datetime DEFAULT CURRENT_TIMESTAMP,
  `plik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generowany_przez` int DEFAULT NULL,
  PRIMARY KEY (`id_raportu`),
  KEY `generowany_przez` (`generowany_przez`),
  CONSTRAINT `raporty_ibfk_1` FOREIGN KEY (`generowany_przez`) REFERENCES `pracownicy` (`id_pracownika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raporty`
--

LOCK TABLES `raporty` WRITE;
/*!40000 ALTER TABLE `raporty` DISABLE KEYS */;
/*!40000 ALTER TABLE `raporty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepta_lek`
--

DROP TABLE IF EXISTS `recepta_lek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepta_lek` (
  `id_recepta_lek` int NOT NULL AUTO_INCREMENT,
  `id_recepty` int NOT NULL,
  `id_leku` int NOT NULL,
  `ilosc` int DEFAULT '1',
  PRIMARY KEY (`id_recepta_lek`),
  KEY `id_recepty` (`id_recepty`),
  KEY `id_leku` (`id_leku`),
  CONSTRAINT `recepta_lek_ibfk_1` FOREIGN KEY (`id_recepty`) REFERENCES `recepty` (`id_recepty`),
  CONSTRAINT `recepta_lek_ibfk_2` FOREIGN KEY (`id_leku`) REFERENCES `leki` (`id_leku`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepta_lek`
--

LOCK TABLES `recepta_lek` WRITE;
/*!40000 ALTER TABLE `recepta_lek` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepta_lek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepty`
--

DROP TABLE IF EXISTS `recepty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepty` (
  `id_recepty` int NOT NULL AUTO_INCREMENT,
  `numer_recepty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_wystawienia` date DEFAULT NULL,
  `data_realizacji` date DEFAULT NULL,
  PRIMARY KEY (`id_recepty`),
  UNIQUE KEY `numer_recepty` (`numer_recepty`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepty`
--

LOCK TABLES `recepty` WRITE;
/*!40000 ALTER TABLE `recepty` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sprzedaz`
--

DROP TABLE IF EXISTS `sprzedaz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sprzedaz` (
  `id_sprzedazy` int NOT NULL AUTO_INCREMENT,
  `data_sprzedazy` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_apteki` int NOT NULL,
  `id_pracownika` int DEFAULT NULL,
  `kwota` decimal(10,2) DEFAULT NULL,
  `metoda_platnosci` enum('gotówka','karta','przelew') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'gotówka',
  PRIMARY KEY (`id_sprzedazy`),
  KEY `id_apteki` (`id_apteki`),
  KEY `id_pracownika` (`id_pracownika`),
  CONSTRAINT `sprzedaz_ibfk_1` FOREIGN KEY (`id_apteki`) REFERENCES `apteki` (`id_apteki`),
  CONSTRAINT `sprzedaz_ibfk_2` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownicy` (`id_pracownika`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprzedaz`
--

LOCK TABLES `sprzedaz` WRITE;
/*!40000 ALTER TABLE `sprzedaz` DISABLE KEYS */;
/*!40000 ALTER TABLE `sprzedaz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sprzet`
--

DROP TABLE IF EXISTS `sprzet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sprzet` (
  `id_sprzetu` int NOT NULL AUTO_INCREMENT,
  `id_apteki` int NOT NULL,
  `typ` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numer_seryjny` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licencja` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('aktywny','nieaktywny') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'aktywny',
  PRIMARY KEY (`id_sprzetu`),
  KEY `id_apteki` (`id_apteki`),
  CONSTRAINT `sprzet_ibfk_1` FOREIGN KEY (`id_apteki`) REFERENCES `apteki` (`id_apteki`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprzet`
--

LOCK TABLES `sprzet` WRITE;
/*!40000 ALTER TABLE `sprzet` DISABLE KEYS */;
/*!40000 ALTER TABLE `sprzet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `szczegoly_dostawy`
--

DROP TABLE IF EXISTS `szczegoly_dostawy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `szczegoly_dostawy` (
  `id_szczegolu` int NOT NULL AUTO_INCREMENT,
  `id_dostawy` int NOT NULL,
  `id_partii` int NOT NULL,
  `ilosc` int NOT NULL,
  `cena_zakupu` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_szczegolu`),
  KEY `id_dostawy` (`id_dostawy`),
  KEY `id_partii` (`id_partii`),
  CONSTRAINT `szczegoly_dostawy_ibfk_1` FOREIGN KEY (`id_dostawy`) REFERENCES `dostawy` (`id_dostawy`),
  CONSTRAINT `szczegoly_dostawy_ibfk_2` FOREIGN KEY (`id_partii`) REFERENCES `partie_lekow` (`id_partii`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `szczegoly_dostawy`
--

LOCK TABLES `szczegoly_dostawy` WRITE;
/*!40000 ALTER TABLE `szczegoly_dostawy` DISABLE KEYS */;
/*!40000 ALTER TABLE `szczegoly_dostawy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `szczegoly_sprzedazy`
--

DROP TABLE IF EXISTS `szczegoly_sprzedazy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `szczegoly_sprzedazy` (
  `id_pozycji` int NOT NULL AUTO_INCREMENT,
  `id_sprzedazy` int NOT NULL,
  `id_partii` int NOT NULL,
  `ilosc` int DEFAULT '1',
  `rabat` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id_pozycji`),
  KEY `id_sprzedazy` (`id_sprzedazy`),
  KEY `id_partii` (`id_partii`),
  CONSTRAINT `szczegoly_sprzedazy_ibfk_1` FOREIGN KEY (`id_sprzedazy`) REFERENCES `sprzedaz` (`id_sprzedazy`),
  CONSTRAINT `szczegoly_sprzedazy_ibfk_2` FOREIGN KEY (`id_partii`) REFERENCES `partie_lekow` (`id_partii`)
) ENGINE=InnoDB AUTO_INCREMENT=850 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `szczegoly_sprzedazy`
--

LOCK TABLES `szczegoly_sprzedazy` WRITE;
/*!40000 ALTER TABLE `szczegoly_sprzedazy` DISABLE KEYS */;
/*!40000 ALTER TABLE `szczegoly_sprzedazy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzytkownicy`
--

DROP TABLE IF EXISTS `uzytkownicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uzytkownicy` (
  `id_uzytkownika` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `haslo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rola` enum('admin','menedżer','farmaceuta','technik') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'farmaceuta',
  `ostatnie_logowanie` datetime DEFAULT NULL,
  `id_pracownika` int DEFAULT NULL,
  PRIMARY KEY (`id_uzytkownika`),
  UNIQUE KEY `login` (`login`),
  KEY `id_pracownika` (`id_pracownika`),
  CONSTRAINT `uzytkownicy_ibfk_1` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownicy` (`id_pracownika`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownicy`
--

LOCK TABLES `uzytkownicy` WRITE;
/*!40000 ALTER TABLE `uzytkownicy` DISABLE KEYS */;
INSERT INTO `uzytkownicy` VALUES (21,'adam_admin','test123','admin',NULL,21),(22,'beata_kierownik','test123','menedżer',NULL,22),(23,'cezary_farmaceuta','test123','farmaceuta',NULL,23),(24,'dorota_farmaceuta','test123','farmaceuta',NULL,24);
/*!40000 ALTER TABLE `uzytkownicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_sprzedaz_dzienna`
--

DROP TABLE IF EXISTS `view_sprzedaz_dzienna`;
/*!50001 DROP VIEW IF EXISTS `view_sprzedaz_dzienna`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_sprzedaz_dzienna` AS SELECT 
 1 AS `id_apteki`,
 1 AS `nazwa_apteki`,
 1 AS `data_sprzedazy`,
 1 AS `sprzedawca`,
 1 AS `suma_dzienna`,
 1 AS `liczba_transakcji`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `zadania_automatyczne`
--

DROP TABLE IF EXISTS `zadania_automatyczne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zadania_automatyczne` (
  `id_zadania` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harmonogram` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('aktywne','nieaktywne') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'aktywne',
  PRIMARY KEY (`id_zadania`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zadania_automatyczne`
--

LOCK TABLES `zadania_automatyczne` WRITE;
/*!40000 ALTER TABLE `zadania_automatyczne` DISABLE KEYS */;
/*!40000 ALTER TABLE `zadania_automatyczne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'siec_aptek'
--
/*!50003 DROP PROCEDURE IF EXISTS `aktualizuj_stan_magazynu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `aktualizuj_stan_magazynu`(
    IN p_id_apteki INT, IN p_id_partii INT, IN p_nowa_ilosc INT, IN p_id_pracownika INT
)
BEGIN
    UPDATE magazyn_apteki SET ilosc_dostepna = p_nowa_ilosc 
    WHERE id_apteki = p_id_apteki AND id_partii = p_id_partii;
    INSERT INTO log_aktywnosci (id_pracownika, data_operacji, akcja, tabela_dotyczy) 
    VALUES (p_id_pracownika, NOW(), 'Zmiana stanu', 'magazyn_apteki');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_dostawe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `dodaj_dostawe`(
    IN p_id_apteki INT, IN p_id_dostawcy INT, IN p_id_leku INT, IN p_ilosc INT, 
    IN p_cena_zakupu DECIMAL(10,2), IN p_cena_sprzedazy DECIMAL(10,2), 
    IN p_data_waznosci DATE, IN p_id_pracownika INT
)
BEGIN
    INSERT INTO dostawy (id_apteki_docelowej, id_dostawcy, status) VALUES (p_id_apteki, p_id_dostawcy, 'dostarczona');
    INSERT INTO partie_lekow (id_leku, numer_serii, data_waznosci, cena_zakupu, cena_sprzedazy, ilosc) 
    VALUES (p_id_leku, 'AUTO-GEN', p_data_waznosci, p_cena_zakupu, p_cena_sprzedazy, p_ilosc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_sprzedaz` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `dodaj_sprzedaz`(
    IN p_id_apteki INT, IN p_id_pracownika INT, IN p_kwota DECIMAL(10,2), 
    IN p_id_partii INT, IN p_ilosc INT, IN p_rabat DECIMAL(5,2)
)
BEGIN
    INSERT INTO sprzedaz (id_apteki, id_pracownika, kwota) VALUES (p_id_apteki, p_id_pracownika, p_kwota);
    UPDATE magazyn_apteki SET ilosc_dostepna = ilosc_dostepna - p_ilosc 
    WHERE id_apteki = p_id_apteki AND id_partii = p_id_partii;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `aktualny_stan_magazynu`
--

/*!50001 DROP VIEW IF EXISTS `aktualny_stan_magazynu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `aktualny_stan_magazynu` AS select `a`.`nazwa` AS `apteka`,`l`.`nazwa_handlowa` AS `lek`,`pl`.`numer_serii` AS `numer_serii`,`pl`.`data_waznosci` AS `data_waznosci`,`ma`.`ilosc_dostepna` AS `ilosc_dostepna`,`pl`.`cena_sprzedazy` AS `cena_sprzedazy`,(`ma`.`ilosc_dostepna` * `pl`.`cena_sprzedazy`) AS `wartosc_magazynu` from (((`magazyn_apteki` `ma` join `apteki` `a` on((`ma`.`id_apteki` = `a`.`id_apteki`))) join `partie_lekow` `pl` on((`ma`.`id_partii` = `pl`.`id_partii`))) join `leki` `l` on((`pl`.`id_leku` = `l`.`id_leku`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `analiza_sprzedazy`
--

/*!50001 DROP VIEW IF EXISTS `analiza_sprzedazy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `analiza_sprzedazy` AS select `l`.`nazwa_handlowa` AS `lek`,sum(`sz`.`ilosc`) AS `liczba_sprzedanych`,sum(((`sz`.`ilosc` * `pl`.`cena_sprzedazy`) * (1 - (`sz`.`rabat` / 100)))) AS `wartosc_sprzedazy` from ((`szczegoly_sprzedazy` `sz` join `partie_lekow` `pl` on((`sz`.`id_partii` = `pl`.`id_partii`))) join `leki` `l` on((`pl`.`id_leku` = `l`.`id_leku`))) group by `l`.`id_leku` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `historia_pracownikow`
--

/*!50001 DROP VIEW IF EXISTS `historia_pracownikow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `historia_pracownikow` AS select 1 AS `imie`,1 AS `nazwisko`,1 AS `apteka`,1 AS `data_od`,1 AS `data_do` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `historia_pracownikow_status`
--

/*!50001 DROP VIEW IF EXISTS `historia_pracownikow_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `historia_pracownikow_status` AS select 1 AS `imie`,1 AS `nazwisko`,1 AS `apteka`,1 AS `data_od`,1 AS `status_zatrudnienia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `log_aktywnosci_rozszerzony`
--

/*!50001 DROP VIEW IF EXISTS `log_aktywnosci_rozszerzony`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `log_aktywnosci_rozszerzony` AS select 1 AS `id_logu`,1 AS `imie`,1 AS `nazwisko`,1 AS `data_operacji`,1 AS `akcja`,1 AS `tabela_dotyczy` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `niskie_stany_magazynowe`
--

/*!50001 DROP VIEW IF EXISTS `niskie_stany_magazynowe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `niskie_stany_magazynowe` AS select 1 AS `apteka`,1 AS `lek`,1 AS `ilosc_dostepna` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `raport_finansowy_aptek`
--

/*!50001 DROP VIEW IF EXISTS `raport_finansowy_aptek`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `raport_finansowy_aptek` AS select 1 AS `apteka`,1 AS `przychod`,1 AS `koszt_zakupu`,1 AS `wynik_finansowy` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_sprzedaz_dzienna`
--

/*!50001 DROP VIEW IF EXISTS `view_sprzedaz_dzienna`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_sprzedaz_dzienna` AS select 1 AS `id_apteki`,1 AS `nazwa_apteki`,1 AS `data_sprzedazy`,1 AS `sprzedawca`,1 AS `suma_dzienna`,1 AS `liczba_transakcji` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-31 12:35:16
