-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: asm4
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `username` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `role` varchar(6) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('admin123','123456789','Cao Thu','author'),('caothu123','123456789','Cao Thu','author'),('reader','123456789','Cao Thu','reader');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `topic` varchar(200) NOT NULL,
  `post` varchar(5000) NOT NULL,
  `publish` bit(1) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username_idx` (`username`),
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'admin123','O.My review','Accepts bookings, Degustation, Green-eco focus, Licensed, Private dining, Romance-first date, Wheelchair access, Vegetarian friendly, Outdoor seating, Gluten-free options','<p><span style=\"font-size:16px\">After six years, the <strong>Bertoncello</strong> brothers &ndash; Chayse on the floor, Blayne in the kitchen &ndash; have relocated their intimate outer-suburban paddock-to-plate restaurant. They haven&#39;t shifted far, just next door, into Beaconsfield&#39;s original post office.</span></p>\r\n\r\n<p><span style=\"font-size:16px\">The new restaurant is more spacious than the old butcher shop, and there is a bar attached, but it&#39;s no great expansion. They still serve up to 30 people for just six meals a week. Spotlit timber tables are oriented towards the kitchen and chefs deliver some dishes in a culmination of the farm-to-table tale. It feels special but it&#39;s far from formal.</span></p>\r\n\r\n<p><span style=\"font-size:16px\">The set menu is so truly seasona<span style=\"color:#e74c3c\"><strong><em>l that some dishes are only on for one night, and the nine or so courses spring from produce grown at O.My&#39;s 1.5 hectare farm in nearby Cardinia. Lots of restaurants grow a few herbs but this one</em></strong></span> doesn&#39;t buy any fruit or veg.</span></p>\r\n\r\n<p><span style=\"font-size:16px\"><img alt=\"Pumpkin tortellini.\" src=\"https://www.goodfood.com.au/content/dam/images/h/1/g/1/3/m/image.related.articleLeadwide.620x349.h1gha8.png/1563865904718.jpg\" title=\"\" /></span></p>\r\n\r\n<p><span style=\"font-size:16px\">Pumpkin tortellini.&nbsp;<cite>Photo: Simon Schluter</cite></span></p>\r\n\r\n<p><span style=\"font-size:16px\">The reverence they show their plants &ndash; nurtured from seed, coaxed to maturity, harvested with care, cooked with loving caress &ndash; is contagious. You&#39;ll never feel as excited about vegetable trimmings as you do here.</span></p>\r\n\r\n<p><span style=\"font-size:16px\">The rigours of farming underpin a no-waste focus that leads to dishes such as pumpkin tortellini, where the pasta is made from flour derived from pumpkin offcuts then filled with pumpkin seed praline and pickled pumpkin skin.</span></p>\r\n\r\n<p><span style=\"font-size:16px\">A Jerusalem<span style=\"background-color:#3498db\"> artichoke dish looks like a plain white mound but it&#39;s a paean to this underloved, knobbly tuber. Spice-p</span>ickled slices of artichoke reveal fried skins, sweet, nutty puree, caramelised pot-roasted artichokes and, at the base, a slow-cooked egg yolk from one of the Bertoncellos&#39; 60 chooks. The dish is a wholly enjoyable balance of fat, acid, salt and sweet, expressed with just one vegetable.</span></p>\r\n\r\n<p><span style=\"font-size:16px\"><img alt=\"Dainty preserved tomato tarts.\" src=\"https://www.goodfood.com.au/content/dam/images/h/1/g/1/3/l/image.related.articleLeadNarrow.300x0.h1gha8.png/1563865904718.jpg\" title=\"\" /></span></p>\r\n\r\n<p><span style=\"font-size:16px\">Dainty preserved tomato tarts.&nbsp;<cite>Photo: Simon Schluter</cite></span></p>\r\n\r\n<p><span style=\"font-size:16px\">Meat is used sparingly. Rescued chicken carcases are turned into a jus that glazes lovingly slow-roasted cabbage. Whole beasts come from micro-farmers who know each animal by name. In fact, a cow called Norman is currently in the coolroom; the farmer who raised him often pops in to see how he&#39;s being used. Norman is now sausages, some of him is being cured, a little of his rump is served as the final savoury course.</span></p>\r\n\r\n<p><span style=\"font-size:16px\">Bread is a thread in the narrative arc of each meal. You&#39;ll eat excellent sourdough with butter and a rich beef tallow spread. You&#39;ll sip sourdough consomme. Loaf ends are turned into pastry for a dainty preserved tomato tart. There&#39;s even a pudding made with sourdough-infused cream. Again, when you&#39;ve worked so hard to make something, you don&#39;t want to throw away a crumb.</span></p>\r\n\r\n<p><span style=\"font-size:16px\">The O.My ethos is underlined by a visible passion for preserving. The path to the toilets is via a winding grotto lined with jars: tomato sauce, salted apple leaves, dried persimmon, all speaking to economy, sustainability and experimental glee.</span></p>\r\n',_binary '\0','2019-07-26'),(2,'admin123','Melbourne restaurant reviews11','Catch up on The Age chief restaurant critic Gemima Cody\'s reviews.','<p>&nbsp;</p>\r\n\r\n<p>A puck of crumbed and fried terrine crowned with green tomato relish.&nbsp;<cite>Photo: Justin McManus</cite></p>\r\n\r\n<p>It does not sound like a light, breezy time. We&#39;re talking black pudding with fried egg, steak tartare (obviously) and devilled duck hearts. But Bennett has a light touch, and dishes land with polish.</p>\r\n\r\n<p>Fried terrine is a perfect golden breaded puck, all sticky with luxurious shredded pork cheek inside and crowned with elegant green tomato relish.</p>\r\n\r\n<p>Cheese and pickle tartlets have perfectly short pastry cases, layered with a mustardy onion chutney, cheddar custard (a little fridgy in flavour one night) and a snowdrift of the sharp cheese.</p>\r\n\r\n<p><img alt=\"Cheese and pickle tartlets layered with onion chutney, cheddar custard and grated cheese.\" src=\"https://www.goodfood.com.au/content/dam/images/h/1/c/w/c/5/image.related.articleLeadwide.620x349.h1d1iv.png/1554332188281.jpg\" title=\"\" /></p>\r\n\r\n<p>Cheese and pickle tartlets layered with onion chutney, cheddar custard and grated cheese.&nbsp;<cite>Photo: Justin McManus</cite></p>\r\n\r\n<p>Bennett has a thing for pickles, but also sm</p>\r\n\r\n<p>&quot; class=&quot;form-control&quot; &gt;</p>\r\n\r\n<p>&quot; class=&quot;form-control&quot; &gt;</p>\r\n\r\n<p>&quot; class=&quot;form-control&quot; &gt;</p>\r\n\r\n<p>&quot; class=&quot;form-control&quot; &gt;</p>\r\n\r\n<p>&quot; class=&quot;form-control&quot; &gt;</p>\r\n',_binary '','2019-07-26');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-30 22:54:35
