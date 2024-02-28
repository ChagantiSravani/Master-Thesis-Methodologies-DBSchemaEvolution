ALTER TABLE `#__fields` ADD COLUMN `only_use_in_subform` tinyint NOT NULL DEFAULT 0 ;
ALTER TABLE `#__mail_templates` ADD COLUMN `extension` varchar(127) NOT NULL DEFAULT '' AFTER `template_id` ;
