/*
База данных книжного магазина.
Содержит 10 таблиц.
В Базе данных представлен ассортимент товара и продажи книг в чате на сайте магазина.
*/
-- создание БД
DROP DATABASE IF EXISTS booksh;
CREATE DATABASE booksh;
USE booksh;

-- таблица books содержит ассортимент магазина и характеристики товара
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `books` (`id`, `name`, `author`, `year`, `weight`) VALUES ('1', 'Флористика для чайников', 'Иван Иванов', '2019', '200 г');
INSERT INTO `books` (`id`, `name`, `author`, `year`, `weight`) VALUES ('2', 'Убийца за океаном', 'Сергей Сергеев', '2015', '150 г');
INSERT INTO `books` (`id`, `name`, `author`, `year`, `weight`) VALUES ('3', 'Межзвездное пространство', 'Мария Маринина', '2016', '300 г');
INSERT INTO `books` (`id`, `name`, `author`, `year`, `weight`) VALUES ('4', 'Время и деньги', 'Анна Игошина', '2020', '350 г');
INSERT INTO `books` (`id`, `name`, `author`, `year`, `weight`) VALUES ('5', 'Абстракционизм', 'Анна Иванова', '2020', '320 г');

-- таблица с ценами. Связана по ключу price_id с таблицей books для определения цены товара
DROP TABLE IF EXISTS `prices`;
CREATE TABLE `prices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `price_id` bigint(20) unsigned NOT NULL,
  `price` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`price_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `prices` (`price_id`, `price`) VALUES ('2', '250');
INSERT INTO `prices` (`price_id`, `price`) VALUES ('5', '550');
INSERT INTO `prices` (`price_id`, `price`) VALUES ('1', '340');
INSERT INTO `prices` (`price_id`, `price`) VALUES ('4', '450');
INSERT INTO `prices` (`price_id`, `price`) VALUES ('3', '670');

-- join таблиц для получения цены товара
select * from books b join prices as p on b.id = p.price_id;

-- таблица со скидками. Связана по ключу disc_id с таблицей books для определения скидки на товар
DROP TABLE IF EXISTS `discs`;
CREATE TABLE `discs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `disc_id` bigint(20) unsigned NOT NULL,
  `discount %` bigint(255) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`disc_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `discs` (`disc_id`, `discount %`) VALUES ('2', '5');
INSERT INTO `discs` (`disc_id`, `discount %`) VALUES ('5', '3');
INSERT INTO `discs` (`disc_id`, `discount %`) VALUES ('1', '15');
select * from discs;

-- join для получения размера скидки на определенный товар
select * from books b join prices as p on b.id = p.price_id
join discs on b.id = disc_id order by 'id';

-- таблица с жанрами. Не связана с таблицами. Используется для группировки товаров по жанрам.
DROP TABLE IF EXISTS `genres`;
CREATE TABLE `genres` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `genre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `genres` (`genre`) VALUES ('Комиксы');
INSERT INTO `genres` (`genre`) VALUES ('Фантастика');
INSERT INTO `genres` (`genre`) VALUES ('Детектив');
INSERT INTO `genres` (`genre`) VALUES ('Художественная');
INSERT INTO `genres` (`genre`) VALUES ('Учебная');
INSERT INTO `genres` (`genre`) VALUES ('Бизнес');
-- select * from genres;

-- изменение таблицы books - добавление столбца с id жанра
alter table books add column genre_id bigint(20) unsigned NOT NULL;
alter table books add foreign key (genre_id) references genres(id);
select * from books;
-- DELETE FROM books WHERE id = '6';
-- SET SQL_SAFE_UPDATES=0

update books set genre_id = '6' where id = '4';
update books set genre_id = '5' where id = '1';
update books set genre_id = '3' where id = '2';
update books set genre_id = '2' where id = '3';
update books set genre_id = '5' where id = '5';
-- select * from books;
-- join группировки товаров по жанрам
select * from books b join genres as g on b.genre_id = g.id join prices as p on b.id = p.price_id order by 'id';

-- таблица для отображения новинок магазина
DROP TABLE IF EXISTS `newcomings`;
CREATE TABLE `newcomings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_new` bigint(20) unsigned DEFAULT NULL,
  `phrase` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'Новинка',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `newcomings` (`id_new`) VALUES ('2');
INSERT INTO `newcomings` (`id_new`) VALUES ('1');
-- select * from newcomings;
-- представление для отображения новинок магазина
create view newcomings_v as
select b.id, b.author, b.year, b.weight, g.genre, p.price, n.phrase from books b join genres as g on b.genre_id = g.id
join prices as p on b.id = p.price_id join newcomings as n on b.id = n.id_new order by 'id';
select * from newcomings_v;

-- таблица с информацией из чата на сайте магазина
DROP TABLE IF EXISTS `sales_in_chat`;
CREATE TABLE `sales_in_chat` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_book` bigint(20) unsigned NOT NULL,
  `id_client` bigint(20) unsigned NOT NULL,
  `message_text` longtext  COLLATE utf8_unicode_ci,
  `manager` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_book`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sales_in_chat` (`id_book`, `id_client`, `message_text`, `manager`) VALUES
('2', '1', 'Добрый день! Хочу заказать у вас книгу.', 'Алекс');
INSERT INTO `sales_in_chat` (`id_book`, `id_client`, `message_text`, `manager`) VALUES
('2', '1', 'Интересна последняя книга Сергея Сергеева. Есть у вас?', 'Алекс');
INSERT INTO `sales_in_chat` (`id_book`, `id_client`, `message_text`, `manager`) VALUES
('2', '1', 'Да, есть. Cтоит 250 рублей. Закажете? ', 'Алекс');
INSERT INTO `sales_in_chat` (`id_book`, `id_client`, `message_text`, `manager`) VALUES
('2', '1', 'Да, спасибо.', 'Алекс');

INSERT INTO `sales_in_chat` (`id_book`, `id_client`, `message_text`, `manager`) VALUES
('5', '2', 'Добрый день! Хочу заказать у вас книгу по флористике.', 'Хельга');
update sales_in_chat set id_book = '1' where id = '5';
INSERT INTO `sales_in_chat` (`id_book`, `id_client`, `message_text`, `manager`) VALUES
('1', '2', 'Добрый день! Есть книга Ивана Иванова. Стоимость - 340 рублей.', 'Хельга');
INSERT INTO `sales_in_chat` (`id_book`, `id_client`, `message_text`, `manager`) VALUES
('1', '2', 'Да, спасибо, закажу.', 'Хельга');
INSERT INTO `books` (`id`, `name`, `author`, `year`, `weight`, `genre_id`) VALUES ('6', 'Горько', 'Максим Иванов', '2010', '310 г', '3');
INSERT INTO `sales_in_chat` (`id_book`, `id_client`, `message_text`, `manager`) VALUES
('6', '3', 'Добрый день! Есть книги Максима Иванова?', 'Серхио');
INSERT INTO `sales_in_chat` (`id_book`, `id_client`, `message_text`, `manager`) VALUES
('6', '3', 'Сейчас нет в наличии. Приносим извинения.', 'Серхио');

-- select * from sales_in_chat;
-- select * from books as b join prices as p on b.id = p.price_id;
-- select * from books;
-- таблица с информацией о наличии/остутсвии книг
DROP TABLE IF EXISTS `in_stock`;
CREATE TABLE `in_stock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_book` bigint(20) unsigned NOT NULL,
  `in_stock` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'В наличии',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_book`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `in_stock` (`id_book`, `in_stock`) VALUES ('6', 'Нет в наличии');
INSERT INTO `in_stock` (`id_book`) VALUES ('1');
INSERT INTO `in_stock` (`id_book`) VALUES ('2');
INSERT INTO `in_stock` (`id_book`) VALUES ('3');
INSERT INTO `in_stock` (`id_book`) VALUES ('4');
INSERT INTO `in_stock` (`id_book`) VALUES ('5');
INSERT INTO `prices` (`price_id`, `price`) VALUES ('6', '370');
-- select на отображение товара в наличииalterselect * from books b join genres as g on b.genre_id = g.id
select * from books b join genres as g on b.genre_id = g.id
join prices as p on b.id = p.price_id join in_stock as i on b.id = i.id_book order by 'id';
-- select * from in_stock;
-- select * from books;
-- select * from genres;
-- представление таблицы с основными характеристиками книги
create view main as
select b.id, b.name, b.author, b.year, b.weight, p.price, i.in_stock, g.genre from books b join genres as g on b.genre_id = g.id
join prices as p on b.id = p.price_id join in_stock as i on b.id = i.id_book order by 'id';
select * from main;

-- таблица с продажами
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_book` bigint(20) unsigned NOT NULL,
  `id_client_chat` bigint(20) unsigned default NULL,
  `id_client_shop` bigint(20) unsigned default NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_book`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sales` (`id_book`, `id_client_chat`, `name`) VALUES ('2', '1', 'Кирилл О.');
INSERT INTO `sales` (`id_book`, `id_client_chat`, `name`) VALUES ('1', '2', 'Кристина А.');
INSERT INTO `sales` (`id_book`, `id_client_shop`, `name`) VALUES ('5', '1822', 'Иван Б.');
INSERT INTO `sales` (`id_book`, `id_client_shop`, `name`) VALUES ('4', '1823', 'Алексей К.');
INSERT INTO `sales` (`id_book`, `id_client_shop`, `name`) VALUES ('3', '1824', 'Екатерина Р.');
INSERT INTO `sales` (`id_book`, `id_client_shop`, `name`) VALUES ('2', '1825', 'Римма О.');
INSERT INTO `sales` (`id_book`, `id_client_shop`, `name`) VALUES ('1', '1826', 'Анна М.');
INSERT INTO `sales` (`id_book`, `id_client_shop`, `name`) VALUES ('5', '1827', 'Антон П.');
INSERT INTO `sales` (`id_book`, `id_client_shop`, `name`) VALUES ('4', '1828', 'Дмитрий К.');
INSERT INTO `sales` (`id_book`, `id_client_shop`, `name`) VALUES ('3', '1829', 'Елена Я.');
INSERT INTO `sales` (`id_book`, `id_client_shop`, `name`) VALUES ('2', '1830', 'Андрей Д.');
INSERT INTO `sales` (`id_book`, `id_client_shop`, `name`) VALUES ('2', '1831', 'Олег З.');
select * from sales_in_chat;
select * from sales;
-- select книги + покупатели
create view buyers as
select b.id, b.name, b.author, b.year, b.weight, p.price, i.in_stock, g.genre,
s.name as 'Покупатель' from books b join genres as g on b.genre_id = g.id
join prices as p on b.id = p.price_id join in_stock as i on b.id = i.id_book join sales as s on b.id = s.id_book order by 'id';
-- select - где продана книга
select b.id, b.name, p.price, s.name as 'Покупатель', s.id_client_chat as 'Продано в чате',
s.id_client_shop as 'Продано в магазине' from books b
join prices as p on b.id = p.price_id join sales as s on b.id = s.id_book order by 'id';
-- представление переписки с клиентом, который купил книгу
create view buyer_in_chat as
select b.id, b.name, p.price, s.name as 'Покупатель', si.manager, si.message_text from books b
join prices as p on b.id = p.price_id join sales as s on b.id = s.id_book
join sales_in_chat as si on s.id_client_chat = si.id_client order by 'id';
select * from buyer_in_chat;