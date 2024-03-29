CREATE TABLE IF NOT EXISTS `#__webauthn_credentials` (
    `id`         VARCHAR(1000)   NOT NULL COMMENT 'Credential ID',
    `user_id`    VARCHAR(128)    NOT NULL COMMENT 'User handle',
    `label`      VARCHAR(190)    NOT NULL COMMENT 'Human readable label',
    `credential` MEDIUMTEXT      NOT NULL COMMENT 'Credential source data, JSON format',
    PRIMARY KEY (`id`(100)),
    INDEX (`user_id`(60))
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
