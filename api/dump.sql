/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cities
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` text,
  `id_region` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_region` (`id_region`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2511 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: contingent_body
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `contingent_body` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_doc` int NOT NULL,
  `Training_Program` int NOT NULL,
  `Standard_Category` int NOT NULL,
  `Occupation_Code` int NOT NULL,
  `Specialty_Name` int NOT NULL,
  `Duration_of_Study` int NOT NULL,
  `Form_of_Education` int NOT NULL,
  `Course` int NOT NULL,
  `Average_Grade_of_Certificate` int NOT NULL,
  `Number_of_KCP_According_to_Founder_Order` int NOT NULL,
  `Total_Students_Count` int NOT NULL,
  `Federal_Budget_Students_Count` int NOT NULL,
  `Regional_Budget_Students_Count` int NOT NULL,
  `Targeted_Training_Students_Count` int NOT NULL,
  `Tuition_Paying_Students_Count` int NOT NULL,
  `Foreign_Students_Count` int NOT NULL,
  `Orphan_Children_Count` int NOT NULL,
  `Children_without_Parental_Care_Count` int NOT NULL,
  `Students_in_Need_of_Housing_Count` int NOT NULL,
  `Provided_Dormitory_Space_Count` int NOT NULL,
  `Denied_Dormitory_Space_Count` int NOT NULL,
  `Graduation_Year_2024_Count` int NOT NULL,
  `Number_of_Taking_Demonstration_Exam_GIA` int NOT NULL,
  `Number_of_Taking_Demonstration_Exam_Intermediate_Assessment` int NOT NULL,
  `Demonstration_Exam_Basic_Level_Count` int NOT NULL,
  `Demonstration_Exam_Professional_Level_Count` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: employee_work_exp
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `employee_work_exp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeLastEdit` text NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `employee_work_exp_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: employee_work_exp_body
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `employee_work_exp_body` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_doc` int NOT NULL,
  `name_of_indicators` text NOT NULL,
  `all_exp` json NOT NULL,
  `teach_exp` json DEFAULT NULL,
  `not_exp` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_doc` (`id_doc`),
  CONSTRAINT `employee_work_exp_body_ibfk_1` FOREIGN KEY (`id_doc`) REFERENCES `employee_work_exp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 407 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '8164 Персонал2.xlsx';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: enrollment
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `enrollment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeLastEdit` text NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enrollment_ibfk_3` (`id_user`),
  CONSTRAINT `enrollment_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: enrollment_body
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `enrollment_body` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_doc` int NOT NULL,
  `Training_Program` varchar(255) DEFAULT NULL,
  `Standard_Category` varchar(255) DEFAULT NULL,
  `Occupation_Code` varchar(20) DEFAULT NULL,
  `Specialty_Name` varchar(255) DEFAULT NULL,
  `Duration_of_Study` int DEFAULT NULL,
  `Form_of_Education` varchar(50) DEFAULT NULL,
  `Course` int DEFAULT NULL,
  `Average_Grade_of_Certificate` decimal(4, 2) DEFAULT NULL,
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
  `Demonstration_Exam_Professional_Level_Count` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enrollment_body_ibfk_1` (`id_doc`),
  CONSTRAINT `enrollment_body_ibfk_1` FOREIGN KEY (`id_doc`) REFERENCES `enrollment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: invalids
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `invalids` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeLastEdit` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `invalids_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 24 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: invalids_body
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `invalids_body` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_doc` int NOT NULL,
  `name_poo` text NOT NULL,
  `specialnost` text NOT NULL,
  `code_of_specialnost` text NOT NULL,
  `counts` json NOT NULL,
  `diagnoses` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_doc` (`id_doc`),
  CONSTRAINT `invalids_body_ibfk_1` FOREIGN KEY (`id_doc`) REFERENCES `invalids` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 132 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: logs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` text,
  `type` tinyint(1) DEFAULT NULL COMMENT '1 - admin / 0 - user',
  `user` int DEFAULT NULL COMMENT 'id user',
  `target` int DEFAULT NULL COMMENT 'target id',
  `dateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: obrazovanie
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `obrazovanie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeLastEdit` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 44 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: obrazovanie_body
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `obrazovanie_body` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_doc` int NOT NULL,
  `name_of_indicators` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `all_obr` int NOT NULL,
  `have_obr` json NOT NULL,
  `kval_cat` json NOT NULL,
  `full_zan` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 253 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: orgazizations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `orgazizations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `inn` text NOT NULL,
  `kpp` text NOT NULL,
  `ogrn` text NOT NULL,
  `ur_address` text NOT NULL,
  `administrator_org` int NOT NULL,
  `id_city` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orgazizations_ibfk_1` (`administrator_org`),
  KEY `id_city` (`id_city`),
  CONSTRAINT `orgazizations_ibfk_1` FOREIGN KEY (`administrator_org`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: regions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `regions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 90 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'unique id',
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `login` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'login ',
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'pwd sha256\r\n',
  `admin_lvl` int NOT NULL DEFAULT '0' COMMENT '0 - eo, 1 - admin',
  `darktheme` tinyint(1) NOT NULL DEFAULT '0',
  `complectName` text NOT NULL COMMENT 'for admin - complect name, for eo - title organization',
  `authkey` text NOT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_org` int DEFAULT NULL,
  `verify` tinyint(1) NOT NULL DEFAULT '0',
  `id_city` int DEFAULT '1',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_org` (`id_org`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_org`) REFERENCES `orgazizations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cities
# ------------------------------------------------------------

INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (-1, 'Не выбрано', -1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1, 'Москва', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2, 'Абрамцево', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (3, 'Алабино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (4, 'Апрелевка', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (5, 'Архангельское', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (6, 'Ашитково', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (7, 'Байконур', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (8, 'Бакшеево', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (9, 'Балашиха', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (10, 'Барыбино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (11, 'Белоомут', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (12, 'Белые Столбы', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (13, 'Бородино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (14, 'Бронницы', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (15, 'Быково', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (16, 'Валуево', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (17, 'Вербилки', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (18, 'Верея', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (19, 'Видное', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (20, 'Внуково', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (21, 'Вождь Пролетариата', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (22, 'Волоколамск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (23, 'Вороново', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (24, 'Воскресенск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (25, 'Восточный', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (26, 'Востряково', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (27, 'Высоковск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (28, 'Голицино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (29, 'Деденево', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (30, 'Дедовск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (31, 'Джержинский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (32, 'Дмитров', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (33, 'Долгопрудный', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (34, 'Домодедово', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (35, 'Дорохово', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (36, 'Дрезна', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (37, 'Дубки', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (38, 'Дубна', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (39, 'Егорьевск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (40, 'Железнодорожный', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (41, 'Жилево', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (42, 'Жуковский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (43, 'Загорск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (44, 'Загорянский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (45, 'Запрудная', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (46, 'Зарайск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (47, 'Звенигород', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (48, 'Зеленоград', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (49, 'Ивантеевка', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (50, 'Икша', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (51, 'Ильинский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (52, 'Истра', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (53, 'Калининград', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (54, 'Кашира', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (55, 'Керва', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (56, 'Климовск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (57, 'Клин', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (58, 'Клязьма', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (59, 'Кожино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (60, 'Кокошкино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (61, 'Коломна', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (62, 'Колюбакино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (63, 'Королев', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (64, 'Косино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (65, 'Котельники', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (66, 'Красково', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (67, 'Красноармейск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (68, 'Красногорск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (69, 'Краснозаводск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (70, 'Краснознаменск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (71, 'Красный Ткач', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (72, 'Крюково', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (73, 'Кубинка', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (74, 'Купавна', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (75, 'Куровское', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (76, 'Лесной Городок', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (77, 'Ликино-Дулево', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (78, 'Лобня', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (79, 'Лопатинский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (80, 'Лосино-Петровский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (81, 'Лотошино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (82, 'Лукино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (83, 'Луховицы', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (84, 'Лыткарино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (85, 'Львовский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (86, 'Люберцы', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (87, 'Малаховка', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (88, 'Михайловское', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (89, 'Михнево', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (90, 'Можайск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (91, 'Монино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (92, 'Муханово', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (93, 'Мытищи', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (94, 'Нарофоминск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (95, 'Нахабино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (96, 'Некрасовка', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (97, 'Немчиновка', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (98, 'Новобратцевский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (99, 'Новоподрезково', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (100, 'Ногинск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (101, 'Обухово', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (102, 'Одинцово', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (103, 'Ожерелье', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (104, 'Озеры', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (105, 'Октябрьский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (106, 'Опалиха', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (107, 'Орехово-Зуево', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (108, 'Павловский Посад', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (109, 'Первомайский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (110, 'Пески', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (111, 'Пироговский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (112, 'Подольск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (113, 'Полушкино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (114, 'Правдинский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (115, 'Привокзальный', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (116, 'Пролетарский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (117, 'Протвино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (118, 'Пушкино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (119, 'Пущино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (120, 'Радовицкий', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (121, 'Раменское', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (122, 'Реутов', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (123, 'Решетниково', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (124, 'Родники', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (125, 'Рошаль', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (126, 'Рублево', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (127, 'Руза', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (128, 'Салтыковка', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (129, 'Северный', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (130, 'Сергиев Посад', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (131, 'Серебряные Пруды', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (132, 'Серпухов', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (133, 'Солнечногорск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (134, 'Солнцево', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (135, 'Софрино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (136, 'Старая Купавна', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (137, 'Старбеево', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (138, 'Ступино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (139, 'Сходня', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (140, 'Талдом', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (141, 'Текстильщик', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (142, 'Темпы', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (143, 'Тишково', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (144, 'Томилино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (145, 'Троицк', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (146, 'Туголесский Бор', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (147, 'Тучково', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (148, 'Уваровка', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (149, 'Удельная', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (150, 'Успенское', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (151, 'Фирсановка', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (152, 'Фосфоритный', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (153, 'Фрязино', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (154, 'Фряново', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (155, 'Химки', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (156, 'Хорлово', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (157, 'Хотьково', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (158, 'Черкизово', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (159, 'Черноголовка', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (160, 'Черусти', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (161, 'Чехов', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (162, 'Шарапово', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (163, 'Шатура', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (164, 'Шатурторф', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (165, 'Шаховская', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (166, 'Шереметьевский', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (167, 'Щелково', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (168, 'Щербинка', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (169, 'Электрогорск', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (170, 'Электросталь', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (171, 'Электроугли', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (172, 'Яхрома', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (173, 'Санкт-Петербург', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (174, 'Александровская', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (175, 'Бокситогорск', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (176, 'Большая Ижора', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (177, 'Будогощь', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (178, 'Вознесенье', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (179, 'Волосово', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (180, 'Волхов', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (181, 'Всеволожск', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (182, 'Выборг', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (183, 'Вырица', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (184, 'Высоцк', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (185, 'Гатчина', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (186, 'Дружная Горка', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (187, 'Дубровка', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (188, 'Ефимовский', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (189, 'Зеленогорск', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (190, 'Ивангород', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (191, 'Каменногорск', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (192, 'Кикерино', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (193, 'Кингисепп', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (194, 'Кириши', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (195, 'Кировск', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (196, 'Кобринское', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (197, 'Колпино', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (198, 'Коммунар', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (199, 'Кронштадт', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (200, 'Лисий Нос', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (201, 'Лодейное Поле', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (202, 'Ломоносов', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (203, 'Луга', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (204, 'Павловск', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (205, 'Парголово', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (206, 'Петродворец', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (207, 'Пикалёво', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (208, 'Подпорожье', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (209, 'Приозерск', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (210, 'Пушкин', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (211, 'Сестрорецк', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (212, 'Сланцы', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (213, 'Сосновый Бор', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (214, 'Тихвин', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (215, 'Тосно', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (216, 'Шлиссельбург', 2);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (219, 'Акташ', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (220, 'Акутиха', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (221, 'Алейск', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (222, 'Алтайский', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (223, 'Баево', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (224, 'Барнаул', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (225, 'Белово', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (226, 'Белокуриха', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (227, 'Белоярск', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (228, 'Бийск', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (229, 'Благовещенск', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (230, 'Боровлянка', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (231, 'Бурла', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (232, 'Бурсоль', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (233, 'Волчиха', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (234, 'Горно-Алтайск', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (235, 'Горняк', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (236, 'Ельцовка', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (237, 'Залесово', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (238, 'Заринск', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (239, 'Заток', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (240, 'Змеиногорск', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (241, 'Камень-на-Оби', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (242, 'Ключи', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (243, 'Кош-Агач', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (244, 'Красногорское', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (245, 'Краснощеково', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (246, 'Кулунда', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (247, 'Кытманово', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (248, 'Мамонтово', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (249, 'Новичиха', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (250, 'Новоалтайск', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (251, 'Онгудай', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (252, 'Павловск', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (253, 'Петропавловское', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (254, 'Поспелиха', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (255, 'Ребриха', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (256, 'Родино', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (257, 'Рубцовск', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (258, 'Славгород', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (259, 'Смоленское', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (260, 'Солонешное', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (261, 'Солтон', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (262, 'Староаллейское', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (263, 'Табуны', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (264, 'Тальменка', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (265, 'Топчиха', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (266, 'Троицкое', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (267, 'Турочак', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (268, 'Тюменцево', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (269, 'Угловское', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (270, 'Усть-Калманка', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (271, 'Усть-Кан', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (272, 'Усть-Кокса', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (273, 'Усть-Улаган', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (274, 'Усть-Чарышская Пристань', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (275, 'Хабары', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (276, 'Целинное', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (277, 'Чарышское', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (278, 'Шебалино', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (279, 'Шелаболиха', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (280, 'Шипуново', 4);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (281, 'Айгунь', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (282, 'Архара', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (283, 'Белогорск', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (284, 'Благовещенск (Амурская обл.)', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (285, 'Бурея', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (286, 'Возжаевка', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (287, 'Екатеринославка', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (288, 'Ерофей Павлович', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (289, 'Завитинск', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (290, 'Зея', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (291, 'Златоустовск', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (292, 'Ивановка', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (293, 'Коболдо', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (294, 'Магдагачи', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (295, 'Новобурейский', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (296, 'Поярково', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (297, 'Райчихинск', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (298, 'Ромны', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (299, 'Свободный', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (300, 'Серышево', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (301, 'Сковородино', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (302, 'Стойба', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (303, 'Тамбовка', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (304, 'Тында', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (305, 'Шимановск', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (306, 'Экимчан', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (307, 'Ядрино', 5);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (308, 'Амдерма', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (309, 'Архангельск', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (310, 'Березник', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (311, 'Вельск', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (312, 'Верхняя Тойма', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (313, 'Волошка', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (314, 'Вычегодский', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (315, 'Емца', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (316, 'Илеза', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (317, 'Ильинско-Подомское', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (318, 'Каргополь', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (319, 'Карпогоры', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (320, 'Кодино', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (321, 'Коноша', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (322, 'Коряжма', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (323, 'Котлас', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (324, 'Красноборск', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (325, 'Лешуконское', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (326, 'Мезень', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (327, 'Мирный', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (328, 'Нарьян-Мар', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (329, 'Новодвинск', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (330, 'Няндома', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (331, 'Онега', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (332, 'Пинега', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (333, 'Плесецк', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (334, 'Северодвинск', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (335, 'Сольвычегодск', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (336, 'Холмогоры', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (337, 'Шенкурск', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (338, 'Яренск', 6);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (339, 'Астрахань', 7);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (340, 'Ахтубинск', 7);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (341, 'Верхний Баскунчак', 7);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (342, 'Володарский', 7);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (343, 'Енотаевка', 7);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (344, 'Икряное', 7);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (345, 'Камызяк', 7);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (346, 'Капустин Яр', 7);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (347, 'Красный Яр', 7);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (348, 'Лиман', 7);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (349, 'Началово', 7);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (350, 'Харабали', 7);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (351, 'Черный Яр', 7);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (352, 'Аксаково', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (353, 'Амзя', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (354, 'Аскино', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (355, 'Баймак', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (356, 'Бакалы', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (357, 'Белебей', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (358, 'Белорецк', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (359, 'Бижбуляк', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (360, 'Бирск', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (361, 'Благовещенск', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (362, 'Большеустьикинское', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (363, 'Бураево', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (364, 'Верхнеяркеево', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (365, 'Верхние Киги', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (366, 'Верхние Татышлы', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (367, 'Верхний Авзян', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (368, 'Давлеканово', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (369, 'Дуван', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (370, 'Дюртюли', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (371, 'Ермекеево', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (372, 'Ермолаево', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (373, 'Зилаир', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (374, 'Зирган', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (375, 'Иглино', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (376, 'Инзер', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (377, 'Исянгулово', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (378, 'Ишимбай', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (379, 'Кананикольское', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (380, 'Кандры', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (381, 'Караидель', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (382, 'Караидельский', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (383, 'Киргиз-Мияки', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (384, 'Красноусольский', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (385, 'Кумертау', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (386, 'Кушнаренково', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (387, 'Малояз', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (388, 'Мелеуз', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (389, 'Месягутово', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (390, 'Мраково', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (391, 'Нефтекамск', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (392, 'Октябрьский', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (393, 'Раевский', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (394, 'Салават', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (395, 'Сибай', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (396, 'Старобалтачево', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (397, 'Старосубхангулово', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (398, 'Стерлибашево', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (399, 'Стерлитамак', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (400, 'Туймазы', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (401, 'Уфа', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (402, 'Учалы', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (403, 'Федоровка', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (404, 'Чекмагуш', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (405, 'Чишмы', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (406, 'Шаран', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (407, 'Янаул', 8);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (408, 'Алексеевка', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (409, 'Белгород', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (410, 'Борисовка', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (411, 'Валуйки', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (412, 'Вейделевка', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (413, 'Волоконовка', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (414, 'Грайворон', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (415, 'Губкин', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (416, 'Ивня', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (417, 'Короча', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (418, 'Красногвардейское', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (419, 'Новый Оскол', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (420, 'Ракитное', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (421, 'Ровеньки', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (422, 'Старый Оскол', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (423, 'Строитель', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (424, 'Чернянка', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (425, 'Шебекино', 9);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (426, 'Алтухово', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (427, 'Белая Березка', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (428, 'Белые Берега', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (429, 'Большое Полпино', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (430, 'Брянск', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (431, 'Бытошь', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (432, 'Выгоничи', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (433, 'Вышков', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (434, 'Гордеевка', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (435, 'Дубровка', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (436, 'Дятьково', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (437, 'Жирятино', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (438, 'Жуковка', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (439, 'Злынка', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (440, 'Ивот', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (441, 'Карачев', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (442, 'Клетня', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (443, 'Климово', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (444, 'Клинцы', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (445, 'Кокаревка', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (446, 'Комаричи', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (447, 'Красная Гора', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (448, 'Локоть', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (449, 'Мглин', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (450, 'Навля', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (451, 'Новозыбков', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (452, 'Погар', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (453, 'Почеп', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (454, 'Ржаница', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (455, 'Рогнедино', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (456, 'Севск', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (457, 'Стародуб', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (458, 'Суземка', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (459, 'Сураж', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (460, 'Трубчевск', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (461, 'Унеча', 10);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (462, 'Бабушкин', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (463, 'Багдарин', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (464, 'Баргузин', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (465, 'Баянгол', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (466, 'Бичура', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (467, 'Выдрино', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (468, 'Гусиное Озеро', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (469, 'Гусиноозерск', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (470, 'Заиграево', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (471, 'Закаменск', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (472, 'Иволгинск', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (473, 'Илька', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (474, 'Кабанск', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (475, 'Каменск', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (476, 'Кижинга', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (477, 'Курумкан', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (478, 'Кырен', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (479, 'Кяхта', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (480, 'Монды', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (481, 'Мухоршибирь', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (482, 'Нижнеангарск', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (483, 'Орлик', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (484, 'Петропавловка', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (485, 'Романовка', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (486, 'Северобайкальск', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (487, 'Селенгинск', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (488, 'Сосново-Озерское', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (489, 'Таксимо', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (490, 'Турунтаево', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (491, 'Улан-Удэ', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (492, 'Хоринск', 11);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (493, 'Александров', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (494, 'Андреево', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (495, 'Анопино', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (496, 'Бавлены', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (497, 'Балакирево', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (498, 'Боголюбово', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (499, 'Великодворский', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (500, 'Вербовский', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (501, 'Владимир', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (502, 'Вязники', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (503, 'Городищи', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (504, 'Гороховец', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (505, 'Гусевский', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (506, 'Гусь Хрустальный', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (507, 'Золотково', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (508, 'Иванищи', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (509, 'Камешково', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (510, 'Карабаново', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (511, 'Киржач', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (512, 'Ковров', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (513, 'Кольчугино', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (514, 'Красная Горбатка', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (515, 'Меленки', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (516, 'Муром', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (517, 'Петушки', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (518, 'Покров', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (519, 'Собинка', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (520, 'Судогда', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (521, 'Суздаль', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (522, 'Юрьев-Польский', 12);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (523, 'Алексеевская', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (524, 'Алущевск', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (525, 'Быково', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (526, 'Волгоград', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (527, 'Волжский', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (528, 'Городище', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (529, 'Дубовка', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (530, 'Елань', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (531, 'Жирновск', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (532, 'Иловля', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (533, 'Калач-на-Дону', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (534, 'Камышин', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (535, 'Кириллов', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (536, 'Клетский', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (537, 'Котельниково', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (538, 'Котово', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (539, 'Кумылженская', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (540, 'Ленинск', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (541, 'Михайловка', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (542, 'Нехаевский', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (543, 'Николаевск', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (544, 'Новоаннинский', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (545, 'Новониколаевский', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (546, 'Ольховка', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (547, 'Палласовка', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (548, 'Рудня', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (549, 'Светлый Яр', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (550, 'Серафимович', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (551, 'Средняя Ахтуба', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (552, 'Сталинград', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (553, 'Старая Полтавка', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (554, 'Суровикино', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (555, 'Урюпинск', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (556, 'Фролово', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (557, 'Чернышковский', 13);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (558, 'Бабаево', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (559, 'Белозерск', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (560, 'Великий Устюг', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (561, 'Верховажье', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (562, 'Вожега', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (563, 'Вологда', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (564, 'Вохтога', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (565, 'Вытегра', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (566, 'Грязовец', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (567, 'Кадников', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (568, 'Кадуй', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (569, 'Кичменгский Городок', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (570, 'Липин Бор', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (571, 'Никольск', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (572, 'Нюксеница', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (573, 'Сокол', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (574, 'Сямжа', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (575, 'Тарногский Городок', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (576, 'Тотьма', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (577, 'Устюжна', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (578, 'Харовск', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (579, 'Чагода', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (580, 'Череповец', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (581, 'Шексна', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (582, 'Шуйское', 14);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (583, 'Анна', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (584, 'Бобров', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (585, 'Богучар', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (586, 'Борисоглебск', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (587, 'Бутурлиновка', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (588, 'Верхний Мамон', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (589, 'Верхняя Хава', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (590, 'Воробьевка', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (591, 'Воронеж', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (592, 'Грибановский', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (593, 'Давыдовка', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (594, 'Елань-Коленовский', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (595, 'Калач', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (596, 'Кантемировка', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (597, 'Лиски', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (598, 'Нижнедевицк', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (599, 'Новая Усмань', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (600, 'Новохоперск', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (601, 'Ольховатка', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (602, 'Острогожск', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (603, 'Павловск', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (604, 'Панино', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (605, 'Петропавловка', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (606, 'Поворино', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (607, 'Подгоренский', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (608, 'Рамонь', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (609, 'Репьевка', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (610, 'Россошь', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (611, 'Семилуки', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (612, 'Таловая', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (613, 'Терновка', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (614, 'Хохольский', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (615, 'Эртиль', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (616, 'нововоронеж', 15);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (617, 'Агвали', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (618, 'Акуша', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (619, 'Ахты', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (620, 'Ачису', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (621, 'Бабаюрт', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (622, 'Бежта', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (623, 'Ботлих', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (624, 'Буйнакск', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (625, 'Вачи', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (626, 'Гергебиль', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (627, 'Гуниб', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (628, 'Дагестанские Огни', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (629, 'Дербент', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (630, 'Дылым', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (631, 'Ершовка', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (632, 'Избербаш', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (633, 'Карабудахкент', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (634, 'Карата', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (635, 'Каспийск', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (636, 'Касумкент', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (637, 'Кизилюрт', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (638, 'Кизляр', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (639, 'Кочубей', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (640, 'Кумух', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (641, 'Курах', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (642, 'Магарамкент', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (643, 'Маджалис', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (644, 'Махачкала', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (645, 'Мехельта', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (646, 'Новолакское', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (647, 'Рутул', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (648, 'Советское', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (649, 'Тарумовка', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (650, 'Терекли-Мектеб', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (651, 'Тлярата', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (652, 'Тпиг', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (653, 'Уркарах', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (654, 'Хасавюрт', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (655, 'Хив', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (656, 'Хунзах', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (657, 'Цуриб', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (658, 'Южно-Сухокумск', 16);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (660, 'Архиповка', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (661, 'Верхний Ландех', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (662, 'Вичуга', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (663, 'Гаврилов Посад', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (664, 'Долматовский', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (665, 'Дуляпино', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (666, 'Заволжск', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (667, 'Заречный', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (668, 'Иваново', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (669, 'Иваньковский', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (670, 'Ильинское-Хованское', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (671, 'Каминский', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (672, 'Кинешма', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (673, 'Комсомольск', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (674, 'Кохма', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (675, 'Лух', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (676, 'Палех', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (677, 'Пестяки', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (678, 'Приволжск', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (679, 'Пучеж', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (680, 'Родники', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (681, 'Савино', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (682, 'Сокольское', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (683, 'Тейково', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (684, 'Фурманов', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (685, 'Шуя', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (686, 'Южа', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (687, 'Юрьевец', 18);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (688, 'Алексеевск', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (689, 'Алзамай', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (690, 'Алыгжер', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (691, 'Ангарск', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (692, 'Артемовский', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (693, 'Атагай', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (694, 'Байкал', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (695, 'Байкальск', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (696, 'Балаганск', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (697, 'Баяндай', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (698, 'Бирюсинск', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (699, 'Бодайбо', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (700, 'Большая Речка', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (701, 'Большой Луг', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (702, 'Бохан', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (703, 'Братск', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (704, 'Видим', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (705, 'Витимский', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (706, 'Вихоревка', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (707, 'Еланцы', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (708, 'Ербогачен', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (709, 'Железногорск-Илимский', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (710, 'Жигалово', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (711, 'Забитуй', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (712, 'Залари', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (713, 'Звездный', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (714, 'Зима', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (715, 'Иркутск', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (716, 'Казачинское', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (717, 'Качуг', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (718, 'Квиток', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (719, 'Киренск', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (720, 'Куйтун', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (721, 'Култук', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (722, 'Кутулик', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (723, 'Мама', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (724, 'Нижнеудинск', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (725, 'Оса', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (726, 'Саянск', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (727, 'Слюдянка', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (728, 'Тайшет', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (729, 'Тулун', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (730, 'Усолье-Сибирское', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (731, 'Усть-Илимск', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (732, 'Усть-Кут', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (733, 'Усть-Ордынский', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (734, 'Усть-Уда', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (735, 'Черемхово', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (736, 'Чунский', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (737, 'Шелехов', 19);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (738, 'Баксан', 20);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (739, 'Майский', 20);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (740, 'Нальчик', 20);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (741, 'Нарткала', 20);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (742, 'Прохладный', 20);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (743, 'Советское', 20);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (744, 'Терек', 20);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (745, 'Тырныауз', 20);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (746, 'Чегем-Первый', 20);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (747, 'Багратионовск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (748, 'Балтийск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (749, 'Гвардейск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (750, 'Гурьевск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (751, 'Гусев', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (752, 'Железнодорожный', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (753, 'Зеленоградск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (754, 'Знаменск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (755, 'Кёнигсберг', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (756, 'Калининград', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (757, 'Кенисберг', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (758, 'Краснознаменск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (759, 'Мамоново', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (760, 'Неман', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (761, 'Нестеров', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (762, 'Озерск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (763, 'Полесск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (764, 'Правдинск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (765, 'Светлогорск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (766, 'Светлый', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (767, 'Славск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (768, 'Советск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (769, 'Черняховск', 21);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (770, 'Аршань', 22);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (771, 'Каспийский', 22);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (772, 'Комсомольский', 22);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (773, 'Малые Дербеты', 22);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (774, 'Приютное', 22);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (775, 'Советское', 22);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (776, 'Троицкое', 22);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (777, 'Утта', 22);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (778, 'Цаган-Аман', 22);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (779, 'Элиста', 22);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (780, 'Юста', 22);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (781, 'Яшалта', 22);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (782, 'Яшкуль', 22);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (783, 'Бабынино', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (784, 'Балабаново', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (785, 'Барятино', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (786, 'Белоусово', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (787, 'Бетлица', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (788, 'Боровск', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (789, 'Дугна', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (790, 'Дудоровский', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (791, 'Думиничи', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (792, 'Еленский', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (793, 'Жиздра', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (794, 'Износки', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (795, 'Калуга', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (796, 'Киров', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (797, 'Козельск', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (798, 'Кондрово', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (799, 'Людиново', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (800, 'Малоярославец', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (801, 'Медынь', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (802, 'Мещовск', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (803, 'Мосальск', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (804, 'Обнинск', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (805, 'Перемышль', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (806, 'Спас-Деменск', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (807, 'Сухиничи', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (808, 'Таруса', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (809, 'Ульяново', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (810, 'Ферзиково', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (811, 'Хвастовичи', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (812, 'Юхнов', 23);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (813, 'Атласово', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (814, 'Аянка', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (815, 'Большерецк', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (816, 'Вилючинск', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (817, 'Елизово', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (818, 'Ильпырский', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (819, 'Каменское', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (820, 'Кировский', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (821, 'Ключи', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (822, 'Крапивная', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (823, 'Мильково', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (824, 'Никольское', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (825, 'Озерновский', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (826, 'Оссора', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (827, 'Палана', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (828, 'Парень', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (829, 'Пахачи', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (830, 'Петропавловск-Камчатский', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (831, 'Тигиль', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (832, 'Тиличики', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (833, 'Усть-Большерецк', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (834, 'Усть-Камчатск', 24);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (863, 'Анжеро-Судженск', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (864, 'Барзас', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (865, 'Белово', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (866, 'Белогорск', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (867, 'Березовский', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (868, 'Грамотеино', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (869, 'Гурьевск', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (870, 'Ижморский', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (871, 'Итатский', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (872, 'Калтан', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (873, 'Кедровка', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (874, 'Кемерово', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (875, 'Киселевск', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (876, 'Крапивинский', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (877, 'Ленинск-Кузнецкий', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (878, 'Мариинск', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (879, 'Междуреченск', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (880, 'Мыски', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (881, 'Новокузнецк', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (882, 'Осинники', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (883, 'Прокопьевск', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (884, 'Промышленная', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (885, 'Тайга', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (886, 'Таштагол', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (887, 'Тисуль', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (888, 'Топки', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (889, 'Тяжинский', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (890, 'Юрга', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (891, 'Яшкино', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (892, 'Яя', 26);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (893, 'Арбаж', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (894, 'Аркуль', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (895, 'Белая Холуница', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (896, 'Богородское', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (897, 'Боровой', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (898, 'Верхошижемье', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (899, 'Вятские Поляны', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (900, 'Зуевка', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (901, 'Каринторф', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (902, 'Кикнур', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (903, 'Кильмезь', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (904, 'Киров', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (905, 'Кирово-Чепецк', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (906, 'Кирс', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (907, 'Кобра', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (908, 'Котельнич', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (909, 'Кумены', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (910, 'Ленинское', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (911, 'Луза', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (912, 'Малмыж', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (913, 'Мураши', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (914, 'Нагорск', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (915, 'Нема', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (916, 'Нововятск', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (917, 'Нолинск', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (918, 'Омутнинск', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (919, 'Опарино', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (920, 'Оричи', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (921, 'Пижанка', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (922, 'Подосиновец', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (923, 'Санчурск', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (924, 'Свеча', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (925, 'Слободской', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (926, 'Советск', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (927, 'Суна', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (928, 'Тужа', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (929, 'Уни', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (930, 'Уржум', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (931, 'Фаленки', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (932, 'Халтурин', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (933, 'Юрья', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (934, 'Яранск', 27);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (935, 'Абезь', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (936, 'Айкино', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (937, 'Верхняя Инта', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (938, 'Визинга', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (939, 'Водный', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (940, 'Вожаель', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (941, 'Воркута', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (942, 'Вуктыл', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (943, 'Гешарт', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (944, 'Елецкий', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (945, 'Емва', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (946, 'Заполярный', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (947, 'Ижма', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (948, 'Инта', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (949, 'Ираель', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (950, 'Каджером', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (951, 'Кажым', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (952, 'Кожым', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (953, 'Койгородок', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (954, 'Корткерос', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (955, 'Кослан', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (956, 'Объячево', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (957, 'Печора', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (958, 'Сосногорск', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (959, 'Сыктывкар', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (960, 'Троицко-Печерск', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (961, 'Усинск', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (962, 'Усогорск', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (963, 'Усть-Кулом', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (964, 'Усть-Цильма', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (965, 'Ухта', 28);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (966, 'Антропово', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (967, 'Боговарово', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (968, 'Буй', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (969, 'Волгореченск', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (970, 'Галич', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (971, 'Горчуха', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (972, 'Зебляки', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (973, 'Кадый', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (974, 'Кологрив', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (975, 'Кострома', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (976, 'Красное-на-Волге', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (977, 'Макарьев', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (978, 'Мантурово', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (979, 'Нерехта', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (980, 'Нея', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (981, 'Островское', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (982, 'Павино', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (983, 'Парфентьево', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (984, 'Поназырево', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (985, 'Солигалич', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (986, 'Судиславль', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (987, 'Сусанино', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (988, 'Чухлома', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (989, 'Шарья', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (990, 'Шемятино', 29);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (991, 'Абинск', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (992, 'Абрау-Дюрсо', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (993, 'Анапа', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (994, 'Апшеронск', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (995, 'Армавир', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (996, 'Архипо-Осиповка', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (997, 'Афипский', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (998, 'Ахтырский', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (999, 'Ачуево', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1000, 'Белореченск', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1001, 'Верхнебаканский', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1002, 'Выселки', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1003, 'Геленджик', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1004, 'Гиагинская', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1005, 'Горячий Ключ', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1006, 'Джубга', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1007, 'Динская', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1008, 'Ейск', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1009, 'Ильский', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1010, 'Кабардинка', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1011, 'Калинино', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1012, 'Калининская', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1013, 'Каменномостский', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1014, 'Каневская', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1015, 'Кореновск', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1016, 'Красноармейская', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1017, 'Краснодар', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1018, 'Кропоткин', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1019, 'Крыловская', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1020, 'Крымск', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1021, 'Курганинск', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1022, 'Кущевская', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1023, 'Лабинск', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1024, 'Лениградская', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1025, 'Майкоп', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1026, 'Мостовской', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1027, 'Новороссийск', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1028, 'Отрадная', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1029, 'Павловская', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1030, 'Приморско-Ахтарск', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1031, 'Северская', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1032, 'Славянск-на-Кубани', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1033, 'Сочи', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1034, 'Староминская', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1035, 'Старощербиновская', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1036, 'Тбилисская', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1037, 'Темрюк', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1038, 'Тимашевск', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1039, 'Тихорецк', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1040, 'Туапсе', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1041, 'Тульский', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1042, 'Усть-Лабинск', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1043, 'Шовгеновский', 30);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1044, ' Железногорск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1045, 'Абаза', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1046, 'Абакан', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1047, 'Абан', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1048, 'Агинское', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1049, 'Артемовск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1050, 'Аскиз', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1051, 'Ачинск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1052, 'Байкит', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1053, 'Балахта', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1054, 'Балыкса', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1055, 'Белый Яр', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1056, 'Бельтырский', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1057, 'Бея', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1058, 'Бискамжа', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1059, 'Боготол', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1060, 'Боград', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1061, 'Богучаны', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1062, 'Большая Мурта', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1063, 'Большой Улуй', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1064, 'Бородино', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1065, 'Ванавара', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1066, 'Верхнеимбатск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1067, 'Горячегорск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1068, 'Дзержинское', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1069, 'Дивногорск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1070, 'Диксон', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1071, 'Дудинка', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1072, 'Емельяново', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1073, 'Енисейск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1074, 'Ермаковское', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1075, 'Заозерный', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1076, 'Зеленогорск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1077, 'Игарка', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1078, 'Идринское', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1079, 'Иланский', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1080, 'Ирбейское', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1081, 'Казачинское', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1082, 'Канск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1083, 'Каратузское', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1084, 'Караул', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1085, 'Кежма', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1086, 'Кодинск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1087, 'Козулька', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1088, 'Копьево', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1089, 'Краснотуранск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1090, 'Красноярск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1091, 'Курагино', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1092, 'Лесосибирск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1093, 'Минусинск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1094, 'Мотыгино', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1095, 'Назарово', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1096, 'Нижний Ингаш', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1097, 'Новоселово', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1098, 'Норильск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1099, 'Партизанское', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1100, 'Пировское', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1101, 'Саяногорск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1102, 'Северо-Енисейский', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1103, 'Сосновоборск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1104, 'Тасеево', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1105, 'Таштып', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1106, 'Тура', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1107, 'Туруханск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1108, 'Тюхтет', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1109, 'Ужур', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1110, 'Усть-Авам', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1111, 'Уяр', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1112, 'Хатанга', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1113, 'Черемушки', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1114, 'Черногорск', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1115, 'Шалинское', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1116, 'Шарыпово', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1117, 'Шира', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1118, 'Шушенское', 31);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1119, 'Варгаши', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1120, 'Глядянское', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1121, 'Далматово', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1122, 'Каргаполье', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1123, 'Катайск', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1124, 'Кетово', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1125, 'Курган', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1126, 'Куртамыш', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1127, 'Лебяжье', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1128, 'Макушино', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1129, 'Мишкино', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1130, 'Мокроусово', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1131, 'Петухово', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1132, 'Половинное', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1133, 'Сафакулево', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1134, 'Целинное', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1135, 'Шадринск', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1136, 'Шатрово', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1137, 'Шумиха', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1138, 'Щучье', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1139, 'Юргамыш', 32);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1140, 'Альменево', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1141, 'Белая', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1142, 'Большое Солдатское', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1143, 'Глушково', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1144, 'Горшечное', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1145, 'Дмитриев-Льговский', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1146, 'Железногорск', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1147, 'Золотухино', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1148, 'Касторное', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1149, 'Конышевка', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1150, 'Коренево', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1151, 'Курск', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1152, 'Курчатов', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1153, 'Кшенский', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1154, 'Льгов', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1155, 'Мантурово', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1156, 'Медвенка', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1157, 'Обоянь', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1158, 'Поныри', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1159, 'Пристень', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1160, 'Прямицыно', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1161, 'Рыльск', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1162, 'Суджа', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1163, 'Тим', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1164, 'Фатеж', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1165, 'Хомутовка', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1166, 'Черемисиново', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1167, 'Щигры', 33);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1168, 'Грязи', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1169, 'Данхов', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1170, 'Доброе', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1171, 'Долгоруково', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1172, 'Елец', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1173, 'Задонск', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1174, 'Измалково', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1175, 'Казинка', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1176, 'Лебедянь', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1177, 'Лев Толстой', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1178, 'Липецк', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1179, 'Тербуны', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1180, 'Усмань', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1181, 'Хлевное', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1182, 'Чаплыгин', 34);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1183, 'Анадырь', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1184, 'Атка', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1185, 'Балыгычан', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1186, 'Беринговский', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1187, 'Билибино', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1188, 'Большевик', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1189, 'Ванкарем', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1190, 'Иульитин', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1191, 'Кадыкчан', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1192, 'Лаврентия', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1193, 'Магадан', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1194, 'Мыс Шмидта', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1195, 'Ола', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1196, 'Омонск', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1197, 'Омсукчан', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1198, 'Палатка', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1199, 'Певек', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1200, 'Провидения', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1201, 'Сеймчан', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1202, 'Синегорье', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1203, 'Сусуман', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1204, 'Усть-Белая', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1205, 'Усть-Омчуг', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1206, 'Эвенск', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1207, 'Эгвекинот', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1208, 'Ягодное', 35);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1209, 'Волжск', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1210, 'Дубовский', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1211, 'Звенигово', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1212, 'Йошкар-Ола', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1213, 'Килемары', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1214, 'Козьмодемьянск', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1215, 'Куженер', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1216, 'Мари-Турек', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1217, 'Медведево', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1218, 'Морки', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1219, 'Новый Торьял', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1220, 'Оршанка', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1221, 'Параньга', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1222, 'Сернур', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1223, 'Советский', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1224, 'Юрино', 36);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1225, 'Ардатов', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1226, 'Атюрьево', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1227, 'Атяшево', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1228, 'Большие Березники', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1229, 'Большое Игнатово', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1230, 'Выша', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1231, 'Ельники', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1232, 'Зубова Поляна', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1233, 'Инсар', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1234, 'Кадошкино', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1235, 'Кемля', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1236, 'Ковылкино', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1237, 'Комсомольский', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1238, 'Кочкурово', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1239, 'Краснослободск', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1240, 'Лямбирь', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1241, 'Ромоданово', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1242, 'Рузаевка', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1243, 'Саранск', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1244, 'Старое Шайгово', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1245, 'Темников', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1246, 'Теньгушево', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1247, 'Торбеево', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1248, 'Чамзинка', 37);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1249, 'Апатиты', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1250, 'Африканда', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1251, 'Верхнетуломский', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1252, 'Заозерск', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1253, 'Заполярный', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1254, 'Зареченск', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1255, 'Зашеек', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1256, 'Зеленоборский', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1257, 'Кандалакша', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1258, 'Кильдинстрой', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1259, 'Кировск', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1260, 'Ковдор', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1261, 'Кола', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1262, 'Конда', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1263, 'Мончегорск', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1264, 'Мурманск', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1265, 'Мурмаши', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1266, 'Никель', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1267, 'Оленегорск', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1268, 'Полярные Зори', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1269, 'Полярный', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1270, 'Североморск', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1271, 'Снежногорск', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1272, 'Умба', 38);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1340, 'Анциферово', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1341, 'Батецкий', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1342, 'Большая Вишера', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1343, 'Боровичи', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1344, 'Валдай', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1345, 'Волот', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1346, 'Деманск', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1347, 'Зарубино', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1348, 'Кресцы', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1349, 'Любытино', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1350, 'Малая Вишера', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1351, 'Марево', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1352, 'Мошенское', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1353, 'Новгород', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1354, 'Окуловка', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1355, 'Парфино', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1356, 'Пестово', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1357, 'Поддорье', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1358, 'Сольцы', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1359, 'Старая Русса', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1360, 'Хвойное', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1361, 'Холм', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1362, 'Чудово', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1363, 'Шимск', 40);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1364, 'Баган', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1365, 'Барабинск', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1366, 'Бердск', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1367, 'Биаза', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1368, 'Болотное', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1369, 'Венгерово', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1370, 'Довольное', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1371, 'Завьялово', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1372, 'Искитим', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1373, 'Карасук', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1374, 'Каргат', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1375, 'Колывань', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1376, 'Краснозерское', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1377, 'Крутиха', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1378, 'Куйбышев', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1379, 'Купино', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1380, 'Кыштовка', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1381, 'Маслянино', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1382, 'Михайловский', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1383, 'Мошково', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1384, 'Новосибирск', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1385, 'Ордынское', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1386, 'Северное', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1387, 'Сузун', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1388, 'Татарск', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1389, 'Тогучин', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1390, 'Убинское', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1391, 'Усть-Тарка', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1392, 'Чаны', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1393, 'Черепаново', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1394, 'Чистоозерное', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1395, 'Чулым', 41);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1396, 'Береговой', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1397, 'Большеречье', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1398, 'Большие Уки', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1399, 'Горьковское', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1400, 'Знаменское', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1401, 'Исилькуль', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1402, 'Калачинск', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1403, 'Колосовка', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1404, 'Кормиловка', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1405, 'Крутинка', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1406, 'Любинский', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1407, 'Марьяновка', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1408, 'Муромцево', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1409, 'Называевск', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1410, 'Нижняя Омка', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1411, 'Нововаршавка', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1412, 'Одесское', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1413, 'Оконешниково', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1414, 'Омск', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1415, 'Павлоградка', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1416, 'Полтавка', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1417, 'Русская Поляна', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1418, 'Саргатское', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1419, 'Седельниково', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1420, 'Таврическое', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1421, 'Тара', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1422, 'Тевриз', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1423, 'Тюкалинск', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1424, 'Усть-Ишим', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1425, 'Черлак', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1426, 'Шербакуль', 42);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1427, 'Абдулино', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1428, 'Адамовка', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1429, 'Айдырлинский', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1430, 'Акбулак', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1431, 'Аккермановка', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1432, 'Асекеево', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1433, 'Беляевка', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1434, 'Бугуруслан', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1435, 'Бузулук', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1436, 'Гай', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1437, 'Грачевка', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1438, 'Домбаровский', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1439, 'Дубенский', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1440, 'Илек', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1441, 'Ириклинский', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1442, 'Кувандык', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1443, 'Курманаевка', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1444, 'Матвеевка', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1445, 'Медногорск', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1446, 'Новоорск', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1447, 'Новосергиевка', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1448, 'Новотроицк', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1449, 'Октябрьское', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1450, 'Оренбург', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1451, 'Орск', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1452, 'Первомайский', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1453, 'Переволоцкий', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1454, 'Пономаревка', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1455, 'Саракташ', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1456, 'Светлый', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1457, 'Северное', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1458, 'Соль-Илецк', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1459, 'Сорочинск', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1460, 'Ташла', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1461, 'Тоцкое', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1462, 'Тюльган', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1463, 'Шарлык', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1464, 'Энергетик', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1465, 'Ясный', 43);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1466, 'Болхов', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1467, 'Верховье', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1468, 'Глазуновка', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1469, 'Дмитровск-Орловский', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1470, 'Долгое', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1471, 'Залегощь', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1472, 'Змиевка', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1473, 'Знаменское', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1474, 'Колпны', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1475, 'Красная Заря', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1476, 'Кромы', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1477, 'Ливны', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1478, 'Малоархангельск', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1479, 'Мценск', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1480, 'Нарышкино', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1481, 'Новосиль', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1482, 'Орел', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1483, 'Покровское', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1484, 'Сосково', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1485, 'Тросна', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1486, 'Хомутово', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1487, 'Хотынец', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1488, 'Шаблыкино', 44);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1489, 'Башмаково', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1490, 'Беднодемьяновск', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1491, 'Беково', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1492, 'Белинский', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1493, 'Бессоновка', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1494, 'Вадинск', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1495, 'Верхозим', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1496, 'Городище', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1497, 'Евлашево', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1498, 'Земетчино', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1499, 'Золотаревка', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1500, 'Исса', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1501, 'Каменка', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1502, 'Колышлей', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1503, 'Кондоль', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1504, 'Кузнецк', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1505, 'Лопатино', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1506, 'Малая Сердоба', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1507, 'Мокшан', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1508, 'Наровчат', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1509, 'Неверкино', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1510, 'Нижний Ломов', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1511, 'Никольск', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1512, 'Пачелма', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1513, 'Пенза', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1514, 'Русский Камешкир', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1515, 'Сердобск', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1516, 'Сосновоборск', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1517, 'Сура', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1518, 'Тамала', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1519, 'Шемышейка', 45);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1520, 'Барда', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1521, 'Березники', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1522, 'Большая Соснова', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1523, 'Верещагино', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1524, 'Гайны', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1525, 'Горнозаводск', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1526, 'Гремячинск', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1527, 'Губаха', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1528, 'Добрянка', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1529, 'Елово', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1530, 'Зюкайка', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1531, 'Ильинский', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1532, 'Карагай', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1533, 'Керчевский', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1534, 'Кизел', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1535, 'Коса', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1536, 'Кочево', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1537, 'Красновишерск', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1538, 'Краснокамск', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1539, 'Кудымкар', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1540, 'Куеда', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1541, 'Кунгур', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1542, 'Лысьва', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1543, 'Ныроб', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1544, 'Нытва', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1545, 'Октябрьский', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1546, 'Орда', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1547, 'Оса', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1548, 'Оханск', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1549, 'Очер', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1550, 'Пермь', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1551, 'Соликамск', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1552, 'Суксун', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1553, 'Уинское', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1554, 'Усолье', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1555, 'Усть-Кишерть', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1556, 'Чайковский', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1557, 'Частые', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1558, 'Чердынь', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1559, 'Чернореченский', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1560, 'Чернушка', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1561, 'Чусовой', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1562, 'Юрла', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1563, 'Юсьва', 46);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1564, 'Анучино', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1565, 'Арсеньев', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1566, 'Артем', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1567, 'Артемовский', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1568, 'Большой Камень', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1569, 'Валентин', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1570, 'Владивосток', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1571, 'Высокогорск', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1572, 'Горные Ключи', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1573, 'Горный', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1574, 'Дальнегорск', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1575, 'Дальнереченск', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1576, 'Зарубино', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1577, 'Кавалерово', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1578, 'Каменка', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1579, 'Камень-Рыболов', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1580, 'Кировский', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1581, 'Лазо', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1582, 'Лесозаводск', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1583, 'Лучегорск', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1584, 'Михайловка', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1585, 'Находка', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1586, 'Новопокровка', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1587, 'Ольга', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1588, 'Партизанск', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1589, 'Пограничный', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1590, 'Покровка', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1591, 'Русский', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1592, 'Самарга', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1593, 'Славянка', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1594, 'Спасск-Дальний', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1595, 'Терней', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1596, 'Уссурийск', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1597, 'Фокино', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1598, 'Хасан', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1599, 'Хороль', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1600, 'Черниговка', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1601, 'Чугуевка', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1602, 'Яковлевка', 47);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1603, 'Бежаницы', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1604, 'Великие Луки', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1605, 'Гдов', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1606, 'Дедовичи', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1607, 'Дно', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1608, 'Заплюсье', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1609, 'Идрица', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1610, 'Красногородское', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1611, 'Кунья', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1612, 'Локня', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1613, 'Невель', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1614, 'Новоржев', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1615, 'Новосокольники', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1616, 'Опочка', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1617, 'Остров', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1618, 'Палкино', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1619, 'Печоры', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1620, 'Плюсса', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1621, 'Порхов', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1622, 'Псков', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1623, 'Пустошка', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1624, 'Пушкинские Горы', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1625, 'Пыталово', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1626, 'Себеж', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1627, 'Струги-Красные', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1628, 'Усвяты', 48);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1629, 'Азов', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1630, 'Аксай', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1631, 'Алмазный', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1632, 'Аютинск', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1633, 'Багаевский', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1634, 'Батайск', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1635, 'Белая Калитва', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1636, 'Боковская', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1637, 'Большая Мартыновка', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1638, 'Вешенская', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1639, 'Волгодонск', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1640, 'Восход', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1641, 'Гигант', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1642, 'Горняцкий', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1643, 'Гуково', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1644, 'Донецк', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1645, 'Донской', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1646, 'Дубовское', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1647, 'Егорлыкская', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1648, 'Жирнов', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1649, 'Заветное', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1650, 'Заводской', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1651, 'Зверево', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1652, 'Зерноград', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1653, 'Зимовники', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1654, 'Кагальницкая', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1655, 'Казанская', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1656, 'Каменоломни', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1657, 'Каменск-Шахтинский', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1658, 'Кашары', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1659, 'Коксовый', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1660, 'Константиновск', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1661, 'Красный Сулин', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1662, 'Куйбышево', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1663, 'Матвеев Курган', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1664, 'Мигулинская', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1665, 'Миллерово', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1666, 'Милютинская', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1667, 'Морозовск', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1668, 'Новочеркасск', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1669, 'Новошахтинск', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1670, 'Обливская', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1671, 'Орловский', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1672, 'Песчанокопское', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1673, 'Покровское', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1674, 'Пролетарск', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1675, 'Ремонтное', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1676, 'Родионово-Несветайская', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1677, 'Ростов-на-Дону', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1678, 'Сальск', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1679, 'Семикаракорск', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1680, 'Таганрог', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1681, 'Тарасовский', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1682, 'Тацинский', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1683, 'Усть-Донецкий', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1684, 'Целина', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1685, 'Цимлянск', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1686, 'Чалтырь', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1687, 'Чертково', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1688, 'Шахты', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1689, 'Шолоховский', 49);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1690, 'Александро-Невский', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1691, 'Горняк', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1692, 'Гусь Железный', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1693, 'Елатьма', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1694, 'Ермишь', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1695, 'Заречный', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1696, 'Захарово', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1697, 'Кадом', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1698, 'Касимов', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1699, 'Кораблино', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1700, 'Милославское', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1701, 'Михайлов', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1702, 'Пителино', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1703, 'Пронск', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1704, 'Путятино', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1705, 'Рыбное', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1706, 'Ряжск', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1707, 'Рязань', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1708, 'Сапожок', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1709, 'Сараи', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1710, 'Сасово', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1711, 'Скопин', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1712, 'Спас-Клепики', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1713, 'Спасск-Рязанский', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1714, 'Старожилово', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1715, 'Ухолово', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1716, 'Чучково', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1717, 'Шацк', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1718, 'Шилово', 50);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1719, 'Алексеевка', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1720, 'Безенчук', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1721, 'Богатое', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1722, 'Богатырь', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1723, 'Большая Глущица', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1724, 'Большая Черниговка', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1725, 'Борское', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1726, 'Волжский', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1727, 'Жигулевск', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1728, 'Зольное', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1729, 'Исаклы', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1730, 'Камышла', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1731, 'Кинель', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1732, 'Кинель-Черкасы', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1733, 'Клявлино', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1734, 'Кошки', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1735, 'Красноармейское', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1736, 'Красный Яр', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1737, 'Куйбышев', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1738, 'Нефтегорск', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1739, 'Новокуйбышевск', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1740, 'Октябрьск', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1741, 'Отрадный', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1742, 'Пестравка', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1743, 'Похвистнево', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1744, 'Приволжье', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1745, 'Самара', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1746, 'Сургут (Самарская обл.)', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1747, 'Сызрань', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1748, 'Тольятти', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1749, 'Хворостянка', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1750, 'Чапаевск', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1751, 'Челно-Вершины', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1752, 'Шентала', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1753, 'Шигоны', 51);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1754, 'Александров Гай', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1755, 'Аркадак', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1756, 'Аткарск', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1757, 'Базарный Карабулак', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1758, 'Балаково', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1759, 'Балашов', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1760, 'Балтай', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1761, 'Возрождение', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1762, 'Вольск', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1763, 'Воскресенское', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1764, 'Горный', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1765, 'Дергачи', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1766, 'Духовницкое', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1767, 'Екатериновка', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1768, 'Ершов', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1769, 'Заречный', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1770, 'Ивантеевка', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1771, 'Калининск', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1772, 'Каменский', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1773, 'Красноармейск', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1774, 'Красный Кут', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1775, 'Лысые Горы', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1776, 'Маркс', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1777, 'Мокроус', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1778, 'Новоузенск', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1779, 'Новые Бурасы', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1780, 'Озинки', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1781, 'Перелюб', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1782, 'Петровск', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1783, 'Питерка', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1784, 'Пугачев', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1785, 'Ровное', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1786, 'Романовка', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1787, 'Ртищево', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1788, 'Самойловка', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1789, 'Саратов', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1790, 'Степное', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1791, 'Татищево', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1792, 'Турки', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1793, 'Хвалынск', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1794, 'Энгельс', 52);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1795, 'Абый', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1796, 'Алдан', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1797, 'Амга', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1798, 'Батагай', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1799, 'Бердигестях', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1800, 'Беркакит', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1801, 'Бестях', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1802, 'Борогонцы', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1803, 'Верхневилюйск', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1804, 'Верхнеколымск', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1805, 'Верхоянск', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1806, 'Вилюйск', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1807, 'Витим', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1808, 'Власово', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1809, 'Жиганск', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1810, 'Зырянка', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1811, 'Кангалассы', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1812, 'Канкунский', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1813, 'Ленск', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1814, 'Майя', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1815, 'Менкеря', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1816, 'Мирный', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1817, 'Нерюнгри', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1818, 'Нычалах', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1819, 'Нюрба', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1820, 'Олекминск', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1821, 'Покровск', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1822, 'Сангар', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1823, 'Саскылах', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1824, 'Среднеколымск', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1825, 'Сунтар', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1826, 'Тикси', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1827, 'Усть-Мая', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1828, 'Усть-Нера', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1829, 'Хандыга', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1830, 'Хонуу', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1831, 'Черский', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1832, 'Чокурдах', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1833, 'Чурапча', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1834, 'Якутск', 53);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1835, 'Александровск-Сахалинский', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1836, 'Анбэцу', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1837, 'Анива', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1838, 'Бошняково', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1839, 'Быков', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1840, 'Вахрушев', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1841, 'Взморье', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1842, 'Гастелло', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1843, 'Горнозаводск', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1844, 'Долинск', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1845, 'Ильинский', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1846, 'Катангли', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1847, 'Корсаков', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1848, 'Курильск', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1849, 'Макаров', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1850, 'Невельск', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1851, 'Ноглики', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1852, 'Оха', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1853, 'Поронайск', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1854, 'Северо-Курильск', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1855, 'Смирных', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1857, 'Тымовское', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1858, 'Углегорск', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1859, 'Холмск', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1860, 'Шахтерск', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1861, 'Южно-Курильск', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1862, 'Южно-Сахалинск', 54);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1863, 'Алапаевск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1864, 'Алтынай', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1865, 'Арамиль', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1866, 'Артемовский', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1867, 'Арти', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1868, 'Асбест', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1869, 'Ачит', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1870, 'Байкалово', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1871, 'Басьяновский', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1872, 'Белоярский', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1873, 'Березовский', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1874, 'Богданович', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1875, 'Буланаш', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1876, 'Верхний Тагил', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1877, 'Верхняя Пышма', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1878, 'Верхняя Салда', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1879, 'Верхняя Синячиха', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1880, 'Верхняя Сысерть', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1881, 'Верхняя Тура', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1882, 'Верхотурье', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1883, 'Висим', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1884, 'Волчанск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1885, 'Воронцовка', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1886, 'Гари', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1887, 'Дегтярск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1888, 'Екатеринбург', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1889, 'Ертарский', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1890, 'Заводоуспенское', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1891, 'Зыряновский', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1892, 'Зюзельский', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1893, 'Ивдель', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1894, 'Изумруд', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1895, 'Ирбит', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1896, 'Ис', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1897, 'Каменск-Уральский', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1898, 'Камышлов', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1899, 'Карпинск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1900, 'Карпунинский', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1901, 'Качканар', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1902, 'Кировград', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1903, 'Краснотурьинск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1904, 'Красноуральск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1905, 'Красноуфимск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1906, 'Кушва', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1907, 'Лесной', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1908, 'Михайловск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1909, 'Невьянск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1910, 'Нижние Серги', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1911, 'Нижний Тагил', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1912, 'Нижняя Салда', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1913, 'Нижняя Тура', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1914, 'Новая Ляля', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1915, 'Новоуральск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1916, 'Оус', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1917, 'Первоуральск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1918, 'Полевской', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1919, 'Пышма', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1920, 'Ревда', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1921, 'Реж', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1922, 'Свердловск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1923, 'Североуральск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1924, 'Серов', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1925, 'Сосьва', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1926, 'Среднеуральск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1927, 'Сухой Лог', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1928, 'Сысерть', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1929, 'Таборы', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1930, 'Тавда', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1931, 'Талица', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1932, 'Тугулым', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1933, 'Туринск', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1934, 'Туринская Слобода', 55);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1935, 'Алагир', 56);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1936, 'Ардон', 56);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1937, 'Беслан', 56);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1938, 'Бурон', 56);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1939, 'Владикавказ', 56);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1940, 'Дигора', 56);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1941, 'Моздок', 56);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1942, 'Орджоникидзе', 56);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1943, 'Чикола', 56);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1944, 'Велиж', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1945, 'Верхнеднепровский', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1946, 'Ворга', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1947, 'Вязьма', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1948, 'Гагарин', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1949, 'Глинка', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1950, 'Голынки', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1951, 'Демидов', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1952, 'Десногорск', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1953, 'Дорогобуж', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1954, 'Духовщина', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1955, 'Екимовичи', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1956, 'Ельня', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1957, 'Ершичи', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1958, 'Издешково', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1959, 'Кардымово', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1960, 'Красный', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1961, 'Монастырщина', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1962, 'Новодугино', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1963, 'Починок', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1964, 'Рославль', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1965, 'Рудня', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1966, 'Сафоново', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1967, 'Смоленск', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1968, 'Сычевка', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1969, 'Угра', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1970, 'Хиславичи', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1971, 'Холм-Жирковский', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1972, 'Шумячи', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1973, 'Ярцево', 57);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1974, 'Александровское', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1975, 'Арзгир', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1976, 'Благодарный', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1977, 'Буденновск', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1978, 'Георгиевск', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1979, 'Дивное', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1980, 'Домбай', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1981, 'Донское', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1982, 'Ессентуки', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1983, 'Железноводск', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1984, 'Зеленокумск', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1985, 'Изобильный', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1986, 'Иноземцево', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1987, 'Ипатово', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1988, 'Карачаевск', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1989, 'Кисловодск', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1990, 'Кочубеевское', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1991, 'Красногвардейское', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1992, 'Курсавка', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1993, 'Левокумское', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1994, 'Минеральные Воды', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1995, 'Невинномысск', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1996, 'Нефтекумск', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1997, 'Новоалександровск', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1998, 'Новоалександровская', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (1999, 'Новопавловск', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2000, 'Новоселицкое', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2001, 'Преградная', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2002, 'Пятигорск', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2003, 'Светлоград', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2004, 'Солнечнодольск', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2005, 'Ставрополь', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2006, 'Степное', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2007, 'Теберда', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2008, 'Усть-Джегута', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2009, 'Хабез', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2010, 'Черкесск', 58);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2011, 'Бондари', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2012, 'Гавриловка Вторая', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2013, 'Жердевка', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2014, 'Знаменка', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2015, 'Инжавино', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2016, 'Кирсанов', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2017, 'Котовск', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2018, 'Мичуринск', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2019, 'Мордово', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2020, 'Моршанск', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2021, 'Мучкапский', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2022, 'Первомайский', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2023, 'Петровское', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2024, 'Пичаево', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2025, 'Рассказово', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2026, 'Ржакса', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2027, 'Староюрьево', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2028, 'Тамбов', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2029, 'Токаревка', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2030, 'Уварово', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2031, 'Умет', 59);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2032, 'Агрыз', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2033, 'Азнакаево', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2034, 'Аксубаево', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2035, 'Актюбинский', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2036, 'Алексеевское', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2037, 'Альметьевск', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2038, 'Альметьевск', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2039, 'Апастово', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2040, 'Арск', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2041, 'Бавлы', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2042, 'Базарные Матаки', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2043, 'Балтаси', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2044, 'Богатые Сабы', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2045, 'Брежнев', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2046, 'Бугульма', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2047, 'Буинск', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2048, 'Васильево', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2049, 'Верхний Услон', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2050, 'Высокая Гора', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2051, 'Дербешкинский', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2052, 'Елабуга', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2053, 'Заинск', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2054, 'Зеленодольск', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2055, 'Казань', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2056, 'Камское Устье', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2057, 'Карабаш', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2058, 'Куйбышев', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2059, 'Кукмод', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2060, 'Кукмор', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2061, 'Лаишево', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2062, 'Лениногорск', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2063, 'Мамадыш', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2064, 'Менделеевск', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2065, 'Мензелинск', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2066, 'Муслюмово', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2067, 'Набережные Челны', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2068, 'Нижнекамск', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2069, 'Новошешминск', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2070, 'Нурлат', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2071, 'Пестрецы', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2072, 'Рыбная Слобода', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2073, 'Сарманово', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2074, 'Старое Дрожжаное', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2075, 'Тетюши', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2076, 'Чистополь', 60);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2077, 'Андреаполь', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2078, 'Бежецк', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2079, 'Белый', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2080, 'Белый Городок', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2081, 'Березайка', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2082, 'Бологое', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2083, 'Васильевский Мох', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2084, 'Выползово', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2085, 'Вышний Волочек', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2086, 'Жарковский', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2087, 'Западная Двина', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2088, 'Заречье', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2089, 'Зубцов', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2090, 'Изоплит', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2091, 'Калашниково', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2092, 'Калинин', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2093, 'Калязин', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2094, 'Кашин', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2095, 'Кесова Гора', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2096, 'Кимры', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2097, 'Конаково', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2098, 'Красный Холм', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2099, 'Кувшиново', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2100, 'Лесное', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2101, 'Лихославль', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2102, 'Максатиха', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2103, 'Молоково', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2104, 'Нелидово', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2105, 'Оленино', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2106, 'Осташков', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2107, 'Пено', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2108, 'Рамешки', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2109, 'Ржев', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2110, 'Сандово', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2111, 'Селижарово', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2112, 'Сонково', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2113, 'Спирово', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2114, 'Старица', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2115, 'Тверь', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2116, 'Торжок', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2117, 'Торопец', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2118, 'Удомля', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2119, 'Фирово', 61);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2120, 'Александровское', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2121, 'Асино', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2122, 'Бакчар', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2123, 'Батурино', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2124, 'Белый Яр', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2125, 'Зырянское', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2126, 'Итатка', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2127, 'Каргасок', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2128, 'Катайга', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2129, 'Кожевниково', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2130, 'Колпашево', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2131, 'Кривошеино', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2132, 'Мельниково', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2133, 'Молчаново', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2134, 'Парабель', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2135, 'Первомайское', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2136, 'Подгорное', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2137, 'Северск', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2138, 'Стрежевой', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2139, 'Томск', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2140, 'Тымск', 62);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2141, 'Ак-Довурак', 63);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2142, 'Бай Хаак', 63);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2143, 'Кызыл', 63);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2144, 'Самагалтай', 63);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2145, 'Сарыг-Сеп', 63);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2146, 'Суть-Холь', 63);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2147, 'Тоора-Хем', 63);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2148, 'Туран', 63);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2149, 'Тээли', 63);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2150, 'Хову-Аксы', 63);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2151, 'Чадан', 63);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2152, 'Шагонар', 63);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2153, 'Эрзин', 63);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2154, 'Агеево', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2155, 'Алексин', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2156, 'Арсеньево', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2157, 'Барсуки', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2158, 'Бегичевский', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2159, 'Белев', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2160, 'Богородицк', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2161, 'Болохово', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2162, 'Велегож', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2163, 'Венев', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2164, 'Волово', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2165, 'Горелки', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2166, 'Донской', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2167, 'Дубна', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2168, 'Епифань', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2169, 'Ефремов', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2170, 'Заокский', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2171, 'Казановка', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2172, 'Кимовск', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2173, 'Киреевск', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2174, 'Куркино', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2175, 'Ленинский', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2176, 'Новомосковск', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2177, 'Одоев', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2178, 'Плавск', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2179, 'Суворов', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2180, 'Тула', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2181, 'Узловая', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2182, 'Щекино', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2183, 'Ясногорск', 64);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2184, 'Абатский', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2185, 'Аксарка', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2186, 'Армизонское', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2187, 'Аромашево', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2188, 'Белоярский', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2189, 'Бердюжье', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2190, 'Большое Сорокино', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2191, 'Вагай', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2192, 'Викулово', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2193, 'Винзили', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2194, 'Голышманово', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2195, 'Губкинский', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2196, 'Заводопетровский', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2197, 'Заводоуковск', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2198, 'Излучинск', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2199, 'Исетское', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2200, 'Ишим', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2201, 'Казанское', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2202, 'Казым-Мыс', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2203, 'Когалым', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2204, 'Кондинское', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2205, 'Красноселькуп', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2206, 'Лабытнанги', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2207, 'Ларьяк', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2208, 'Мегион', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2209, 'Мужи', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2210, 'Муравленко', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2211, 'Надым', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2212, 'Находка', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2213, 'Нефтеюганск', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2214, 'Нижневартовск', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2215, 'Нижняя Тавда', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2216, 'Новый Уренгой', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2217, 'Ноябрьск', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2218, 'Нягань', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2219, 'Октябрьское', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2220, 'Омутинский', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2221, 'Радужный', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2222, 'Салехард', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2223, 'Сладково', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2224, 'Советский', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2225, 'Сургут', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2226, 'Тазовский', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2227, 'Тарко-Сале', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2228, 'Тобольск', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2229, 'Тюмень', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2230, 'Уват', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2231, 'Унъюган', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2232, 'Упорово', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2233, 'Урай', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2234, 'Ханты-Мансийск', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2235, 'Юрибей', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2236, 'Ялуторовск', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2237, 'Яр-Сале', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2238, 'Ярково', 65);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2239, 'Алнаши', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2240, 'Балезино', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2241, 'Вавож', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2242, 'Воткинск', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2243, 'Глазов', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2244, 'Грахово', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2245, 'Дебесы', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2246, 'Завьялово', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2247, 'Игра', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2248, 'Ижевск', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2249, 'Кама', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2250, 'Камбарка', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2251, 'Каракулино', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2252, 'Кез', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2253, 'Кизнер', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2254, 'Киясово', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2255, 'Красногорское', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2256, 'Можга', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2257, 'Сарапул', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2258, 'Селты', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2259, 'Сюмси', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2260, 'Ува', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2261, 'Устинов', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2262, 'Шаркан', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2263, 'Юкаменское', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2264, 'Якшур-Бодья', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2265, 'Яр', 66);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2266, 'Базарный Сызган', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2267, 'Барыш', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2268, 'Большое Нагаткино', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2269, 'Вешкайма', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2270, 'Глотовка', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2271, 'Димитровград', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2272, 'Игнатовка', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2273, 'Измайлово', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2274, 'Инза', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2275, 'Ишеевка', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2276, 'Канадей', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2277, 'Карсун', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2278, 'Кузоватово', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2279, 'Майна', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2280, 'Новая Малыкла', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2281, 'Новоспасское', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2282, 'Павловка', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2283, 'Радищево', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2284, 'Сенгилей', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2285, 'Старая Кулатка', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2286, 'Старая Майна', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2287, 'Сурское', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2288, 'Тереньга', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2289, 'Ульяновск', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2290, 'Чердаклы', 67);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2291, 'Аксай', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2292, 'Дарьинское', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2293, 'Деркул', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2294, 'Джамбейты', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2295, 'Джаныбек', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2296, 'Казталовка', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2297, 'Калмыково', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2298, 'Каратобе', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2299, 'Переметное', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2300, 'Сайхин', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2301, 'Уральск', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2302, 'Федоровка', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2303, 'Фурманово', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2304, 'Чапаев', 68);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2305, 'Амурск', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2306, 'Аян', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2307, 'Березовый', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2308, 'Бикин', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2309, 'Бира', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2310, 'Биракан', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2311, 'Богородское', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2312, 'Болонь', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2313, 'Ванино', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2314, 'Волочаевка Вторая', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2315, 'Высокогорный', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2316, 'Вяземский', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2317, 'Горный', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2318, 'Гурское', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2319, 'Дормидонтовка', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2320, 'Заветы Ильича', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2321, 'Известковый', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2322, 'Иннокентьевка', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2323, 'Комсомольск-на-Амуре', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2324, 'Ленинское', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2325, 'Нелькан', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2326, 'Николаевск-на-Амуре', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2327, 'Облучье', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2328, 'Охотск', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2329, 'Переяславка', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2330, 'Смидович', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2331, 'Советская Гавань', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2332, 'Софийск', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2333, 'Троицкое', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2334, 'Тугур', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2335, 'Хабаровск', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2336, 'Чегдомын', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2337, 'Чумикан', 69);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2340, 'Аган', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2341, 'Игрим', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2342, 'Излучинск', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2343, 'Лангепас', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2344, 'Лянтор', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2345, 'Мегион', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2346, 'Нефтеюганск', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2347, 'Нижневартовск', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2348, 'Нягань', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2349, 'Покачи', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2350, 'Приобье', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2351, 'Пыть-Ях', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2352, 'Радужный', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2353, 'Сургут', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2354, 'Урай', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2355, 'Ханты-Мансийск', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2356, 'Югорск', 71);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2357, 'Агаповка', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2358, 'Аргаяш', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2359, 'Аша', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2360, 'Бакал', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2361, 'Бреды', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2362, 'Варна', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2363, 'Верхнеуральск', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2364, 'Верхний Уфалей', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2365, 'Еманжелинск', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2366, 'Златоуст', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2367, 'Карабаш', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2368, 'Карталы', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2369, 'Касли', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2370, 'Катав-Ивановск', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2371, 'Копейск', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2372, 'Коркино', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2373, 'Кунашак', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2374, 'Куса', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2375, 'Кыштым', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2376, 'Магнитогорск', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2377, 'Миасс', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2378, 'Озерск', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2379, 'Октябрьское', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2380, 'Пласт', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2381, 'Сатка', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2382, 'Сим', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2383, 'Снежинск', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2384, 'Трехгорный', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2385, 'Троицк', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2386, 'Увельский', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2387, 'Уйское', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2388, 'Усть-Катав', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2389, 'Фершампенуаз', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2390, 'Чебаркуль', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2391, 'Челябинск', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2392, 'Чесма', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2393, 'Южно-Уральск', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2394, 'Юрюзань', 72);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2395, 'Аргун', 73);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2396, 'Грозный', 73);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2397, 'Гудермез', 73);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2398, 'Малгобек', 73);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2399, 'Назрань', 73);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2400, 'Наурская', 73);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2401, 'Ножай-Юрт', 73);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2402, 'Орджоникидзевская', 73);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2403, 'Советское', 73);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2404, 'Урус-Мартан', 73);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2405, 'Шали', 73);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2406, 'Агинское', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2407, 'Аксеново-Зиловское', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2408, 'Акша', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2409, 'Александровский Завод', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2410, 'Амазар', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2411, 'Арбагар', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2412, 'Атамановка', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2413, 'Балей', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2414, 'Борзя', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2415, 'Букачача', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2416, 'Газимурский Завод', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2417, 'Давенда', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2418, 'Дарасун', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2419, 'Дровяная', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2420, 'Дульдурга', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2421, 'Жиндо', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2422, 'Забайкальск', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2423, 'Итака', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2424, 'Калга', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2425, 'Карымское', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2426, 'Кличка', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2427, 'Ключевский', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2428, 'Кокуй', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2429, 'Краснокаменск', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2430, 'Красный Чикой', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2431, 'Кыра', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2432, 'Моготуй', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2433, 'Могоча', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2434, 'Нерчинск', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2435, 'Нерчинский Завод', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2436, 'Нижний Часучей', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2437, 'Оловянная', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2438, 'Первомайский', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2439, 'Петровск-Забайкальский', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2440, 'Приаргунск', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2441, 'Сретенск', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2442, 'Тупик', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2443, 'Улеты', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2444, 'Хилок', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2445, 'Чара', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2446, 'Чернышевск', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2447, 'Чита', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2448, 'Шелопугино', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2449, 'Шилка', 74);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2450, 'Алатырь', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2451, 'Аликово', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2452, 'Батырева', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2453, 'Буинск', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2454, 'Вурнары', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2455, 'Ибреси', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2456, 'Канаш', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2457, 'Киря', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2458, 'Комсомольское', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2459, 'Красноармейское', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2460, 'Красные Четаи', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2461, 'Кугеси', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2462, 'Мариинский Посад', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2463, 'Моргауши', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2464, 'Новочебоксарск', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2465, 'Порецкое', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2466, 'Урмары', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2467, 'Цивильск', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2468, 'Чебоксары', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2469, 'Шемурша', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2470, 'Шумерля', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2471, 'Ядрин', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2472, 'Яльчики', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2473, 'Янтиково', 75);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2474, 'Анадырь', 76);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2475, 'Билибино', 76);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2476, 'Губкинский', 77);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2477, 'Заполярный', 77);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2478, 'Муравленко', 77);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2479, 'Надым', 77);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2480, 'Новый Уренгой', 77);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2481, 'Ноябрьск', 77);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2482, 'Пуровск', 77);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2483, 'Салехард', 77);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2484, 'Тарко', 77);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2485, 'Андропов', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2486, 'Берендеево', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2487, 'Большое Село', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2488, 'Борисоглебский', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2489, 'Брейтово', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2490, 'Бурмакино', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2491, 'Варегово', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2492, 'Волга', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2493, 'Гаврилов Ям', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2494, 'Данилов', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2495, 'Любим', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2496, 'Мышкино', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2497, 'Некрасовское', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2498, 'Новый Некоуз', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2499, 'Переславль-Залесский', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2500, 'Пошехонье-Володарск', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2501, 'Ростов', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2502, 'Рыбинск', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2503, 'Тутаев', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2504, 'Углич', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2505, 'Ярославль', 78);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2506, '111', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2508, '23213', 1);
INSERT INTO
  `cities` (`id`, `text`, `id_region`)
VALUES
  (2509, '1', 2);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: contingent_body
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: employee_work_exp
# ------------------------------------------------------------

INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (1, 1, '2023-11-08 21:07:53', '', 1);
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    4,
    3,
    '2023-11-09 23:57:30',
    '16.11.2023 12:21:39',
    0
  );
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (5, 3, '2023-11-09 23:57:32', '', 1);
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    6,
    2,
    '2023-11-10 00:15:35',
    '16.11.2023 12:55:48',
    1
  );
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    7,
    1,
    '2023-11-10 00:15:45',
    '16.11.2023 09:48:52',
    1
  );
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (8, 2, '2023-11-10 01:04:15', '', 1);
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    9,
    1,
    '2023-11-16 06:53:49',
    '01.05.2024 05:46:53',
    1
  );
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    10,
    1,
    '2023-11-16 10:55:51',
    '16.11.2023 12:55:51',
    1
  );
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    11,
    2,
    '2023-11-16 13:10:44',
    '16.11.2023 15:11:15',
    1
  );
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    12,
    1,
    '2024-04-13 12:51:55',
    '13.04.2024 12:51:55',
    1
  );
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    13,
    1,
    '2024-05-05 10:36:42',
    '14.05.2024 23:29:06',
    1
  );
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    14,
    1,
    '2024-05-11 03:56:54',
    '11.05.2024 03:56:54',
    1
  );
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    15,
    1,
    '2024-05-11 20:00:28',
    '14.05.2024 03:32:41',
    1
  );
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    16,
    4,
    '2024-05-13 15:28:20',
    '13.05.2024 15:28:20',
    1
  );
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    20,
    4,
    '2024-05-15 22:12:45',
    '15.05.2024 22:13:07',
    1
  );
INSERT INTO
  `employee_work_exp` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    21,
    4,
    '2024-05-15 22:16:01',
    '15.05.2024 22:17:30',
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: employee_work_exp_body
# ------------------------------------------------------------

INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    1,
    1,
    'В том числе руководящие работники',
    '{\"before3\": 3, \"from3to5\": 10}',
    '{\"before3\": 3, \"from3to5\": 10}',
    5
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    5,
    5,
    '',
    '{\"col4\": 5, \"col5\": 1, \"col6\": 0, \"col7\": 0, \"col8\": 4, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 7, \"col13\": 0, \"col14\": 0, \"col15\": 10, \"col16\": 0, \"col17\": 0}',
    22
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    6,
    5,
    '',
    '{\"col4\": 7, \"col5\": 0, \"col6\": 2, \"col7\": 0, \"col8\": 0, \"col9\": 5, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 8, \"col14\": 0, \"col15\": 0, \"col16\": 11, \"col17\": 0}',
    22
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    7,
    5,
    '',
    '{\"col4\": 9, \"col5\": 0, \"col6\": 0, \"col7\": 3, \"col8\": 0, \"col9\": 0, \"col10\": 6}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 9, \"col15\": 0, \"col16\": 0, \"col17\": 12}',
    22
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    15,
    8,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    16,
    8,
    'фыв',
    '{\"col4\": 0, \"col5\": 999, \"col6\": 999, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}',
    124
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    17,
    8,
    'рвырвыр',
    '{\"col4\": 0, \"col5\": 325, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 235, \"col10\": 0}',
    '{\"col12\": 999, \"col13\": 0, \"col14\": 0, \"col15\": 253, \"col16\": 0, \"col17\": 999}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    18,
    8,
    'фыпыфп',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 999, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}',
    999
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    19,
    8,
    'фыпфыпыф',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 124, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 234, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}',
    999
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    20,
    8,
    'фыв',
    '{\"col4\": 0, \"col5\": 999, \"col6\": 999, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}',
    124
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    21,
    8,
    'рвырвыр',
    '{\"col4\": 0, \"col5\": 325, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 235, \"col10\": 0}',
    '{\"col12\": 999, \"col13\": 0, \"col14\": 0, \"col15\": 253, \"col16\": 0, \"col17\": 999}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    22,
    8,
    'фыпыфп',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 999, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}',
    999
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    23,
    8,
    'фыпфыпыф',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 124, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 234, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}',
    999
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    28,
    7,
    'фыв',
    '{\"col4\": 1998, \"col5\": 999, \"col6\": 999, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 124}',
    124
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    29,
    7,
    'рвырвыр',
    '{\"col4\": 560, \"col5\": 325, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 235, \"col10\": 0}',
    '{\"col12\": 999, \"col13\": 0, \"col14\": 0, \"col15\": 253, \"col16\": 0, \"col17\": 999, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    30,
    7,
    'фыпыфп',
    '{\"col4\": 999, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 999, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 999}',
    999
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    31,
    7,
    'фыпфыпыф',
    '{\"col4\": 124, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 124, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 234, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 999}',
    999
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    32,
    4,
    '',
    '{\"col4\": 5, \"col5\": 1, \"col6\": 0, \"col7\": 0, \"col8\": 4, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 7, \"col13\": 0, \"col14\": 0, \"col15\": 10, \"col16\": 0, \"col17\": 0, \"col18\": 22}',
    22
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    33,
    4,
    'смтвапвап',
    '{\"col4\": 7, \"col5\": 0, \"col6\": 2, \"col7\": 0, \"col8\": 0, \"col9\": 5, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 8, \"col14\": 0, \"col15\": 0, \"col16\": 11, \"col17\": 0, \"col18\": 22}',
    22
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    34,
    4,
    '',
    '{\"col4\": 9, \"col5\": 0, \"col6\": 0, \"col7\": 3, \"col8\": 0, \"col9\": 0, \"col10\": 6}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 9, \"col15\": 0, \"col16\": 0, \"col17\": 12, \"col18\": 22}',
    22
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    35,
    6,
    'фыв',
    '{\"col4\": 1998, \"col5\": 999, \"col6\": 999, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 124}',
    124
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    36,
    6,
    'рвырвыр',
    '{\"col4\": 560, \"col5\": 325, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 235, \"col10\": 0}',
    '{\"col12\": 999, \"col13\": 0, \"col14\": 0, \"col15\": 253, \"col16\": 0, \"col17\": 999, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    37,
    6,
    'фыпыфп',
    '{\"col4\": 999, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 999, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 999}',
    999
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    38,
    10,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    43,
    11,
    'Численность работников всего',
    '{\"col4\": 21, \"col5\": 10, \"col6\": 2, \"col7\": 3, \"col8\": 1, \"col9\": 4, \"col10\": 1}',
    '{\"col12\": 4, \"col13\": 0, \"col14\": 5, \"col15\": 6, \"col16\": 7, \"col17\": 2, \"col18\": 2}',
    2
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    44,
    11,
    'В ТОМ ЧИСЛЕ РУКОВДЯЩИЕ РАБОТНИКИ',
    '{\"col4\": 1001, \"col5\": 1, \"col6\": 1, \"col7\": 999, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    81,
    12,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    211,
    9,
    'люди',
    '{\"col4\": 10, \"col5\": 5, \"col6\": 0, \"col7\": 3, \"col8\": 2, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 1, \"col13\": 2, \"col14\": 3, \"col15\": 6, \"col16\": 0, \"col17\": 5, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    212,
    9,
    'коты',
    '{\"col4\": 37, \"col5\": 5, \"col6\": 5, \"col7\": 20, \"col8\": 0, \"col9\": 0, \"col10\": 7}',
    '{\"col12\": 0, \"col13\": 11, \"col14\": 24, \"col15\": 4, \"col16\": 0, \"col17\": 0, \"col18\": 48}',
    48
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    213,
    9,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    214,
    9,
    '',
    '{\"col4\": 17, \"col5\": 0, \"col6\": 8, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 9}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    215,
    9,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    216,
    9,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 1}',
    1
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    217,
    9,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    226,
    14,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    227,
    14,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    231,
    16,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}',
    999
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    232,
    16,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0}',
    42
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    255,
    15,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 1, \"col13\": 1, \"col14\": 1, \"col15\": 1, \"col16\": 1, \"col17\": 1, \"col18\": 1}',
    1
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    256,
    15,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 2}',
    2
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    257,
    15,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    304,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 1, \"col18\": 4}',
    4
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    305,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 11, \"col18\": 44}',
    44
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    306,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    307,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    308,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    309,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    310,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    311,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    312,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    313,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    314,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    315,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    316,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    317,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    318,
    13,
    '',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    341,
    20,
    'Численность работников - всего (сумма строк 02, 06, 21, 22)',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 1, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    342,
    20,
    'в том числе: руководящие работники - всего',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    343,
    20,
    'из них: директор (начальник)',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 2, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    344,
    20,
    'из них: заместители директора (начальника)',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    345,
    20,
    'из них: руководитель филиала',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 3, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    346,
    20,
    'в том числе: педагогические работники - всего (сумма строк 07,12-20)',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    347,
    20,
    'в том числе: преподаватели - всего (сумма строк 8-11)',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    348,
    20,
    'из них: общеобразовательных дисциплин',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    349,
    20,
    'из них: общего гуманитарного и социально-экономического учебного цикла',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    350,
    20,
    'из них: математического и общего естественнонаучного учебного цикла',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    351,
    20,
    'из них: профессионального учебного цикла',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    352,
    20,
    'в том числе: мастера производственного обучения',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    353,
    20,
    'в том числе: социальные педагоги',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    354,
    20,
    'в том числе: педагоги-психологи',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    355,
    20,
    'в том числе: педагоги-организаторы',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    356,
    20,
    'в том числе: преподаватели-организаторы (основ безопасности жизнедеятельности, допризывной подготовки)',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    357,
    20,
    'в том числе: руководители физического воспитания',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    358,
    20,
    'в том числе: методисты',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    359,
    20,
    'в том числе: тьюторы',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    360,
    20,
    'в том числе: прочие',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    361,
    20,
    'в том числе: учебно-вспомогательный персонал',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    362,
    20,
    'в том числе: обслуживающий персонал',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    385,
    21,
    'Численность работников - всего (сумма строк 02, 06, 21, 22)',
    '{\"col4\": 2, \"col5\": 1, \"col6\": 1, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 1, \"col13\": 1, \"col14\": 1, \"col15\": 1, \"col16\": 1, \"col17\": 1, \"col18\": 1}',
    1
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    386,
    21,
    'в том числе: руководящие работники - всего',
    '{\"col4\": 240, \"col5\": 10, \"col6\": 230, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 10, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 20}',
    20
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    387,
    21,
    'из них: директор (начальник)',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 30, \"col14\": 0, \"col15\": 20, \"col16\": 30, \"col17\": 2, \"col18\": 30}',
    30
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    388,
    21,
    'из них: заместители директора (начальника)',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 2, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    389,
    21,
    'из них: руководитель филиала',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    390,
    21,
    'в том числе: педагогические работники - всего (сумма строк 07,12-20)',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    391,
    21,
    'в том числе: преподаватели - всего (сумма строк 8-11)',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    392,
    21,
    'из них: общеобразовательных дисциплин',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    393,
    21,
    'из них: общего гуманитарного и социально-экономического учебного цикла',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    394,
    21,
    'из них: математического и общего естественнонаучного учебного цикла',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    395,
    21,
    'из них: профессионального учебного цикла',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    396,
    21,
    'в том числе: мастера производственного обучения',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    397,
    21,
    'в том числе: социальные педагоги',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    398,
    21,
    'в том числе: педагоги-психологи',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    399,
    21,
    'в том числе: педагоги-организаторы',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    400,
    21,
    'в том числе: преподаватели-организаторы (основ безопасности жизнедеятельности, допризывной подготовки)',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    401,
    21,
    'в том числе: руководители физического воспитания',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    402,
    21,
    'в том числе: методисты',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    403,
    21,
    'в том числе: тьюторы',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    404,
    21,
    'в том числе: прочие',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    405,
    21,
    'в том числе: учебно-вспомогательный персонал',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );
INSERT INTO
  `employee_work_exp_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_exp`,
    `teach_exp`,
    `not_exp`
  )
VALUES
  (
    406,
    21,
    'в том числе: обслуживающий персонал',
    '{\"col4\": 0, \"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0}',
    '{\"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: enrollment
# ------------------------------------------------------------

INSERT INTO
  `enrollment` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    1,
    2,
    '2023-11-15 07:09:08',
    '14.05.2024 06:33:14',
    1
  );
INSERT INTO
  `enrollment` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    4,
    1,
    '2024-05-14 15:17:55',
    '14.05.2024 15:17:55',
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: enrollment_body
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: invalids
# ------------------------------------------------------------

INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    1,
    1,
    '2023-11-16 07:18:19',
    '16.11.2023 10:32:25',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    2,
    1,
    '2023-11-16 07:19:29',
    '16.11.2023 11:26:30',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (3, 1, '2023-11-16 07:20:54', NULL, 1);
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    4,
    1,
    '2023-11-16 07:25:23',
    '16.11.2023 09:25:25',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    5,
    1,
    '2023-11-16 07:26:01',
    '16.11.2023 09:26:03',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    6,
    1,
    '2023-11-16 07:41:43',
    '16.11.2023 09:41:45',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    7,
    1,
    '2023-11-16 07:46:13',
    '16.11.2023 09:46:13',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    8,
    1,
    '2023-11-16 10:58:04',
    '16.11.2023 12:58:04',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    9,
    3,
    '2023-11-16 11:34:36',
    '16.11.2023 13:34:38',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    10,
    2,
    '2023-11-16 12:18:49',
    '16.11.2023 14:18:49',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    11,
    2,
    '2023-11-16 13:16:09',
    '14.05.2024 03:58:47',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    12,
    2,
    '2023-11-16 13:18:22',
    '16.11.2023 15:18:22',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    13,
    1,
    '2024-05-14 04:12:52',
    '16.11.2023 15:18:22',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    14,
    1,
    '2024-05-14 04:13:08',
    '16.11.2023 15:18:22',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    15,
    1,
    '2024-05-14 04:13:45',
    '16.11.2023 15:18:22',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    16,
    1,
    '2024-05-14 04:13:45',
    '16.11.2023 15:18:22',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    17,
    1,
    '2024-05-14 04:14:17',
    '14.05.2024 04:14:17',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    18,
    1,
    '2024-05-14 04:14:18',
    '14.05.2024 21:26:37',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    19,
    1,
    '2024-05-14 04:14:29',
    '14.05.2024 04:14:29',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    20,
    1,
    '2024-05-14 04:14:30',
    '14.05.2024 23:30:01',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    21,
    1,
    '2024-05-14 04:14:41',
    '14.05.2024 04:14:41',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    22,
    1,
    '2024-05-14 04:15:23',
    '14.05.2024 04:15:23',
    1
  );
INSERT INTO
  `invalids` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    23,
    1,
    '2024-05-15 23:33:23',
    '16.05.2024 07:39:57',
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: invalids_body
# ------------------------------------------------------------

INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    10,
    2,
    '',
    '',
    '1',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    11,
    8,
    '',
    '',
    '1',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    12,
    8,
    '',
    '',
    '1',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    13,
    9,
    '',
    '',
    '1',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    14,
    10,
    'fdfd',
    'dfdf',
    '1',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    15,
    10,
    'dffd',
    'fdfd',
    '1',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    53,
    11,
    'ГАПОУ \"Педагогический колледж\" г.Бугуруслана',
    '',
    '1',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 1, \"col13\": 2, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    54,
    11,
    '',
    '',
    '1',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 4, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 1, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    55,
    11,
    '',
    '',
    '1',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 222, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    56,
    15,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 1, \"col6\": 1, \"col7\": 1, \"col8\": 1, \"col9\": 1}',
    '{\"col11\": 313, \"col12\": 999, \"col13\": 141, \"col14\": 4, \"col15\": 14, \"col16\": 14, \"col17\": 14, \"col18\": 141, \"col19\": 4, \"col20\": 14, \"col21\": 14, \"col22\": 14, \"col23\": 14, \"col24\": 14, \"col25\": 14, \"col26\": 14, \"col27\": 14, \"col28\": 14}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    57,
    16,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 1, \"col6\": 1, \"col7\": 1, \"col8\": 1, \"col9\": 1}',
    '{\"col11\": 313, \"col12\": 999, \"col13\": 141, \"col14\": 4, \"col15\": 14, \"col16\": 14, \"col17\": 14, \"col18\": 141, \"col19\": 4, \"col20\": 14, \"col21\": 14, \"col22\": 14, \"col23\": 14, \"col24\": 14, \"col25\": 14, \"col26\": 14, \"col27\": 14, \"col28\": 14}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    58,
    17,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 1, \"col6\": 1, \"col7\": 1, \"col8\": 1, \"col9\": 1}',
    '{\"col11\": 313, \"col12\": 999, \"col13\": 141, \"col14\": 4, \"col15\": 14, \"col16\": 14, \"col17\": 14, \"col18\": 141, \"col19\": 4, \"col20\": 14, \"col21\": 14, \"col22\": 14, \"col23\": 14, \"col24\": 14, \"col25\": 14, \"col26\": 14, \"col27\": 14, \"col28\": 14}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    59,
    17,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '14',
    '14',
    '{\"col5\": 14, \"col6\": 14, \"col7\": 14, \"col8\": 14, \"col9\": 14}',
    '{\"col11\": 14, \"col12\": 41, \"col13\": 414, \"col14\": 154, \"col15\": 15, \"col16\": 15, \"col17\": 15, \"col18\": 15, \"col19\": 15, \"col20\": 154, \"col21\": 14, \"col22\": 14, \"col23\": 14, \"col24\": 14, \"col25\": 14, \"col26\": 14, \"col27\": 14, \"col28\": 14}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    60,
    17,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 13, \"col6\": 999, \"col7\": 3, \"col8\": 13, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    64,
    19,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 1, \"col6\": 1, \"col7\": 1, \"col8\": 1, \"col9\": 1}',
    '{\"col11\": 313, \"col12\": 999, \"col13\": 141, \"col14\": 4, \"col15\": 14, \"col16\": 14, \"col17\": 14, \"col18\": 141, \"col19\": 4, \"col20\": 14, \"col21\": 14, \"col22\": 14, \"col23\": 14, \"col24\": 14, \"col25\": 14, \"col26\": 14, \"col27\": 14, \"col28\": 14}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    65,
    19,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '14',
    '14',
    '{\"col5\": 14, \"col6\": 14, \"col7\": 14, \"col8\": 14, \"col9\": 14}',
    '{\"col11\": 14, \"col12\": 41, \"col13\": 414, \"col14\": 154, \"col15\": 15, \"col16\": 15, \"col17\": 15, \"col18\": 15, \"col19\": 15, \"col20\": 154, \"col21\": 14, \"col22\": 14, \"col23\": 14, \"col24\": 14, \"col25\": 14, \"col26\": 14, \"col27\": 14, \"col28\": 14}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    66,
    19,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 13, \"col6\": 999, \"col7\": 3, \"col8\": 13, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    70,
    21,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 321, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    71,
    21,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 321, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    72,
    22,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 999, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    82,
    18,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 1, \"col6\": 1, \"col7\": 1, \"col8\": 1, \"col9\": 1}',
    '{\"col11\": 313, \"col12\": 999, \"col13\": 141, \"col14\": 4, \"col15\": 14, \"col16\": 14, \"col17\": 14, \"col18\": 141, \"col19\": 4, \"col20\": 14, \"col21\": 14, \"col22\": 14, \"col23\": 123, \"col24\": 5, \"col25\": 14, \"col26\": 14, \"col27\": 14, \"col28\": 14}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    83,
    18,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '14',
    '14',
    '{\"col5\": 14, \"col6\": 14, \"col7\": 14, \"col8\": 14, \"col9\": 14}',
    '{\"col11\": 14, \"col12\": 41, \"col13\": 414, \"col14\": 154, \"col15\": 15, \"col16\": 15, \"col17\": 15, \"col18\": 15, \"col19\": 15, \"col20\": 154, \"col21\": 14, \"col22\": 14, \"col23\": 14, \"col24\": 14, \"col25\": 14, \"col26\": 14, \"col27\": 14, \"col28\": 14}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    84,
    18,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 13, \"col6\": 999, \"col7\": 3, \"col8\": 13, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 2, \"col19\": 0, \"col20\": 33, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    85,
    20,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 1, \"col6\": 1, \"col7\": 1, \"col8\": 1, \"col9\": 1}',
    '{\"col11\": 313, \"col12\": 999, \"col13\": 141, \"col14\": 4, \"col15\": 14, \"col16\": 14, \"col17\": 14, \"col18\": 141, \"col19\": 4, \"col20\": 14, \"col21\": 14, \"col22\": 14, \"col23\": 14, \"col24\": 14, \"col25\": 14, \"col26\": 14, \"col27\": 14, \"col28\": 14}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    86,
    20,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '14',
    '14',
    '{\"col5\": 14, \"col6\": 14, \"col7\": 14, \"col8\": 14, \"col9\": 14}',
    '{\"col11\": 14, \"col12\": 41, \"col13\": 414, \"col14\": 154, \"col15\": 15, \"col16\": 15, \"col17\": 15, \"col18\": 15, \"col19\": 15, \"col20\": 154, \"col21\": 14, \"col22\": 14, \"col23\": 14, \"col24\": 14, \"col25\": 14, \"col26\": 14, \"col27\": 14, \"col28\": 9}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    87,
    20,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 13, \"col6\": 999, \"col7\": 3, \"col8\": 13, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    88,
    20,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '',
    '1',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 7, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    117,
    23,
    'Министерство Просвящения',
    'Архитектура',
    '07.02.01',
    '{\"col5\": 1, \"col6\": 1, \"col7\": 3, \"col8\": 4, \"col9\": 1}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 1, \"col15\": 0, \"col16\": 0, \"col17\": 3, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 1, \"col22\": 0, \"col23\": 0, \"col24\": 1, \"col25\": 0, \"col26\": 10, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    118,
    23,
    'Министерство Просвящения',
    'Программирование в компьютерных системах',
    '09.02.03',
    '{\"col5\": 0, \"col6\": 1, \"col7\": 2, \"col8\": 3, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 1, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 1, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 1, \"col23\": 0, \"col24\": 0, \"col25\": 1, \"col26\": 0, \"col27\": 0, \"col28\": 2}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    119,
    23,
    'Министерство Просвящения',
    'Машинист паровых турбин',
    '13.01.02',
    '{\"col5\": 1, \"col6\": 3, \"col7\": 0, \"col8\": 3, \"col9\": 0}',
    '{\"col11\": 1, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 2, \"col16\": 0, \"col17\": 0, \"col18\": 3, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 1, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    120,
    23,
    'Министерство Просвящения',
    'Проверка',
    '05.01.03',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 2, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 2, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    121,
    23,
    'Министерство Просвящения',
    '',
    '00.00.00',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    122,
    23,
    'Министерство Просвящения',
    '',
    '00.00.00',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    123,
    23,
    'Министерство Просвящения',
    '',
    '00.00.00',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    124,
    23,
    'Министерство Просвящения',
    '',
    '00.00.00',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    125,
    23,
    'Министерство Просвящения',
    '',
    '00.00.00',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    126,
    23,
    'Министерство Просвящения',
    '',
    '00.00.00',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    127,
    23,
    'Министерство Просвящения',
    '',
    '00.00.00',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    128,
    23,
    'Министерство Просвящения',
    '',
    '00.00.00',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    129,
    23,
    'Министерство Просвящения',
    '',
    '00.00.00',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    130,
    23,
    'Министерство Просвящения',
    '',
    '00.00.00',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );
INSERT INTO
  `invalids_body` (
    `id`,
    `id_doc`,
    `name_poo`,
    `specialnost`,
    `code_of_specialnost`,
    `counts`,
    `diagnoses`
  )
VALUES
  (
    131,
    23,
    'Министерство Просвящения',
    '',
    '00.00.00',
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0}',
    '{\"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0, \"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0, \"col19\": 0, \"col20\": 0, \"col21\": 0, \"col22\": 0, \"col23\": 0, \"col24\": 0, \"col25\": 0, \"col26\": 0, \"col27\": 0, \"col28\": 0}'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: logs
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: obrazovanie
# ------------------------------------------------------------

INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    1,
    1,
    '2023-11-16 08:51:36',
    '14.05.2024 23:25:47',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    8,
    2,
    '2023-11-16 12:13:30',
    '16.11.2023 14:13:30',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    9,
    2,
    '2023-11-16 12:17:21',
    '16.11.2023 14:17:21',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    10,
    1,
    '2024-05-07 23:48:49',
    '07.05.2024 23:48:49',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    11,
    1,
    '2024-05-07 23:51:49',
    '07.05.2024 23:51:49',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    12,
    1,
    '2024-05-07 23:53:08',
    '07.05.2024 23:53:07',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    13,
    1,
    '2024-05-07 23:54:41',
    '07.05.2024 23:54:41',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    14,
    1,
    '2024-05-07 23:55:47',
    '07.05.2024 23:55:47',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    15,
    1,
    '2024-05-08 00:02:04',
    '08.05.2024 00:02:04',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    16,
    1,
    '2024-05-08 00:03:14',
    '08.05.2024 00:03:14',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    17,
    1,
    '2024-05-11 03:56:16',
    '11.05.2024 03:56:16',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    18,
    8,
    '2024-05-13 23:01:14',
    '13.05.2024 23:01:14',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    19,
    1,
    '2024-05-14 15:23:38',
    '14.05.2024 15:23:38',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    20,
    1,
    '2024-05-14 15:29:41',
    '14.05.2024 15:29:41',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    21,
    1,
    '2024-05-14 15:30:28',
    '14.05.2024 15:30:28',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    22,
    1,
    '2024-05-14 15:33:59',
    '14.05.2024 15:33:59',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    23,
    1,
    '2024-05-14 15:34:19',
    '14.05.2024 15:34:19',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    24,
    1,
    '2024-05-14 15:42:07',
    '14.05.2024 15:42:07',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    25,
    1,
    '2024-05-14 15:49:46',
    '14.05.2024 15:49:46',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    26,
    1,
    '2024-05-14 15:53:10',
    '14.05.2024 15:53:10',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    27,
    1,
    '2024-05-14 18:25:11',
    '14.05.2024 18:25:11',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    28,
    1,
    '2024-05-14 18:26:19',
    '14.05.2024 18:26:19',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    29,
    1,
    '2024-05-14 18:26:20',
    '14.05.2024 18:26:19',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    30,
    1,
    '2024-05-14 18:27:04',
    '14.05.2024 18:27:04',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    31,
    1,
    '2024-05-14 18:27:05',
    '14.05.2024 18:27:04',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    32,
    1,
    '2024-05-14 18:28:33',
    '14.05.2024 18:28:33',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    33,
    1,
    '2024-05-14 18:28:55',
    '14.05.2024 18:28:55',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    34,
    1,
    '2024-05-14 20:38:02',
    '14.05.2024 21:12:33',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    35,
    1,
    '2024-05-14 21:14:50',
    '14.05.2024 22:26:00',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    36,
    1,
    '2024-05-14 21:28:45',
    '14.05.2024 21:28:45',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    37,
    1,
    '2024-05-14 22:14:20',
    '14.05.2024 22:20:50',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    38,
    1,
    '2024-05-14 22:21:26',
    '14.05.2024 22:22:10',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    39,
    1,
    '2024-05-14 22:22:26',
    '14.05.2024 22:22:42',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    40,
    1,
    '2024-05-14 22:28:11',
    '14.05.2024 23:14:10',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    41,
    1,
    '2024-05-14 22:41:21',
    '14.05.2024 22:41:29',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    42,
    1,
    '2024-05-14 22:41:35',
    '14.05.2024 22:47:59',
    1
  );
INSERT INTO
  `obrazovanie` (
    `id`,
    `id_user`,
    `dateCreate`,
    `timeLastEdit`,
    `disabled`
  )
VALUES
  (
    43,
    4,
    '2024-05-15 22:13:32',
    '16.05.2024 00:54:22',
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: obrazovanie_body
# ------------------------------------------------------------

INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    2,
    24,
    '',
    2,
    '{\"col5\": 90, \"col6\": 846, \"col7\": 512, \"col8\": 612, \"col9\": 999, \"col10\": 65, \"col11\": 165, \"col12\": 999, \"col13\": 43, \"col14\": 999}',
    '{\"col15\": 15, \"col16\": 415, \"col17\": 321, \"col18\": 1}',
    1
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    3,
    24,
    '',
    2,
    '{\"col5\": 90, \"col6\": 846, \"col7\": 512, \"col8\": 612, \"col9\": 999, \"col10\": 65, \"col11\": 165, \"col12\": 999, \"col13\": 43, \"col14\": 999}',
    '{\"col15\": 15, \"col16\": 415, \"col17\": 321, \"col18\": 1}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    4,
    32,
    'ыфвыв213',
    1,
    '{\"col5\": 999, \"col6\": 23, \"col7\": 999, \"col8\": 232, \"col9\": 32, \"col10\": 32, \"col11\": 3, \"col12\": 232, \"col13\": 3, \"col14\": 23}',
    '{\"col15\": 23, \"col16\": 23, \"col17\": 232, \"col18\": 3}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    5,
    32,
    '124м42мм',
    2,
    '{\"col5\": 24, \"col6\": 242, \"col7\": 4, \"col8\": 24, \"col9\": 24, \"col10\": 24, \"col11\": 24, \"col12\": 999, \"col13\": 242, \"col14\": 999}',
    '{\"col15\": 42, \"col16\": 4, \"col17\": 24, \"col18\": 24}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    6,
    32,
    'м23ап3а',
    3,
    '{\"col5\": 3, \"col6\": 3, \"col7\": 3, \"col8\": 3, \"col9\": 33, \"col10\": 0, \"col11\": 999, \"col12\": 35, \"col13\": 999, \"col14\": 25}',
    '{\"col15\": 25, \"col16\": 25, \"col17\": 252, \"col18\": 52}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    7,
    32,
    'п43п2й',
    4,
    '{\"col5\": 4, \"col6\": 34, \"col7\": 999, \"col8\": 24, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    8,
    33,
    '123',
    1,
    '{\"col5\": 23, \"col6\": 23, \"col7\": 23, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    11,
    34,
    'фывфыв',
    1,
    '{\"col5\": 51, \"col6\": 1, \"col7\": 2, \"col8\": 1, \"col9\": 1, \"col10\": 42, \"col11\": 4, \"col12\": 24, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    17,
    36,
    '',
    1,
    '{\"col5\": 1998, \"col6\": 0, \"col7\": 0, \"col8\": 999, \"col9\": 999, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    54,
    37,
    '',
    1,
    '{\"col5\": 13, \"col6\": 1, \"col7\": 1, \"col8\": 1, \"col9\": 1, \"col10\": 2, \"col11\": 3, \"col12\": 4, \"col13\": 5, \"col14\": 6}',
    '{\"col15\": 7, \"col16\": 8, \"col17\": 9, \"col18\": 10}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    55,
    37,
    '',
    2,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    56,
    37,
    '',
    3,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 123, \"col18\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    57,
    37,
    '',
    4,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 123}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    58,
    37,
    '',
    5,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0, \"col18\": 321}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    62,
    38,
    '',
    1,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 123, \"col18\": 1}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    64,
    39,
    '',
    1,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 55, \"col18\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    68,
    35,
    '',
    1,
    '{\"col5\": 7, \"col6\": 1, \"col7\": 1, \"col8\": 1, \"col9\": 1, \"col10\": 1, \"col11\": 1, \"col12\": 1, \"col13\": 1, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 4, \"col18\": 123}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    145,
    41,
    'asdsad',
    1,
    '{\"col5\": 7, \"col6\": 1, \"col7\": 1, \"col8\": 1, \"col9\": 1, \"col10\": 1, \"col11\": 1, \"col12\": 1, \"col13\": 1, \"col14\": 1}',
    '{\"col15\": 1, \"col16\": 1, \"col17\": 1, \"col18\": 55}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    146,
    41,
    '312as',
    2,
    '{\"col5\": 16, \"col6\": 1, \"col7\": 1, \"col8\": 1, \"col9\": 10, \"col10\": 1, \"col11\": 1, \"col12\": 1, \"col13\": 1, \"col14\": 10}',
    '{\"col15\": 10, \"col16\": 1, \"col17\": 10, \"col18\": 123}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    149,
    42,
    'asdasd',
    1,
    '{\"col5\": 1, \"col6\": 1, \"col7\": 1, \"col8\": 1, \"col9\": 1, \"col10\": 1, \"col11\": 1, \"col12\": 1, \"col13\": 1, \"col14\": 1}',
    '{\"col15\": 1, \"col16\": 33, \"col17\": 213}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    160,
    40,
    'samolet',
    1,
    '{\"col5\": 28, \"col6\": 11, \"col7\": 2, \"col8\": 22, \"col9\": 4, \"col10\": 5, \"col11\": 222, \"col12\": 7, \"col13\": 9, \"col14\": 10}',
    '{\"col15\": 11, \"col16\": 12, \"col17\": 13}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    161,
    40,
    'тест',
    2,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    162,
    1,
    '',
    1,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 2}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    163,
    1,
    '',
    2,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    164,
    1,
    '',
    3,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    231,
    43,
    'Численность работников - всего (сумма строк 02, 06, 21, 22)',
    1,
    '{\"col5\": 1, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    232,
    43,
    'в том числе: руководящие работники - всего',
    2,
    '{\"col5\": 2, \"col6\": 2, \"col7\": 2, \"col8\": 2, \"col9\": 2, \"col10\": 2, \"col11\": 2, \"col12\": 2, \"col13\": 2, \"col14\": 1}',
    '{\"col15\": 1, \"col16\": 1, \"col17\": 1}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    233,
    43,
    'из них: директор (начальник)',
    3,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    234,
    43,
    'из них: заместители директора (начальника)',
    4,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    235,
    43,
    'из них: руководитель филиала',
    5,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    236,
    43,
    'в том числе: педагогические работники - всего (сумма строк 07,12-20)',
    6,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    237,
    43,
    'в том числе: преподаватели - всего (сумма строк 8-11)',
    7,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    238,
    43,
    'из них: общеобразовательных дисциплин',
    8,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    239,
    43,
    'из них: общего гуманитарного и социально-экономического учебного цикла',
    9,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    240,
    43,
    'из них: математического и общего естественнонаучного учебного цикла',
    10,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    241,
    43,
    'из них: профессионального учебного цикла',
    11,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    242,
    43,
    'в том числе: мастера производственного обучения',
    12,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    243,
    43,
    'в том числе: социальные педагоги',
    13,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    244,
    43,
    'в том числе: педагоги-психологи',
    14,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    245,
    43,
    'в том числе: педагоги-организаторы',
    15,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    246,
    43,
    'в том числе: преподаватели-организаторы (основ безопасности жизнедеятельности, допризывной подготовки)',
    16,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    247,
    43,
    'в том числе: руководители физического воспитания',
    17,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    248,
    43,
    'в том числе: методисты',
    18,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    249,
    43,
    'в том числе: тьюторы',
    19,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    250,
    43,
    'в том числе: прочие',
    20,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    251,
    43,
    'в том числе: учебно-вспомогательный персонал',
    21,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );
INSERT INTO
  `obrazovanie_body` (
    `id`,
    `id_doc`,
    `name_of_indicators`,
    `all_obr`,
    `have_obr`,
    `kval_cat`,
    `full_zan`
  )
VALUES
  (
    252,
    43,
    'в том числе: обслуживающий персонал',
    22,
    '{\"col5\": 0, \"col6\": 0, \"col7\": 0, \"col8\": 0, \"col9\": 0, \"col10\": 0, \"col11\": 0, \"col12\": 0, \"col13\": 0, \"col14\": 0}',
    '{\"col15\": 0, \"col16\": 0, \"col17\": 0}',
    99999
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: orgazizations
# ------------------------------------------------------------

INSERT INTO
  `orgazizations` (
    `id`,
    `title`,
    `inn`,
    `kpp`,
    `ogrn`,
    `ur_address`,
    `administrator_org`,
    `id_city`
  )
VALUES
  (-2, 'Отсутствует', '0', '0', '0', '', 1, 0);
INSERT INTO
  `orgazizations` (
    `id`,
    `title`,
    `inn`,
    `kpp`,
    `ogrn`,
    `ur_address`,
    `administrator_org`,
    `id_city`
  )
VALUES
  (-1, 'Не выбрано', '0', '0', '0', '', 1, 0);
INSERT INTO
  `orgazizations` (
    `id`,
    `title`,
    `inn`,
    `kpp`,
    `ogrn`,
    `ur_address`,
    `administrator_org`,
    `id_city`
  )
VALUES
  (
    1,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '5602001385',
    '560201001',
    '1025600544408',
    '461636, Оренбургская Область, г.о. Город Бугуруслан, г Бугуруслан, ул Челюскина, зд. 41',
    1,
    1434
  );
INSERT INTO
  `orgazizations` (
    `id`,
    `title`,
    `inn`,
    `kpp`,
    `ogrn`,
    `ur_address`,
    `administrator_org`,
    `id_city`
  )
VALUES
  (
    2,
    'ГБПОУ ВО \"БСХТ\"',
    '5602001755',
    '560201001',
    '1025600543847',
    '461630, Оренбургская Область, г.о. Город Бугуруслан, г Бугуруслан, ул Московская, зд. 56',
    2,
    1434
  );
INSERT INTO
  `orgazizations` (
    `id`,
    `title`,
    `inn`,
    `kpp`,
    `ogrn`,
    `ur_address`,
    `administrator_org`,
    `id_city`
  )
VALUES
  (
    3,
    'МОСКОВСКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ ИМЕНИ М.В.ЛОМОНОСОВА',
    '7729082090',
    '772901001',
    '1037700258694',
    '119234, г. Москва, вн.тер.г. Муниципальный Округ Раменки, тер Ленинские Горы, д. 1',
    3,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: regions
# ------------------------------------------------------------

INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (-1, 'Не выбрано');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (1, 'Москва и Московская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (2, 'Санкт-Петербург и область');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (4, 'Алтайский край');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (5, 'Амурская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (6, 'Архангельская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (7, 'Астраханская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (8, 'Башкортостан(Башкирия)');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (9, 'Белгородская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (10, 'Брянская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (11, 'Бурятия');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (12, 'Владимирская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (13, 'Волгоградская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (14, 'Вологодская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (15, 'Воронежская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (16, 'Дагестан');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (18, 'Ивановская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (19, 'Иркутская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (20, 'Кабардино-Балкария');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (21, 'Калининградская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (22, 'Калмыкия');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (23, 'Калужская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (24, 'Камчатская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (26, 'Кемеровская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (27, 'Кировская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (28, 'Коми');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (29, 'Костромская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (30, 'Краснодарский край');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (31, 'Красноярский край');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (32, 'Курганская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (33, 'Курская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (34, 'Липецкая обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (35, 'Магаданская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (36, 'Марий Эл');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (37, 'Мордовия');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (38, 'Мурманская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (40, 'Новгородская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (41, 'Новосибирская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (42, 'Омская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (43, 'Оренбургская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (44, 'Орловская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (45, 'Пензенская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (46, 'Пермская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (47, 'Приморский край');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (48, 'Псковская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (49, 'Ростовская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (50, 'Рязанская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (51, 'Самарская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (52, 'Саратовская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (53, 'Саха (Якутия)');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (54, 'Сахалин');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (55, 'Свердловская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (56, 'Северная Осетия');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (57, 'Смоленская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (58, 'Ставропольский край');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (59, 'Тамбовская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (60, 'Татарстан');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (61, 'Тверская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (62, 'Томская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (63, 'Тува (Тувинская Респ.)');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (64, 'Тульская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (65, 'Тюменская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (66, 'Удмуртия');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (67, 'Ульяновская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (68, 'Уральская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (69, 'Хабаровский край');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (71, 'Ханты-Мансийский АО');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (72, 'Челябинская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (73, 'Чечено-Ингушетия');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (74, 'Читинская обл.');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (75, 'Чувашия');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (76, 'Чукотский АО');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (77, 'Ямало-Ненецкий АО');
INSERT INTO
  `regions` (`id`, `text`)
VALUES
  (78, 'Ярославская обл.');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: users
# ------------------------------------------------------------

INSERT INTO
  `users` (
    `id`,
    `email`,
    `login`,
    `password`,
    `admin_lvl`,
    `darktheme`,
    `complectName`,
    `authkey`,
    `dateCreate`,
    `id_org`,
    `verify`,
    `id_city`,
    `disabled`
  )
VALUES
  (
    1,
    '',
    'dmitriy_smir1_2_3@mail.ru',
    '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',
    1,
    0,
    'Министерство Просвящения',
    '8gem6x5gb0i-3lt1ho23hmj-mmds3ze3t5-1;',
    '2023-11-09 16:49:21',
    1,
    1,
    1434,
    0
  );
INSERT INTO
  `users` (
    `id`,
    `email`,
    `login`,
    `password`,
    `admin_lvl`,
    `darktheme`,
    `complectName`,
    `authkey`,
    `dateCreate`,
    `id_org`,
    `verify`,
    `id_city`,
    `disabled`
  )
VALUES
  (
    2,
    '',
    'admin@mail.ru',
    '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',
    1,
    0,
    'Министерство Просвящения',
    'cqeg2l861fh-s3xaxw0y42-ouvppiaz01f-2;',
    '2023-11-12 01:12:38',
    1,
    1,
    1434,
    1
  );
INSERT INTO
  `users` (
    `id`,
    `email`,
    `login`,
    `password`,
    `admin_lvl`,
    `darktheme`,
    `complectName`,
    `authkey`,
    `dateCreate`,
    `id_org`,
    `verify`,
    `id_city`,
    `disabled`
  )
VALUES
  (
    3,
    '123',
    'user@mail.ru',
    '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',
    0,
    0,
    'ГАПОУ \"БНК\" Г. БУГУРУСЛАНА ОРЕНБУРГСКОЙ ОБЛАСТИ',
    '4rezerpimwi-e4v5dadazk-l7x47io9mpr-3;',
    '2023-11-13 07:14:48',
    1,
    1,
    1434,
    0
  );
INSERT INTO
  `users` (
    `id`,
    `email`,
    `login`,
    `password`,
    `admin_lvl`,
    `darktheme`,
    `complectName`,
    `authkey`,
    `dateCreate`,
    `id_org`,
    `verify`,
    `id_city`,
    `disabled`
  )
VALUES
  (
    4,
    'ne_znau.com',
    'CrazyCuts@mail.ru',
    '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',
    0,
    0,
    'ГАПОУ \"БСХТ\"',
    'oagsiitpfd-w4vqdt5xfu-zq8zafetc9-4;',
    '2024-04-13 13:14:55',
    1,
    0,
    1434,
    0
  );
INSERT INTO
  `users` (
    `id`,
    `email`,
    `login`,
    `password`,
    `admin_lvl`,
    `darktheme`,
    `complectName`,
    `authkey`,
    `dateCreate`,
    `id_org`,
    `verify`,
    `id_city`,
    `disabled`
  )
VALUES
  (
    6,
    NULL,
    'luciano_aventador@mail.ru',
    '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',
    0,
    0,
    'ГАПОУ \"Педагогический колледж\"',
    'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',
    '2024-05-13 18:11:01',
    -1,
    0,
    1434,
    0
  );
INSERT INTO
  `users` (
    `id`,
    `email`,
    `login`,
    `password`,
    `admin_lvl`,
    `darktheme`,
    `complectName`,
    `authkey`,
    `dateCreate`,
    `id_org`,
    `verify`,
    `id_city`,
    `disabled`
  )
VALUES
  (
    9,
    NULL,
    'samolet@mail.ru',
    '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',
    0,
    0,
    'samolet',
    '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e',
    '2024-05-15 22:10:12',
    -1,
    0,
    1434,
    0
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
