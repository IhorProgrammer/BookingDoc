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
-- База данных: `booking`
--

-- --------------------------------------------------------

--
-- Структура таблицы `amenities`
--

CREATE TABLE `amenities` (
  `amenities_id` int NOT NULL,
  `amenities_name` varchar(50) DEFAULT NULL,
  `language_code` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `aminities_apartments`
--

CREATE TABLE `aminities_apartments` (
  `id` int NOT NULL,
  `aminities_id` int NOT NULL,
  `apartment_id` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `apartments`
--

CREATE TABLE `apartments` (
  `apartments_id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `city_id` int NOT NULL,
  `zipcode` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `client_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `apartments_info`
--

CREATE TABLE `apartments_info` (
  `apartments_id` varchar(32) NOT NULL,
  `smoking` tinyint(1) NOT NULL,
  `animals` tinyint(1) NOT NULL,
  `events` tinyint(1) NOT NULL,
  `check_in_from` datetime NOT NULL,
  `check_in_to` datetime NOT NULL,
  `departure_from` datetime NOT NULL,
  `departure_to` datetime NOT NULL,
  `reservation_auto` tinyint(1) NOT NULL,
  `return_money` tinyint(1) NOT NULL,
  `monthly_payment` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `armored`
--

CREATE TABLE `armored` (
  `id` varchar(32) DEFAULT NULL,
  `check-in` date NOT NULL,
  `check-out` date NOT NULL,
  `cost` double NOT NULL,
  `rooms_id` varchar(32) DEFAULT NULL,
  `payment_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `beds`
--

CREATE TABLE `beds` (
  `id` int NOT NULL,
  `room_id` varchar(32) NOT NULL,
  `quantity` int NOT NULL,
  `bed_type_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `bed_type`
--

CREATE TABLE `bed_type` (
  `id` int NOT NULL,
  `bed_type_name` varchar(50) NOT NULL,
  `language_code` int NOT NULL,
  `icon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `id` int NOT NULL,
  `cities_name` varchar(100) NOT NULL,
  `country_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `client_data`
--

CREATE TABLE `client_data` (
  `id` varchar(36) NOT NULL,
  `gmail_id` varchar(24) DEFAULT NULL,
  `avatar` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `given_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `family_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nickname` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `citizenship` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `salt` varchar(32) NOT NULL,
  `derived_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pasport_id` varchar(36) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `client_data`
--

INSERT INTO `client_data` (`id`, `gmail_id`, `avatar`, `given_name`, `family_name`, `nickname`, `email`, `phone`, `birthday`, `gender`, `citizenship`, `salt`, `derived_key`, `pasport_id`, `is_verified`, `balance`) VALUES
('964b5872-dc2a-4f0e-b3f1-b37cc8a40774', '110887466608559061061', 'https://lh3.googleusercontent.com/a/ACg8ocJriNf-MphpAmDYNeXcPwcB7ZuRfIbzujyoXzsHwh8dvtdghQ=s96-c', 'Booking', 'Testing', 'bookingtesting73@gmail.com', 'bookingtesting73@gmail.com', '', NULL, NULL, '', 'F61C2EAEFF9CC7664A33F865B23FC086', '9F94826F70E9A5CF660FAB7DF808B00B', NULL, 0, 0.00),
('b70dcd9b-0fef-47f3-beab-ff0d51646fb5', NULL, 'e74f3ff4-efa1-4d9c-b5ac-89821a6ff12c.png', NULL, NULL, 'ihor', 'ihor.kuzubov@gmail.com', '', NULL, 1, '', 'C2F2686300D2DB9BEEF4957535EB0681', '9F6BB6AD6A2A1A46A30822855D33A3CA', NULL, 0, 0.00);

-- --------------------------------------------------------

--
-- Структура таблицы `client_pasport_data`
--

CREATE TABLE `client_pasport_data` (
  `id` varchar(32) NOT NULL,
  `first_name_hash` varchar(64) NOT NULL,
  `last_name_hash` varchar(64) NOT NULL,
  `expiry_date_hash` varchar(64) NOT NULL,
  `country_of_issule_hash` varchar(64) NOT NULL,
  `pasport_number_hash` varchar(64) NOT NULL,
  `salt` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Зберігає закодовані паспортні дані в БД';

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `languages`
--

CREATE TABLE `languages` (
  `code` int NOT NULL,
  `languages_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `parking`
--

CREATE TABLE `parking` (
  `id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `language_code` int NOT NULL,
  `icon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `transaction_deposit` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  `status_id` int NOT NULL,
  `amount` double NOT NULL,
  `need_money` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_status`
--

CREATE TABLE `payment_status` (
  `id` int NOT NULL,
  `payment_status_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_language`
--

CREATE TABLE `personal_language` (
  `id` int NOT NULL,
  `apartment_id` varchar(32) NOT NULL,
  `language_code` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `promotion`
--

CREATE TABLE `promotion` (
  `id` int NOT NULL,
  `room_id` varchar(32) NOT NULL,
  `start_date` datetime NOT NULL,
  `max_people` int NOT NULL DEFAULT (-(1)),
  `days` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rooms`
--

CREATE TABLE `rooms` (
  `room_id` varchar(32) NOT NULL,
  `apartment_id` varchar(32) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `number` int DEFAULT NULL,
  `photos_json` json NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rooms_info`
--

CREATE TABLE `rooms_info` (
  `room_id` varchar(32) NOT NULL,
  `guests` int NOT NULL,
  `bathrooms` int NOT NULL,
  `children_allowed` tinyint(1) NOT NULL,
  `children_bad` tinyint(1) NOT NULL,
  `area` int NOT NULL,
  `breakfast` tinyint(1) NOT NULL,
  `parking_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tokens`
--

CREATE TABLE `tokens` (
  `id` varchar(36) NOT NULL,
  `salt` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_user` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `token_created` datetime NOT NULL DEFAULT (now()),
  `token_used` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tokens`
--

INSERT INTO `tokens` (`id`, `salt`, `id_user`, `token_created`, `token_used`) VALUES
('33c0c306-6a18-459a-88e9-1ee05cc5bc35', 'd071b35d-039f-4c37-89d2-f3824a090984', 'b70dcd9b-0fef-47f3-beab-ff0d51646fb5', '2024-10-10 12:23:29', '2024-10-10 12:23:57'),
('3403e341-2e4f-4f9a-aace-5ddb20428cad', '63f7f9cc-e512-4e38-be67-def25f78416c', 'b70dcd9b-0fef-47f3-beab-ff0d51646fb5', '2024-10-10 11:47:42', '2024-10-10 12:10:13'),
('7b8799ae-9413-46eb-8513-a02815e099b6', '7f505ac6-3a90-4b0e-9cd8-7c6f36d4afb8', '964b5872-dc2a-4f0e-b3f1-b37cc8a40774', '2024-10-10 11:41:13', '2024-10-10 11:47:35'),
('840cdfe1-2e62-4e94-b6d1-01b3ab02bbf3', '0552a9ec-9a2b-4084-a914-f926d9e01103', 'b70dcd9b-0fef-47f3-beab-ff0d51646fb5', '2024-10-10 12:20:16', '2024-10-10 12:21:29'),
('d72b0ff3-8b00-4b14-8770-39c17b94b13f', '9aafaa2f-5dd1-429e-be23-0108c176f053', '964b5872-dc2a-4f0e-b3f1-b37cc8a40774', '2024-10-10 11:31:55', '2024-10-10 11:40:36'),
('df49f11d-86f8-42b4-b3fc-1a35be21cb71', 'e406103b-fcf9-4b72-a023-aa59964b2ebd', NULL, '2024-10-10 11:40:44', '2024-10-10 11:40:51');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`amenities_id`),
  ADD KEY `fk_amenities_languages_0` (`language_code`);

--
-- Индексы таблицы `aminities_apartments`
--
ALTER TABLE `aminities_apartments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_aminities_apartments_apartment_id` (`apartment_id`),
  ADD KEY `fk_aminities_apartments_amenities` (`aminities_id`);

--
-- Индексы таблицы `apartments`
--
ALTER TABLE `apartments`
  ADD PRIMARY KEY (`apartments_id`),
  ADD UNIQUE KEY `unq_apartments_city_id` (`city_id`),
  ADD KEY `fk_apartments_client_data` (`client_id`);

--
-- Индексы таблицы `apartments_info`
--
ALTER TABLE `apartments_info`
  ADD PRIMARY KEY (`apartments_id`);

--
-- Индексы таблицы `armored`
--
ALTER TABLE `armored`
  ADD KEY `fk_бронювання_rooms` (`rooms_id`),
  ADD KEY `fk_бронювання_payments` (`payment_id`);

--
-- Индексы таблицы `beds`
--
ALTER TABLE `beds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_beds_bed_type_id` (`bed_type_id`),
  ADD UNIQUE KEY `unq_beds_room_id` (`room_id`);

--
-- Индексы таблицы `bed_type`
--
ALTER TABLE `bed_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bed_type_languages` (`language_code`);

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_cities_country_id_0` (`country_id`);

--
-- Индексы таблицы `client_data`
--
ALTER TABLE `client_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nickname` (`nickname`),
  ADD UNIQUE KEY `unq_client_data_pasport_id` (`pasport_id`);

--
-- Индексы таблицы `client_pasport_data`
--
ALTER TABLE `client_pasport_data`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`code`);

--
-- Индексы таблицы `parking`
--
ALTER TABLE `parking`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fk_parking_languages` (`language_code`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payments_payment_status` (`status_id`);

--
-- Индексы таблицы `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_language`
--
ALTER TABLE `personal_language`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_personal_language_language_code` (`language_code`),
  ADD KEY `fk_personal_language_apartments` (`apartment_id`);

--
-- Индексы таблицы `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_promotion_rooms` (`room_id`);

--
-- Индексы таблицы `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `unq_rooms_apartment_id` (`apartment_id`);

--
-- Индексы таблицы `rooms_info`
--
ALTER TABLE `rooms_info`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `fk_rooms_info_parking` (`parking_id`);

--
-- Индексы таблицы `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `amenities`
--
ALTER TABLE `amenities`
  MODIFY `amenities_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `aminities_apartments`
--
ALTER TABLE `aminities_apartments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `beds`
--
ALTER TABLE `beds`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bed_type`
--
ALTER TABLE `bed_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `languages`
--
ALTER TABLE `languages`
  MODIFY `code` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `parking`
--
ALTER TABLE `parking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `payment_status`
--
ALTER TABLE `payment_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `personal_language`
--
ALTER TABLE `personal_language`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `amenities`
--
ALTER TABLE `amenities`
  ADD CONSTRAINT `fk_amenities_languages_0` FOREIGN KEY (`language_code`) REFERENCES `languages` (`code`);

--
-- Ограничения внешнего ключа таблицы `aminities_apartments`
--
ALTER TABLE `aminities_apartments`
  ADD CONSTRAINT `fk_aminities_apartments_amenities` FOREIGN KEY (`aminities_id`) REFERENCES `amenities` (`amenities_id`);

--
-- Ограничения внешнего ключа таблицы `apartments`
--
ALTER TABLE `apartments`
  ADD CONSTRAINT `fk_apartments_aminities_apartments` FOREIGN KEY (`apartments_id`) REFERENCES `aminities_apartments` (`apartment_id`),
  ADD CONSTRAINT `fk_apartments_cities` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `fk_apartments_client_data` FOREIGN KEY (`client_id`) REFERENCES `client_data` (`id`),
  ADD CONSTRAINT `fk_apartments_rooms` FOREIGN KEY (`apartments_id`) REFERENCES `rooms` (`apartment_id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `apartments_info`
--
ALTER TABLE `apartments_info`
  ADD CONSTRAINT `fk_apartments_info_apartments` FOREIGN KEY (`apartments_id`) REFERENCES `apartments` (`apartments_id`);

--
-- Ограничения внешнего ключа таблицы `armored`
--
ALTER TABLE `armored`
  ADD CONSTRAINT `fk_бронювання_payments` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `fk_бронювання_rooms` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`room_id`);

--
-- Ограничения внешнего ключа таблицы `bed_type`
--
ALTER TABLE `bed_type`
  ADD CONSTRAINT `fk_bed_type_beds` FOREIGN KEY (`id`) REFERENCES `beds` (`bed_type_id`);

--
-- Ограничения внешнего ключа таблицы `client_data`
--
ALTER TABLE `client_data`
  ADD CONSTRAINT `fk_client_data_client_pasport_data` FOREIGN KEY (`pasport_id`) REFERENCES `client_pasport_data` (`id`);

--
-- Ограничения внешнего ключа таблицы `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `fk_countries_cities_0` FOREIGN KEY (`id`) REFERENCES `cities` (`country_id`);

--
-- Ограничения внешнего ключа таблицы `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `fk_languages_parking` FOREIGN KEY (`code`) REFERENCES `parking` (`language_code`);

--
-- Ограничения внешнего ключа таблицы `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_payment_status` FOREIGN KEY (`status_id`) REFERENCES `payment_status` (`id`);

--
-- Ограничения внешнего ключа таблицы `personal_language`
--
ALTER TABLE `personal_language`
  ADD CONSTRAINT `fk_personal_language_apartments` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`apartments_id`),
  ADD CONSTRAINT `fk_personal_language_languages` FOREIGN KEY (`language_code`) REFERENCES `languages` (`code`);

--
-- Ограничения внешнего ключа таблицы `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `fk_promotion_rooms` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);

--
-- Ограничения внешнего ключа таблицы `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `fk_rooms_beds` FOREIGN KEY (`room_id`) REFERENCES `beds` (`room_id`);

--
-- Ограничения внешнего ключа таблицы `rooms_info`
--
ALTER TABLE `rooms_info`
  ADD CONSTRAINT `fk_rooms_info_parking` FOREIGN KEY (`parking_id`) REFERENCES `parking` (`id`),
  ADD CONSTRAINT `fk_rooms_info_rooms` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
