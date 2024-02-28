ALTER TABLE stockcatproperties CONVERT TO CHARACTER SET utf8;
ALTER TABLE `www_users` CHANGE COLUMN `language` `language` varchar(10) NOT NULL DEFAULT 'en_GB.utf8';
ALTER TABLE `currencies` ADD COLUMN `decimalplaces` tinyint(3) NOT NULL DEFAULT 2 AFTER `hundredsname`;
ALTER TABLE `holdreasons` DROP INDEX `ReasonCode`;
ALTER TABLE `chartmaster` DROP INDEX `AccountCode`;
ALTER TABLE `purchorders` ADD COLUMN `paymentterms` char(2) NOT NULL DEFAULT '';
ALTER TABLE `purchorders` ADD COLUMN `suppdeladdress1` varchar(40) NOT NULL DEFAULT '' AFTER deladd6;
ALTER TABLE `purchorders` ADD COLUMN `suppdeladdress2` varchar(40) NOT NULL DEFAULT '' AFTER suppdeladdress1;
ALTER TABLE `purchorders` ADD COLUMN `suppdeladdress3` varchar(40) NOT NULL DEFAULT '' AFTER suppdeladdress2;
ALTER TABLE `purchorders` ADD COLUMN `suppdeladdress4` varchar(40) NOT NULL DEFAULT '' AFTER suppdeladdress3;
ALTER TABLE `purchorders` ADD COLUMN `suppdeladdress5` varchar(20) NOT NULL DEFAULT '' AFTER suppdeladdress4;
ALTER TABLE `purchorders` ADD COLUMN `suppdeladdress6` varchar(15) NOT NULL DEFAULT '' AFTER suppdeladdress5;
ALTER TABLE `purchorders` ADD COLUMN `suppliercontact` varchar(30) NOT NULL DEFAULT '' AFTER suppdeladdress6;
ALTER TABLE `purchorders` ADD COLUMN `supptel` varchar(30) NOT NULL DEFAULT '' AFTER suppliercontact;
ALTER TABLE `purchorders` ADD COLUMN `tel` varchar(15) NOT NULL DEFAULT '' AFTER deladd6;
ALTER TABLE `purchorders` ADD COLUMN `port` varchar(40) NOT NULL DEFAULT '' ;
ALTER TABLE `www_users` ADD COLUMN `pdflanguage` tinyint(1) NOT NULL DEFAULT '0';
ALTER TABLE `purchorderauth` ADD COLUMN `offhold` tinyint(1) NOT NULL DEFAULT 0;
CREATE TABLE IF NOT EXISTS `pcashdetails` (
  `counterindex` int(20) NOT NULL AUTO_INCREMENT,
  `tabcode` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `codeexpense` varchar(20) NOT NULL,
  `amount` double NOT NULL,
  `authorized` date NOT NULL COMMENT 'date cash assigment was revised and authorized by authorizer from tabs table',
  `posted` tinyint(4) NOT NULL COMMENT 'has (or has not) been posted into gltrans',
  `notes` text NOT NULL,
  `receipt` text COMMENT 'filename or path to scanned receipt or code of receipt to find physical receipt if tax guys or auditors show up',
  PRIMARY KEY (`counterindex`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
CREATE TABLE IF NOT EXISTS `pcexpenses` (
  `codeexpense` varchar(20) NOT NULL COMMENT 'code for the group',
  `description` varchar(50) NOT NULL COMMENT 'text description, e.g. meals, train tickets, fuel, etc',
  `glaccount` int(11) NOT NULL COMMENT 'GL related account',
  PRIMARY KEY (`codeexpense`),
  KEY (`glaccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `pctabexpenses` (
  `typetabcode` varchar(20) NOT NULL,
  `codeexpense` varchar(20) NOT NULL,
  KEY (`typetabcode`),
  KEY (`codeexpense`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `pctabs` (
  `tabcode` varchar(20) NOT NULL,
  `usercode` varchar(20) NOT NULL COMMENT 'code of user employee from www_users',
  `typetabcode` varchar(20) NOT NULL,
  `currency` char(3) NOT NULL,
  `tablimit` double NOT NULL,
  `authorizer` varchar(20) NOT NULL COMMENT 'code of user from www_users',
  `glaccountassignment` int(11) NOT NULL COMMENT 'gl account where the money comes from',
  `glaccountpcash` int(11) NOT NULL,
  PRIMARY KEY (`tabcode`),
  KEY (`usercode`),
  KEY (`typetabcode`),
  KEY (`currency`),
  KEY (`authorizer`),
  KEY (`glaccountassignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `pctypetabs` (
  `typetabcode` varchar(20) NOT NULL COMMENT 'code for the type of petty cash tab',
  `typetabdescription` varchar(50) NOT NULL COMMENT 'text description, e.g. tab for CEO',
  PRIMARY KEY (`typetabcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `supptrans`  ADD COLUMN `inputdate` datetime NOT NULL AFTER `duedate` ;
ALTER TABLE `debtortrans`  ADD COLUMN `inputdate` datetime NOT NULL AFTER `trandate` ;
ALTER TABLE `reportfields` CHANGE COLUMN `fieldname` `fieldname` VARCHAR(60) NOT NULL DEFAULT '';
CREATE TABLE IF NOT EXISTS `pickinglists` (
  `pickinglistno` int(11) NOT NULL DEFAULT 0,
  `orderno` int(11) NOT NULL DEFAULT 0,
  `pickinglistdate` date NOT NULL default '2023-01-01',
  `dateprinted` date NOT NULL default '2023-01-01',
  `deliverynotedate` date NOT NULL default '2023-01-01',
  PRIMARY KEY (`pickinglistno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `pickinglistdetails` (
  `pickinglistno` int(11) NOT NULL DEFAULT 0,
  `pickinglistlineno` int(11) NOT NULL DEFAULT 0,
  `orderlineno` int(11) NOT NULL DEFAULT 0,
  `qtyexpected` double NOT NULL default 0.00,
  `qtypicked` double NOT NULL default 0.00,
  PRIMARY KEY (`pickinglistno`, `pickinglistlineno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `prices` ADD `startdate` DATE NOT NULL DEFAULT '2023-01-01' , ADD `enddate` DATE NOT NULL DEFAULT '2023-01-01';
ALTER TABLE prices DROP PRIMARY KEY ,
ADD PRIMARY KEY ( `stockid` , `typeabbrev` , `currabrev` , `debtorno` , `branchcode`, `startdate` , `enddate` ) ;
ALTER TABLE purchdata ADD column minorderqty int(11) NOT NULL default 1;
ALTER TABLE stockcheckfreeze ADD COLUMN stockcheckdate date NOT NULL;
ALTER TABLE suppliers add (email varchar(55),fax varchar(25), telephone varchar(25));
ALTER TABLE `www_users` add `supplierid` varchar(10) NOT NULL DEFAULT '' AFTER `customerid`;
ALTER TABLE locations add cashsalecustomer VARCHAR(21) NOT NULL DEFAULT '';
DROP TABLE contracts;
DROP TABLE contractreqts;
DROP TABLE contractbom;
CREATE TABLE IF NOT EXISTS `contractbom` (
   contractref varchar(20) NOT NULL DEFAULT '0',
   `stockid` varchar(20) NOT NULL DEFAULT '',
  `workcentreadded` char(5) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`contractref`,`stockid`,`workcentreadded`),
  KEY `Stockid` (`stockid`),
  KEY `ContractRef` (`contractref`),
  KEY `WorkCentreAdded` (`workcentreadded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `contractreqts` (
  `contractreqid` int(11) NOT NULL AUTO_INCREMENT,
  `contractref` varchar(20) NOT NULL DEFAULT '0',
  `requirement` varchar(40) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '1',
  `costperunit` double NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`contractreqid`),
  KEY `ContractRef` (`contractref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `contracts` (
  `contractref` varchar(20) NOT NULL DEFAULT '',
  `contractdescription` text NOT NULL,
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
   `loccode` varchar(5) NOT NULL DEFAULT '',
  `status` tinyint NOT NULL DEFAULT 0,
  `categoryid` varchar(6) NOT NULL DEFAULT '',
  `orderno` int(11) NOT NULL DEFAULT '0',
  `customerref` VARCHAR( 20 ) NOT NULL DEFAULT '',
  `margin` double NOT NULL DEFAULT '1',
  `wo` int(11) NOT NULL DEFAULT '0',
  `requireddate` date NOT NULL DEFAULT '2023-01-01',
  `drawing` varchar(50) NOT NULL DEFAULT '',
  `exrate` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`contractref`),
  KEY `OrderNo` (`orderno`),
  KEY `CategoryID` (`categoryid`),
  KEY `Status` (`status`),
  KEY `WO` (`wo`),
  KEY `loccode` (`loccode`),
  KEY `DebtorNo` (`debtorno`,`branchcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `salestypes` CHANGE COLUMN `sales_type` `sales_type` VARCHAR(40) NOT NULL DEFAULT '';
CREATE TABLE IF NOT EXISTS `offers` (
  offerid int(11) NOT NULL AUTO_INCREMENT,
  tenderid int(11) NOT NULL DEFAULT 0,
  supplierid varchar(10) NOT NULL DEFAULT '',
  stockid varchar(20) NOT NULL DEFAULT '',
  quantity double NOT NULL DEFAULT 0.0,
  uom varchar(15) NOT NULL DEFAULT '',
  price double NOT NULL DEFAULT 0.0,
  expirydate date NOT NULL DEFAULT '2023-01-01',
  currcode char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`offerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `emailsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(30) NOT NULL,
  `port` char(5) NOT NULL,
  `heloaddress` varchar(20) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `timeout` int(11) DEFAULT '5',
  `companyname` varchar(50) DEFAULT NULL,
  `auth` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `salesorderdetails` ADD COLUMN `commissionrate` double NOT NULL DEFAULT 0.0;
ALTER TABLE `salesorderdetails` ADD COLUMN `commissionearned` double NOT NULL DEFAULT 0.0;
CREATE TABLE `suppliertype` (
  `typeid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
ALTER TABLE `suppliers` ADD COLUMN `supptype` tinyint(4) NOT NULL DEFAULT 1 AFTER `address6`;
ALTER TABLE `loctransfers` CHANGE COLUMN `shipqty` `shipqty` double NOT NULL DEFAULT 0.0;
ALTER TABLE `www_users` CHANGE `supplierid` `supplierid` VARCHAR( 10 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '';
ALTER TABLE `orderdeliverydifferenceslog` DROP PRIMARY KEY;
ALTER TABLE `loctransfers` CHANGE COLUMN `recqty` `recqty` double NOT NULL DEFAULT 0.0;
CREATE TABLE IF NOT EXISTS `contractcharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `contractref` varchar(20) NOT NULL,
  `transtype` SMALLINT NOT NULL DEFAULT 20,
  `transno` INT NOT NULL DEFAULT 0,
  `amount` double NOT NULL DEFAULT 0,
  `narrative` TEXT NOT NULL,
  `anticipated` TINYINT NOT NULL DEFAULT 0,
  INDEX ( `contractref` , `transtype` , `transno` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `reports` ADD `col9width` INT( 3 ) NOT NULL DEFAULT '25' AFTER `col8width` ;
ALTER TABLE `reports` ADD `col10width` INT( 3 ) NOT NULL DEFAULT '25' AFTER `col9width` ;
ALTER TABLE `reports` ADD `col11width` INT( 3 ) NOT NULL DEFAULT '25' AFTER `col10width` ;
ALTER TABLE `reports` ADD `col12width` INT( 3 ) NOT NULL DEFAULT '25' AFTER `col11width` ;
ALTER TABLE `reports` ADD `col13width` INT( 3 ) NOT NULL DEFAULT '25' AFTER `col12width` ;
ALTER TABLE `reports` ADD `col14width` INT( 3 ) NOT NULL DEFAULT '25' AFTER `col13width` ;
ALTER TABLE `reports` ADD `col15width` INT( 3 ) NOT NULL DEFAULT '25' AFTER `col14width` ;
ALTER TABLE `reports` ADD `col16width` INT( 3 ) NOT NULL DEFAULT '25' AFTER `col15width` ;
ALTER TABLE `reports` ADD `col17width` INT( 3 ) NOT NULL DEFAULT '25' AFTER `col16width` ;
ALTER TABLE `reports` ADD `col18width` INT( 3 ) NOT NULL DEFAULT '25' AFTER `col17width` ;
ALTER TABLE `reports` ADD `col19width` INT( 3 ) NOT NULL DEFAULT '25' AFTER `col18width` ;
ALTER TABLE `reports` ADD `col20width` INT( 3 ) NOT NULL DEFAULT '25' AFTER `col19width` ;
ALTER TABLE `reportfields` CHANGE `fieldname` `fieldname` VARCHAR( 80) NOT NULL DEFAULT '';
ALTER TABLE `stockcatproperties` ADD `maximumvalue` DOUBLE NOT NULL DEFAULT 999999999 AFTER `defaultvalue` ,
	ADD `minimumvalue` DOUBLE NOT NULL DEFAULT -999999999,
	ADD `numericvalue` TINYINT NOT NULL DEFAULT 0 ;
CREATE TABLE IF NOT EXISTS `fixedassetcategories` (
  `categoryid` char(6) NOT NULL DEFAULT '',
  `categorydescription` char(20) NOT NULL DEFAULT '',
  `costact` int(11) NOT NULL DEFAULT '0',
  `depnact` int(11) NOT NULL DEFAULT '0',
  `disposalact` int(11) NOT NULL DEFAULT '80000',
  `accumdepnact` int(11) NOT NULL DEFAULT '0',
  defaultdepnrate double NOT NULL DEFAULT '.2',
  defaultdepntype int NOT NULL DEFAULT '1',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `fixedassets` (
  `assetid` int(11) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(30) NOT NULL DEFAULT '',
  `barcode` varchar(20) NOT NULL,
  `assetlocation` varchar(6) NOT NULL DEFAULT '',
  `cost` double NOT NULL DEFAULT '0',
  `accumdepn` double NOT NULL DEFAULT '0',
  `datepurchased` date NOT NULL DEFAULT '2023-01-01',
  `disposalproceeds` double NOT NULL DEFAULT '0',
  `assetcategoryid` varchar(6) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `longdescription` text NOT NULL,
  `depntype` int(11) NOT NULL DEFAULT '1',
  `depnrate` double NOT NULL,
  `disposaldate` date NOT NULL DEFAULT '2023-01-01',
  PRIMARY KEY (`assetid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE fixedassettrans(
	id INT( 11 ) NOT NULL AUTO_INCREMENT ,
	assetid INT( 11 ) NOT NULL ,
	transtype TINYINT( 4 ) NOT NULL ,
	transdate DATE NOT NULL,
	transno INT NOT NULL ,
	periodno SMALLINT( 6 ) NOT NULL ,
	inputdate DATE NOT NULL ,
	fixedassettranstype  varchar(8) NOT NULL ,
	amount DOUBLE NOT NULL ,
	PRIMARY KEY ( id ) ,
	INDEX ( assetid, transtype, transno ) ,
	INDEX ( inputdate ),
	INDEX (transdate)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
ALTER TABLE stockcheckfreeze CHANGE stockcheckdate stockcheckdate date NOT NULL DEFAULT '2023-01-01';
ALTER TABLE purchorderdetails ADD COLUMN assetid int NOT NULL DEFAULT 0;
DROP TABLE scripts;
CREATE TABLE IF NOT EXISTS `scripts` (
  `script` varchar(78) NOT NULL DEFAULT '',
  `pagesecurity` tinyint(11) NOT NULL DEFAULT '1',
  `description` text NOT NULL,
  PRIMARY KEY (`script`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `purchorderdetails` CHANGE `nw` `netweight` VARCHAR( 50 )  DEFAULT '';
ALTER TABLE `purchorderdetails` CHANGE `gw` `kgs` VARCHAR( 50 )  DEFAULT '';
ALTER TABLE `purchorderdetails` ADD `conversionfactor` DOUBLE NOT NULL DEFAULT '1';
ALTER TABLE `purchorderdetails` CHANGE `uom` `suppliersunit` VARCHAR( 50 );
ALTER TABLE `salesorders` ADD `poplaced` TINYINT NOT NULL DEFAULT '0',
ADD INDEX ( `poplaced` );
CREATE TABLE IF NOT EXISTS `fixedassetlocations` (
  `locationid` char(6) NOT NULL DEFAULT '',
  `locationdescription` char(20) NOT NULL DEFAULT '',
  `parentlocationid` char(6) DEFAULT '',
  PRIMARY KEY (`locationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE locations ADD cashsalebranch varchar(10) DEFAULT '';
ALTER TABLE `locations` CHANGE `cashsalecustomer` `cashsalecustomer` VARCHAR( 10 ) DEFAULT '';
ALTER TABLE `paymentmethods` ADD `usepreprintedstationery` TINYINT NOT NULL DEFAULT '0';
ALTER TABLE `purchorderdetails`
  DROP `itemno`,
  DROP `subtotal_amount`,
  DROP `package`,
  DROP `pcunit`,
  DROP `kgs`,
  DROP `cuft`,
  DROP `total_quantity`,
  DROP `netweight`,
  DROP `total_amount`;
