ALTER TABLE `#__finder_filters` MODIFY `created_by` int unsigned NOT NULL DEFAULT 0;
ALTER TABLE `#__finder_filters` MODIFY `created_by_alias` varchar(255) NOT NULL DEFAULT '';
ALTER TABLE `#__finder_filters` MODIFY `created` datetime NOT NULL;
ALTER TABLE `#__finder_filters` MODIFY `modified` datetime NOT NULL;
ALTER TABLE `#__finder_filters` MODIFY `checked_out_time` datetime NULL DEFAULT NULL;
ALTER TABLE `#__finder_filters` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `#__finder_filters` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `#__finder_links` CHANGE `route` `route` varchar(400);
ALTER TABLE `#__finder_links` CHANGE `language` `language` CHAR(7) NOT NULL DEFAULT '' AFTER `access`;
ALTER TABLE `#__finder_links` MODIFY `state` int NOT NULL DEFAULT 1;
ALTER TABLE `#__finder_links` MODIFY `access` int NOT NULL DEFAULT 0;
ALTER TABLE `#__finder_links` MODIFY `indexdate` datetime NOT NULL;
ALTER TABLE `#__finder_links` MODIFY `publish_start_date` datetime NULL DEFAULT NULL;
ALTER TABLE `#__finder_links` MODIFY `publish_end_date` datetime NULL DEFAULT NULL;
ALTER TABLE `#__finder_links` MODIFY `start_date` datetime NULL DEFAULT NULL;
ALTER TABLE `#__finder_links` MODIFY `end_date` datetime NULL DEFAULT NULL;
ALTER TABLE `#__finder_links` ADD INDEX `idx_language` (`language`) ;
ALTER TABLE `#__finder_links` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `#__finder_links` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE TABLE IF NOT EXISTS `#__finder_links_terms` (
	`link_id` INT UNSIGNED NOT NULL,
	`term_id` INT UNSIGNED NOT NULL,
	`weight` FLOAT UNSIGNED NOT NULL DEFAULT 0,
	PRIMARY KEY (`link_id`, `term_id`),
	INDEX `idx_term_weight` (`term_id`, `weight`),
	INDEX `idx_link_term_weight` (`link_id`, `term_id`, `weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `#__finder_links_terms0`;
DROP TABLE IF EXISTS `#__finder_links_terms1`;
DROP TABLE IF EXISTS `#__finder_links_terms2`;
DROP TABLE IF EXISTS `#__finder_links_terms3`;
DROP TABLE IF EXISTS `#__finder_links_terms4`;
DROP TABLE IF EXISTS `#__finder_links_terms5`;
DROP TABLE IF EXISTS `#__finder_links_terms6`;
DROP TABLE IF EXISTS `#__finder_links_terms7`;
DROP TABLE IF EXISTS `#__finder_links_terms8`;
DROP TABLE IF EXISTS `#__finder_links_terms9`;
DROP TABLE IF EXISTS `#__finder_links_termsa`;
DROP TABLE IF EXISTS `#__finder_links_termsb`;
DROP TABLE IF EXISTS `#__finder_links_termsc`;
DROP TABLE IF EXISTS `#__finder_links_termsd`;
DROP TABLE IF EXISTS `#__finder_links_termse`;
DROP TABLE IF EXISTS `#__finder_links_termsf`;
CREATE TABLE IF NOT EXISTS `#__finder_logging` (
  `searchterm` VARCHAR(255) NOT NULL DEFAULT '',
  `md5sum` VARCHAR(32) NOT NULL DEFAULT '',
  `query` BLOB NOT NULL,
  `hits` INT NOT NULL DEFAULT 1,
  `results` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`md5sum`),
  INDEX `searchterm` (`searchterm`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `#__finder_logging` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `#__finder_logging` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `#__finder_taxonomy`;
CREATE TABLE IF NOT EXISTS `#__finder_taxonomy` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`parent_id` INT UNSIGNED NOT NULL DEFAULT '0',
	`lft` INT NOT NULL DEFAULT '0',
	`rgt` INT NOT NULL DEFAULT '0',
	`level` INT UNSIGNED NOT NULL DEFAULT '0',
	`path` VARCHAR(400) NOT NULL DEFAULT '',
	`title` VARCHAR(255) NOT NULL DEFAULT '',
	`alias` VARCHAR(400) NOT NULL DEFAULT '',
	`state` TINYINT UNSIGNED NOT NULL DEFAULT '1',
	`access` TINYINT UNSIGNED NOT NULL DEFAULT '1',
	`language` CHAR(7) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`),
	INDEX `idx_state` (`state`),
	INDEX `idx_access` (`access`),
	INDEX `idx_path` (`path`(100)),
	INDEX `idx_left_right` (`lft`, `rgt`),
	INDEX `idx_alias` (`alias`(100)),
	INDEX `idx_language` (`language`),
	INDEX `idx_parent_published` (`parent_id`, `state`, `access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `#__finder_taxonomy_map` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `#__finder_taxonomy_map` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `#__finder_terms` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `#__finder_terms` CHANGE `language` `language` CHAR(7) NOT NULL DEFAULT '' AFTER `links`;
ALTER TABLE `#__finder_terms` MODIFY `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL;
ALTER TABLE `#__finder_terms` MODIFY `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '';
ALTER TABLE `#__finder_terms` MODIFY `soundex` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '';
ALTER TABLE `#__finder_terms` DROP INDEX `idx_term` ;
ALTER TABLE `#__finder_terms` ADD INDEX `idx_stem` (`stem`) ;
ALTER TABLE `#__finder_terms` ADD INDEX `idx_language` (`language`) ;
ALTER TABLE `#__finder_terms` ADD UNIQUE INDEX `idx_term_language` (`term`, `language`) ;
ALTER TABLE `#__finder_terms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `#__finder_terms_common`;
CREATE TABLE IF NOT EXISTS `#__finder_terms_common` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` char(7) NOT NULL DEFAULT '',
  `custom` int NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_term_language` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `#__finder_tokens` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `#__finder_tokens` CHANGE `language` `language` CHAR(7) NOT NULL DEFAULT '' AFTER `context`;
ALTER TABLE `#__finder_tokens` MODIFY `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL;
ALTER TABLE `#__finder_tokens` MODIFY `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '';
ALTER TABLE `#__finder_tokens` ADD INDEX `idx_stem` (`stem`) ;
ALTER TABLE `#__finder_tokens` ADD INDEX `idx_language` (`language`) ;
ALTER TABLE `#__finder_tokens` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `#__finder_tokens_aggregate` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `#__finder_tokens_aggregate` DROP COLUMN `map_suffix` ;
ALTER TABLE `#__finder_tokens_aggregate` CHANGE `language` `language` CHAR(7) NOT NULL DEFAULT '' AFTER `total_weight`;
ALTER TABLE `#__finder_tokens_aggregate` MODIFY `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL;
ALTER TABLE `#__finder_tokens_aggregate` MODIFY `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '';
ALTER TABLE `#__finder_tokens_aggregate` MODIFY `term_weight` float unsigned NOT NULL DEFAULT 0;
ALTER TABLE `#__finder_tokens_aggregate` MODIFY `context_weight` float unsigned NOT NULL DEFAULT 0;
ALTER TABLE `#__finder_tokens_aggregate` MODIFY `total_weight` float unsigned NOT NULL DEFAULT 0;
ALTER TABLE `#__finder_tokens_aggregate` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `#__finder_types` MODIFY `mime` varchar(100) NOT NULL DEFAULT '';
ALTER TABLE `#__finder_types` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `#__finder_types` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
