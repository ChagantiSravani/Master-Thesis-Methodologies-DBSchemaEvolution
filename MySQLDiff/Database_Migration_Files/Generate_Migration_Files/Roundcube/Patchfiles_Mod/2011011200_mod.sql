ALTER TABLE `contacts` ADD `words` TEXT NULL AFTER `vcard`;
ALTER TABLE `contacts` CHANGE `vcard` `vcard` LONGTEXT  NULL DEFAULT NULL;
