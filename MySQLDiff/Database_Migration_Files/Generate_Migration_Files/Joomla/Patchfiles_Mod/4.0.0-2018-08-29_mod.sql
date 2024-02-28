ALTER TABLE `#__ucm_content` MODIFY `core_created_time` datetime NOT NULL;
ALTER TABLE `#__ucm_content` MODIFY `core_modified_time` datetime NOT NULL;
ALTER TABLE `#__ucm_content` MODIFY `core_publish_up` datetime NULL DEFAULT NULL;
ALTER TABLE `#__ucm_content` MODIFY `core_publish_down` datetime NULL DEFAULT NULL;
ALTER TABLE `#__ucm_content` MODIFY `core_checked_out_time` datetime NULL DEFAULT NULL;
ALTER TABLE `#__modules` MODIFY `publish_up` datetime NULL DEFAULT NULL;
ALTER TABLE `#__modules` MODIFY `publish_down` datetime NULL DEFAULT NULL;
ALTER TABLE `#__modules` MODIFY `checked_out_time` datetime NULL DEFAULT NULL;
