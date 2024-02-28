ALTER TABLE `cache`
    DROP `session_id`;
ALTER TABLE `users`
    CHANGE `language` `language` varchar(5);
ALTER TABLE `cache` ENGINE=InnoDB;
ALTER TABLE `session` ENGINE=InnoDB;
ALTER TABLE `messages` ENGINE=InnoDB;
ALTER TABLE `users` ENGINE=InnoDB;
ALTER TABLE `contacts` ENGINE=InnoDB;
ALTER TABLE `identities` ENGINE=InnoDB;
