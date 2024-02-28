ALTER TABLE `#__contact_details` DROP COLUMN `xreference` ;
ALTER TABLE `#__content` DROP COLUMN `xreference` ;
ALTER TABLE `#__newsfeeds` DROP COLUMN `xreference` ;
ALTER TABLE `#__update_sites` ADD COLUMN `checked_out` int unsigned NOT NULL DEFAULT 0 ;
ALTER TABLE `#__update_sites` ADD COLUMN `checked_out_time` datetime NULL DEFAULT NULL ;
ALTER TABLE `#__content_frontpage` ADD COLUMN `featured_up` datetime ;
ALTER TABLE `#__content_frontpage` ADD COLUMN `featured_down` datetime ;
