CREATE TABLE taxcategories(
taxcatid tinyint( 4 ) AUTO_INCREMENT NOT NULL ,
taxcatname varchar( 30 ) NOT NULL ,
PRIMARY KEY ( taxcatid )
) ENGINE=InnoDB;
ALTER TABLE `taxauthlevels` CHANGE `dispatchtaxauthority` `dispatchtaxprovince` TINYINT( 4 ) DEFAULT '1' NOT NULL;
ALTER TABLE `taxauthlevels` CHANGE `level` `taxcatid` TINYINT( 4 ) DEFAULT '0' NOT NULL;
ALTER TABLE `taxauthlevels` DROP INDEX `dispatchtaxauthority` , ADD INDEX `dispatchtaxprovince` ( `dispatchtaxprovince` );
ALTER TABLE `taxauthlevels` ADD INDEX ( `taxcatid` );
CREATE TABLE taxprovinces(
taxprovinceid tinyint( 4 ) AUTO_INCREMENT NOT NULL ,
taxprovincename varchar( 30 ) NOT NULL ,
PRIMARY KEY ( taxprovinceid )
) ENGINE=InnoDB;
ALTER TABLE `locations` CHANGE `taxauthority` `taxprovinceid` TINYINT( 4 ) DEFAULT '1' NOT NULL;
ALTER TABLE `locations` ADD INDEX ( `taxprovinceid` );
CREATE TABLE taxgroups (
  taxgroupid tinyint(4) auto_increment NOT NULL,
  taxgroupdescription varchar(30) NOT NULL,
  PRIMARY KEY(taxgroupid)
)ENGINE=InnoDB;
CREATE TABLE taxgrouptaxes (
  taxgroupid tinyint(4) NOT NULL,
  taxauthid tinyint(4) NOT NULL,
  calculationorder tinyint(4) NOT NULL,
  taxontax tinyint(4) DEFAULT 0 NOT NULL,
  PRIMARY KEY(taxgroupid, taxauthid )
) ENGINE=InnoDB;
ALTER TABLE `taxgrouptaxes` ADD INDEX ( `taxgroupid` );
ALTER TABLE `taxgrouptaxes` ADD INDEX ( `taxauthid` );
CREATE TABLE stockmovestaxes (
	stkmoveno int NOT NULL,
	taxauthid tinyint NOT NULL,
	taxontax TINYINT DEFAULT 0 NOT NULL,
	taxcalculationorder TINYINT NOT NULL,
	taxrate double DEFAULT 0 NOT NULL,
	PRIMARY KEY (stkmoveno,taxauthid),
	KEY (taxauthid),
	KEY (taxcalculationorder)
) ENGINE=InnoDB;
ALTER TABLE stockmoves DROP COLUMN taxrate;
CREATE TABLE debtortranstaxes (
	`debtortransid` INT NOT NULL ,
	`taxauthid` TINYINT NOT NULL ,
	`taxamount` DOUBLE NOT NULL,
	PRIMARY KEY(debtortransid,
			taxauthid),
	KEY (taxauthid)
) ENGINE=innodb;
ALTER TABLE `custbranch` CHANGE `taxauthority` `taxgroupid` TINYINT( 4 ) DEFAULT '1' NOT NULL;
ALTER TABLE `custbranch` DROP INDEX `area_2` ;
ALTER TABLE `custbranch` DROP INDEX `taxauthority` , ADD INDEX `taxgroupid` ( `taxgroupid` ) ;
ALTER TABLE `taxauthlevels` RENAME `taxauthrates`;
ALTER TABLE `stockmaster` CHANGE `taxlevel` `taxcatid` TINYINT( 4 ) DEFAULT '1' NOT NULL;
ALTER TABLE `stockmaster` ADD INDEX ( `taxcatid` );
ALTER TABLE `salesorderdetails` DROP PRIMARY KEY;
ALTER TABLE `salesorderdetails` ADD `orderlineno` INT DEFAULT '0' NOT NULL FIRST ;
CREATE TABLE `supptranstaxes` (
  `supptransid` int(11) NOT NULL default '0',
  `taxauthid` tinyint(4) NOT NULL default '0',
  `taxamount` double NOT NULL default '0',
  PRIMARY KEY  (`supptransid`,`taxauthid`),
  KEY `taxauthid` (`taxauthid`)
) ENGINE=InnoDB;
ALTER TABLE `suppliers` CHANGE `taxauthority` `taxgroupid` TINYINT( 4 ) DEFAULT '1' NOT NULL;
ALTER TABLE `suppliers` DROP INDEX `taxauthority` , ADD INDEX `taxgroupid` ( `taxgroupid` );
ALTER TABLE locations ADD COLUMN managed tinyint NOT NULL default '0';
