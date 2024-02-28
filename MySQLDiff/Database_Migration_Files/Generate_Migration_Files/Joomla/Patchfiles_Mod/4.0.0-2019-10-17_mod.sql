ALTER TABLE `#__users` MODIFY `registerDate` datetime NOT NULL;
ALTER TABLE `#__users` MODIFY `lastvisitDate` datetime NULL DEFAULT NULL;
ALTER TABLE `#__users` MODIFY `lastResetTime` datetime NULL DEFAULT NULL;
