ALTER TABLE `users` ADD UNIQUE `username` (`username`, `mail_host`);
ALTER TABLE `contacts` MODIFY `email` varchar(255) NOT NULL;
