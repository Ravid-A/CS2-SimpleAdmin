CREATE TABLE IF NOT EXISTS `sa_admins_servers` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `admin_id` INTEGER NOT NULL,
    `server_id` INTEGER NOT NULL,
    FOREIGN KEY (`admin_id`) REFERENCES `sa_admins` (`id`) ON DELETE CASCADE
);

ALTER TABLE `sa_admins` ADD `global` INTEGER NOT NULL DEFAULT 0;

INSERT INTO `sa_admins_servers` (`admin_id`, `server_id`)
SELECT `id`, `server_id` FROM `sa_admins` WHERE `server_id` IS NOT NULL;

UPDATE `sa_admins` SET `global` = 1 WHERE `server_id` IS NULL;

ALTER TABLE `sa_admins` DROP COLUMN `server_id`;
