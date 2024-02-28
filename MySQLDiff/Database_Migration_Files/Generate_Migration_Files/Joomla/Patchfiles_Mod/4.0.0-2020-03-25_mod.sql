ALTER TABLE `#__extensions` MODIFY `protected` tinyint NOT NULL DEFAULT 0 COMMENT 'Flag to indicate if the extension is protected. Protected extensions cannot be disabled.';
ALTER TABLE `#__extensions` ADD COLUMN `locked` tinyint NOT NULL DEFAULT 0 COMMENT 'Flag to indicate if the extension is locked. Locked extensions cannot be uninstalled.' ;
