ALTER TABLE `locations` ADD `glaccountcode` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'GL account of the location';
ALTER TABLE `locations` ADD `allowinvoicing` TINYINT(1) NOT NULL DEFAULT '1' COMMENT 'Allow invoicing of items at this location';
