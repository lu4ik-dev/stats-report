-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 16 2023 г., 13:19
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `stats-report`
--
CREATE DATABASE IF NOT EXISTS `stats-report` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `stats-report`;

-- --------------------------------------------------------

--
-- Структура таблицы `employee_work_exp`
--

CREATE TABLE `employee_work_exp` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeLastEdit` text NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `employee_work_exp`
--

INSERT INTO `employee_work_exp` (`id`, `id_user`, `dateCreate`, `timeLastEdit`, `disabled`) VALUES
(1, 1, '2023-11-08 18:07:53', '', 1),
(4, 3, '2023-11-09 20:57:30', '16.11.2023 12:21:39', 0),
(5, 3, '2023-11-09 20:57:32', '', 1),
(6, 2, '2023-11-09 21:15:35', '16.11.2023 12:55:48', 0),
(7, 1, '2023-11-09 21:15:45', '16.11.2023 09:48:52', 1),
(8, 2, '2023-11-09 22:04:15', '', 1),
(9, 1, '2023-11-16 03:53:49', '16.11.2023 08:54:33', 0),
(10, 1, '2023-11-16 07:55:51', '16.11.2023 12:55:51', 1),
(11, 2, '2023-11-16 10:10:44', '16.11.2023 15:11:15', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `employee_work_exp_body`
--

CREATE TABLE `employee_work_exp_body` (
  `id` int NOT NULL,
  `id_doc` int NOT NULL,
  `name_of_indicators` text NOT NULL,
  `all_exp` json NOT NULL,
  `teach_exp` json DEFAULT NULL,
  `not_exp` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='8164 Персонал2.xlsx';

--
-- Дамп данных таблицы `employee_work_exp_body`
--

INSERT INTO `employee_work_exp_body` (`id`, `id_doc`, `name_of_indicators`, `all_exp`, `teach_exp`, `not_exp`) VALUES
(1, 1, 'В том числе руководящие работники', '{\"before3\": 3, \"from3to5\": 10}', '{\"before3\": 3, \"from3to5\": 10}', 5),
(5, 5, '', '{\"col4\": 5, \"col5\": 1, \"col6\": 0, \"col7\": 0, \"col8\": 4, \"col9\": 0, \"col10\": 0}', '{\"col12\": 7, \"col13\": 0, \"col14\": 0, \"col15\": 10, \"col16\": 0, \"col17\": 0}', 22),
(6, 5, '', '{\"col4\": 7, \"col5\": 0, \"col6\": 2, \"col7\": 0, \"col8\": 0, \"col9\": 5, \"col10\": 0}', '{\"col12\": 0, \"col13\": 8, \"col14\": 0, \"col15\": 0, \"col16\": 11, \"col17\": 0}', 22),
(7, 5, '', '{\"col4\": 9, \"col5\": 0, \"col6\": 0, \"col7\": 3, \"col8\": 0, \"col9\": 0, \"col10\": 6}', '{\"col12\": 0, \"col13\": 0, \"col14\": 9, \"col15\": 0, \"col16\": 0, \"col17\": 12}', 22),
(15, 8, '', '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}', 0),
(16, 8, 'фыв', '{\"col4\": 0, \"col5\": 999, \"col6\": 999, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}', 124),
(17, 8, 'рвырвыр', '{\"col4\": 0, \"col5\": 325, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 235, \"col10\": 0}', '{\"col12\": 999, \"col13\": 0, \"col14\": 0, \"col15\": 253, \"col16\": 0, \"col17\": 999}', 0),
(18, 8, 'фыпыфп', '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 999, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}', 999),
(19, 8, 'фыпфыпыф', '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 124, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 234, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}', 999),
(20, 8, 'фыв', '{\"col4\": 0, \"col5\": 999, \"col6\": 999, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}', 124),
(21, 8, 'рвырвыр', '{\"col4\": 0, \"col5\": 325, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 235, \"col10\": 0}', '{\"col12\": 999, \"col13\": 0, \"col14\": 0, \"col15\": 253, \"col16\": 0, \"col17\": 999}', 0),
(22, 8, 'фыпыфп', '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 999, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}', 999),
(23, 8, 'фыпфыпыф', '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 124, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 234, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}', 999),
(26, 9, 'люди', '{\"col4\": 18, \"col5\": 5, \"col6\": 8, \"col7\": 3, \"col8\": 2, \"col9\": 0, \"col10\": 0}', '{\"col12\": 1, \"col13\": 2, \"col14\": 3, \"col15\": 6, \"col16\": 0, \"col17\": 5, \"col18\": 0}', 0),
(27, 9, 'коты', '{\"col4\": 111, \"col5\": 3, \"col6\": 5, \"col7\": 20, \"col8\": 83, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 11, \"col14\": 24, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 48}', 48),
(28, 7, 'фыв', '{\"col4\": 1998, \"col5\": 999, \"col6\": 999, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 124}', 124),
(29, 7, 'рвырвыр', '{\"col4\": 560, \"col5\": 325, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 235, \"col10\": 0}', '{\"col12\": 999, \"col13\": 0, \"col14\": 0, \"col15\": 253, \"col16\": 0, \"col17\": 999, \"col18\": 0}', 0),
(30, 7, 'фыпыфп', '{\"col4\": 999, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 999, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 999}', 999),
(31, 7, 'фыпфыпыф', '{\"col4\": 124, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 124, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 234, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 999}', 999),
(32, 4, '', '{\"col4\": 5, \"col5\": 1, \"col6\": 0, \"col7\": 0, \"col8\": 4, \"col9\": 0, \"col10\": 0}', '{\"col12\": 7, \"col13\": 0, \"col14\": 0, \"col15\": 10, \"col16\": 0, \"col17\": 0, \"col18\": 22}', 22),
(33, 4, 'смтвапвап', '{\"col4\": 7, \"col5\": 0, \"col6\": 2, \"col7\": 0, \"col8\": 0, \"col9\": 5, \"col10\": 0}', '{\"col12\": 0, \"col13\": 8, \"col14\": 0, \"col15\": 0, \"col16\": 11, \"col17\": 0, \"col18\": 22}', 22),
(34, 4, '', '{\"col4\": 9, \"col5\": 0, \"col6\": 0, \"col7\": 3, \"col8\": 0, \"col9\": 0, \"col10\": 6}', '{\"col12\": 0, \"col13\": 0, \"col14\": 9, \"col15\": 0, \"col16\": 0, \"col17\": 12, \"col18\": 22}', 22),
(35, 6, 'фыв', '{\"col4\": 1998, \"col5\": 999, \"col6\": 999, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 124}', 124),
(36, 6, 'рвырвыр', '{\"col4\": 560, \"col5\": 325, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 235, \"col10\": 0}', '{\"col12\": 999, \"col13\": 0, \"col14\": 0, \"col15\": 253, \"col16\": 0, \"col17\": 999, \"col18\": 0}', 0),
(37, 6, 'фыпыфп', '{\"col4\": 999, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 999, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 999}', 999),
(38, 10, '', '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}', 0),
(43, 11, 'Численность работников всего', '{\"col4\": 21, \"col5\": 10, \"col6\": 2, \"col7\": 3, \"col8\": 1, \"col9\": 4, \"col10\": 1}', '{\"col12\": 4, \"col13\": 0, \"col14\": 5, \"col15\": 6, \"col16\": 7, \"col17\": 2, \"col18\": 2}', 2),
(44, 11, 'В ТОМ ЧИСЛЕ РУКОВДЯЩИЕ РАБОТНИКИ', '{\"col4\": 1001, \"col5\": 1, \"col6\": 1, \"col7\": 999, \"col8\": 0, \"col9\": 0, \"col10\": 0}', '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `enrollment`
--

CREATE TABLE `enrollment` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeLastEdit` text NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `enrollment`
--

INSERT INTO `enrollment` (`id`, `id_user`, `dateCreate`, `timeLastEdit`, `disabled`) VALUES
(1, 2, '2023-11-15 04:09:08', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `enrollment_body`
--

CREATE TABLE `enrollment_body` (
  `id` int NOT NULL,
  `id_doc` int NOT NULL,
  `Training_Program` varchar(255) DEFAULT NULL,
  `Standard_Category` varchar(255) DEFAULT NULL,
  `Occupation_Code` varchar(20) DEFAULT NULL,
  `Specialty_Name` varchar(255) DEFAULT NULL,
  `Duration_of_Study` int DEFAULT NULL,
  `Form_of_Education` varchar(50) DEFAULT NULL,
  `Course` int DEFAULT NULL,
  `Average_Grade_of_Certificate` decimal(4,2) DEFAULT NULL,
  `Number_of_KCP_According_to_Founder_Order` int DEFAULT NULL,
  `Total_Students_Count` int DEFAULT NULL,
  `Federal_Budget_Students_Count` int DEFAULT NULL,
  `Regional_Budget_Students_Count` int DEFAULT NULL,
  `Targeted_Training_Students_Count` int DEFAULT NULL,
  `Tuition_Paying_Students_Count` int DEFAULT NULL,
  `Foreign_Students_Count` int DEFAULT NULL,
  `Orphan_Children_Count` int DEFAULT NULL,
  `Children_without_Parental_Care_Count` int DEFAULT NULL,
  `Students_in_Need_of_Housing_Count` int DEFAULT NULL,
  `Provided_Dormitory_Space_Count` int DEFAULT NULL,
  `Denied_Dormitory_Space_Count` int DEFAULT NULL,
  `Graduation_Year_2024_Count` int DEFAULT NULL,
  `Number_of_Taking_Demonstration_Exam_GIA` int DEFAULT NULL,
  `Number_of_Taking_Demonstration_Exam_Intermediate_Assessment` int DEFAULT NULL,
  `Demonstration_Exam_Basic_Level_Count` int DEFAULT NULL,
  `Demonstration_Exam_Professional_Level_Count` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `enrollment_body`
--

INSERT INTO `enrollment_body` (`id`, `id_doc`, `Training_Program`, `Standard_Category`, `Occupation_Code`, `Specialty_Name`, `Duration_of_Study`, `Form_of_Education`, `Course`, `Average_Grade_of_Certificate`, `Number_of_KCP_According_to_Founder_Order`, `Total_Students_Count`, `Federal_Budget_Students_Count`, `Regional_Budget_Students_Count`, `Targeted_Training_Students_Count`, `Tuition_Paying_Students_Count`, `Foreign_Students_Count`, `Orphan_Children_Count`, `Children_without_Parental_Care_Count`, `Students_in_Need_of_Housing_Count`, `Provided_Dormitory_Space_Count`, `Denied_Dormitory_Space_Count`, `Graduation_Year_2024_Count`, `Number_of_Taking_Demonstration_Exam_GIA`, `Number_of_Taking_Demonstration_Exam_Intermediate_Assessment`, `Demonstration_Exam_Basic_Level_Count`, `Demonstration_Exam_Professional_Level_Count`) VALUES
(1, 1, 'dfhdfh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'he', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `invalids`
--

CREATE TABLE `invalids` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeLastEdit` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `disabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `invalids`
--

INSERT INTO `invalids` (`id`, `id_user`, `dateCreate`, `timeLastEdit`, `disabled`) VALUES
(1, 1, '2023-11-16 04:18:19', '16.11.2023 10:32:25', 1),
(2, 1, '2023-11-16 04:19:29', '16.11.2023 11:26:30', 1),
(3, 1, '2023-11-16 04:20:54', NULL, 1),
(4, 1, '2023-11-16 04:25:23', '16.11.2023 09:25:25', 1),
(5, 1, '2023-11-16 04:26:01', '16.11.2023 09:26:03', 1),
(6, 1, '2023-11-16 04:41:43', '16.11.2023 09:41:45', 1),
(7, 1, '2023-11-16 04:46:13', '16.11.2023 09:46:13', 1),
(8, 1, '2023-11-16 07:58:04', '16.11.2023 12:58:04', 1),
(9, 3, '2023-11-16 08:34:36', '16.11.2023 13:34:38', 1),
(10, 2, '2023-11-16 09:18:49', '16.11.2023 14:18:49', 1),
(11, 2, '2023-11-16 10:16:09', '16.11.2023 15:16:09', 0),
(12, 2, '2023-11-16 10:18:22', '16.11.2023 15:18:22', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `invalids_body`
--

CREATE TABLE `invalids_body` (
  `id` int NOT NULL,
  `id_doc` int NOT NULL,
  `name_poo` text NOT NULL,
  `specialnost` text NOT NULL,
  `code_of_specialnost` text NOT NULL,
  `counts` json NOT NULL,
  `diagnoses` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `invalids_body`
--

INSERT INTO `invalids_body` (`id`, `id_doc`, `name_poo`, `specialnost`, `code_of_specialnost`, `counts`, `diagnoses`) VALUES
(10, 2, '', '', '1', '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}', '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'),
(11, 8, '', '', '1', '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}', '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'),
(12, 8, '', '', '1', '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}', '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'),
(13, 9, '', '', '1', '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}', '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'),
(14, 10, 'fdfd', 'dfdf', '1', '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}', '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'),
(15, 10, 'dffd', 'fdfd', '1', '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}', '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'),
(16, 11, '', '', '1', '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}', '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'),
(17, 12, 'БНК', 'пкс', '09.02.03', '{\"col5\": 999, \"col6\": 999, \"col7\": 999, \"col8\": 999, \"col9\": 999}', '{\"col11\": 999, \"col12\": 999, \"col13\": 999, \"col14\": 999, \"col15\": 999, \"col16\": 999, \"col17\": 999, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'),
(18, 12, '', '', '1', '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}', '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}');

-- --------------------------------------------------------

--
-- Структура таблицы `obrazovanie`
--

CREATE TABLE `obrazovanie` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeLastEdit` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `obrazovanie`
--

INSERT INTO `obrazovanie` (`id`, `id_user`, `dateCreate`, `timeLastEdit`, `disabled`) VALUES
(1, 1, '2023-11-16 05:51:36', '16.11.2023 13:55:08', 0),
(8, 2, '2023-11-16 09:13:30', '16.11.2023 14:13:30', 0),
(9, 2, '2023-11-16 09:17:21', '16.11.2023 14:17:21', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `obrazovanie_body`
--

CREATE TABLE `obrazovanie_body` (
  `id` int NOT NULL,
  `id_doc` int NOT NULL,
  `name_of_indicators` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `all_obr` int NOT NULL,
  `have_obr` json NOT NULL,
  `kval_cat` json NOT NULL,
  `full_zan` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL COMMENT 'unique id',
  `login` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'login ',
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'pwd sha256\r\n',
  `admin_lvl` int NOT NULL DEFAULT '0' COMMENT '0 - eo, 1 - admin',
  `complectName` text NOT NULL COMMENT 'for admin - complect name, for eo - title organization',
  `authkey` text NOT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `admin_lvl`, `complectName`, `authkey`, `dateCreate`) VALUES
(1, 'BPK', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1, 'ГАПОУ \"Педагогический колледж\" г.Бугуруслана', 'eb9afezwzrb-zg7fhnj6h2-19j9o8yhczt-1;', '2023-11-09 13:49:21'),
(2, 'BNK', '04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 1, 'ГАПОУ \"Бугурусланский Нефтяной Колледж\"', 'gsrx79v8k0o-y1tydjeqicm-r0fjvvpu8ib-2;', '2023-11-11 22:12:38'),
(3, 'BSHT', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', 1, 'ГАПОУ \"Сельскохозяйственный техникум города Бугуруслана\"', 'kr0fotma5ng-it5ml3wgwvs-h4nv2wngm2-3;', '2023-11-13 04:14:48');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `employee_work_exp`
--
ALTER TABLE `employee_work_exp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `employee_work_exp_body`
--
ALTER TABLE `employee_work_exp_body`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_doc` (`id_doc`);

--
-- Индексы таблицы `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollment_ibfk_3` (`id_user`);

--
-- Индексы таблицы `enrollment_body`
--
ALTER TABLE `enrollment_body`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollment_body_ibfk_1` (`id_doc`);

--
-- Индексы таблицы `invalids`
--
ALTER TABLE `invalids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `invalids_body`
--
ALTER TABLE `invalids_body`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_doc` (`id_doc`);

--
-- Индексы таблицы `obrazovanie`
--
ALTER TABLE `obrazovanie`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `obrazovanie_body`
--
ALTER TABLE `obrazovanie_body`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `employee_work_exp`
--
ALTER TABLE `employee_work_exp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `employee_work_exp_body`
--
ALTER TABLE `employee_work_exp_body`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `enrollment_body`
--
ALTER TABLE `enrollment_body`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `invalids`
--
ALTER TABLE `invalids`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `invalids_body`
--
ALTER TABLE `invalids_body`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `obrazovanie`
--
ALTER TABLE `obrazovanie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `obrazovanie_body`
--
ALTER TABLE `obrazovanie_body`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'unique id', AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employee_work_exp`
--
ALTER TABLE `employee_work_exp`
  ADD CONSTRAINT `employee_work_exp_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `employee_work_exp_body`
--
ALTER TABLE `employee_work_exp_body`
  ADD CONSTRAINT `employee_work_exp_body_ibfk_1` FOREIGN KEY (`id_doc`) REFERENCES `employee_work_exp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `enrollment_body`
--
ALTER TABLE `enrollment_body`
  ADD CONSTRAINT `enrollment_body_ibfk_1` FOREIGN KEY (`id_doc`) REFERENCES `enrollment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `invalids`
--
ALTER TABLE `invalids`
  ADD CONSTRAINT `invalids_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `invalids_body`
--
ALTER TABLE `invalids_body`
  ADD CONSTRAINT `invalids_body_ibfk_1` FOREIGN KEY (`id_doc`) REFERENCES `invalids` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
