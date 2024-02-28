ALTER TABLE `stockcategory` ADD `issueglact` int(11) NOT NULL DEFAULT 0 AFTER `adjglact`;
CREATE TABLE departments (
`departmentid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`description` VARCHAR (100) NOT NULL DEFAULT '',
`authoriser` varchar (20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE stockrequest (
`dispatchid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`loccode` VARCHAR (5) NOT NULL DEFAULT '',
`departmentid` INT NOT NULL DEFAULT 0,
`despatchdate` DATE NOT NULL DEFAULT '2023-01-01',
`authorised` TINYINT NOT NULL DEFAULT 0,
`closed` TINYINT NOT NULL DEFAULT 0,
`narrative` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE stockrequestitems (
`dispatchitemsid` INT NOT NULL DEFAULT 0,
`dispatchid` INT NOT NULL DEFAULT 0,
`stockid` VARCHAR (20) NOT NULL DEFAULT '',
`quantity` DOUBLE NOT NULL DEFAULT 0,
`qtydelivered` DOUBLE NOT NULL DEFAULT 0,
`decimalplaces` INT(11) NOT NULL DEFAULT 0,
`uom` VARCHAR(20) NOT NULL DEFAULT '',
`completed` TINYINT NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `labels` (
  `labelid` tinyint(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `papersize` varchar(20) NOT NULL,
  `height` tinyint(11) NOT NULL,
  `width` tinyint(11) NOT NULL,
  `topmargin` tinyint(11) NOT NULL,
  `leftmargin` tinyint(11) NOT NULL,
  `rowheight` tinyint(11) NOT NULL,
  `columnwidth` tinyint(11) NOT NULL,
  PRIMARY KEY (`labelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
CREATE TABLE IF NOT EXISTS `labelfields` (
  `labelfieldid` int(11) NOT NULL AUTO_INCREMENT,
  `labelid` tinyint(4) NOT NULL,
  `fieldvalue` varchar(20) CHARACTER SET utf8 NOT NULL,
  `vpos` tinyint(4) NOT NULL,
  `hpos` tinyint(4) NOT NULL,
  `fontsize` tinyint(4) NOT NULL,
  `barcode` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`labelfieldid`),
  KEY `labelid` (`labelid`),
  KEY `vpos` (`vpos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
ALTER TABLE `locations` ADD UNIQUE `locationname` (`locationname`);
ALTER TABLE `stockmaster` CHANGE `lastcostupdate` `lastcostupdate` DATE NOT NULL DEFAULT '2023-01-01';
ALTER TABLE `labels` CHANGE `papersize` `pagewidth` DOUBLE NOT NULL DEFAULT '0';
ALTER TABLE `labels` ADD `pageheight` DOUBLE NOT NULL DEFAULT '0' AFTER `pagewidth`;
ALTER TABLE `labels` CHANGE `height` `height` DOUBLE NOT NULL DEFAULT '0';
ALTER TABLE `labels` CHANGE `width` `width` DOUBLE NOT NULL DEFAULT '0';
ALTER TABLE `labels` CHANGE `topmargin` `topmargin` DOUBLE NOT NULL DEFAULT '0';
ALTER TABLE `labels` CHANGE `leftmargin` `leftmargin` DOUBLE NOT NULL DEFAULT '0';
ALTER TABLE `labels` CHANGE `rowheight` `rowheight` DOUBLE NOT NULL DEFAULT '0';
ALTER TABLE `labels` CHANGE `columnwidth` `columnwidth` DOUBLE NOT NULL DEFAULT '0';
ALTER TABLE `labelfields` CHANGE `vpos` `vpos` DOUBLE NOT NULL DEFAULT '0';
ALTER TABLE `labelfields` CHANGE `hpos` `hpos` DOUBLE NOT NULL DEFAULT '0';
ALTER TABLE paymentmethods ADD opencashdrawer tinyint NOT NULL default '0';
ALTER TABLE bankaccounts MODIFY column accountcode varchar(20) NOT NULL default '0';
ALTER TABLE banktrans MODIFY column bankact varchar(20) NOT NULL default '0';
ALTER TABLE chartdetails DROP PRIMARY KEY;
ALTER TABLE chartdetails MODIFY column accountcode varchar(20) NOT NULL default '0';
ALTER TABLE chartdetails ADD PRIMARY KEY (accountcode,period);
ALTER TABLE gltrans MODIFY column account varchar(20) NOT NULL default '0';
ALTER TABLE pcexpenses MODIFY column glaccount varchar(20) NOT NULL DEFAULT '0';
ALTER TABLE pctabs MODIFY column glaccountassignment varchar(20) NOT NULL DEFAULT '0';
ALTER TABLE taxauthorities MODIFY column taxglcode varchar(20) NOT NULL DEFAULT '0';
ALTER TABLE taxauthorities MODIFY column purchtaxglaccount varchar(20) NOT NULL DEFAULT '0';
ALTER TABLE chartmaster MODIFY column accountcode varchar(20) NOT NULL DEFAULT '0';
ALTER TABLE pctabs MODIFY column glaccountpcash varchar(20) NOT NULL DEFAULT '0';
