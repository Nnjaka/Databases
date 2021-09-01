-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
-- Host: mysql.hostinger.ro    Database: u574849695_23
-- Server version	10.4.15-MariaDB-cll-lve
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `name` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `communities` VALUES (1,'quasi',1),
(2,'ipsum',2),
(3,'ipsum',3),
(4,'repellat',4),
(5,'ut',5),
(6,'aut',6),
(7,'aut',7),
(8,'corporis',8),
(9,'similique',9),
(10,'explicabo',10),
(11,'voluptas',11),
(12,'quod',12),
(13,'debitis',13),
(14,'voluptatibus',14),
(15,'tempora',15),
(16,'molestias',16),
(17,'eius',17),
(18,'aut',18),
(19,'aut',19),
(20,'sit',20);


DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_ad` datetime DEFAULT current_timestamp(),
  `updated_ad` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`initiator_user_id` <> `target_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `friend_requests` VALUES ('1','2','requested','1986-04-20 17:01:49','1998-02-23 02:50:02'),
('2','3','declined','1999-10-21 19:09:48','1995-06-01 12:45:33'),
('3','4','requested','1988-09-10 19:37:10','1995-11-02 02:18:28'),
('4','5','declined','2002-08-09 13:11:34','2001-08-17 11:58:56'),
('5','6','unfriended','2010-11-22 08:19:31','2018-02-14 06:25:03'),
('6','7','declined','2003-11-12 04:37:05','1985-03-31 17:13:11'),
('7','8','unfriended','2020-04-30 18:50:29','2013-12-18 12:44:58'),
('8','9','requested','2008-07-23 22:58:22','1989-08-26 17:25:16'),
('9','10','approved','1988-09-11 02:04:43','2018-05-08 16:41:15'),
('10','11','requested','1995-02-07 13:17:08','1987-08-24 13:45:43'),
('11','12','requested','2018-04-03 01:26:05','1978-11-06 04:06:52'),
('12','13','unfriended','1997-07-11 15:04:50','2001-02-28 07:05:32'),
('13','14','approved','1974-02-28 10:08:27','2020-02-17 21:54:48'),
('14','15','unfriended','1983-02-24 19:50:35','2013-03-07 13:27:48'),
('15','16','declined','1974-10-24 21:31:12','1970-04-08 04:39:56'),
('16','17','approved','2008-11-17 13:09:34','1987-02-02 05:34:33'),
('17','18','unfriended','1984-08-29 15:59:49','1998-11-27 00:22:55'),
('18','19','requested','2014-08-20 22:27:13','2015-03-06 16:35:22'),
('19','20','requested','1989-12-16 19:38:39','2018-06-21 00:49:33'),
('20','1','unfriended','1974-01-13 20:41:35','1979-05-24 08:43:32');

DROP TABLE IF EXISTS `gifts`;
CREATE TABLE `gifts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gifts` VALUES (1,'amet',16.00),
(2,'voluptates',17.00),
(3,'quod',13.00),
(4,'est',12.00),
(5,'consequatur',5.00),
(6,'dignissimos',11.00),
(7,'quos',6.00),
(8,'molestiae',3.00),
(9,'deleniti',18.00),
(10,'rerum',17.00),
(11,'placeat',4.00),
(12,'rerum',6.00),
(13,'ad',20.00),
(14,'error',3.00),
(15,'perspiciatis',5.00),
(16,'cum',11.00),
(17,'asperiores',12.00),
(18,'velit',15.00),
(19,'exercitationem',2.00),
(20,'voluptatem',19.00);

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `fk_likes_user_id` (`user_id`),
  KEY `fk_likes_media_id` (`media_id`),
  CONSTRAINT `fk_likes_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_likes_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `likes` VALUES (1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10),
(11,11,11),
(12,12,12),
(13,13,13),
(14,14,14),
(15,15,15),
(16,16,16),
(17,17,17),
(18,18,18),
(19,19,19),
(20,20,20);

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_ad` datetime DEFAULT current_timestamp(),
  `updated_ad` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `media` VALUES (1,1,1,'Cumque aperiam dicta consequatur. Sit aut vel cupiditate similique unde eveniet. Dolore omnis quaerat ut assumenda dolorem perferendis necessitatibus. Eum animi est qui ut et est.','aperiam',NULL,'1979-11-09 20:26:31','2008-12-18 00:49:56'),
(2,2,2,'Iure pariatur cupiditate optio quia sit ut. Accusamus quaerat aut cumque non esse incidunt saepe. Autem qui ducimus distinctio ut qui et explicabo corporis. Facere repellendus omnis ea consequatur nemo quo quia.','impedit',NULL,'2004-07-18 17:07:41','1978-04-25 15:29:37'),
(3,3,3,'Soluta vero sit ea autem non odit odit. Qui et molestiae voluptate autem pariatur asperiores. Velit eligendi quia culpa officiis. Ducimus dolor unde molestiae qui.','autem',NULL,'1982-07-09 08:58:31','1999-07-10 21:02:01'),
(4,4,4,'Veniam incidunt dolor aut debitis quo illo voluptatem. Molestias totam et labore repellat. Porro earum accusamus totam rerum perspiciatis sed. Sunt quasi dolor necessitatibus alias veniam distinctio nisi.','facilis',NULL,'2012-01-24 14:12:09','2005-05-01 16:23:10'),
(5,5,1,'Qui qui doloribus ex dignissimos occaecati porro. Aliquid aut aliquid dolor qui. Qui iste suscipit et nihil quod aut tempora. Sint voluptate eos quos est nulla dolores.','ut',NULL,'1972-11-30 01:15:30','1972-09-23 16:09:38'),
(6,6,2,'Et et ullam consectetur veritatis amet architecto sed. Aut voluptatem qui quos consequatur. Accusamus cum quia iure rerum explicabo voluptate.','eveniet',NULL,'2018-02-09 23:34:35','2003-01-19 06:26:42'),
(7,7,3,'Est culpa voluptatibus voluptatibus. Tempore possimus voluptates corporis ex sunt eos totam.','fuga',NULL,'1995-04-03 21:23:44','2017-01-22 12:00:00'),
(8,8,4,'Et velit qui dolores aperiam est ut iure voluptas. Alias repellendus dolorum odio dolor in.','cumque',NULL,'1998-08-01 12:58:30','2021-01-06 11:31:58'),
(9,9,1,'Quis aspernatur commodi ut sed. Hic sunt maiores nobis tempora aperiam voluptates. Esse qui eaque est dolore cum.','velit',NULL,'1971-02-14 05:07:33','2012-02-16 02:22:49'),
(10,10,2,'Quia aut omnis aliquam dignissimos pariatur vero quod. Aut quo qui quisquam vel. Fugiat fugit corrupti in possimus voluptatem veritatis qui beatae.','ut',NULL,'1981-12-18 06:27:01','2009-11-28 05:09:04'),
(11,11,3,'Libero repellat consequatur perferendis fuga doloremque. Nostrum est quia adipisci soluta iste velit. Blanditiis quia aperiam aspernatur et aspernatur.','dolores',NULL,'2006-04-10 07:53:06','1989-12-01 10:03:11'),
(12,12,4,'Delectus quia rerum sit odio neque qui. Voluptatibus natus et dolorum dignissimos incidunt sunt. Id optio autem dolores id asperiores beatae. Sint molestiae occaecati eaque deserunt non. Rem animi culpa soluta quasi.','quis',NULL,'1993-04-05 08:36:43','2010-07-07 21:50:11'),
(13,13,1,'Et itaque distinctio quasi sit sint. Deleniti cupiditate et qui voluptatibus ut necessitatibus sed. Qui similique culpa enim porro iusto minima et.','sed',NULL,'1996-02-28 03:52:41','2017-02-19 17:53:26'),
(14,14,2,'Aut exercitationem reprehenderit beatae rerum sint et iste eius. Voluptas culpa omnis blanditiis nihil. Sit excepturi rerum dolorem ipsam est. Aut cupiditate molestiae id sit.','repudiandae',NULL,'1977-08-25 09:39:28','1989-01-02 13:47:12'),
(15,15,3,'Velit et explicabo provident sit. Aperiam similique repellat nostrum sed in. Vel illum ea cum ducimus voluptatem voluptatibus quam.','voluptas',NULL,'1982-02-16 07:55:19','1977-05-29 14:15:35'),
(16,16,4,'Ea unde exercitationem qui in. Voluptatem qui dolorem nobis voluptatem repellat facere ducimus. Voluptatem aliquam ut non quibusdam eum. Ratione ex veritatis ex doloribus ex alias.','ad',NULL,'2015-10-10 02:36:31','1991-12-25 14:02:47'),
(17,17,1,'Id et est ut accusantium. Itaque asperiores et velit dolor sed.','non',NULL,'1977-07-21 12:58:07','2002-10-12 20:12:17'),
(18,18,2,'Consequatur quam culpa voluptatem consectetur ipsa laborum sit. Libero est ut quaerat asperiores. Unde vitae autem dicta aut et.','occaecati',NULL,'2014-03-01 18:13:46','2019-03-08 08:46:23'),
(19,19,3,'Quis vero porro enim repellat cum sunt. Sapiente blanditiis fuga molestias et quos similique. Illo architecto officiis quia. Ut recusandae et facilis omnis ipsam aut.','consequuntur',NULL,'2017-10-26 21:23:13','1997-12-30 05:31:12'),
(20,20,4,'Totam voluptas veniam quas amet magnam corporis nostrum. Tenetur omnis sunt recusandae officia at suscipit eos. Sed eos sed suscipit corrupti nisi itaque distinctio.','consectetur',NULL,'1993-09-21 16:13:55','1980-11-02 17:55:14');

DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `media_types` VALUES (1,'text'),
(2,'video'),
(3,'music'),
(4,'image');

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `messages` VALUES (1,1,1,'Facere labore dolorem iste est. Enim facere quos nulla et veniam qui.','2009-06-15 15:09:28'),
(2,2,2,'Facilis earum corrupti dolor animi deserunt. Voluptatem in possimus quod voluptates id unde. Eos accusantium aut voluptatum. Accusamus neque aut minima saepe.','2009-05-17 19:20:34'),
(3,3,3,'Enim quae molestiae in et ut inventore tempore quidem. Adipisci itaque necessitatibus unde reiciendis. Ea molestiae ipsum ipsa. Impedit deserunt voluptatem voluptas molestiae nostrum soluta.','1983-07-30 10:31:27'),
(4,4,4,'Aut soluta omnis ex nisi et rerum. Dolore sit maiores natus est voluptatem omnis. Quo eum tempora commodi iste quam neque.','2004-08-04 10:22:18'),
(5,5,5,'Rerum sit et voluptatem doloremque quis mollitia temporibus. Sit est vel blanditiis consequatur eius qui nam. Fuga est veniam quia sed quas eligendi.','2005-07-20 00:49:57'),
(6,6,6,'Quibusdam aperiam totam et ipsam. Aspernatur occaecati consectetur harum id voluptates. Debitis sunt est corrupti eos hic qui quia. Molestiae consequuntur nisi nisi distinctio quae qui et.','1991-06-06 13:14:18'),
(7,7,7,'Inventore distinctio nulla delectus. Rerum incidunt quia commodi eius magni nam. Mollitia in neque cumque assumenda iusto.','1984-03-10 22:04:36'),
(8,8,8,'Sint quos consequatur rerum repellendus. Rerum id doloremque est illo. Voluptatem eos rerum dolorem deleniti est voluptatem molestiae. Nostrum consequatur omnis modi ullam omnis.','2000-11-26 05:37:05'),
(9,9,9,'Rem commodi corrupti ipsam ut et. Quidem natus beatae est praesentium et. Quia nihil ullam reiciendis impedit ut. Reprehenderit est nobis eius eum aperiam cupiditate.','2008-04-05 20:27:38'),
(10,10,10,'Enim eum itaque eaque ea ut nihil enim. Omnis dolorum et sunt explicabo. Consectetur impedit ut molestiae impedit rerum. Fugit distinctio nostrum aspernatur eos.','2017-07-03 08:54:45'),
(11,11,11,'Ut autem magni ea voluptatem ad qui. Aperiam ut delectus et velit voluptatum error omnis. Odio maxime quia rerum odit eaque ad. Enim voluptatem non nobis vero facilis.','1977-12-28 14:21:13'),
(12,12,12,'Enim sunt praesentium magni corporis facilis. Qui quisquam eos ea tempore quod qui. Est incidunt omnis corporis ex vel.','1970-01-20 04:51:53'),
(13,13,13,'Quis soluta rem doloremque quisquam mollitia velit. Nihil ratione quas est quia et quam. Facilis aliquid voluptas qui nesciunt et quia.','1992-02-12 03:37:48'),
(14,14,14,'Qui voluptatibus aspernatur consequatur. Similique cumque at cupiditate hic quod ut. Aspernatur accusamus occaecati corporis aliquid doloribus deleniti corporis.','2016-12-07 15:38:10'),
(15,15,15,'Pariatur est occaecati totam occaecati est est. Sit quo rerum error sunt similique. Omnis magnam sit voluptates et optio.','1981-07-02 10:49:18'),
(16,16,16,'Iusto cupiditate iure voluptatem nisi voluptatem. Pariatur sint qui exercitationem accusantium dolor architecto nam. Eum qui similique quasi accusamus possimus sed illo saepe. Rem libero eum dicta voluptas et nam delectus.','1993-10-06 10:56:54'),
(17,17,17,'Ut saepe ut consectetur illum quam. Eos earum vel iste nostrum dolorem. Omnis hic voluptatum fuga illum. Dolor rerum ipsum totam at.','2009-01-07 23:14:28'),
(18,18,18,'Et ducimus alias eaque quia. Rerum tenetur ullam quisquam doloribus ut. Nostrum ad ipsa voluptas iusto omnis atque in. Architecto omnis eligendi quis ab magnam aut eos. Culpa debitis atque sit molestias ipsam laborum ratione.','1986-01-06 21:13:19'),
(19,19,19,'Omnis qui quae exercitationem neque. Dolor velit est voluptas totam nihil reprehenderit. Id delectus ullam sit ex est voluptates. Porro incidunt vel corporis pariatur laborum earum.','2006-11-06 02:39:08'),
(20,20,20,'Dolores rerum molestiae amet et provident ratione. Accusantium sequi ab nihil repellendus. Ipsa atque aut quaerat voluptatem amet. Qui architecto id magnam asperiores est.','1997-09-26 03:32:22');


DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
  `user_id` bigint(20) unsigned NOT NULL,
  `photo_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`,`photo_id`),
  KEY `photo_id` (`photo_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `photo_albums_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `photo_albums` VALUES (1,1,'veniam'),
(2,2,'quibusdam'),
(3,3,'magnam'),
(4,4,'et'),
(5,5,'architecto'),
(6,6,'aspernatur'),
(7,7,'delectus'),
(8,8,'deleniti'),
(9,9,'unde'),
(10,10,'sint'),
(11,11,'non'),
(12,12,'reprehenderit'),
(13,13,'autem'),
(14,14,'dolor'),
(15,15,'totam'),
(16,16,'ullam'),
(17,17,'sunt'),
(18,18,'culpa'),
(19,19,'labore'),
(20,20,'debitis');

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_ad` datetime DEFAULT current_timestamp(),
  `updated_ad` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `photos` VALUES (1,1,'Itaque nam sed nemo ex eius hic amet. Animi omnis reiciendis explicabo perspiciatis rem commodi. Necessitatibus id aut officia unde. Adipisci voluptas molestias vel commodi esse architecto maiores beatae.','eligendi',NULL,'2007-10-29 16:57:45','1981-02-22 00:23:12'),
(2,2,'Totam voluptas est iure at doloremque et. Nisi sit enim ducimus quis perferendis laudantium.','ut',NULL,'1976-03-04 10:50:19','1974-03-14 07:04:45'),
(3,3,'Consequatur et pariatur in voluptates. Qui magnam labore minima aut corrupti nostrum.','et',NULL,'2016-04-09 01:41:10','2008-01-04 03:12:48'),
(4,4,'Dolore aliquid et sit deleniti quo dolorem quasi. Dolor sit voluptas aut quis nulla. Repellendus cum ullam molestiae ea.','est',NULL,'1970-04-05 12:05:01','2008-04-30 21:33:59'),
(5,5,'Voluptatibus debitis qui sit. Non earum eius vitae ea et architecto. Sunt sunt natus animi. Expedita magnam facere cum placeat id.','eos',NULL,'1984-12-17 11:48:08','2019-03-12 05:56:04'),
(6,6,'Ut ut exercitationem ullam cum. Est voluptas id nisi id ipsa et dolore. Temporibus deleniti sit voluptatem libero. Non aut perspiciatis nulla nesciunt.','ut',NULL,'1980-06-23 18:59:28','1988-09-20 15:39:42'),
(7,7,'Omnis qui est perferendis magnam quae. Et est reprehenderit rerum tempora. Repellendus dolorem ipsum quod velit tenetur. Eos et et rerum ab.','illum',NULL,'1981-06-04 12:12:52','1981-05-11 19:30:54'),
(8,8,'Consequuntur mollitia nostrum est voluptas distinctio iure. Sit est consequuntur et corporis voluptatem quis aut. Voluptatem nesciunt incidunt cupiditate dignissimos.','necessitatibus',NULL,'1975-11-27 08:00:22','2002-12-23 01:17:23'),
(9,9,'Architecto neque cumque eligendi nostrum. Nisi quae blanditiis ullam tempora quam sequi. Iste dolorum soluta alias autem vitae et. Incidunt eum consequatur nesciunt adipisci magnam inventore. Deserunt ex commodi quam sit ut sed qui.','possimus',NULL,'1992-02-22 22:41:36','2020-03-05 17:02:49'),
(10,10,'A explicabo accusantium consequuntur non quod. Blanditiis assumenda sed eos architecto rerum voluptatem nostrum et. Aperiam eaque omnis quisquam quo quas.','error',NULL,'1980-11-14 10:33:50','1997-05-03 12:31:01'),
(11,11,'Eveniet ut ut illum illum labore ea et. Suscipit nisi aut voluptatum qui omnis et alias. Quis excepturi animi repellendus accusantium. Ipsum id officiis ea.','rerum',NULL,'2010-10-29 00:32:02','2001-01-12 06:56:20'),
(12,12,'Voluptatem voluptatem fuga magnam est quaerat. Pariatur praesentium consequatur laboriosam debitis maiores aut. Ducimus quisquam autem et ipsum officiis numquam. Explicabo praesentium et atque amet quisquam est.','omnis',NULL,'2003-11-19 16:15:40','1978-06-10 01:01:40'),
(13,13,'Ducimus et perspiciatis dolor qui. Rerum quisquam vel omnis ex aut vitae. Ratione facere non velit aut fuga rerum.','est',NULL,'1982-10-28 04:51:08','1972-04-04 19:10:22'),
(14,14,'Occaecati quia necessitatibus maxime laboriosam. Ducimus assumenda fuga aut quas quia sed. Nihil ut incidunt velit reiciendis et mollitia rerum.','in',NULL,'1985-12-10 16:51:44','1994-01-30 04:22:48'),
(15,15,'Illum omnis est tempora culpa pariatur quasi. Eveniet nihil inventore aperiam amet est praesentium recusandae laboriosam. Rem aut sit dicta reprehenderit. Ea doloremque dolores consequuntur corporis enim voluptatum minima.','voluptatem',NULL,'2008-07-15 09:58:27','1994-03-25 02:14:42'),
(16,16,'Iste placeat quis officiis. Magni placeat dolor repellendus placeat autem.','facilis',NULL,'2014-09-04 07:36:48','2013-01-09 00:15:48'),
(17,17,'Cum autem vel tempora eaque similique. Tenetur voluptas et nihil quae quaerat molestias et amet. Similique qui totam quia id.','sit',NULL,'1977-01-31 02:21:20','2010-05-05 18:42:24'),
(18,18,'Perferendis dolor delectus natus doloremque consequatur. Atque repudiandae architecto fugiat velit fugiat ipsam vel. Et qui et necessitatibus beatae et nemo dicta. Ut quae exercitationem quibusdam ad voluptatem repudiandae qui.','voluptatem',NULL,'2012-11-21 05:25:55','2020-04-12 23:11:58'),
(19,19,'Eum ea beatae provident voluptatem. Iusto et accusantium mollitia. Dicta qui ut blanditiis aut ipsam et inventore qui. Voluptate totam odio dolor aut.','natus',NULL,'2019-03-16 14:38:41','2006-11-16 09:07:46'),
(20,20,'Corrupti dolor quam aut aut at voluptas sit. Non id voluptatem odit sint possimus ut. Eius enim commodi quo expedita.','vel',NULL,'2002-03-22 10:33:36','1991-06-08 08:19:34');

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hometown` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `birthday` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_profiles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `profiles` VALUES (1,'m',NULL,'1980-10-22 16:29:00','2006-10-07 18:09:25'),
(2,'m',NULL,'2008-05-11 19:02:55','1979-08-02 10:48:27'),
(3,'f',NULL,'1993-12-26 12:17:15','1996-10-09 00:53:30'),
(4,'m',NULL,'2005-05-29 06:53:34','2011-03-19 12:21:59'),
(5,'f',NULL,'2016-06-10 02:29:41','1978-02-06 23:07:17'),
(6,'f',NULL,'2008-09-08 08:14:16','1995-08-23 05:53:55'),
(7,'m',NULL,'2000-01-15 18:51:14','1984-07-15 22:34:42'),
(8,'m',NULL,'1978-02-15 02:42:35','1990-12-18 09:10:46'),
(9,'f',NULL,'1985-08-24 01:41:20','1971-04-19 13:18:17'),
(10,'m',NULL,'2008-07-29 21:34:40','1985-12-07 21:40:06'),
(11,'m',NULL,'1995-01-12 03:30:53','2000-02-04 17:25:09'),
(12,'m',NULL,'2009-06-16 02:22:54','2021-03-07 10:23:13'),
(13,'m',NULL,'1985-12-23 23:47:30','1989-03-26 21:45:50'),
(14,'f',NULL,'2015-06-08 04:38:01','2005-04-18 13:25:01'),
(15,'f',NULL,'1970-10-22 03:37:19','2020-10-24 14:16:06'),
(16,'f',NULL,'2015-11-04 11:37:53','1982-03-06 09:51:45'),
(17,'m',NULL,'2007-08-07 10:00:24','1998-06-19 23:58:37'),
(18,'m',NULL,'2010-10-31 01:06:36','2001-07-19 18:18:11'),
(19,'f',NULL,'1983-05-02 19:10:33','2014-02-07 02:23:02'),
(20,'m',NULL,'1971-07-24 23:43:49','1982-09-04 05:38:42');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `idx_users_username` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Пользователи';

INSERT INTO `users` VALUES (1,'Nikolas','O\'Conner','cremin.donnell@example.com',89075269600),
(2,'Brain','Beatty','collier.hermann@example.org',89906481218),
(3,'Jazmin','Anderson','ziemann.stuart@example.org',89270481320),
(4,'Laverne','Jones','gwilliamson@example.net',89126916684),
(5,'Jess','Herman','jacobson.johathan@example.net',89703360717),
(6,'Carolyn','McGlynn','grant.maggie@example.net',89933807100),
(7,'Ronny','Dibbert','mauricio.lebsack@example.com',89929600824),
(8,'Montana','Weissnat','cremin.emery@example.com',89878889061),
(9,'Damaris','Harris','pjacobs@example.org',89246813841),
(10,'Vicente','Daniel','block.adriana@example.com',89337097395),
(11,'Eliezer','Cummerata','blair.nicolas@example.org',89842416278),
(12,'Gust','Botsford','krajcik.keyshawn@example.net',89659141848),
(13,'Pedro','Roob','trantow.stephen@example.com',89087083396),
(14,'Orie','Huel','kirstin95@example.net',89405086711),
(15,'Janis','Batz','bill.ziemann@example.org',89922442284),
(16,'Ewell','Hilpert','smith.cathy@example.org',89156454935),
(17,'Brain','Schultz','qsipes@example.com',89944713084),
(18,'Naomie','Lind','eloisa.bartoletti@example.net',89419368545),
(19,'Jaden','Schaden','manley.kautzer@example.net',89340975262),
(20,'Estrella','White','sdubuque@example.org',89958142223);

DROP TABLE IF EXISTS `users_communities`;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users_communities` VALUES (1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20);

DROP TABLE IF EXISTS `users_gifts`;
CREATE TABLE `users_gifts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `gift_id` bigint(20) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `target_user_id` (`target_user_id`),
  KEY `gift_id` (`gift_id`),
  CONSTRAINT `users_gifts_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_gifts_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_gifts_ibfk_3` FOREIGN KEY (`gift_id`) REFERENCES `gifts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users_gifts` VALUES (1,1,1,1,'Quaerat voluptas molestias dolorem tempore maiores at corporis odit. Omnis ut ipsum repudiandae sit est hic est. Et mollitia eveniet deserunt qui quasi.','1988-11-27 17:00:27'),
(2,2,2,2,'Laboriosam enim quas praesentium nihil quia quos. Harum voluptatem reiciendis aperiam cumque temporibus esse. Molestiae et quo veniam consequuntur consequatur quas id.','2015-09-07 00:27:35'),
(3,3,3,3,'Recusandae minus modi sequi autem ea. Facilis enim ut assumenda voluptatum magnam consequuntur cumque suscipit. Odio blanditiis eos deserunt at sint nihil. Enim cupiditate et recusandae dolore et consequatur ut.','1976-01-14 13:52:24'),
(4,4,4,4,'Ducimus tempore voluptatem a beatae est ut sit. Inventore aut in non sint quis expedita sed eos. Labore error est hic doloremque ipsam.','1976-09-01 08:53:30'),
(5,5,5,5,'Atque quia et vitae perspiciatis quia explicabo. Vel et excepturi officia enim autem molestiae eveniet. Excepturi non rerum nobis molestiae provident et. Unde ipsa dolor occaecati dolorem est aperiam.','2005-05-17 06:50:47'),
(6,6,6,6,'Et consequatur accusantium quia aut id molestiae dignissimos. Dolores voluptas est molestiae magni debitis. Recusandae nostrum commodi distinctio ab.','1996-08-06 16:53:37'),
(7,7,7,7,'Est possimus sit et ducimus. Id corporis tempora harum quaerat aliquam. Distinctio suscipit ut laboriosam temporibus. Omnis nemo quia a cupiditate dolorem voluptatem.','1994-03-20 21:32:16'),
(8,8,8,8,'Veniam voluptas dignissimos sint natus quia nesciunt placeat voluptatem. In ex adipisci omnis. Voluptatibus ea vero quam molestiae. Esse ullam illo modi maiores a consequatur occaecati.','1974-02-17 21:43:42'),
(9,9,9,9,'Perferendis numquam eligendi nulla quasi. Quidem at voluptatem sequi tenetur hic cupiditate consequuntur sunt. Rerum sed veritatis ullam omnis laboriosam. Quia ab tempora nesciunt.','1998-11-07 14:48:00'),
(10,10,10,10,'Qui molestiae non in sit dolorem quisquam. Est eligendi excepturi quia enim quis. Ut quo illum sunt consequatur. Sed recusandae unde sit maxime eos voluptatem et.','1973-12-05 08:02:44'),
(11,11,11,11,'Vitae quisquam sunt enim quod tempora. Provident quisquam enim praesentium ea est id. Culpa numquam ipsam ipsa placeat modi.','2020-08-02 22:52:36'),
(12,12,12,12,'Deleniti nesciunt sapiente iste at. Sed quo suscipit sit atque voluptatum iste repellendus. Quibusdam libero qui in voluptatibus. Et fugiat harum magnam. Eius iure qui beatae sequi enim nihil.','2001-10-21 18:40:15'),
(13,13,13,13,'Similique magni et voluptatibus porro quia. In facilis iste eveniet tenetur blanditiis adipisci non. A et omnis ut quam maiores error atque dolor.','1987-07-15 08:08:14'),
(14,14,14,14,'Dolore dignissimos dolorem aut ea repellendus sapiente iste. Architecto labore laboriosam rerum fugit atque labore.','1978-04-13 02:42:11'),
(15,15,15,15,'Omnis dolorum sed voluptate nihil consequatur a et. Animi amet culpa fugiat beatae omnis voluptate. Dolor quia perspiciatis a vitae. Tempore nihil illum quia corporis et.','2004-08-31 23:48:47'),
(16,16,16,16,'Dolor eum quis mollitia. Similique in eaque neque sapiente temporibus. Voluptatem omnis velit saepe. Nesciunt soluta quibusdam maiores voluptas omnis aut accusamus.','2018-03-09 00:49:18'),
(17,17,17,17,'Omnis iusto et temporibus voluptatibus id fugiat rerum. Veritatis explicabo et perspiciatis accusamus quidem laudantium nam. Sit sequi velit doloribus illum blanditiis quaerat. Velit dicta libero nostrum quo.','1990-03-22 20:03:57'),
(18,18,18,18,'Itaque excepturi sed quia reprehenderit. Possimus tempore incidunt et repudiandae repudiandae vitae. Consectetur ut sunt nihil eveniet.','2003-12-10 17:39:41'),
(19,19,19,19,'Perspiciatis nemo minus eligendi ut vel eaque qui odio. Sunt praesentium soluta eaque tempore doloremque error ut. Voluptas deserunt beatae error. Incidunt dignissimos praesentium pariatur qui et quia rem.','2019-02-16 05:46:41'),
(20,20,20,20,'Nemo amet nihil voluptates non aspernatur ea adipisci. In possimus aut impedit tenetur molestiae. Ut sit quia alias molestias cumque.','2020-10-24 10:08:02');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-29 12:28:45
