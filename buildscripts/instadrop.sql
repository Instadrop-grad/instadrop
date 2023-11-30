CREATE DATABASE IF NOT EXISTS `drop`;
CREATE USER IF NOT EXISTS 'instadrop' WITH PASSWORD 'instadrop';
GRANT ALL PRIVILEGES ON `drop`.* TO 'instadrop';
FLUSH PRIVILEGES;
USE `drop`;

CREATE TABLE IF NOT EXISTS `object` (
    `id`        VARCHAR(766) NOT NULL,
    `name`      VARCHAR(766) NOT NULL,
    `directory` TEXT NOT NULL,
    `meta`      LONGBLOB,
    PRIMARY KEY (`id`, `name`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
