ALTER TABLE `#__content` MODIFY `created` datetime NOT NULL;
ALTER TABLE `#__content` MODIFY `modified` datetime NOT NULL;
ALTER TABLE `#__content` MODIFY `publish_up` datetime NULL DEFAULT NULL;
ALTER TABLE `#__content` MODIFY `publish_down` datetime NULL DEFAULT NULL;
ALTER TABLE `#__content` MODIFY `checked_out_time` datetime NULL DEFAULT NULL;
ALTER TABLE `#__messages` MODIFY `date_time` datetime NOT NULL;
