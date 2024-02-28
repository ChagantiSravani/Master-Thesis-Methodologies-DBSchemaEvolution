CREATE TABLE `custcontacts` (
  `contid` int(11) NOT NULL auto_increment,
  `debtorno` varchar(10) NOT NULL,
  `contactname` varchar(40) NOT NULL,
  `role` varchar(40) NOT NULL,
  `phoneno` varchar(20) NOT NULL,
  `notes` varchar(255) NOT NULL,
  PRIMARY KEY  (`contid`)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS `factorcompanies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coyname` varchar(50) NOT NULL DEFAULT '',
  `address1` varchar(40) NOT NULL DEFAULT '',
  `address2` varchar(40) NOT NULL DEFAULT '',
  `address3` varchar(40) NOT NULL DEFAULT '',
  `address4` varchar(40) NOT NULL DEFAULT '',
  `address5` varchar(20) NOT NULL DEFAULT '',
  `address6` varchar(15) NOT NULL DEFAULT '',
  `contact` varchar(25) NOT NULL DEFAULT '',
  `telephone` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(25) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `factor_name` (`coyname`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;
ALTER TABLE `suppliers` ADD COLUMN `taxref` varchar(20) NOT NULL default '';
CREATE TABLE `tags` (
`tagref` tinyint(4) NOT NULL auto_increment,
`tagdescription` varchar(50) NOT NULL,
PRIMARY KEY (`tagref`)
) ENGINE=InnoDB;
ALTER TABLE `gltrans` ADD COLUMN `tag` tinyint(4) NOT NULL default '0' AFTER `jobref`;
ALTER TABLE `custbranch` ADD `lat` FLOAT( 10, 6 ) NOT NULL AFTER `braddress6` ,
ADD `lng` FLOAT( 10, 6 ) NOT NULL AFTER `lat`;
ALTER TABLE `suppliers` ADD `lat` FLOAT( 10, 6 ) NOT NULL AFTER `address6` ,
ADD `lng` FLOAT( 10, 6 ) NOT NULL AFTER `lat`;
CREATE TABLE `geocode_param` (
 `geocodeid` varchar(4) NOT NULL default '',
 `geocode_key` varchar(200) NOT NULL default '',
 `center_long` varchar(20) NOT NULL default '',
 `center_lat` varchar(20) NOT NULL default '',
 `map_height` varchar(10) NOT NULL default '',
 `map_width` varchar(10) NOT NULL default '',
 `map_host` varchar(50) NOT NULL default ''
) ENGINE=InnoDB;
CREATE TABLE `debtortype` (
`typeid` tinyint(4) NOT NULL auto_increment,
`typename` varchar(100) NOT NULL,
PRIMARY KEY (`typeid`)
) ENGINE=InnoDB;
ALTER TABLE `debtorsmaster` ADD `typeid` tinyint(4) NOT NULL default '1';
ALTER TABLE `purchdata` ADD `effectivefrom` DATE NOT NULL;
CREATE TABLE `debtortypenotes` (
`noteid` tinyint(4) NOT NULL auto_increment,
`typeid` tinyint(4) NOT NULL default '0',
`href` varchar(100) NOT NULL,
`note` varchar(200) NOT NULL,
`date` date NOT NULL default '2023-01-01',
`priority` varchar(20) NOT NULL,
PRIMARY KEY (`noteid`)
) ENGINE=InnoDB;
CREATE TABLE `custnotes` (
`noteid` tinyint(4) NOT NULL auto_increment,
`debtorno` varchar(10) NOT NULL default '0',
`href` varchar(100) NOT NULL,
`note` varchar(200) NOT NULL,
`date` date NOT NULL default '2023-01-01',
`priority` varchar(20) NOT NULL,
PRIMARY KEY (`noteid`)
) ENGINE=InnoDB;
ALTER TABLE salesglpostings MODIFY COLUMN area VARCHAR(3) NOT NULL;
ALTER TABLE salesanalysis MODIFY COLUMN area VARCHAR(3) NOT NULL;
ALTER TABLE `debtortrans` CHANGE `trandate` `trandate` DATE NOT NULL DEFAULT '2023-01-01';
