ALTER TABLE `banktrans` ADD `chequeno` VARCHAR(16) NOT NULL DEFAULT '' AFTER `currcode`;
ALTER TABLE `custbranch` CHANGE `lat` `lat` FLOAT(12,8) NOT NULL DEFAULT '0.00000000';
ALTER TABLE `custbranch` CHANGE `lng` `lng` FLOAT(12,8) NOT NULL DEFAULT '0.00000000';
ALTER TABLE `supptrans` ADD `chequeno` VARCHAR(16) NOT NULL DEFAULT '' AFTER `hold`;
ALTER TABLE `supptrans` ADD `void` TINYINT(1) NOT NULL DEFAULT 0 AFTER `chequeno`;
ALTER TABLE `pcexpenses` ADD COLUMN `taxcatid` TINYINT(4) NOT NULL DEFAULT 1 AFTER `tag`;
ALTER TABLE `pctabs` ADD COLUMN `defaulttag` TINYINT(4) NOT NULL DEFAULT 0 AFTER `glaccountpcash`;
ALTER TABLE `pctabs` ADD COLUMN `taxgroupid` TINYINT(4) NOT NULL DEFAULT 1 AFTER `defaulttag`;
ALTER TABLE `pctabs` ADD COLUMN `authorizerexpenses` VARCHAR(20) NOT NULL AFTER `authorizer`;
ALTER TABLE `pcashdetails` ADD COLUMN `tag` INT(11) NOT NULL DEFAULT 0 AFTER `tabcode`;
CREATE TABLE `pcashdetailtaxes` (
	`counterindex` INT(20) NOT NULL AUTO_INCREMENT,
	`pccashdetail` INT(20) NOT NULL DEFAULT 0,
	`calculationorder` TINYINT(4) NOT NULL DEFAULT 0,
	`description` VARCHAR(40) NOT NULL DEFAULT '',
	`taxauthid` TINYINT(4) NOT NULL DEFAULT '0',
	`purchtaxglaccount` VARCHAR(20) NOT NULL DEFAULT '',
	`taxontax` TINYINT(4) NOT NULL DEFAULT 0,
	`taxrate` DOUBLE NOT NULL DEFAULT 0.0,
	`amount` DOUBLE NOT NULL DEFAULT 0.0,
	PRIMARY KEY(counterindex)
) Engine=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE pcashdetails MODIFY receipt text COMMENT 'Column redundant. Replaced by receipt file upload. Nov 2017.';
ALTER TABLE `stockserialitems` ADD `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP, ADD INDEX (`createdate`);
ALTER TABLE `salesorders` ADD `internalcomment` BLOB NULL DEFAULT NULL;
CREATE TABLE IF NOT EXISTS pickreq (
	`prid` int not null auto_increment,
	`initiator` varchar(20) not null default '',
	`shippedby` varchar(20) not null default '',
	`initdate` date not null default '2023-01-01',
	`requestdate` date not null default '2023-01-01',
	`shipdate` date not null default '2023-01-01',
	`status` varchar(12) not null default '',
	`comments` text default null,
	`closed` tinyint not null default '0',
	`loccode` varchar(5) not null default '',
	`orderno` int not null default '1',
	`consignment` varchar(15) NOT NULL DEFAULT '',
	`packages` int(11) NOT NULL DEFAULT '1' COMMENT 'number of cartons',
	PRIMARY KEY (`prid`),
	key (`orderno`),
	key (`requestdate`),
	key (`shipdate`),
	key (`status`),
	key (`closed`),
	key (`loccode`),
	constraint foreign key (`orderno`) REFERENCES salesorders(`orderno`)
) Engine=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS pickreqdetails (
	`detailno` int not null auto_increment,
	`prid` int not null default '1',
	`orderlineno` int not null default '0',
	`stockid` varchar(20) not null default '',
	`qtyexpected` double not null default '0',
	`qtypicked` double not null default '0',
	`invoicedqty` double not null default '0',
	`shipqty` double not null default '0',
	PRIMARY KEY (`detailno`),
	key (`prid`),
	key (`stockid`),
	constraint foreign key (`prid`) REFERENCES pickreq(`prid`)
) Engine=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS pickserialdetails (
	`serialmoveid` int not null auto_increment,
	`detailno` int not null default '1',
	`stockid` varchar(20) not null default '',
	`serialno` varchar(30) not null default '',
	`moveqty` double not null default '0',
	PRIMARY KEY (`serialmoveid`),
	key (`detailno`),
	key (`stockid`,`serialno`),
	key (`serialno`)) Engine=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `pcreceipts` (
	`counterindex` INT(20) NOT NULL AUTO_INCREMENT,
	`pccashdetail` INT(20) NOT NULL DEFAULT 0 COMMENT 'Expenses record identity',
	`hashfile` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'MD5 hash of uploaded receipt file',
	`type` varchar(80) NOT NULL DEFAULT '' COMMENT 'Mime type of uploaded receipt file',
	`extension` varchar(4) NOT NULL DEFAULT '' COMMENT 'File extension of uploaded receipt',
	`size` int(20) NOT NULL DEFAULT 0 COMMENT 'File size of uploaded receipt',
	PRIMARY KEY (`counterindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE pcashdetails ADD COLUMN purpose text NULL AFTER posted;
