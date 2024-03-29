-- RoundCube Webmail initial database structure
-- Version 0.1-rc1
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `cache`
-- 

CREATE TABLE `cache` (
  `cache_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL default '0',
  `session_id` varchar(40) default NULL,
  `cache_key` varchar(128) NOT NULL default '',
  `created` datetime NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY  (`cache_id`),
  KEY `user_id` (`user_id`),
  KEY `cache_key` (`cache_key`),
  KEY `session_id` (`session_id`)
);

-- --------------------------------------------------------

-- 
-- Table structure for table `contacts`
-- 

CREATE TABLE `contacts` (
  `contact_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL default '0',
  `changed` datetime NOT NULL,
  `del` tinyint(1) NOT NULL default '0',
  `name` varchar(128) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `firstname` varchar(128) NOT NULL default '',
  `surname` varchar(128) NOT NULL default '',
  `vcard` text NOT NULL,
  PRIMARY KEY  (`contact_id`),
  KEY `user_id` (`user_id`)
);

-- --------------------------------------------------------

-- 
-- Table structure for table `identities`
-- 

CREATE TABLE `identities` (
  `identity_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL default '0',
  `del` tinyint(1) NOT NULL default '0',
  `standard` tinyint(1) NOT NULL default '0',
  `name` varchar(128) NOT NULL default '',
  `organization` varchar(128) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `reply-to` varchar(128) NOT NULL default '',
  `bcc` varchar(128) NOT NULL default '',
  `signature` text NOT NULL,
  `html_signature` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`identity_id`),
  KEY `user_id` (`user_id`)
);

-- --------------------------------------------------------

-- 
-- Table structure for table `session`
-- 

CREATE TABLE `session` (
  `sess_id` varchar(40) NOT NULL default '',
  `created` datetime NOT NULL ,
  `changed` datetime NOT NULL ,
  `ip` VARCHAR(40) NOT NULL default '',
  `vars` text NOT NULL,
  PRIMARY KEY  (`sess_id`)
);

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(128) NOT NULL default '',
  `mail_host` varchar(128) NOT NULL default '',
  `alias` varchar(128) NOT NULL default '',
  `created` datetime NOT NULL ,
  `last_login` datetime NOT NULL ,
  `language` varchar(5) NOT NULL default 'en',
  `preferences` text,
  PRIMARY KEY  (`user_id`)
);

-- --------------------------------------------------------

-- 
-- Table structure for table `messages`
-- 

CREATE TABLE `messages` (
  `message_id` int(11) unsigned NOT NULL auto_increment,
  `user_id` int(11) unsigned NOT NULL default '0',
  `del` tinyint(1) NOT NULL default '0',
  `cache_key` varchar(128) NOT NULL default '',
  `created` datetime NOT NULL ,
  `idx` int(11) unsigned NOT NULL default '0',
  `uid` int(11) unsigned NOT NULL default '0',
  `subject` varchar(255) NOT NULL default '',
  `from` varchar(255) NOT NULL default '',
  `to` varchar(255) NOT NULL default '',
  `cc` varchar(255) NOT NULL default '',
  `date` datetime NOT NULL ,
  `size` int(11) unsigned NOT NULL default '0',
  `headers` text NOT NULL,
  `structure` text,
  PRIMARY KEY  (`message_id`),
  KEY `user_id` (`user_id`),
  KEY `idx` (`idx`),
  KEY `uid` (`uid`),
  UNIQUE `uniqueness` (`user_id`, `cache_key`, `uid`)
);


