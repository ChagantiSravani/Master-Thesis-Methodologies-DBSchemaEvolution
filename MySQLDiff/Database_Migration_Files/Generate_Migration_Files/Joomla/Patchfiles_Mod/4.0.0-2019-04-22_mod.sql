ALTER TABLE `#__contact_details` MODIFY `created` datetime NOT NULL;
ALTER TABLE `#__contact_details` MODIFY `modified` datetime NOT NULL;
ALTER TABLE `#__contact_details` MODIFY `publish_up` datetime NULL DEFAULT NULL;
ALTER TABLE `#__contact_details` MODIFY `publish_down` datetime NULL DEFAULT NULL;
ALTER TABLE `#__contact_details` MODIFY `checked_out_time` datetime NULL DEFAULT NULL;
