ALTER TABLE `woitems` ADD `comments` LONGBLOB NULL DEFAULT NULL ;
ALTER TABLE  `www_users` CHANGE  `modulesallowed`  `modulesallowed` VARCHAR( 25 ) NOT NULL;
CREATE TABLE `custitem` (
  `debtorno` char(10) NOT NULL DEFAULT '',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `cust_part` varchar(20) NOT NULL DEFAULT '',
  `cust_description` varchar(30) NOT NULL DEFAULT '',
  `customersuom` char(50) NOT NULL DEFAULT '',
  `conversionfactor` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`debtorno`,`stockid`),
  KEY `StockID` (`stockid`),
  KEY `Debtorno` (`debtorno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER table pricematrix ADD column currabrev char(3) NOT NULL DEFAULT '';
ALTER table pricematrix ADD column startdate date NOT NULL DEFAULT '2023-01-01';
ALTER table pricematrix ADD column enddate date NOT NULL DEFAULT '9999-12-31';
ALTER table pricematrix DROP PRIMARY KEY;
ALTER table pricematrix ADD PRIMARY KEY (`salestype`,`stockid`,`currabrev`,`quantitybreak`,`startdate`,`enddate`);
ALTER TABLE  `debtortrans` CHANGE  `consignment`  `consignment` VARCHAR( 20 ) NOT NULL DEFAULT  '';
ALTER TABLE `workorders` ADD `closecomments` LONGBLOB NULL DEFAULT NULL ;
CREATE TABLE IF NOT EXISTS `relateditems` (
  `stockid` varchar(20) CHARACTER SET utf8 NOT NULL,
  `related` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`stockid`,`related`),
  UNIQUE KEY `Related` (`related`,`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER table purchorders MODIFY tel varchar(30) NOT NULL DEFAULT '';
CREATE TABLE IF NOT EXISTS `locationusers` (
  `loccode` varchar(5) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `canview` tinyint(4) NOT NULL DEFAULT '0',
  `canupd` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loccode`,`userid`),
  KEY `UserId` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE  `locations` ADD  `usedforwo` TINYINT( 4 ) NOT NULL DEFAULT  '1' AFTER  `internalrequest`;
ALTER TABLE  `bankaccounts` ADD  `importformat` VARCHAR( 10 ) NOT NULL DEFAULT  '';
ALTER TABLE  `audittrail` ADD INDEX (  `transactiondate` );
ALTER TABLE stockmoves MODIFY price DECIMAL(21,5) NOT NULL DEFAULT '0.00000';
ALTER TABLE  `stockmoves` ADD  `userid` VARCHAR( 20 ) NOT NULL , ADD INDEX (  `userid` ) ;
