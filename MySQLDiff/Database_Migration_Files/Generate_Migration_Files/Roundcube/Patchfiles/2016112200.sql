-- redundant column, for compat. with Galera Cluster
ALTER TABLE `dictionary` ADD COLUMN `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

-- DROP TABLE `cache`;
-- DROP TABLE `cache_shared`;

-- CREATE TABLE `cache` (
--  `user_id` int(10) UNSIGNED NOT NULL,
--  `cache_key` varchar(128) /*!40101 CHARACTER SET ascii COLLATE ascii_general_ci */ NOT NULL,
--  `expires` datetime DEFAULT NULL,
--  `data` longtext NOT NULL,
--  PRIMARY KEY (`user_id`, `cache_key`),
--  CONSTRAINT `user_id_fk_cache` FOREIGN KEY (`user_id`)
--    REFERENCES `users`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
--  INDEX `expires_index` (`expires`)
-- ) /*!40000 ENGINE=INNODB */ /*!40101 CHARACTER SET utf8 COLLATE utf8_general_ci */;


-- CREATE TABLE `cache_shared` (
--  `cache_key` varchar(255) /*!40101 CHARACTER SET ascii COLLATE ascii_general_ci */ NOT NULL,
--  `expires` datetime DEFAULT NULL,
--  `data` longtext NOT NULL,
--  PRIMARY KEY (`cache_key`),
--  INDEX `expires_index` (`expires`)
-- ) /*!40000 ENGINE=INNODB */ /*!40101 CHARACTER SET utf8 COLLATE utf8_general_ci */;

ALTER TABLE cache DROP COLUMN created; 
ALTER TABLE cache DROP INDEX user_cache_index; 
ALTER TABLE cache ADD PRIMARY KEY (user_id,cache_key);
ALTER TABLE cache_shared DROP COLUMN created; 
ALTER TABLE cache_shared DROP INDEX cache_key_index; 
ALTER TABLE cache_shared ADD PRIMARY KEY (cache_key);