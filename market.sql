-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Фев 15 2026 г., 07:47
-- Версия сервера: 8.0.43
-- Версия PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `market`
--

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `product_description` text,
  `product_price` decimal(10,2) NOT NULL,
  `product_image_path` varchar(500) DEFAULT NULL,
  `adminId` int NOT NULL,
  `product_create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `product_update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `RoleId` int NOT NULL,
  `RoleName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`RoleId`, `RoleName`) VALUES
(1, 'Пользователь'),
(2, 'Админ');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `UserId` int NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `UserSurname` varchar(50) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `UserPassword` varchar(200) NOT NULL,
  `RegDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserRole` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`UserId`, `UserName`, `UserSurname`, `UserEmail`, `UserPassword`, `RegDate`, `UserRole`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', '$2y$10$g2pzUAZgq4EJeF0hhV87Q.K15nC3k4YG5yyQbpRJTAAMGd0iHvujy', '2026-02-08 11:08:46', 1),
(2, 'admin', 'adminovich', 'admin@adminovich.com', '$2y$10$iwSIsM/Q8N5zgROfLCHk/.IqgAlvV0aTlfUUDjnrNUVvKe9WYj.Be', '2026-02-08 11:09:16', 1),
(3, 'rodya', 'rodya', 'rodya@rodya.com', '$2y$10$Rt4X.qVi8NiL3JYTIhhogujNFz5UsZzxV8NuXisnC/BUckHaeb4k2', '2026-02-08 11:10:52', 2),
(4, 'fast', 'fast', 'fast@gmail.com', '$2y$10$thswklLlH4uc/bdc8TB69.5C1.Pb7a5hVXK.kQCNroM9Cg4WwK41.', '2026-02-08 11:59:07', 1),
(5, 'defla', 'admin', 'dadmin@admin.com', '$2y$10$UpImUxbtqDKY65n1ZKwxref7iC/mz4ZpSC0Ps7GMbUrpp9IAwgnPe', '2026-02-15 10:07:50', 1),
(6, 'admin', 'admin', 'adm1@a.com', '$2y$10$q1fNMaI9K3udhFIxTY0MJ.hBcmntRACYb0RG1Ftl2CRqOl.1kbbKG', '2026-02-15 11:21:28', 1),
(7, 'a', 'a', 'a@a.com', '$2y$10$IKDeS3AIrl71nFvrREJsEe5iSXxMubFgJzbuopYoHYiMi2LL5YqCq', '2026-02-15 11:26:20', 2);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `users_role`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `users_role` (
`RegDate` datetime
,`RoleId` int
,`RoleName` varchar(20)
,`UserEmail` varchar(100)
,`UserId` int
,`UserName` varchar(50)
,`UserPassword` varchar(200)
,`UserSurname` varchar(50)
);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `adminId` (`adminId`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleId`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `UserEmail` (`UserEmail`),
  ADD KEY `fk_users_role` (`UserRole`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `RoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

-- --------------------------------------------------------

--
-- Структура для представления `users_role`
--
DROP TABLE IF EXISTS `users_role`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `users_role`  AS SELECT `u`.`UserId` AS `UserId`, `u`.`UserName` AS `UserName`, `u`.`UserSurname` AS `UserSurname`, `u`.`UserEmail` AS `UserEmail`, `u`.`UserPassword` AS `UserPassword`, `u`.`RegDate` AS `RegDate`, `r`.`RoleName` AS `RoleName`, `r`.`RoleId` AS `RoleId` FROM (`users` `u` join `role` `r` on((`u`.`UserRole` = `r`.`RoleId`))) ;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `users` (`UserId`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_role` FOREIGN KEY (`UserRole`) REFERENCES `role` (`RoleId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
