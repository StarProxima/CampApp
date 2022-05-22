-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 22 2022 г., 05:43
-- Версия сервера: 10.2.43-MariaDB
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `rustamxa_test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `achievements`
--

CREATE TABLE `achievements` (
  `ind` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `scores` int(11) NOT NULL DEFAULT 0,
  `urlPhoto` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `achievements`
--

INSERT INTO `achievements` (`ind`, `name`, `description`, `scores`, `urlPhoto`) VALUES
(1, 'Покушал', 'Смачно покушал', 15, 'https://sun9-45.userapi.com/s/v1/ig2/g9MNYFcYEA0E9O8mLCZHD5Qw72TxtJ-9mySaxgX_dDwzVdVv5K10FNP5Bl7cy5qMu2WX43yXs8lanv2K4-rAf_cO.jpg?size=570x567&quality=96&type=album'),
(2, 'Пляжный завсегдатай', 'Загореть на пляжу', 10, 'https://sun9-16.userapi.com/s/v1/ig2/_8Ff2fnBE3oRU6HJWLf0ZSB7QZ4VFFJ1mLBhkKhGap6fPHjpjzf9xrWnfMwd86BQ7D2lMKlR-ZNAcmtYFEcg1xhA.jpg?size=621x619&quality=96&type=album'),
(3, 'Мексиканец', 'Станцевать горячее танго', 20, 'https://sun9-77.userapi.com/s/v1/ig2/61ZCpzHsu6z8hmQImgkXHfh2phMduIhBP45g9_qX5oBfYFVFBGGAp0TUQ1CcZEOxjsUURVvNTMa5KHzCPgd7OLWn.jpg?size=652x652&quality=96&type=album'),
(4, 'Вместе - сила!', 'Всем отрядом сдвинуть тяжёлый камень', 15, 'https://sun9-80.userapi.com/s/v1/ig2/kqEveUAbncGbJNvkGeFnaoGoshcwV5hWgpx-9LY5wAOyt4aBrscV9JUIH774WW5DKmlQVguJSw4QZDyc8y8nAQ7P.jpg?size=650x647&quality=96&type=album'),
(5, 'Сыщик', 'Выяснить, кто ест по ночам', 25, 'https://sun9-75.userapi.com/s/v1/ig2/23-G48iPsoJ_sIKDo7QlWN_PM2cZ9iPJFkLps79g5wzL5jLgkKWRvMHtzhHv-Q3FMJbNXfiiwj08IvR_72fGZZJf.jpg?size=514x514&quality=96&type=album'),
(6, 'Ночное небо', 'Посетить кружок астрономов', 10, 'https://sun9-87.userapi.com/s/v1/ig2/5MI3ctSRkc7RqTnln4mQDHolewSlidvJ5cTzYqa3sW0BDoUcTeYEd_lDfIKKRgQYm4nolbNyiF0H9lSxA363eXTd.jpg?size=712x713&quality=96&type=album'),
(7, 'Вечный двигатель', 'Открыть тайную планету танго', 30, 'https://sun9-62.userapi.com/s/v1/ig2/SXyWLAVQpHbGuMAZjvpUHqVYH5dLlqoDpuKSFz0aV9uadA3-v7O_Z-i6NjRvLCrKIceB36MICiIQKvuOXyGE0u-4.jpg?size=650x649&quality=96&type=album'),
(8, 'Учёный', 'Не получить ни одной тройки', 20, 'https://sun9-38.userapi.com/s/v1/ig2/dsomnGhdxH5eYN23AQxWWwc6IpPoTeKygkXTbZ824YZK1tcDtwSkB4d48VeJvv_GIHtOc_AIMClc3gmvmERj0TTm.jpg?size=448x448&quality=96&type=album'),
(9, 'Автостопом по спутникам', 'Побывать в ракетном парке', 10, 'https://sun9-53.userapi.com/s/v1/ig2/53ftOynvniYiBCQ2Kr_wYso6HlvCHQQXxzwDSRimYHFiuicjFHRcs48LpPFG-DcJAknxjeScNYooHmqFlDqC2OCg.jpg?size=710x711&quality=96&type=album'),
(10, 'Бесконечность, и далее!', 'Стать астронавтом', 15, 'https://sun9-41.userapi.com/s/v1/ig2/ir2xUVOVPvvjgCU1LMdNhjbOrAflzmqcjFP05SCUJBHXeVz1AM3D00deIOXCuGXKGdCrByFcdIl9gv3OtZkPuNBK.jpg?size=648x648&quality=96&type=album'),
(11, 'Хороший хозяин', 'Победить на конкурсе питомцев', 40, 'https://sun9-67.userapi.com/s/v1/ig2/uBdydxCoBWHbfdZSzZFAvqmt-EVkGfNALcemCP5u_oTqILn9qM1wjNVwjwKIX0wJJGF_NC_8P0nWX0wtmhmZsMqt.jpg?size=678x678&quality=96&type=album'),
(12, 'А ларчик просто открывался', 'Сходить на лекцию о главном богатстве Земли', 5, 'https://sun9-47.userapi.com/s/v1/ig2/APgIBvhWXewqI2QowD171UH7P92mMHwLuYIaw-fa-6dwqPcjWbCyyToqDLJhYuEA1VSoy5nDdmWXO2H8FfOkf6TS.jpg?size=678x675&quality=96&type=album');

-- --------------------------------------------------------

--
-- Структура таблицы `achievementsAndChildren`
--

CREATE TABLE `achievementsAndChildren` (
  `achievementInd` int(11) NOT NULL,
  `childInd` int(11) NOT NULL,
  `getData` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `achievementsAndChildren`
--

INSERT INTO `achievementsAndChildren` (`achievementInd`, `childInd`, `getData`) VALUES
(1, 1, '2022-05-21 18:03:33'),
(2, 1, '2022-05-22 03:58:45'),
(4, 1, '2022-05-22 03:58:45'),
(5, 1, '2022-05-22 03:58:45'),
(1, 2, '2022-05-22 03:58:45'),
(9, 2, '2022-05-22 03:58:45');

-- --------------------------------------------------------

--
-- Структура таблицы `children`
--

CREATE TABLE `children` (
  `ind` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `balance` double NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `patronymic` varchar(100) NOT NULL,
  `republic` varchar(100) NOT NULL,
  `provinces` varchar(100) NOT NULL,
  `town` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `job` varchar(100) NOT NULL,
  `entryData` date NOT NULL,
  `exitData` date NOT NULL,
  `sectionsList` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `parentKey` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `children`
--

INSERT INTO `children` (`ind`, `login`, `password`, `balance`, `name`, `surname`, `patronymic`, `republic`, `provinces`, `town`, `post`, `job`, `entryData`, `exitData`, `sectionsList`, `parentKey`) VALUES
(1, 'khakhuk', 'f6b2b0ee1aa442d44ac10097ef738f3fca11cb918a723383c5b13d6879b16ae6', 100, 'Рустам', 'Хахук', 'Нальбиевич', 'Эчпочмак', 'Авокадо', 'Краснодар', 'Президент', 'Президент', '2022-05-11', '2022-05-30', '', 1),
(2, 'hochuspat!', 'tjsegsdgfykdm63we474e7m5r8r68r747tu5', 150, 'Даниил', 'Давыденко', 'Данилович', 'Посейдон', 'Море', 'Океан', 'Администратор', 'Каменщик', '2022-05-01', '2022-05-24', '', 1),
(3, 'nadegda', 'jerbferbf34hto4nhfn', 250, 'Евгения', 'Иванова', 'Кирилловна', 'Аврора', 'Дворец', 'Замок', 'Президент', 'Прогер', '2022-05-02', '2022-05-25', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `counselors`
--

CREATE TABLE `counselors` (
  `ind` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `patronymic` varchar(50) NOT NULL,
  `telephone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `counselors`
--

INSERT INTO `counselors` (`ind`, `login`, `password`, `name`, `surname`, `patronymic`, `telephone`) VALUES
(1, 'more', 'uihrogh358gh83hg8r', 'Артур', 'Джан', 'Егиазарян', '89181027722'),
(2, 'goregore', 'g3n5ugn39hg8ngvi85r9', 'Полина', 'Гордиенко', 'Дмитриевна', '89181027711'),
(3, 'hotFALSE', 'j30ijg0jg08hg805hg0', 'Хакатон', 'Хакатонов', 'Хакатонович', '89181027700');

-- --------------------------------------------------------

--
-- Структура таблицы `counselorsAndChildren`
--

CREATE TABLE `counselorsAndChildren` (
  `counselorInd` int(11) NOT NULL,
  `childInd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `counselorsAndChildren`
--

INSERT INTO `counselorsAndChildren` (`counselorInd`, `childInd`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `doctors`
--

CREATE TABLE `doctors` (
  `ind` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `patronymic` varchar(100) NOT NULL,
  `telephone` varchar(11) NOT NULL,
  `cabinet` varchar(50) NOT NULL,
  `corpus` varchar(100) NOT NULL,
  `workTime` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `doctors`
--

INSERT INTO `doctors` (`ind`, `login`, `password`, `name`, `surname`, `patronymic`, `telephone`, `cabinet`, `corpus`, `workTime`) VALUES
(1, 'asssssssssssssssssss', 'jvijg0ervuje9rvj0e', 'Ольга', 'Иванова', 'Эдуардовна', '89181027733', '34', 'РАК', '12:00-12:12'),
(2, 'dodododod', 'uvyv8yg87b78', 'Денис', 'Улезко', 'Сергеевич', '89181027744', '76', 'АРТРИТ', '13:50-16:40');

-- --------------------------------------------------------

--
-- Структура таблицы `doctorsProceduresChildren`
--

CREATE TABLE `doctorsProceduresChildren` (
  `doctorInd` int(11) NOT NULL,
  `procedureInd` int(11) NOT NULL,
  `childInd` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `countPerTime` int(11) DEFAULT NULL,
  `countPerDay` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `eventsOfTimeTable`
--

CREATE TABLE `eventsOfTimeTable` (
  `eventInd` int(11) NOT NULL,
  `timeTableInd` int(11) NOT NULL,
  `weekdays` tinyint(4) NOT NULL COMMENT 'битовая маска',
  `fromTime` smallint(6) NOT NULL,
  `toTime` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `eventsOfTimeTable`
--

INSERT INTO `eventsOfTimeTable` (`eventInd`, `timeTableInd`, `weekdays`, `fromTime`, `toTime`) VALUES
(1, 1, 127, 400, 500),
(1, 3, 127, 530, 600),
(2, 1, 127, 560, 600),
(2, 3, 127, 500, 530),
(3, 1, 127, 630, 650),
(3, 3, 127, 630, 700),
(5, 1, 127, 600, 630),
(5, 3, 127, 600, 630),
(6, 1, 127, 800, 860),
(6, 3, 127, 730, 800);

-- --------------------------------------------------------

--
-- Структура таблицы `eventToSignUp`
--

CREATE TABLE `eventToSignUp` (
  `ind` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `data` date NOT NULL,
  `weekday` tinyint(1) NOT NULL COMMENT 'битовая маска',
  `urlPhoto` varchar(3000) NOT NULL,
  `urlMap` varchar(3000) NOT NULL,
  `fromTime` smallint(6) NOT NULL,
  `toTime` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `eventToSignUp`
--

INSERT INTO `eventToSignUp` (`ind`, `name`, `description`, `data`, `weekday`, `urlPhoto`, `urlMap`, `fromTime`, `toTime`) VALUES
(1, 'Рыбалка', 'Занятие выуживанием рыбы из водоёма с целью прокорма или для развлечения. Рыбалка делится на любительскую и спортивную. В отличие от рыболовства, рыбалка - развлечение, досуг, вид отдыха, туризма и спорта.', '2022-05-03', 4, 'https://yandex.ru/images/search?rpt=simage&noreask=1&source=qa&text=%D0%A0%D1%8B%D0%B1%D0%B0%D0%BB%D0%BA%D0%B0&stype=image&lr=35&parent-reqid=1653173026996781-13842787218395257908-vla1-3156-vla-l7-balancer-8080-BAL-5533', '', 12, 13),
(2, 'Игра на укулеле', 'Укулеле — это гавайская разновидность гитары с четырьмя струнами, а иногда — с восемью струнами (четыре пары сдвоенных струн). По основной версии, с гавайского языка название инструмента переводится как «прыгающая блоха», так как при игре движения пальцев напоминают перемещение этого насекомого.', '2022-05-04', 5, 'https://yandex.ru/images/search?text=%D0%A3%D0%BA%D1%83%D0%BB%D0%B5%D0%BB%D0%B5%20%D0%B3%D0%B8%D1%82%D0%B0%D1%80%D0%B0%20%D1%84%D0%BE%D1%82%D0%BE&img_url=https%3A%2F%2Fgloimg.gbtcdn.com%2Fgb%2Fpdm-product-pic%2FElectronic%2F2016%2F03%2F02%2Fsource-img%2F20160302112047_89268.jpg&rpt=simage&source=qa&stype=image&lr=35&parent-reqid=1653173215333406-3191981828579002672-vla1-3156-vla-l7-balancer-8080-BAL-7092', '', 14, 16),
(3, 'Футбол', 'Командный вид спорта, в котором целью является забить мяч в ворота соперника ногами или другими частями тела большее количество раз, чем команда соперника. В настоящее время самый популярный и массовый вид спорта в мире.', '2022-05-04', 3, 'https://yandex.ru/images/search?rpt=simage&noreask=1&source=qa&text=%D0%95%D0%B2%D1%80%D0%BE%D0%BF%D0%B5%D0%B9%D1%81%D0%BA%D0%B8%D0%B9+%D1%84%D1%83%D1%82%D0%B1%D0%BE%D0%BB&stype=image&lr=35&parent-reqid=1653173291270847-4117046531656133284-vla1-3918-vla-l7-balancer-8080-BAL-8878', '', 11, 12),
(4, 'Плавание', 'Вид спорта или спортивная дисциплина, заключающаяся в преодолении вплавь за наименьшее время различных дистанций. При этом в подводном положении по действующим ныне правилам разрешается проплыть не более 15 м после старта или поворота; скоростные виды подводного плавания относятся не к плаванию, а к подводному спорту.', '2022-05-05', 5, 'https://yandex.ru/images/search?rpt=simage&noreask=1&source=qa&text=%D0%9F%D0%BB%D0%B0%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5+%28%D1%81%D0%BF%D0%BE%D1%80%D1%82%29&stype=image&lr=35&parent-reqid=1653173341171177-10743109267250622662-vla1-3918-vla-l7-balancer-8080-BAL-4997', '', 16, 18);

-- --------------------------------------------------------

--
-- Структура таблицы `eventToTimeTable`
--

CREATE TABLE `eventToTimeTable` (
  `ind` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `urlPhoto` varchar(3000) NOT NULL,
  `urlMap` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `eventToTimeTable`
--

INSERT INTO `eventToTimeTable` (`ind`, `name`, `description`, `urlPhoto`, `urlMap`) VALUES
(1, 'Зарядка', 'Важно заниматься зарядкой по утрам!', 'https://sun9-45.userapi.com/s/v1/ig2/g9MNYFcYEA0E9O8mLCZHD5Qw72TxtJ-9mySaxgX_dDwzVdVv5K10FNP5Bl7cy5qMu2WX43yXs8lanv2K4-rAf_cO.jpg?size=570x567&quality=96&type=album', 'https://kartinkin.net/uploads/posts/2022-02/1644887133_61-kartinkin-net-p-kotiki-milie-kartinki-67.jpg'),
(2, 'Завтрак', 'Сытый завтрак - залог хорошего дня.', 'https://kot-pes.com/wp-content/uploads/2016/10/image1-21.jpeg', 'https://bugaga.ru/uploads/posts/2017-03/1489052030_kotik-hosiko-12.jpg'),
(3, 'Пикник', 'Пикник - это пикник, что еще добавить?', 'https://554a875a-71dc-4f5f-b6bf-ae8967f137d5.selcdn.net/thumbs2/5a61be2a-5e10-11e6-b006-6e714efd800d.800x600.jpg', 'https://554a875a-71dc-4f5f-b6bf-ae8967f137d5.selcdn.net/thumbs2/5a61be2a-5e10-11e6-b006-6e714efd800d.800x600.jpg'),
(5, 'Обед', 'Первое -суп', 'https://static.tildacdn.com/tild6534-3966-4761-b231-366665386165/kinopoiskru-Darkwing.jpg', ''),
(6, 'Ужин', 'йогурт или кефирчик то шо нужно', 'https://img.cartoongoodies.com/wp-content/uploads/2020/11/TaleSpin.jpeg', '');

-- --------------------------------------------------------

--
-- Структура таблицы `medCarts`
--

CREATE TABLE `medCarts` (
  `ind` int(11) NOT NULL,
  `age` tinyint(4) NOT NULL,
  `healthGroup` varchar(50) NOT NULL,
  `doctorInd` int(11) DEFAULT NULL,
  `conclusionOfDoctor` text NOT NULL,
  `dataFromLabAndInstrumentalStudies` text NOT NULL,
  `healthEffect` varchar(50) NOT NULL,
  `infectiousContact` int(11) NOT NULL,
  `mainDiagnosis` text NOT NULL,
  `supDiagnosis` text NOT NULL,
  `ableToSport` varchar(50) NOT NULL,
  `ableToExcursions` varchar(50) NOT NULL,
  `numberOfClimatotherapy` varchar(50) NOT NULL,
  `numberOfMovingMode` varchar(50) NOT NULL,
  `diet` varchar(100) NOT NULL,
  `OVD_SHD` varchar(100) NOT NULL,
  `countOfWater` smallint(6) NOT NULL,
  `minutesBeforeEat` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `parents`
--

CREATE TABLE `parents` (
  `ind` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `patronymic` varchar(50) NOT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `telephone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `parents`
--

INSERT INTO `parents` (`ind`, `login`, `password`, `name`, `surname`, `patronymic`, `balance`, `telephone`) VALUES
(1, 'girenko', 'f6b2b0ee1aa442d44ac10097ef738f3fca11cb918a723383c5b13d6879b16ae6', 'Даниил', 'Гиренко', 'Евгеньевич', 0, '88005553535'),
(2, 'Hheh', 'tg5byn5ynuy5', 'Родитель', 'Родительный', 'Родильный', 190, '89181027755');

-- --------------------------------------------------------

--
-- Структура таблицы `procedures`
--

CREATE TABLE `procedures` (
  `ind` int(11) NOT NULL,
  `medGroup` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `type` varchar(100) NOT NULL,
  `cabinet` varchar(50) NOT NULL,
  `corpus` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `procedures`
--

INSERT INTO `procedures` (`ind`, `medGroup`, `name`, `type`, `cabinet`, `corpus`) VALUES
(1, 'заболевания ЖКТ', 'Гастроскопия', 'Обследование', '45', 'Дай бог тебе здоровья'),
(2, 'Сердечники', 'Кардиограмма', 'Обследование', '67', 'И твоё сердце снова разобьют');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `ind` int(11) NOT NULL,
  `eventInd` int(11) NOT NULL,
  `date` date NOT NULL,
  `score` int(11) NOT NULL,
  `comments` varchar(256) NOT NULL,
  `childInd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`ind`, `eventInd`, `date`, `score`, `comments`, `childInd`) VALUES
(1, 5, '2020-05-22', 4, 'Не весело', 2),
(2, 5, '2020-05-22', 4, 'Не весело', 1),
(3, 1, '2020-05-22', 4, 'Не весело', 2),
(5, 1, '2022-05-22', 1, 'цмрурур', 1),
(6, 2, '2022-05-22', 5, 'Вкусно!', 1),
(7, 2, '2022-05-01', 3, 'хочу спать!', 2),
(8, 1, '2022-05-22', 1, 'цмрурур', 1),
(9, 5, '2022-05-11', 4, 'намана', 3),
(10, 3, '2022-05-13', 1, 'грубо', 1),
(11, 6, '2022-05-08', 4, 'хорошо, но стоит не быть такими грубыми', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `timeTable`
--

CREATE TABLE `timeTable` (
  `ind` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `timeTable`
--

INSERT INTO `timeTable` (`ind`, `name`) VALUES
(1, 'Тестировочное'),
(3, 'Возможно тоже тест,  а там кто его знает');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`ind`);

--
-- Индексы таблицы `achievementsAndChildren`
--
ALTER TABLE `achievementsAndChildren`
  ADD PRIMARY KEY (`childInd`,`achievementInd`),
  ADD KEY `achievementInd` (`achievementInd`);

--
-- Индексы таблицы `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`ind`),
  ADD KEY `parentKey` (`parentKey`);

--
-- Индексы таблицы `counselors`
--
ALTER TABLE `counselors`
  ADD PRIMARY KEY (`ind`);

--
-- Индексы таблицы `counselorsAndChildren`
--
ALTER TABLE `counselorsAndChildren`
  ADD PRIMARY KEY (`counselorInd`,`childInd`),
  ADD KEY `childInd` (`childInd`);

--
-- Индексы таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`ind`);

--
-- Индексы таблицы `doctorsProceduresChildren`
--
ALTER TABLE `doctorsProceduresChildren`
  ADD PRIMARY KEY (`childInd`,`procedureInd`,`doctorInd`),
  ADD KEY `doctorInd` (`doctorInd`),
  ADD KEY `procedureInd` (`procedureInd`);

--
-- Индексы таблицы `eventsOfTimeTable`
--
ALTER TABLE `eventsOfTimeTable`
  ADD PRIMARY KEY (`eventInd`,`timeTableInd`,`fromTime`) USING BTREE,
  ADD KEY `timeTableInd` (`timeTableInd`);

--
-- Индексы таблицы `eventToSignUp`
--
ALTER TABLE `eventToSignUp`
  ADD PRIMARY KEY (`ind`);

--
-- Индексы таблицы `eventToTimeTable`
--
ALTER TABLE `eventToTimeTable`
  ADD PRIMARY KEY (`ind`);

--
-- Индексы таблицы `medCarts`
--
ALTER TABLE `medCarts`
  ADD PRIMARY KEY (`ind`),
  ADD KEY `medCarts_ibfk_1` (`doctorInd`);

--
-- Индексы таблицы `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`ind`);

--
-- Индексы таблицы `procedures`
--
ALTER TABLE `procedures`
  ADD PRIMARY KEY (`ind`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`ind`,`eventInd`,`childInd`) USING BTREE,
  ADD KEY `childIndex` (`childInd`),
  ADD KEY `eventIndex` (`eventInd`);

--
-- Индексы таблицы `timeTable`
--
ALTER TABLE `timeTable`
  ADD PRIMARY KEY (`ind`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `achievements`
--
ALTER TABLE `achievements`
  MODIFY `ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `children`
--
ALTER TABLE `children`
  MODIFY `ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `counselors`
--
ALTER TABLE `counselors`
  MODIFY `ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `doctors`
--
ALTER TABLE `doctors`
  MODIFY `ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `eventToSignUp`
--
ALTER TABLE `eventToSignUp`
  MODIFY `ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `eventToTimeTable`
--
ALTER TABLE `eventToTimeTable`
  MODIFY `ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `medCarts`
--
ALTER TABLE `medCarts`
  MODIFY `ind` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `parents`
--
ALTER TABLE `parents`
  MODIFY `ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `procedures`
--
ALTER TABLE `procedures`
  MODIFY `ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `timeTable`
--
ALTER TABLE `timeTable`
  MODIFY `ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `achievementsAndChildren`
--
ALTER TABLE `achievementsAndChildren`
  ADD CONSTRAINT `achievementsAndChildren_ibfk_1` FOREIGN KEY (`achievementInd`) REFERENCES `achievements` (`ind`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `achievementsAndChildren_ibfk_2` FOREIGN KEY (`childInd`) REFERENCES `children` (`ind`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `children`
--
ALTER TABLE `children`
  ADD CONSTRAINT `children_ibfk_1` FOREIGN KEY (`parentKey`) REFERENCES `parents` (`ind`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `counselorsAndChildren`
--
ALTER TABLE `counselorsAndChildren`
  ADD CONSTRAINT `counselorsAndChildren_ibfk_1` FOREIGN KEY (`childInd`) REFERENCES `children` (`ind`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `counselorsAndChildren_ibfk_2` FOREIGN KEY (`counselorInd`) REFERENCES `counselors` (`ind`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `doctorsProceduresChildren`
--
ALTER TABLE `doctorsProceduresChildren`
  ADD CONSTRAINT `doctorsProceduresChildren_ibfk_1` FOREIGN KEY (`childInd`) REFERENCES `children` (`ind`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doctorsProceduresChildren_ibfk_2` FOREIGN KEY (`doctorInd`) REFERENCES `doctors` (`ind`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doctorsProceduresChildren_ibfk_3` FOREIGN KEY (`procedureInd`) REFERENCES `procedures` (`ind`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `eventsOfTimeTable`
--
ALTER TABLE `eventsOfTimeTable`
  ADD CONSTRAINT `eventsOfTimeTable_ibfk_1` FOREIGN KEY (`eventInd`) REFERENCES `eventToTimeTable` (`ind`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eventsOfTimeTable_ibfk_2` FOREIGN KEY (`timeTableInd`) REFERENCES `timeTable` (`ind`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `medCarts`
--
ALTER TABLE `medCarts`
  ADD CONSTRAINT `medCarts_ibfk_1` FOREIGN KEY (`doctorInd`) REFERENCES `doctors` (`ind`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`childInd`) REFERENCES `children` (`ind`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`eventInd`) REFERENCES `eventToTimeTable` (`ind`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
