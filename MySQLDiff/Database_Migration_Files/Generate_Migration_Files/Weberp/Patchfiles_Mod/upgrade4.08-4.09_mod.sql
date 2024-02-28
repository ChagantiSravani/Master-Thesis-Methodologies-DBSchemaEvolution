CREATE TABLE IF NOT EXISTS `internalstockcatrole` (
  `categoryid` varchar(6) NOT NULL,
  `secroleid` int(11) NOT NULL,
  KEY `internalstockcatrole_ibfk_1` (`categoryid`),
  KEY `internalstockcatrole_ibfk_2` (`secroleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE  `locations` ADD  `internalrequest` TINYINT( 4 ) NOT NULL DEFAULT  '1' COMMENT  'Allow (1) or not (0) internal request from this location';
ALTER TABLE  `loctransfers` CHANGE  `shipdate`  `shipdate` DATETIME NOT NULL DEFAULT  '2023-01-01 00:00:00';
ALTER TABLE  `loctransfers` CHANGE  `recdate`  `recdate` DATETIME NOT NULL DEFAULT  '2023-01-01 00:00:00';
ALTER TABLE  `www_users` ADD  `department` INT( 11 ) NOT NULL DEFAULT  '0';
ALTER TABLE `suppliers` CHANGE `address6` `address6` VARCHAR( 40 ) NOT NULL DEFAULT '';
ALTER TABLE `custbranch` CHANGE `braddress6` `braddress6` VARCHAR( 40 ) NOT NULL DEFAULT '';
ALTER TABLE `debtorsmaster` CHANGE `address6` `address6` VARCHAR( 40 ) NOT NULL DEFAULT '';
ALTER TABLE `stockrequest` ADD INDEX (`loccode`);
ALTER TABLE `stockrequest` ADD INDEX (`departmentid`);
ALTER TABLE `stockrequestitems` ADD PRIMARY KEY ( `dispatchitemsid` );
ALTER TABLE `stockrequestitems` ADD INDEX ( `dispatchid` );
ALTER TABLE `stockrequestitems` ADD INDEX ( `stockid` );
ALTER TABLE `internalstockcatrole` ADD PRIMARY KEY ( `categoryid` , `secroleid` );
