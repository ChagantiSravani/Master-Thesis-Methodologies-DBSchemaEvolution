ALTER TABLE stockmaster DROP lastcurcostdate;
ALTER TABLE stockmaster ADD lastcostupdate DATE NOT NULL;
ALTER TABLE `banktrans` ADD INDEX ( `ref` );
ALTER TABLE  `pcexpenses` ADD  `tag` TINYINT( 4 ) NOT NULL DEFAULT  '0';
