-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: db_mysql
-- Время создания: Окт 10 2024 г., 12:59
-- Версия сервера: 8.0.39
-- Версия PHP: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `emails`
--

-- --------------------------------------------------------

--
-- Структура таблицы `token_info`
--

CREATE TABLE `token_info` (
  `id_token` varchar(36) NOT NULL,
  `id_user` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `token_info`
--

INSERT INTO `token_info` (`id_token`, `id_user`) VALUES
('7b8799ae-9413-46eb-8513-a02815e099b6', '964b5872-dc2a-4f0e-b3f1-b37cc8a40774'),
('d72b0ff3-8b00-4b14-8770-39c17b94b13f', '964b5872-dc2a-4f0e-b3f1-b37cc8a40774'),
('33c0c306-6a18-459a-88e9-1ee05cc5bc35', 'b70dcd9b-0fef-47f3-beab-ff0d51646fb5'),
('3403e341-2e4f-4f9a-aace-5ddb20428cad', 'b70dcd9b-0fef-47f3-beab-ff0d51646fb5'),
('840cdfe1-2e62-4e94-b6d1-01b3ab02bbf3', 'b70dcd9b-0fef-47f3-beab-ff0d51646fb5');

-- --------------------------------------------------------

--
-- Структура таблицы `user_info`
--

CREATE TABLE `user_info` (
  `id_user` varchar(36) NOT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user_info`
--

INSERT INTO `user_info` (`id_user`, `email`) VALUES
('964b5872-dc2a-4f0e-b3f1-b37cc8a40774', 'bookingtesting73@gmail.com'),
('b70dcd9b-0fef-47f3-beab-ff0d51646fb5', 'ihor.kuzubov@gmail.com');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `token_info`
--
ALTER TABLE `token_info`
  ADD PRIMARY KEY (`id_token`),
  ADD KEY `fk_token_info_user_info` (`id_user`);

--
-- Индексы таблицы `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id_user`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `token_info`
--
ALTER TABLE `token_info`
  ADD CONSTRAINT `fk_token_info_user_info` FOREIGN KEY (`id_user`) REFERENCES `user_info` (`id_user`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
