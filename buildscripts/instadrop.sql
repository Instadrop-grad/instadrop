CREATE DATABASE IF NOT EXISTS `drop`;
CREATE USER IF NOT EXISTS 'instadrop' WITH PASSWORD 'instadrop';
GRANT ALL PRIVILEGES ON `drop`.* TO 'instadrop';
FLUSH PRIVILEGES;
USE `drop`;

CREATE TABLE IF NOT EXISTS `object` (
    `object_id`         VARCHAR(766) NOT NULL,
    `file_name`         VARCHAR(766) NOT NULL,
    `start_offset`      VARCHAR(200) NOT NULL,
    `object_size`       VARCHAR(787) NOT NULL,
    `meta`              LONGBLOB,
    PRIMARY KEY (`object_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `object_mapping` (
    `object_name`       VARCHAR(766) NOT NULL,
    `bucket_id`         VARCHAR(766) NOT NULL,
    `object_id`         VARCHAR(766) NOT NULL,
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `bucket` (
    `bucket_name`       VARCHAR(766) NOT NULL,
    `bucket_id`         VARCHAR(766) NOT NULL,
    `ACL`               LONGBLOB,
    `meta`              LONGBLOB,
    PRIMARY KEY (`bucket_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;