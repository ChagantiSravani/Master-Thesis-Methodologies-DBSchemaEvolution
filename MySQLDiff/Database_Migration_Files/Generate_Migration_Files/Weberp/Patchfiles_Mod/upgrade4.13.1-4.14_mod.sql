ALTER TABLE `www_users` ADD `showpagehelp` TINYINT(1) NOT NULL DEFAULT '1' COMMENT 'Turn off/on page help' AFTER `showdashboard`, ADD `showfieldhelp` TINYINT(1) NOT NULL DEFAULT '1' COMMENT 'Turn off/on field help' AFTER `showpagehelp`;
ALTER TABLE  `paymentmethods` ADD COLUMN  `percentdiscount` DOUBLE NOT NULL DEFAULT 0;
ALTER TABLE `pcashdetails` ADD UNIQUE KEY `tabcodedate` (`tabcode`,`date`,`codeexpense`,`counterindex`);
CREATE table favourites (userid varchar(20) NOT NULL DEFAULT '',
	caption varchar(50) NOT NULL DEFAULT '',
	href varchar(200) NOT NULL DEFAULT '#',
	PRIMARY KEY (userid,caption)) Engine=InnoDB DEFAULT CHARSET=utf8;
