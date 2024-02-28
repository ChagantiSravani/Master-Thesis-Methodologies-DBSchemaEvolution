CREATE TABLE `cache` (`cache_id` int unsigned NOT NULL AUTO_INCREMENT, `user_id` int unsigned NOT NULL DEFAULT '0', `cache_key` varchar(128) NOT NULL DEFAULT '', `created` datetime NOT NULL, `data` longtext NOT NULL, PRIMARY KEY (`cache_id`), KEY `user_id` (`user_id`), KEY `cache_key` (`cache_key`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `contacts` (`contact_id` int unsigned NOT NULL AUTO_INCREMENT, `user_id` int unsigned NOT NULL DEFAULT '0', `changed` datetime NOT NULL, `del` tinyint(1) NOT NULL DEFAULT '0', `name` varchar(128) NOT NULL DEFAULT '', `email` varchar(255) NOT NULL, `firstname` varchar(128) NOT NULL DEFAULT '', `surname` varchar(128) NOT NULL DEFAULT '', `vcard` text NOT NULL, PRIMARY KEY (`contact_id`), KEY `user_id` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `identities` (`identity_id` int unsigned NOT NULL AUTO_INCREMENT, `user_id` int unsigned NOT NULL DEFAULT '0', `changed` datetime NOT NULL, `del` tinyint(1) NOT NULL DEFAULT '0', `standard` tinyint(1) NOT NULL DEFAULT '0', `name` varchar(128) NOT NULL, `organization` varchar(128) NOT NULL DEFAULT '', `email` varchar(128) NOT NULL, `reply-to` varchar(128) NOT NULL DEFAULT '', `bcc` varchar(128) NOT NULL DEFAULT '', `signature` text, `html_signature` tinyint(1) NOT NULL DEFAULT '0', PRIMARY KEY (`identity_id`), KEY `user_id` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `messages` (`message_id` int unsigned NOT NULL AUTO_INCREMENT, `user_id` int unsigned NOT NULL DEFAULT '0', `del` tinyint(1) NOT NULL DEFAULT '0', `cache_key` varchar(128) NOT NULL DEFAULT '', `created` datetime NOT NULL, `idx` int unsigned NOT NULL DEFAULT '0', `uid` int unsigned NOT NULL DEFAULT '0', `subject` varchar(255) NOT NULL DEFAULT '', `from` varchar(255) NOT NULL DEFAULT '', `to` varchar(255) NOT NULL DEFAULT '', `cc` varchar(255) NOT NULL DEFAULT '', `date` datetime NOT NULL, `size` int unsigned NOT NULL DEFAULT '0', `headers` text NOT NULL, `structure` text, PRIMARY KEY (`message_id`), UNIQUE KEY `uniqueness` (`user_id`,`cache_key`,`uid`), KEY `user_id` (`user_id`), KEY `idx` (`idx`), KEY `uid` (`uid`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `session` (`sess_id` varchar(40) NOT NULL DEFAULT '', `created` datetime NOT NULL, `changed` datetime NOT NULL, `ip` varchar(40) NOT NULL DEFAULT '', `vars` mediumtext NOT NULL, PRIMARY KEY (`sess_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `users` (`user_id` int unsigned NOT NULL AUTO_INCREMENT, `username` varchar(128) NOT NULL DEFAULT '', `mail_host` varchar(128) NOT NULL DEFAULT '', `alias` varchar(128) NOT NULL DEFAULT '', `created` datetime NOT NULL, `last_login` datetime DEFAULT NULL, `language` varchar(5) DEFAULT NULL, `preferences` text, PRIMARY KEY (`user_id`), UNIQUE KEY `username` (`username`,`mail_host`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `contactgroups` (`contactgroup_id` int unsigned NOT NULL AUTO_INCREMENT, `user_id` int unsigned NOT NULL DEFAULT '0', `changed` datetime NOT NULL, `del` tinyint(1) NOT NULL DEFAULT '0', `name` varchar(128) NOT NULL DEFAULT '', PRIMARY KEY (`contactgroup_id`), KEY `contactgroups_user_index` (`user_id`,`del`), CONSTRAINT `user_id_fk_contactgroups` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `contactgroupmembers` (`contactgroup_id` int unsigned NOT NULL, `contact_id` int unsigned NOT NULL DEFAULT '0', `created` datetime NOT NULL, PRIMARY KEY (`contactgroup_id`,`contact_id`), KEY `contact_id_fk_contacts` (`contact_id`), CONSTRAINT `contact_id_fk_contacts` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`contact_id`) ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT `contactgroup_id_fk_contactgroups` FOREIGN KEY (`contactgroup_id`) REFERENCES `contactgroups` (`contactgroup_id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
