ALTER TABLE `suppliers` ADD COLUMN `url` varchar(50) NOT NULL DEFAULT '';
ALTER table locstock change bin bin varchar(10) NOT NULL DEFAULT '';
CREATE TABLE IF NOT EXISTS `bankaccountusers` (
  `accountcode` varchar(20) NOT NULL COMMENT 'Bank account code',
  `userid` varchar(20) NOT NULL COMMENT 'User code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
