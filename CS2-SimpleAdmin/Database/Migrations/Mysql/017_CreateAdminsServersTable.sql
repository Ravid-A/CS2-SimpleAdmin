CREATE TABLE IF NOT EXISTS `sa_admins_servers` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `admin_id` int(11) NOT NULL,
 `server_id` int(11) NOT NULL,
 PRIMARY KEY (`id`),
 FOREIGN KEY (`admin_id`) REFERENCES `sa_admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `sa_admins` ADD `global` TINYINT(1) NOT NULL DEFAULT 0;

INSERT INTO `sa_admins_servers` (`admin_id`, `server_id`)
SELECT `id`, `server_id` FROM `sa_admins` WHERE `server_id` IS NOT NULL;

UPDATE `sa_admins` SET `global` = 1 WHERE `server_id` IS NULL;

ALTER TABLE `sa_admins` DROP COLUMN `server_id`;
