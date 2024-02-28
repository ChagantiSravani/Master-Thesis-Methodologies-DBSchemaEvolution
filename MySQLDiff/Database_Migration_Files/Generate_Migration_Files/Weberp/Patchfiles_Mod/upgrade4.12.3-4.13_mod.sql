CREATE TABLE IF NOT EXISTS `loctransfercancellations` (
			`reference` INT(11) NOT NULL ,
			`stockid` VARCHAR(20) NOT NULL ,
			`cancelqty` DOUBLE NOT NULL ,
			`canceldate` DATETIME NOT NULL ,
			`canceluserid` VARCHAR(20) NOT NULL ) ENGINE = InnoDB;
ALTER TABLE `loctransfercancellations` ADD INDEX `Index1` (`reference`, `stockid`) COMMENT '';
ALTER TABLE `loctransfercancellations` ADD INDEX `Index2` (`canceldate`, `reference`, `stockid`) COMMENT '';
CREATE TABLE IF NOT EXISTS `suppinvstogrn` (
	  `suppinv` int(11) NOT NULL,
	  `grnno` int(11) NOT NULL,
  PRIMARY KEY (`suppinv`,`grnno`),
  KEY `suppinvstogrn_ibfk_1` (`grnno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER table grns ADD supplierref varchar(30) NOT NULL DEFAULT '';
CREATE TABLE IF NOT EXISTS `glaccountusers` (
  `accountcode` varchar(20) NOT NULL COMMENT 'GL account code from chartmaster',
  `userid` varchar(20) NOT NULL,
  `canview` tinyint(4) NOT NULL DEFAULT '0',
  `canupd` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `glaccountusers` ADD UNIQUE `useraccount` (`userid`, `accountcode`);
ALTER TABLE `glaccountusers` ADD UNIQUE `accountuser` (`accountcode`, `userid`);
ALTER table bom ADD remark varchar(500) NOT NULL DEFAULT '';
ALTER table pctabs CHANGE authorizer authorizer varchar(100);
ALTER table pctabs CHANGE assigner assigner varchar(100);
ALTER table bom ADD digitals int(11) NOT NULL DEFAULT 0;
ALTER table custcontacts ADD statement tinyint(4) NOT NULL DEFAULT 0;
