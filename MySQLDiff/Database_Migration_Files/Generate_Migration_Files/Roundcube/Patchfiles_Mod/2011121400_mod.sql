ALTER TABLE `contacts` MODIFY `email` text NOT NULL;
ALTER TABLE `cache` ALTER `user_id` DROP DEFAULT;
ALTER TABLE `cache_index` ALTER `user_id` DROP DEFAULT;
ALTER TABLE `cache_thread` ALTER `user_id` DROP DEFAULT;
ALTER TABLE `cache_messages` ALTER `user_id` DROP DEFAULT;
ALTER TABLE `contacts` ALTER `user_id` DROP DEFAULT;
ALTER TABLE `contactgroups` ALTER `user_id` DROP DEFAULT;
ALTER TABLE `contactgroupmembers` ALTER `contact_id` DROP DEFAULT;
ALTER TABLE `identities` ALTER `user_id` DROP DEFAULT;
ALTER TABLE `searches` ALTER `user_id` DROP DEFAULT;