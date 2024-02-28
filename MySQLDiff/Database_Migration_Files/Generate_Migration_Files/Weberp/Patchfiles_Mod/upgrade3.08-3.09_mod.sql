CREATE TABLE `audittrail` (
	`transactiondate` datetime NOT NULL default '2023-01-01',
	`userid` varchar(20) NOT NULL default '',
	`querystring` text,
	KEY `UserID` (`userid`)
) ENGINE=InnoDB;
ALTER TABLE `salesorders` CHANGE `contactemail` `contactemail` VARCHAR( 40 ) DEFAULT NULL;
CREATE TABLE `factorcompanies` (
  `id` int(11) NOT NULL auto_increment,
  `coyname` varchar(50) NOT NULL default '',
  `address1` varchar(40) NOT NULL default '',
  `address2` varchar(40) NOT NULL default '',
  `address3` varchar(40) NOT NULL default '',
  `address4` varchar(40) NOT NULL default '',
  `address5` varchar(20) NOT NULL default '',
  `address6` varchar(15) NOT NULL default '',
  `contact` varchar(25) NOT NULL default '',
  `telephone` varchar(25) NOT NULL default '',
  `fax` varchar(25) NOT NULL default '',
  `email` varchar(55) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB;
ALTER TABLE `suppliers` ADD COLUMN  `factorcompanyid` int(11) NOT NULL default 1 AFTER `taxgroupid`;
ALTER TABLE `stockmaster` ADD COLUMN  `perishable` tinyint(1) NOT NULL default 0 AFTER `serialised`;
ALTER TABLE `stockmaster` ADD COLUMN `appendfile` varchar(40) NOT NULL default 'none' AFTER `serialised`;
ALTER TABLE `stockserialitems` ADD COLUMN  `expirationdate` datetime NOT NULL default '2023-01-01' AFTER `serialno`;
ALTER TABLE `bankaccounts` ADD COLUMN `currcode` CHAR( 3 ) NOT NULL AFTER `accountcode` ;
ALTER TABLE `banktrans` CHANGE `exrate` `exrate` DOUBLE NOT NULL DEFAULT '1' COMMENT 'From bank account currency to payment currency';
ALTER TABLE `banktrans` ADD `functionalexrate` DOUBLE NOT NULL DEFAULT '1' COMMENT 'Account currency to functional currency';
ALTER TABLE `worequirements` Add CONSTRAINT `worequirements_ibfk_3` FOREIGN KEY (`wo`, `parentstockid`) REFERENCES `woitems` (`wo`, `stockid`);
CREATE TABLE `assetmanager` (
  `id` int(11) NOT NULL auto_increment,
  `serialno` varchar(30) NOT NULL default '',
  `assetglcode` int(11) NOT NULL default '0',
  `depnglcode` int(11) NOT NULL default '0',
  `description` varchar(30) NOT NULL default '',
  `lifetime` int(11) NOT NULL default 0,
  `location` varchar(15) NOT NULL default '',
  `cost` double NOT NULL default 0.0,
  `depn` double NOT NULL default 0.0,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB;
