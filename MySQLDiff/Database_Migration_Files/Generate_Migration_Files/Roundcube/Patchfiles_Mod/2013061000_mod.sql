ALTER TABLE `cache` ADD `expires` datetime DEFAULT NULL;
ALTER TABLE `cache_shared` ADD `expires` datetime DEFAULT NULL;
ALTER TABLE `cache_index` ADD `expires` datetime DEFAULT NULL;
ALTER TABLE `cache_thread` ADD `expires` datetime DEFAULT NULL;
ALTER TABLE `cache_messages` ADD `expires` datetime DEFAULT NULL;
ALTER TABLE `cache_index` DROP `changed`;
ALTER TABLE `cache_thread` DROP `changed`;
ALTER TABLE `cache_messages` DROP `changed`;
