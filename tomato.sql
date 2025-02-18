-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: tomato
-- ------------------------------------------------------
-- Server version	8.2.0

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

--
-- Current Database: `tomato`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tomato` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tomato`;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `address_id` binary(16) NOT NULL,
  `city` varchar(255) NOT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `latitude` decimal(38,2) NOT NULL,
  `longitude` decimal(38,2) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FK1fa36y2oqhao3wgg2rw1pi459` (`user_id`),
  CONSTRAINT `FK1fa36y2oqhao3wgg2rw1pi459` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (_binary '░Zy}\'Na¬\Ωa\n·\ΣG','Kolkata','CB 1/1 Railpukur Road, Baguiati',22.61,88.43,'700059','97ddfaba-b79c-41d8-bb02-6775e7dea159');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `email` varchar(255) NOT NULL,
  `food_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`email`,`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items_cart_item_list`
--

DROP TABLE IF EXISTS `cart_items_cart_item_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items_cart_item_list` (
  `cart_items_email` varchar(255) NOT NULL,
  `cart_item_list_email` varchar(255) NOT NULL,
  `cart_item_list_food_id` int NOT NULL,
  UNIQUE KEY `UK_7ku89t66sdnv3g1jdpuc5ahfp` (`cart_item_list_email`,`cart_item_list_food_id`),
  KEY `FKivk2nhhjbje19yd6a9h3635kb` (`cart_items_email`),
  CONSTRAINT `FKivk2nhhjbje19yd6a9h3635kb` FOREIGN KEY (`cart_items_email`) REFERENCES `cart_items` (`email`),
  CONSTRAINT `FKrisxvgcfg71ylhxcqg0vhbhe` FOREIGN KEY (`cart_item_list_email`, `cart_item_list_food_id`) REFERENCES `cart_item` (`email`, `food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items_cart_item_list`
--

LOCK TABLES `cart_items_cart_item_list` WRITE;
/*!40000 ALTER TABLE `cart_items_cart_item_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items_cart_item_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `published` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('4147592a-deea-4d00-9f61-377ca1d26f2e','Non Veg',1),('728d766a-8a73-4882-8950-db7fe8ca767d','Burger',1),('af23daf3-9d4b-4b37-b5c2-3c741852b7e9','Biriyani',1),('ef476d62-5ea6-4575-bcfc-432f23316250','Indian',1),('f6fb5839-72a3-4875-b290-63fcb8db1dd0','Chinese',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_agent_orders`
--

DROP TABLE IF EXISTS `delivery_agent_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_agent_orders` (
  `delivery_agent_id` binary(16) NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  KEY `FKho7pui2mut590gurnb21wm10e` (`delivery_agent_id`),
  CONSTRAINT `FKho7pui2mut590gurnb21wm10e` FOREIGN KEY (`delivery_agent_id`) REFERENCES `delivery_agents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_agent_orders`
--

LOCK TABLES `delivery_agent_orders` WRITE;
/*!40000 ALTER TABLE `delivery_agent_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_agent_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_agents`
--

DROP TABLE IF EXISTS `delivery_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_agents` (
  `id` binary(16) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `avatar` text,
  `email` varchar(255) NOT NULL,
  `is_online` bit(1) NOT NULL,
  `is_assigned` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_agents`
--

LOCK TABLES `delivery_agents` WRITE;
/*!40000 ALTER TABLE `delivery_agents` DISABLE KEYS */;
INSERT INTO `delivery_agents` VALUES (_binary 'e{Ü╟╣iJÅ»ò}╗än','101095259296411258727','Ayush Sharma','https://lh3.googleusercontent.com/a/ACg8ocILV6hpqUABIUJ9hHpJuGYQvi8flQ2_bvhOSy0HtvvNS5_EdpX4sw=s96-c','arp23359@gmail.com',_binary '',_binary '\0');
/*!40000 ALTER TABLE `delivery_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_partner`
--

DROP TABLE IF EXISTS `delivery_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_partner` (
  `id` varchar(255) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_partner`
--

LOCK TABLES `delivery_partner` WRITE;
/*!40000 ALTER TABLE `delivery_partner` DISABLE KEYS */;
INSERT INTO `delivery_partner` VALUES ('0148026b-431c-4f6e-bb7f-ebc8c55a6a36',13.45,11.38,'Ayush'),('041cf87a-0ee8-4398-94ba-d8e7704208ec',13.45,11.38,'Ayush'),('0671f438-4b8d-4646-91d9-e5de8413f942',13.45,11.38,'Ayush'),('06ba5fac-1b3d-472e-8bac-e0ab6e3f6caa',13.45,11.38,'Ayush'),('06c5db7d-b658-49a9-a306-d2e1601ac72b',13.45,11.38,'Ayush'),('07e42207-fc42-4f37-807f-68e0501a91df',13.45,11.38,'Ayush'),('0812a0d3-d18f-4222-b202-bbb436623d50',13.45,11.38,'Ayush'),('0963d19e-6659-44c0-819c-575f30807120',13.45,11.38,'Ayush'),('0aeedc00-0b50-4f19-bdc4-64afb3d3921e',13.45,11.38,'Ayush'),('0b95b45e-1cae-484f-8ec1-a26eea9940d8',13.45,11.38,'Ayush'),('0c0e132a-e6e8-477c-b032-c028cfb014bb',13.45,11.38,'Ayush'),('0c38c8e1-3e47-4baf-9a0f-f7be9977672d',13.45,11.38,'Ayush'),('0cb88bef-2647-4337-a1a7-3f2793b200e2',13.45,11.38,'Ayush'),('11cc44ee-c134-4c34-949c-8d30ccba480e',13.45,11.38,'Ayush'),('12533ce7-ae29-4636-b233-61f6ad3d860d',13.45,11.38,'Ayush'),('14229670-0fea-4820-9968-e32d35042de3',13.45,11.38,'Ayush'),('14929576-32da-4c36-af78-c744f313275f',13.45,11.38,'Ayush'),('14ea7c7d-3bad-49be-b2b0-b2cdf3da921f',13.45,11.38,'Ayush'),('16089438-b0e3-45b0-8d3f-294eeb3337e0',13.45,11.38,'Ayush'),('1739abfb-e369-40ac-813b-9899886b0ac1',13.45,11.38,'Ayush'),('18f91517-aaf7-4a95-b20f-8292aec0841a',13.45,11.38,'Ayush'),('193e8512-cfc6-4a1e-9175-94767727545e',13.45,11.38,'Ayush'),('19d06eee-7bf8-4654-9082-d2fdbc5b22e4',13.45,11.38,'Ayush'),('1ce7045f-df3e-4f99-8cc4-013f1e00dbe2',13.45,11.38,'Ayush'),('1d4142fd-3180-440e-91d0-018888fbc925',13.45,11.38,'Ayush'),('1e0a4d8a-cc41-459e-a1fe-41d169d8ff48',13.45,11.38,'Ayush'),('21f979d7-76e4-4124-830c-ccb1ffedcbc8',13.45,11.38,'Ayush'),('220f8557-2335-47b7-9f68-571a4852f6ee',13.45,11.38,'Ayush'),('256b833f-e431-469b-84f0-39cb67a086bb',13.45,11.38,'Ayush'),('271d801a-9a1e-4f0b-bee9-4e0c743c1a43',13.45,11.38,'Ayush'),('272fcec4-8870-4c0e-83f4-4af0bb47eafe',13.45,11.38,'Ayush'),('27600e83-ae26-41d9-8b92-600954a46735',13.45,11.38,'Ayush'),('2e6a90d7-4bc8-4810-84e7-603be9550d75',13.45,11.38,'Ayush'),('2e7e1953-517e-4c0c-926d-143e566f0b56',13.45,11.38,'Ayush'),('2e893448-7610-4a92-944c-d274398b472b',13.45,11.38,'Ayush'),('2fe1351a-287d-4920-99f6-b7ecfcdfb69e',13.45,11.38,'Ayush'),('30b74863-701f-41d3-9fe3-63209d2454f9',13.45,11.38,'Ayush'),('31e01ed2-0076-417f-8e86-bd392a29a6a6',13.45,11.38,'Ayush'),('32b9bc04-ecd2-4308-9271-a3378389e8e2',13.45,11.38,'Ayush'),('34a7e252-eb60-4009-ba22-ae3b66158cda',13.45,11.38,'Ayush'),('36329c99-70c5-4358-bfcb-8f11cb273dff',13.45,11.38,'Ayush'),('36c1d348-6017-4056-907b-50e1327cacf7',13.45,11.38,'Ayush'),('36e33070-f5a0-42bb-b8bd-7504d13eb32d',13.45,11.38,'Ayush'),('37859f4c-6553-42ef-9d13-faa1dfe18f59',13.45,11.38,'Ayush'),('3860bffd-c29f-400a-9739-75413a202a21',13.45,11.38,'Ayush'),('3954b7d0-0dfe-41f5-b639-67faf1a7bc00',13.45,11.38,'Ayush'),('3d32d141-5d26-4da5-b987-97d414d46da2',13.45,11.38,'Ayush'),('3f453305-8303-46df-811c-6ef69bd180f1',13.45,11.38,'Ayush'),('40295c94-e28c-4cb5-9352-84eb8d775e40',13.45,11.38,'Ayush'),('4200cbaf-dffc-43f9-a277-b5e0c82ad069',13.45,11.38,'Ayush'),('42013c75-effc-43a6-afd7-8646798c8871',13.45,11.38,'Ayush'),('4239fded-9134-44ed-8030-57f0f1210839',13.45,11.38,'Ayush'),('43b3d479-3f7e-4ef5-9cb5-e38f7f91f14d',13.45,11.38,'Ayush'),('450a460a-3193-43aa-9f3f-83c8e2a80c9c',13.45,11.38,'Ayush'),('490c9e1f-21d7-4212-b3d2-193c538f54a4',13.45,11.38,'Ayush'),('493c8d22-fe19-4863-bced-5bb3808d7dfe',13.45,11.38,'Ayush'),('4a71dbb3-ff46-431f-af15-7eee6727dc0a',13.45,11.38,'Ayush'),('4a827434-27c8-488a-aec6-04a437d0b33d',13.45,11.38,'Ayush'),('4b948999-ff3a-4099-adff-381137d6b445',13.45,11.38,'Ayush'),('4df41c63-506d-42d6-b676-5a85ffae5346',13.45,11.38,'Ayush'),('4e215d56-0525-4cad-8118-26ed4b7146ac',13.45,11.38,'Ayush'),('4f9f8aa8-8a08-4802-bffa-bb3413043939',13.45,11.38,'Ayush'),('504c5127-075d-4225-a523-620ef150545a',13.45,11.38,'Ayush'),('5292e5f4-e7d6-43b2-9a92-f98c8bf98108',13.45,11.38,'Ayush'),('56f3102d-82cf-4fe9-a083-83a5fd646fa9',13.45,11.38,'Ayush'),('5957c3d7-bef5-4233-9807-189b830a1de0',13.45,11.38,'Ayush'),('5ab30ad0-daa3-4ce1-a848-3fc8ee2b21c4',13.45,11.38,'Ayush'),('5e0f0046-c19b-4123-98d1-d96507aa0132',13.45,11.38,'Ayush'),('5f5f04a6-b10b-4bb0-91ef-2f6e819b2f03',13.45,11.38,'Ayush'),('5fae7222-1d19-4705-b15e-80ec257c8010',13.45,11.38,'Ayush'),('602bbc05-36f0-47f4-99ec-350fb0fc5903',13.45,11.38,'Ayush'),('60875b96-7ff0-4683-9980-69719c31ae19',13.45,11.38,'Ayush'),('6188a907-e3ce-459e-a38c-fc29a4b2d373',13.45,11.38,'Ayush'),('6395630a-a6c4-4e2c-8916-0d5d2f5212e0',13.45,11.38,'Ayush'),('63d54bde-a3ed-482f-a83b-4aac66608c54',13.45,11.38,'Ayush'),('65685667-0c99-4524-93a3-93a72a108764',13.45,11.38,'Ayush'),('66c74f86-b329-4a81-8d84-05af4e7ccfa5',13.45,11.38,'Ayush'),('6735e70b-eb5e-4ed9-b0a1-ee56ad8e2745',13.45,11.38,'Ayush'),('68f9b7e3-3811-4526-801d-00dfbbb35315',13.45,11.38,'Ayush'),('69ef6210-f438-4851-9f3f-a5828bc2531d',13.45,11.38,'Ayush'),('6a058e77-20b4-4309-b435-66468858eff3',13.45,11.38,'Ayush'),('6c25947e-fbd3-41c2-91ef-cd74854541e2',13.45,11.38,'Ayush'),('6c5ad64a-1dca-4c33-82b9-2bafc2606242',13.45,11.38,'Ayush'),('6c5b8ec3-9ed8-43cc-8007-599ef06edf6f',13.45,11.38,'Ayush'),('6e312496-a88d-4abf-b58e-08b504a27a56',13.45,11.38,'Ayush'),('6e7e1b59-ed12-417a-8cf2-f72c70f64806',13.45,11.38,'Ayush'),('6ef6a7b8-8acb-4e90-b0fc-cf914cafcd8c',13.45,11.38,'Ayush'),('6f98fd5f-22c2-4fb1-bb37-5e96b0117791',13.45,11.38,'Ayush'),('726c01b0-db49-4545-a1e0-bbee817df0cd',13.45,11.38,'Ayush'),('73d30776-87f0-4ce5-b400-70968434e042',13.45,11.38,'Ayush'),('74f4928f-9f05-47a5-8bef-e1d9757e578e',13.45,11.38,'Ayush'),('7507598e-fc01-4ea5-aff4-3c822e309c01',13.45,11.38,'Ayush'),('75234951-4983-477a-a5b2-9608a3a5a56e',13.45,11.38,'Ayush'),('76844426-c6d5-4219-a123-8b1664f09e14',13.45,11.38,'Ayush'),('780649df-1048-4ce2-9aab-0ade9ccdc564',13.45,11.38,'Ayush'),('781c12e2-b267-4a35-b346-f6347cdc7707',13.45,11.38,'Ayush'),('782c8898-fb07-4ae5-99d9-c88d9fd84f17',13.45,11.38,'Ayush'),('7a277e11-f352-4e0a-8128-95bbce7dc8bb',13.45,11.38,'Ayush'),('7ac18d0c-c4a6-4fa5-8bd3-dcb7d3116261',13.45,11.38,'Ayush'),('7b3029fc-6a91-4880-879c-5794874cfdae',13.45,11.38,'Ayush'),('7c6ccb55-cd9a-41bc-afb0-71c59a07f6b0',13.45,11.38,'Ayush'),('7cac9ac2-d07f-4569-8de8-236bd02516c2',13.45,11.38,'Ayush'),('7d9c9bf1-9742-4226-b1d7-63f0ebb69e60',13.45,11.38,'Ayush'),('7f495828-3b74-4adf-9e79-d777ebb5e86e',13.45,11.38,'Ayush'),('7f999ea8-628e-4408-a6b9-c089102c8ab7',13.45,11.38,'Ayush'),('7fad5c78-f134-4131-80cd-a36a33e48e04',13.45,11.38,'Ayush'),('81299317-684d-43bc-8380-0426ac27253e',13.45,11.38,'Ayush'),('8227c68a-3b4f-4d73-a358-628240daa2ae',13.45,11.38,'Ayush'),('83d23931-26fe-4d09-9b8e-befc9972b4fe',13.45,11.38,'Ayush'),('852e1a1c-1d41-414c-957f-c9d5ea88ceb9',13.45,11.38,'Ayush'),('85fa036f-fed8-4977-adc8-ccda8115e32d',13.45,11.38,'Ayush'),('862ff760-d564-494e-af06-12a93531a6b7',13.45,11.38,'Ayush'),('8b302b4c-db16-4dd8-907f-fea0d7f0d259',13.45,11.38,'Ayush'),('8d2bdcbe-5da4-43ee-865a-91efb2151f7a',13.45,11.38,'Ayush'),('8e27dc18-ee6e-40c8-a0aa-e3e96007351f',13.45,11.38,'Ayush'),('8e290d20-f087-412a-ab53-747f9a20e5e6',13.45,11.38,'Ayush'),('8e3183bd-42df-4479-8980-7303417cf164',13.45,11.38,'Ayush'),('90a7dfa3-dfc7-4c2c-886a-ffdb6085dbef',13.45,11.38,'Ayush'),('90a879c2-ef49-4afb-bb3c-99eb5104b567',13.45,11.38,'Ayush'),('919a2e75-a652-476e-8467-0615825ef379',13.45,11.38,'Ayush'),('9283606a-8b1f-4342-9fc4-d2b23edf7f00',13.45,11.38,'Ayush'),('92fafab9-e282-455f-9cdb-163fa61c4093',13.45,11.38,'Ayush'),('934a6749-7ca1-42aa-81cf-53bf226c75f1',13.45,11.38,'Ayush'),('960c1e1a-4006-4b98-bd20-70024d448614',13.45,11.38,'Ayush'),('96bfa8b1-0f0c-4a18-a7fa-b0fcd0ccc577',13.45,11.38,'Ayush'),('97580a11-29d6-412e-8195-2df894a47939',13.45,11.38,'Ayush'),('97970b25-a42e-46d9-8c69-833b3f5519d3',13.45,11.38,'Ayush'),('9835f942-b1e6-48e5-90d3-0b1efeff2d96',13.45,11.38,'Ayush'),('9e91b754-ac44-4f91-99dc-34776141bcaa',13.45,11.38,'Ayush'),('9f089828-d54a-4397-a0f0-145970c8c52b',13.45,11.38,'Ayush'),('9f379e59-79ee-4327-a331-b0b9f807a8f5',13.45,11.38,'Ayush'),('a04c8e68-2f47-45ac-9a09-d342e521c5ea',13.45,11.38,'Ayush'),('a6db1fce-b4e3-4b89-9e6b-f2437f847a67',13.45,11.38,'Ayush'),('a747a84f-62fb-4730-b04f-ee555300efbd',13.45,11.38,'Ayush'),('ab7339cd-95fd-499e-90f7-6cd5daa7103a',13.45,11.38,'Ayush'),('ab81a051-a959-4630-8862-0937575c9f58',13.45,11.38,'Ayush'),('abbb2099-e1cd-4da2-80bf-d6100e8b6c29',13.45,11.38,'Ayush'),('ae5ffbec-f60f-4488-ad01-fa1b6b804fd1',13.45,11.38,'Ayush'),('b16b2f96-77da-4cfa-8bc9-badfa3b42afe',13.45,11.38,'Ayush'),('b2060ad3-a419-4803-b915-22743feb6765',13.45,11.38,'Ayush'),('b348118a-8cc3-49c0-af9b-bd1a8b304e9a',13.45,11.38,'Ayush'),('b3b21160-809e-41ce-8abd-d1f0b044cca9',13.45,11.38,'Ayush'),('b71b0e77-f1a8-4eb3-af48-85e187b3783e',13.45,11.38,'Ayush'),('b81140de-6bf7-43b4-92a5-babff5a7777e',13.45,11.38,'Ayush'),('b89c22dc-b00f-4552-a308-27d0b43eb301',13.45,11.38,'Ayush'),('b8c51da8-b9d2-4d7d-94df-450f4bf2b6aa',13.45,11.38,'Ayush'),('b8dd6690-4d34-445b-b7fe-43c74e3393ea',13.45,11.38,'Ayush'),('b9b26b22-d150-4a32-979f-e5dee394c370',13.45,11.38,'Ayush'),('b9dec425-ca36-4ab7-822c-e0e2666b7413',13.45,11.38,'Ayush'),('ba2de76e-6794-4cbc-bfb5-5491482d7d33',13.45,11.38,'Ayush'),('bc460e41-5c4f-4557-b025-d990d350c271',13.45,11.38,'Ayush'),('bca8f9aa-67e7-4ff1-9672-e27f515dc56b',13.45,11.38,'Ayush'),('bd1a7825-350c-4c34-9037-bc078f2550f5',13.45,11.38,'Ayush'),('be3356c7-9751-4b96-97af-33b3285cc3bf',13.45,11.38,'Ayush'),('be6737b9-31e6-437e-8c4e-b9596974c9ef',13.45,11.38,'Ayush'),('bf2a0f41-706f-48c4-b845-81b31a4a998e',13.45,11.38,'Ayush'),('c84612eb-a010-498f-b343-603d92f74063',13.45,11.38,'Ayush'),('c960c64b-6469-4341-b537-68ee902de2e6',13.45,11.38,'Ayush'),('c9e33e31-cd1d-49fd-9122-ba4fc8e6fb50',13.45,11.38,'Ayush'),('cab5151d-2d7b-4aed-96a9-730ac78e287a',13.45,11.38,'Ayush'),('cbfc825d-ed16-49d8-bf43-d88071f44d74',13.45,11.38,'Ayush'),('d0b70333-52d2-4e21-90e6-457f9ae9c3f5',13.45,11.38,'Ayush'),('d17c7513-cc6f-4329-91c3-6bc580c6aaa4',13.45,11.38,'Ayush'),('d1bbb3ab-f23e-4e07-8e63-e2ef69e322a4',13.45,11.38,'Ayush'),('d3e26865-9f89-4139-86d1-1d177425df62',13.45,11.38,'Ayush'),('d4d9ed66-adc5-4e37-946d-78d2edc4b383',13.45,11.38,'Ayush'),('d61e1e55-948c-4bcb-8bd1-8b2bad65d6f2',13.45,11.38,'Ayush'),('d77e04b1-0f79-4c48-b450-2da6af8f3385',13.45,11.38,'Ayush'),('d91bd843-efe1-419f-baf6-5cf057b357c0',13.45,11.38,'Ayush'),('da2c4475-4b0d-4a33-9be9-79f8989141ae',13.45,11.38,'Ayush'),('da64839b-0da9-46d2-a38e-dd8946488679',13.45,11.38,'Ayush'),('db1a3507-64b3-41d9-a1bb-eedfa2460f08',13.45,11.38,'Ayush'),('dbd96421-8d50-4543-a725-195b228c2c00',13.45,11.38,'Ayush'),('dbded1ec-d218-4456-aa3c-316f5c265430',13.45,11.38,'Ayush'),('dc18292f-ef3b-4014-be80-14a55c6563c5',13.45,11.38,'Ayush'),('dc8be7f2-d716-46c6-8e4e-787c5cd0aafa',13.45,11.38,'Ayush'),('df614928-a81e-423a-92d5-11c438c0462a',13.45,11.38,'Ayush'),('e2b3fadf-0b87-4906-a81e-2d9b5f834216',13.45,11.38,'Ayush'),('e84660db-d21b-4fd2-8e21-093e32f66540',13.45,11.38,'Ayush'),('e8ac91c0-19c9-4d35-be22-2b419689aff5',13.45,11.38,'Ayush'),('e910a647-b0bc-4a4d-b26b-b7aa7ba9f237',13.45,11.38,'Ayush'),('e948ef34-2cc6-4aef-a3e4-0e0603e7b1d4',13.45,11.38,'Ayush'),('eb9dbe6c-ec19-4803-b22d-0413cb036092',13.45,11.38,'Ayush'),('ecb969d2-4ae6-4413-beac-562df01df65a',13.45,11.38,'Ayush'),('ee7e5fa6-a0d8-41d2-b780-4a914a6f8310',13.45,11.38,'Ayush'),('ee92bcee-1460-4f77-8594-0da6fafc3d95',13.45,11.38,'Ayush'),('eef3ca15-762d-4c85-af4e-813e363a7692',13.45,11.38,'Ayush'),('f03e82f3-f0d9-472e-9602-1cf276b9b8a8',13.45,11.38,'Ayush'),('f407e31e-fa1c-440d-947f-aa46ce8facad',13.45,11.38,'Ayush'),('f5b22c87-31a6-41bb-8895-77eb2e506688',13.45,11.38,'Ayush'),('f663f836-5bcf-401b-aa61-001625fdfdb8',13.45,11.38,'Ayush'),('f6cc3502-d424-441c-9370-8edb6be4acb1',13.45,11.38,'Ayush'),('f72bf28b-1af1-43df-af61-18888811b964',13.45,11.38,'Ayush'),('f79ffe0b-84b7-4673-946f-d6f0f8b53fd8',13.45,11.38,'Ayush'),('f837968b-5f8a-4ea6-bce8-fe889cae8fa1',13.45,11.38,'Ayush'),('fd2705b0-eb80-4962-8071-2da8d07edb81',13.45,11.38,'Ayush'),('fd30e08a-866c-4ebb-a240-3bd1b5fae9fe',13.45,11.38,'Ayush'),('fddb45b3-9442-4c44-8c96-c692a2426c81',13.45,11.38,'Ayush'),('fe1129a0-6d09-4c3d-89e2-e4aa96a34aa8',13.45,11.38,'Ayush'),('ff9d1303-0123-4fc2-810e-a91622c64cee',13.45,11.38,'Ayush'),('xxx',13.45,11.38,'Ayush');
/*!40000 ALTER TABLE `delivery_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `id` varchar(255) NOT NULL,
  `cook_time` int DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image_url` varchar(1000) DEFAULT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `on_sale` double NOT NULL,
  `price` double NOT NULL,
  `published` int DEFAULT NULL,
  `stars` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES ('b1fb170c-f326-4016-b3fa-6bf8f8cf2ca8',10,'A hamburger, also known as a burger, is a sandwich made up of a cooked patty of ground beef between two buns. Burgers are often seasoned and grilled or fried, and are commonly garnished with onions, lettuce, tomatoes, ketchup, and bacon. Other ingredients that can be added include mayonnaise, cheese, and cream.','https://res.cloudinary.com/dgfljm0r3/image/upload/v1704914623/ubq1cbbxtlcjcc8fxlev.png','Hamburger',0,250,1,4.6),('c3c1379d-c122-4c12-abb1-11aed44f316a',10,'Chicken biryani is a fragrant South Asian rice dish, combining marinated chicken, basmati rice, and aromatic spices in a flavorful medley.','../../assets/food3.png','Chicken Biriyani',0,140,1,4.8);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_category`
--

DROP TABLE IF EXISTS `food_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_category` (
  `food_id` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  KEY `FKfwwad8hlrt9n61hxh7a1a9n02` (`category_id`),
  KEY `FK2dh3obfbbqnpsr2qpqprewq8i` (`food_id`),
  CONSTRAINT `FK2dh3obfbbqnpsr2qpqprewq8i` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`),
  CONSTRAINT `FKfwwad8hlrt9n61hxh7a1a9n02` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_category`
--

LOCK TABLES `food_category` WRITE;
/*!40000 ALTER TABLE `food_category` DISABLE KEYS */;
INSERT INTO `food_category` VALUES ('b1fb170c-f326-4016-b3fa-6bf8f8cf2ca8','4147592a-deea-4d00-9f61-377ca1d26f2e'),('b1fb170c-f326-4016-b3fa-6bf8f8cf2ca8','728d766a-8a73-4882-8950-db7fe8ca767d'),('c3c1379d-c122-4c12-abb1-11aed44f316a','4147592a-deea-4d00-9f61-377ca1d26f2e'),('c3c1379d-c122-4c12-abb1-11aed44f316a','af23daf3-9d4b-4b37-b5c2-3c741852b7e9'),('c3c1379d-c122-4c12-abb1-11aed44f316a','ef476d62-5ea6-4575-bcfc-432f23316250');
/*!40000 ALTER TABLE `food_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `one_time_password`
--

DROP TABLE IF EXISTS `one_time_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `one_time_password` (
  `id` varchar(255) NOT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `one_time_password_code` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `one_time_password`
--

LOCK TABLES `one_time_password` WRITE;
/*!40000 ALTER TABLE `one_time_password` DISABLE KEYS */;
INSERT INTO `one_time_password` VALUES ('0d069398-e312-4cbb-af7d-5143a1a0e074','2024-01-04 22:57:45.249000',913380),('0f4c46d2-d210-4cc6-9ab8-79fb69864dbc','2024-01-17 22:40:45.864000',886262),('1f34ac7b-fc02-43f6-a25e-1e72f3a59bdf','2024-01-07 23:08:06.111000',780703),('49971a12-2850-4f30-af2d-b300b64e06f6','2024-01-04 01:44:40.944000',492142),('5371e00e-e5ea-4119-a3fd-47b4281a6f0b','2024-01-05 18:21:18.943000',161234),('6664049a-03bc-4762-a6b1-9c617c505222','2024-01-05 18:23:12.534000',974060),('73a870d0-698c-4aca-9729-9db5e3e1511a','2024-01-07 23:10:03.278000',690826),('98704881-bc0d-4166-a04e-708200c9eabb','2024-05-18 02:22:00.981000',695737),('ca509950-3850-43da-8bd1-f7ee88e189cf','2024-03-21 15:10:48.966000',729980),('cd9c5220-d0e0-4315-9c25-66549dc3793b','2024-01-05 18:23:03.317000',996948),('d84e511a-7ee8-4f6b-9b2f-9195356262b0','2024-01-04 01:58:57.262000',630146),('f5a51c54-040b-4c72-b400-a00b5530e98c','2024-05-18 02:56:54.990000',171917),('f6ab6fd8-821e-4338-88e4-ef827a8a4d8e','2024-01-04 01:49:15.435000',515573);
/*!40000 ALTER TABLE `one_time_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(255) NOT NULL,
  `amount` int NOT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order_items`
--

DROP TABLE IF EXISTS `orders_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order_items` (
  `my_order_order_id` varchar(255) NOT NULL,
  `order_items_id` varchar(255) NOT NULL,
  UNIQUE KEY `UK_9d47gapmi35omtannusv6btu3` (`order_items_id`),
  KEY `FKfy5vlpootux3gv6b2uuv98xa0` (`my_order_order_id`),
  CONSTRAINT `FK7nw03p9mxq154wvbsonaq0qrw` FOREIGN KEY (`order_items_id`) REFERENCES `order_item` (`id`),
  CONSTRAINT `FKfy5vlpootux3gv6b2uuv98xa0` FOREIGN KEY (`my_order_order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order_items`
--

LOCK TABLES `orders_order_items` WRITE;
/*!40000 ALTER TABLE `orders_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` binary(16) NOT NULL,
  `amount` decimal(38,2) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `rzp_order_id` varchar(255) DEFAULT NULL,
  `rzp_pay_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj94hgy9v5fw1munb90tar2eje` (`user_id`),
  CONSTRAINT `FKj94hgy9v5fw1munb90tar2eje` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (_binary '¢GÑRJ9┐Å+m6y',19000.00,NULL,'2024-05-19 23:10:51.276705',NULL,'order_OCREGAAvRaVgSs',NULL,'initiated','online','97ddfaba-b79c-41d8-bb02-6775e7dea159',NULL),(_binary 'Ö,q\ΩûG4ª/Húuhgñ',19000.00,NULL,'2024-05-20 00:53:46.621971',NULL,NULL,NULL,'initiated','cod','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-20 00:53:46.621971'),(_binary '	\╟QI\\\┬I╛Ü┴æ>╝;-Æ',47000.00,NULL,'2024-05-21 05:06:30.162445',NULL,NULL,NULL,'initiated','cod','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-21 05:06:30.162445'),(_binary '\Z╠ì░Bzÿb─╢Çⁿ\╩',19000.00,'+919874180842','2024-05-19 23:37:53.996913',NULL,'order_OCRgpPH49VxGQk','pay_OCRhtjSjadxYr1','captured','online','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-19 23:38:55.772241'),(_binary '-\╫╠╜mICÆ╜\n¢#rîò\µ',33000.00,NULL,'2024-05-20 00:56:41.083309',NULL,NULL,NULL,'initiated','cod','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-20 00:56:41.083309'),(_binary 'H%ûQ[AD«j░N5ƒgö',38600.00,NULL,'2024-05-22 08:39:08.432129',NULL,'order_ODNymZFyvIMAeY',NULL,'initiated','online','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-22 08:39:08.432129'),(_binary 'LƒKL54@Zú\┘N{f7N▒',33000.00,NULL,'2024-05-21 04:37:26.110318',NULL,'order_OCvKLP07kI41aQ',NULL,'initiated','online','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-21 04:37:26.110318'),(_binary 'OPamDz¥(ì=ªza',33000.00,NULL,'2024-05-21 04:40:02.856004',NULL,'order_OCvN6T8SqOLGlW',NULL,'initiated','online','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-21 04:40:02.856004'),(_binary 'z¡{.	E╠ô\Ω(?ƒ²',33000.00,NULL,'2024-05-21 04:47:55.434728',NULL,'order_OCvVQLN1mP0aCY',NULL,'initiated','online','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-21 04:47:55.434728'),(_binary '}\0\Ω2\╘RL┼╜▐ïèeñ|',16200.00,NULL,'2024-06-19 00:06:09.444314',NULL,'order_OOKCIMgbktXyUW',NULL,'initiated','online','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-06-19 00:06:09.444314'),(_binary 'å0╛\τ8@I£\┘\╨[{\▌X╝',19000.00,NULL,'2024-05-20 00:52:46.077874',NULL,NULL,NULL,'initiated','cod','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-20 00:52:46.077874'),(_binary 'ú\Σ\Σê\⌡JNçú.\rs\Γ¬TÅ',33000.00,NULL,'2024-05-20 00:56:33.163889',NULL,'order_OCT1udQDXoIdzr',NULL,'initiated','online','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-20 00:56:33.163889'),(_binary '▓é¥P─éO╗⌐¼Æ\φ╕î',229000.00,'+919874180842','2024-05-19 23:40:27.842311',NULL,'order_OCRjXQP9NH9GcZ','pay_OCRjv1cu2JczFR','captured','online','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-19 23:40:50.839199'),(_binary '╖╟Ä│UgM┤ü┴f`H┴╖│',33000.00,NULL,'2024-05-21 04:29:48.055947',NULL,'order_OCvCHJHRE5P1aQ',NULL,'initiated','online','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-21 04:29:48.055947'),(_binary '┐\╫Z╡\0\▐LïèiI\⌠âUs⌐',33000.00,NULL,'2024-05-20 01:02:39.893983',NULL,NULL,NULL,'initiated','cod','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-20 01:02:39.893983'),(_binary '\╨_═⌐E─ô\⌡\ß4╙ä\ß',33000.00,NULL,'2024-05-20 00:55:01.030465',NULL,NULL,NULL,'initiated','cod','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-20 00:55:01.030465'),(_binary '▐â~\╦\▀\╦D╟ì5\∩\ΩLs^²',33000.00,NULL,'2024-05-21 04:17:21.775004',NULL,'order_OCuz8mFnF5YV19',NULL,'initiated','online','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-21 04:17:21.775004'),(_binary '\Θ\α^\╦W²N░₧ñ\≥°┐|',47000.00,NULL,'2024-05-21 05:08:14.852402',NULL,NULL,NULL,'initiated','cod','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-21 05:08:14.852402'),(_binary '\⌡o╚ç\πHcäÜ\╚KpD¬',33000.00,NULL,'2024-05-21 04:23:45.852934',NULL,'order_OCv5u1y91MImxE',NULL,'initiated','online','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-21 04:23:45.852934'),(_binary '²▐Æ<╕Hè₧J\⌠∙ôV\δ',19000.00,NULL,'2024-05-20 00:51:39.309906',NULL,NULL,NULL,'initiated','cod','97ddfaba-b79c-41d8-bb02-6775e7dea159','2024-05-20 00:51:39.309906');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(255) NOT NULL,
  `about` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('611ec935-d709-444f-b5d5-176a518488da','CP','jobs.ayushsharma@gmail.com','Ayush','Sharma','$2a$10$MhTmJZBY.EKKu0JNMlaRB.0lzy07J5xDK0SYP8soyGIkNlf.79CrC','USER','9874180842'),('6dd56cfc-ccea-4451-9658-924d79bb17dd','ICE','kuntal2001saha@gmail.com','Kuntal','Saha','$2a$10$zhkt5q0W.MQLGvQmCF7xOewYmhZ4zP96CJopYZUnzTwN3D8aXoKy6','USER','9088931373'),('753cd01e-05a9-4b4b-8d29-25a6b44eb552','AAA','adityakumarm793@gmail.com','Aditya','Mishra','$2a$10$eRlbM1IK8CDkY9NZaJGPBuhqzgvS/iEoWsqte5HB2oyNf4v9hIqy6','USER',NULL),('88a3e267-c791-4d74-89a0-5e26a1cf8be9','AAA','hi@dipanroy.com','Dipan ','Roy','$2a$10$zNj3R/WfKFund3LkoAhtCuB3VgoSYX/vzwSKAWu3OXeKcKHRPuA56','USER',NULL),('97ddfaba-b79c-41d8-bb02-6775e7dea159','CP','arp23359@gmail.com','XCoder','420','$2a$10$cjSR37vUwseLVFD1uzcNUuYHgvNwHv40HQdwaGNnQcIbfj35Pjfsa','USER','9874180842');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-27 21:23:42
