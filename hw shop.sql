-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
use sample;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
	birthday_at DATE DEFAULT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

start transaction;
insert into sample.users select * from shop.users where id = 1;
commit;

select * from users;

use shop;
select * from users;

-- 2
/* Создайте представление, которое выводит название name товарной позиции из таблицы products и
соответствующее название каталога name из таблицы catalogs.*/
select * from catalogs;
-- select * from products as p join catalogs as c on p.catalog_id = c.id;
create view sh_v as
select c.name as type, p.id, p.name, p.catalog_id from products as p
join catalogs as c
on p.catalog_id = c.id;
select * from sh_v;

-- задание по уроку 3
/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/

DROP PROCEDURE IF EXISTS hello;
delimiter //
CREATE PROCEDURE hello()
BEGIN
	CASE 
		WHEN CURTIME() BETWEEN '06:00' AND '12:00' THEN
			SELECT 'Доброе утро';
		WHEN CURTIME() BETWEEN '12:00' AND '18:00' THEN
			SELECT 'Добрый день';
		WHEN CURTIME() BETWEEN '18:00' AND '24:00' THEN
			SELECT 'Добрый вечер';
		ELSE
			SELECT 'Доброй ночи';
	END CASE;
END //
delimiter ;

CALL hello();

/*В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
Допустимо присутствие обоих полей или одно из них.
Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
При попытке присвоить полям NULL-значение необходимо отменить операцию.*/

DROP TRIGGER IF EXISTS pr_tr;
delimiter //
CREATE TRIGGER pr_tr BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'operation cancelled';
	END IF;
END //
delimiter ;
-- select * from products;
INSERT INTO products (name, description, price, catalog_id)
VALUES (NULL, NULL, 5000, 2);

INSERT INTO products (name, description, price, catalog_id)
VALUES ('Intel', NULL, 17120.00, 1);
