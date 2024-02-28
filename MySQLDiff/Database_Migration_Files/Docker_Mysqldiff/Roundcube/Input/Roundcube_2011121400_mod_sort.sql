CREATE TABLE `cache` (`cache_id` int unsigned NOT NULL AUTO_INCREMENT, `user_id` int unsigned NOT NULL, `cache_key` varchar(128) NOT NULL DEFAULT '', `created` datetime NOT NULL, `data` longtext NOT NULL, PRIMARY KEY (`cache_id`), KEY `user_id` (`user_id`), KEY `cache_key` (`cache_key`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `contacts` (`contact_id` int unsigned NOT NULL AUTO_INCREMENT, `user_id` int unsigned NOT NULL, `changed` datetime NOT NULL, `del` tinyint(1) NOT NULL DEFAULT '0', `name` varchar(128) NOT NULL DEFAULT '', `email` text NOT NULL, `firstname` varchar(128) NOT NULL DEFAULT '', `surname` varchar(128) NOT NULL DEFAULT '', `vcard` longtext, `words` text, PRIMARY KEY (`contact_id`), KEY `user_id` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `identities` (`identity_id` int unsigned NOT NULL AUTO_INCREMENT, `user_id` int unsigned NOT NULL, `changed` datetime NOT NULL, `del` tinyint(1) NOT NULL DEFAULT '0', `standard` tinyint(1) NOT NULL DEFAULT '0', `name` varchar(128) NOT NULL, `organization` varchar(128) NOT NULL DEFAULT '', `email` varchar(128) NOT NULL, `reply-to` varchar(128) NOT NULL DEFAULT '', `bcc` varchar(128) NOT NULL DEFAULT '', `signature` text, `html_signature` tinyint(1) NOT NULL DEFAULT '0', PRIMARY KEY (`identity_id`), KEY `user_id` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `session` (`sess_id` varchar(128) NOT NULL, `created` datetime NOT NULL, `changed` datetime NOT NULL, `ip` varchar(40) NOT NULL DEFAULT '', `vars` mediumtext NOT NULL, PRIMARY KEY (`sess_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `users` (`user_id` int unsigned NOT NULL AUTO_INCREMENT, `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL, `mail_host` varchar(128) NOT NULL DEFAULT '', `alias` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL, `created` datetime NOT NULL, `last_login` datetime DEFAULT NULL, `language` varchar(5) DEFAULT NULL, `preferences` text, PRIMARY KEY (`user_id`), UNIQUE KEY `username` (`username`,`mail_host`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `contactgroups` (`contactgroup_id` int unsigned NOT NULL AUTO_INCREMENT, `user_id` int unsigned NOT NULL, `changed` datetime NOT NULL, `del` tinyint(1) NOT NULL DEFAULT '0', `name` varchar(128) NOT NULL DEFAULT '', PRIMARY KEY (`contactgroup_id`), KEY `contactgroups_user_index` (`user_id`,`del`), CONSTRAINT `user_id_fk_contactgroups` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `cache_index` (`user_id` int unsigned NOT NULL, `mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL, `changed` datetime NOT NULL, `valid` tinyint(1) NOT NULL DEFAULT '0', `data` longtext NOT NULL, PRIMARY KEY (`user_id`,`mailbox`), KEY `changed_index` (`changed`), CONSTRAINT `user_id_fk_cache_index` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `cache_messages` (`user_id` int unsigned NOT NULL, `mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL, `uid` int unsigned NOT NULL DEFAULT '0', `changed` datetime NOT NULL, `data` longtext NOT NULL, `flags` int NOT NULL DEFAULT '0', PRIMARY KEY (`user_id`,`mailbox`,`uid`), KEY `changed_index` (`changed`), CONSTRAINT `user_id_fk_cache_messages` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `cache_thread` (`user_id` int unsigned NOT NULL, `mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL, `changed` datetime NOT NULL, `data` longtext NOT NULL, PRIMARY KEY (`user_id`,`mailbox`), KEY `changed_index` (`changed`), CONSTRAINT `user_id_fk_cache_thread` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `dictionary` (`user_id` int unsigned DEFAULT NULL, `language` varchar(5) NOT NULL, `data` longtext NOT NULL, UNIQUE KEY `uniqueness` (`user_id`,`language`), CONSTRAINT `user_id_fk_dictionary` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `searches` (`search_id` int unsigned NOT NULL AUTO_INCREMENT, `user_id` int unsigned NOT NULL, `type` int NOT NULL DEFAULT '0', `name` varchar(128) NOT NULL, `data` text, PRIMARY KEY (`search_id`), UNIQUE KEY `uniqueness` (`user_id`,`type`,`name`), CONSTRAINT `user_id_fk_searches` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `contactgroupmembers` (`contactgroup_id` int unsigned NOT NULL, `contact_id` int unsigned NOT NULL, `created` datetime NOT NULL, PRIMARY KEY (`contactgroup_id`,`contact_id`), KEY `contact_id_fk_contacts` (`contact_id`), CONSTRAINT `contact_id_fk_contacts` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`contact_id`) ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT `contactgroup_id_fk_contactgroups` FOREIGN KEY (`contactgroup_id`) REFERENCES `contactgroups` (`contactgroup_id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
