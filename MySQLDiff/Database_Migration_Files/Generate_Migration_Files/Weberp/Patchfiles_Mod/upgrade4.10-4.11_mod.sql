ALTER TABLE  `companies` CHANGE  `debtorsact`  `debtorsact` VARCHAR( 20 ) NOT NULL DEFAULT  '70000',
CHANGE  `pytdiscountact`  `pytdiscountact` VARCHAR( 20 ) NOT NULL DEFAULT  '55000',
CHANGE  `creditorsact`  `creditorsact` VARCHAR( 20 ) NOT NULL DEFAULT  '80000',
CHANGE  `payrollact`  `payrollact` VARCHAR( 20 ) NOT NULL DEFAULT  '84000',
CHANGE  `grnact`  `grnact` VARCHAR( 20 ) NOT NULL DEFAULT  '72000',
CHANGE  `exchangediffact`  `exchangediffact` VARCHAR( 20 ) NOT NULL DEFAULT  '65000',
CHANGE  `purchasesexchangediffact`  `purchasesexchangediffact` VARCHAR( 20 ) NOT NULL DEFAULT  '0',
CHANGE  `retainedearnings`  `retainedearnings` VARCHAR( 20 ) NOT NULL DEFAULT  '90000',
CHANGE  `freightact`  `freightact` VARCHAR( 20 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `lastcostrollup` CHANGE  `stockact`  `stockact` VARCHAR( 20 ) NOT NULL DEFAULT  '0',
CHANGE  `adjglact`  `adjglact` VARCHAR( 20 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `salesglpostings` CHANGE  `discountglcode`  `discountglcode` VARCHAR( 20 ) NOT NULL DEFAULT  '0',
CHANGE  `salesglcode`  `salesglcode` VARCHAR( 20 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `cogsglpostings` CHANGE  `glcode`  `glcode` VARCHAR( 20 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `fixedassetcategories` CHANGE  `costact`  `costact` VARCHAR( 20 ) NOT NULL DEFAULT  '0',
CHANGE  `depnact`  `depnact` VARCHAR( 20 ) NOT NULL DEFAULT  '0',
CHANGE  `disposalact`  `disposalact` VARCHAR( 20 ) NOT NULL DEFAULT  '80000',
CHANGE  `accumdepnact`  `accumdepnact` VARCHAR( 20 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `purchorderdetails` CHANGE  `glcode`  `glcode` VARCHAR( 20 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `stockcategory` CHANGE  `stockact`  `stockact` VARCHAR( 20 ) NOT NULL DEFAULT  '0',
CHANGE  `adjglact`  `adjglact` VARCHAR( 20 ) NOT NULL DEFAULT  '0',
CHANGE  `issueglact`  `issueglact` VARCHAR( 20 ) NOT NULL DEFAULT  '0',
CHANGE  `purchpricevaract`  `purchpricevaract` VARCHAR( 20 ) NOT NULL DEFAULT  '80000',
CHANGE  `materialuseagevarac`  `materialuseagevarac` VARCHAR( 20 ) NOT NULL DEFAULT  '80000',
CHANGE  `wipact`  `wipact` VARCHAR( 20 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `workcentres` CHANGE  `overheadrecoveryact`  `overheadrecoveryact` VARCHAR( 20 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `currencies` ADD  `webcart` TINYINT( 1 ) NOT NULL DEFAULT  '1' COMMENT  'If 1 shown in weberp cart. if 0 no show';
ALTER TABLE  `salescat` CHANGE  `salescatname`  `salescatname` VARCHAR( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
CREATE TABLE `mailgroups` ( id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	                      groupname varchar(100) NOT NULL,
			      unique (groupname)) ENGINE = InnoDB DEFAULT CHARSET = utf8;
CREATE TABLE `mailgroupdetails` (groupname varchar(100) NOT NULL,
	                   userid varchar(20) NOT NULL,
			   INDEX(`groupname`)) Engine=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE stockrequestitems DROP PRIMARY KEY;
ALTER TABLE stockrequestitems ADD PRIMARY KEY (`dispatchitemsid`,`dispatchid`);
CREATE TABLE IF NOT EXISTS `fixedassettasks` (
  `taskid` int(11) NOT NULL AUTO_INCREMENT,
  `assetid` int(11) NOT NULL,
  `taskdescription` text NOT NULL,
  `frequencydays` int(11) NOT NULL DEFAULT '365',
  `lastcompleted` date NOT NULL,
  `userresponsible` varchar(20) NOT NULL,
  `manager` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`taskid`),
  KEY `assetid` (`assetid`),
  KEY `userresponsible` (`userresponsible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
CREATE TABLE IF NOT EXISTS `stockdescriptiontranslations` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `language_id` varchar(10) NOT NULL DEFAULT 'en_GB.utf8',
  `descriptiontranslation` varchar(50) NOT NULL,
  PRIMARY KEY (`stockid`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `debtorsmaster` ADD `language_id` VARCHAR( 10 ) NOT NULL DEFAULT 'en_GB.utf8';
ALTER TABLE `debtortrans` ADD `salesperson` VARCHAR( 4 ) NOT NULL DEFAULT '' , ADD INDEX ( `salesperson` );
CREATE TABLE IF NOT EXISTS `manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) NOT NULL,
  `manufacturers_url` varchar(50) NOT NULL DEFAULT '',
  `manufacturers_image` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY (`manufacturers_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `salescattranslations` (
  `salescatid` tinyint(4) NOT NULL DEFAULT '0',
  `language_id` varchar(10) NOT NULL DEFAULT 'en_GB.utf8',
  `salescattranslation` varchar(40) NOT NULL,
  PRIMARY KEY (`salescatid`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE salescatprod ADD COLUMN manufacturers_id int(11) NOT NULL;
ALTER TABLE salescatprod ADD COLUMN featured int(11) DEFAULT '0' NOT NULL;
ALTER TABLE `salescatprod` ADD INDEX ( `manufacturers_id` );
ALTER TABLE  `purchorderauth` CHANGE  `authlevel`  `authlevel` DOUBLE NOT NULL DEFAULT  '0';
ALTER TABLE  `freightcosts` ADD  `destinationcountry` VARCHAR( 40 ) NOT NULL AFTER  `locationfrom`;
ALTER TABLE  `stockmaster` CHANGE  `kgs`  `grossweight` DECIMAL( 20, 4 ) NOT NULL DEFAULT  '0.0000';
ALTER TABLE  `custbranch` CHANGE  `brpostaddr3`  `brpostaddr3` VARCHAR( 40 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  '',
						  CHANGE  `brpostaddr4`  `brpostaddr4` VARCHAR( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  '',
 						  CHANGE  `brpostaddr6`  `brpostaddr6` VARCHAR( 40 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  '';
ALTER TABLE `stockcategory` ADD `defaulttaxcatid` TINYINT NOT NULL DEFAULT '1';
ALTER TABLE  `salescat` ADD  `active` INT NOT NULL DEFAULT  '1' COMMENT  '1 if active 0 if inactive';
