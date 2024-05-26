-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 05 2018 г., 07:31
-- Версия сервера: 5.6.38
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `atlantida`
--

-- --------------------------------------------------------

--
-- Структура таблицы `batches`
--

CREATE TABLE `batches` (
  `id` int(11) NOT NULL,
  `batchpm` varchar(55) NOT NULL,
  `m_operation_id` varchar(55) NOT NULL,
  `vremya` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `summa` float NOT NULL,
  `segodnya` varchar(12) NOT NULL,
  `frod` int(1) NOT NULL DEFAULT '0',
  `summa_rub` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `db_competition`
--

CREATE TABLE `db_competition` (
  `id` int(11) NOT NULL,
  `1m` double NOT NULL DEFAULT '0',
  `2m` double NOT NULL DEFAULT '0',
  `3m` double NOT NULL DEFAULT '0',
  `user_1` varchar(10) NOT NULL,
  `user_2` varchar(10) NOT NULL,
  `user_3` varchar(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `date_add` int(11) NOT NULL DEFAULT '0',
  `date_end` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `db_competition_users`
--

CREATE TABLE `db_competition_users` (
  `id` int(11) NOT NULL,
  `user` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `points` double NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `db_payeer_insert`
--

CREATE TABLE `db_payeer_insert` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sum` double NOT NULL DEFAULT '0',
  `date_add` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `db_video`
--

CREATE TABLE `db_video` (
  `id` int(11) NOT NULL,
  `user` char(10) NOT NULL,
  `iduser` int(11) NOT NULL,
  `comment` text CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `curatorid` int(11) NOT NULL,
  `summa` double(10,2) NOT NULL,
  `psumma` decimal(10,2) NOT NULL,
  `unixtime` bigint(20) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `fake` int(1) NOT NULL,
  `kol` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `summa` float NOT NULL,
  `description` text NOT NULL,
  `comment` text NOT NULL,
  `type` int(11) NOT NULL COMMENT '0 - нейтрально (отладка), 1 - положительное действие (green), 2 - отрицательное (red)',
  `status` int(1) NOT NULL DEFAULT '0',
  `timeunix` int(22) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pay`
--

CREATE TABLE `pay` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `data` int(11) DEFAULT NULL,
  `summa` double(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `php_chat`
--

CREATE TABLE `php_chat` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `mes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ss_users`
--

CREATE TABLE `ss_users` (
  `id` int(11) NOT NULL,
  `user` varchar(15) NOT NULL DEFAULT 'Anonim',
  `wallet` varchar(15) NOT NULL,
  `curator` int(11) NOT NULL,
  `i_have_refs_as_curator` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL COMMENT 'IP пользователя при регистрации',
  `last_ip` varchar(15) NOT NULL COMMENT 'IP пользователя при последнем входе в аккаунт',
  `came` varchar(50) NOT NULL COMMENT 'Откуда пришел',
  `act_1` int(1) NOT NULL DEFAULT '0',
  `reg_unix` bigint(20) NOT NULL,
  `avatar` varchar(255) DEFAULT 'no.png',
  `cursum` decimal(10,2) NOT NULL,
  `psum` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Таблица юзеров';

-- --------------------------------------------------------

--
-- Структура таблицы `userstat`
--

CREATE TABLE `userstat` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `opisanie` text NOT NULL,
  `color` varchar(50) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `summa` float DEFAULT NULL,
  `comment` varchar(33) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `db_competition`
--
ALTER TABLE `db_competition`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `db_competition_users`
--
ALTER TABLE `db_competition_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `db_payeer_insert`
--
ALTER TABLE `db_payeer_insert`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `db_video`
--
ALTER TABLE `db_video`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pay`
--
ALTER TABLE `pay`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `php_chat`
--
ALTER TABLE `php_chat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `ss_users`
--
ALTER TABLE `ss_users`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `ss_users` ADD FULLTEXT KEY `came` (`came`);

--
-- Индексы таблицы `userstat`
--
ALTER TABLE `userstat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `batches`
--
ALTER TABLE `batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `db_competition`
--
ALTER TABLE `db_competition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `db_competition_users`
--
ALTER TABLE `db_competition_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `db_payeer_insert`
--
ALTER TABLE `db_payeer_insert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `db_video`
--
ALTER TABLE `db_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pay`
--
ALTER TABLE `pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `php_chat`
--
ALTER TABLE `php_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ss_users`
--
ALTER TABLE `ss_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `userstat`
--
ALTER TABLE `userstat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
