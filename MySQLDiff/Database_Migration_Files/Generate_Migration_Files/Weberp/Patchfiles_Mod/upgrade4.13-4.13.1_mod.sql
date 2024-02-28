ALTER TABLE `debtortrans` CHANGE `trandate` `trandate` DATE NOT NULL DEFAULT '2023-01-01';
ALTER TABLE `salesanalysis` CHANGE `salesperson` `salesperson` VARCHAR(4) DEFAULT '' NOT NULL;
ALTER TABLE `stockrequest` ADD `initiator` VARCHAR(20) NOT NULL DEFAULT '';
ALTER TABLE `workorders` ADD `reference` VARCHAR(40) NOT NULL DEFAULT '';
ALTER TABLE `workorders` ADD `remark` TEXT DEFAULT NULL;
ALTER TABLE `chartmaster` ADD `cashflowsactivity` TINYINT(1) NOT NULL DEFAULT '-1' COMMENT 'Cash flows activity' AFTER `group_`;
