-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 20-Dez-2017 às 18:32
-- Versão do servidor: 10.1.8-MariaDB
-- PHP Version: 5.6.14

-- DB_LANORA VERSION : 1.1

CREATE TABLE IF NOT EXISTS `ci_client_sessions` (
        `id` varchar(128) NOT NULL,
        `ip_address` varchar(45) NOT NULL,
        `timestamp` int(10) unsigned DEFAULT 0 NOT NULL,
        `data` blob NOT NULL,
        KEY `ci_sessions_timestamp` (`timestamp`)
);

ALTER TABLE `clientes` ADD (
		`email` varchar(80) NOT NULL,
		`senha` varchar(45) NOT NULL
);


