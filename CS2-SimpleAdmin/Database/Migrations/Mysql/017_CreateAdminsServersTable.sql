CREATE TABLE IF NOT EXISTS `sa_admins_servers` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `admin_id` int(11) NOT NULL,
 `server_id` int(11) NULL,
 PRIMARY KEY (`id`),
 FOREIGN KEY (`admin_id`) REFERENCES `sa_admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `sa_admins_servers` (`admin_id`, `server_id`)
SELECT `id`, `server_id` FROM `sa_admins` WHERE `server_id` IS NOT NULL;
