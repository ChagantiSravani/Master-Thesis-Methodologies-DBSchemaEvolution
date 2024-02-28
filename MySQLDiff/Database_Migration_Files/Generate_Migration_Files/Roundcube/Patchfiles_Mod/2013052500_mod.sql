CREATE TABLE `cache_shared` (
 `cache_key` varchar(255)  NOT NULL,
 `created` datetime NOT NULL ,
 `data` longtext NOT NULL,
 INDEX `created_index` (`created`),
 INDEX `cache_key_index` (`cache_key`)
)  ;
