ALTER TABLE `suppliers` ADD COLUMN `defaultgl` VARCHAR(20) NOT NULL DEFAULT '1' AFTER `url`;
ALTER TABLE `suppliers` ADD COLUMN `defaultshipper` INT(11) NOT NULL DEFAULT '0' AFTER `url`;
ALTER TABLE `stockmaster` DROP COLUMN `appendfile`;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `surname` varchar(20) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `stockid` varchar(20) NOT NULL COMMENT 'FK with stockmaster',
  `manager` int(11) COMMENT 'an employee also in this table',
  `normalhours` double NOT NULL DEFAULT '40',
  `userid` varchar(20) NOT NULL DEFAULT '' COMMENT 'loose FK with www-users will have some employees who are not users',
  `email` varchar(55) NOT NULL DEFAULT '',
  KEY `surname` (`surname`),
  KEY `firstname` (`firstname`),
  KEY `stockid` (`stockid`),
  KEY `manager` (`manager`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `timesheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `wo` int(11) NOT NULL COMMENT 'loose FK with workorders',
  `employeeid` INT NOT NULL,
  `weekending` DATE NOT NULL DEFAULT '1900-01-01',
  `workcentre` varchar(5) NOT NULL COMMENT 'loose FK with workcentres',
  `day1` double NOT NULL default 0,
  `day2` double NOT NULL default 0,
  `day3` double NOT NULL default 0,
  `day4` double NOT NULL default 0,
  `day5` double NOT NULL default 0,
  `day6` double NOT NULL default 0,
  `day7` double NOT NULL default 0,
  `status` tinyint(4) NOT NULL default 0 COMMENT '0=entered 1=submitted 2=approved',
  KEY `workcentre` (`workcentre`),
  KEY `employees` (`employeeid`),
  KEY `wo` (`wo`),
  KEY `weekending` (`weekending`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE audittrail CHANGE `transactiondate` `transactiondate` datetime NOT NULL DEFAULT '1000-01-01 00:00:00';
ALTER TABLE banktrans CHANGE `transdate` `transdate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE bom CHANGE `effectiveafter` `effectiveafter`  date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE contracts CHANGE `requireddate` `requireddate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE custallocns CHANGE `datealloc` `datealloc` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE custnotes CHANGE `date` `date` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE debtorsmaster CHANGE `clientsince` `clientsince` datetime NOT NULL DEFAULT '1000-01-01 00:00:00';
ALTER TABLE debtortrans CHANGE `trandate` `trandate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE debtortypenotes CHANGE `date` `date` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE deliverynotes   CHANGE `deliverydate` `deliverydate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE fixedassets CHANGE `datepurchased` `datepurchased` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE fixedassets CHANGE `disposaldate` `disposaldate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE gltrans CHANGE `trandate` `trandate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE grns CHANGE `deliverydate` `deliverydate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE loctransfers CHANGE `shipdate` `shipdate` datetime NOT NULL DEFAULT '1000-01-01 00:00:00';
ALTER TABLE loctransfers CHANGE `recdate` `recdate` datetime NOT NULL DEFAULT '1000-01-01 00:00:00';
ALTER TABLE mrpdemands CHANGE `duedate` `duedate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE offers CHANGE `expirydate` `expirydate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE periods CHANGE `lastdate_in_period` `lastdate_in_period` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE pickinglists CHANGE `pickinglistdate` `pickinglistdate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE pickinglists CHANGE `dateprinted` `dateprinted` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE pickinglists CHANGE `deliverynotedate` `deliverynotedate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE pickreq CHANGE `initdate` `initdate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE pickreq CHANGE `requestdate` `requestdate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE pickreq CHANGE `shipdate` `shipdate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE pricematrix CHANGE `startdate` `startdate`  date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE prices CHANGE `startdate` `startdate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE purchorderdetails CHANGE `deliverydate` `deliverydate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE purchorders CHANGE `orddate` `orddate` datetime NOT NULL DEFAULT '1000-01-01 00:00:00';
ALTER TABLE purchorders CHANGE `revised` `revised` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE purchorders CHANGE `deliverydate` `deliverydate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE qasamples CHANGE `sampledate` `sampledate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE recurringsalesorders CHANGE `orddate` `orddate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE recurringsalesorders CHANGE `lastrecurrence` `lastrecurrence` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE recurringsalesorders CHANGE `stopdate` `stopdate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE salesorderdetails CHANGE `actualdispatchdate` `actualdispatchdate` datetime NOT NULL DEFAULT '1000-01-01 00:00:00';
ALTER TABLE salesorders CHANGE `orddate` `orddate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE salesorders CHANGE `deliverydate` `deliverydate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE salesorders CHANGE `confirmeddate` `confirmeddate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE salesorders CHANGE `datepackingslipprinted` `datepackingslipprinted` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE salesorders CHANGE `quotedate` `quotedate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE sampleresults CHANGE `testdate` `testdate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE shipments CHANGE `eta` `eta` datetime NOT NULL DEFAULT '1000-01-01 00:00:00';
ALTER TABLE stockcheckfreeze CHANGE `stockcheckdate` `stockcheckdate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE stockmaster CHANGE `lastcostupdate` `lastcostupdate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE stockmoves CHANGE `trandate` `trandate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE stockrequest CHANGE `despatchdate` `despatchdate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE stockserialitems CHANGE `expirationdate` `expirationdate` datetime NOT NULL DEFAULT '1000-01-01 00:00:00';
ALTER TABLE suppallocs CHANGE `datealloc` `datealloc` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE suppliers CHANGE `suppliersince` `suppliersince` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE supptrans CHANGE `trandate` `trandate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE supptrans CHANGE `duedate` `duedate` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE tenders CHANGE `requiredbydate` `requiredbydate` datetime NOT NULL DEFAULT '1000-01-01 00:00:00';
ALTER TABLE workorders CHANGE `requiredby` `requiredby` date NOT NULL DEFAULT '1000-01-01';
ALTER TABLE workorders CHANGE `startdate` `startdate` date NOT NULL DEFAULT '1000-01-01';
CREATE TABLE `jnltmplheader` (
  `templateid` INT(11) NOT NULL DEFAULT 0,
  `templatedescription` VARCHAR(50) NOT NULL DEFAULT '',
  `journaltype` INT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`templateid`)
);
CREATE TABLE `jnltmpldetails` (
  `linenumber` INT(11) NOT NULL DEFAULT 0,
  `templateid` INT(11) NOT NULL DEFAULT 0,
  `tags` VARCHAR(50) NOT NULL DEFAULT '0',
  `accountcode` VARCHAR(20) NOT NULL DEFAULT '1',
  `amount` DOUBLE NOT NULL DEFAULT 0,
  `narrative` VARCHAR(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`templateid`, `linenumber`)
);
