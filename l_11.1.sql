/* Создайте таблицу logs типа Archive.
Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи,
название таблицы, идентификатор первичного ключа и содержимое поля name.*/

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	t_name VARCHAR(45) NOT NULL,
	id BIGINT(20) NOT NULL,
	name_value VARCHAR(45) NOT NULL
) ENGINE = ARCHIVE;

-- select * from users;
DROP TRIGGER IF EXISTS log_users;
delimiter //
CREATE TRIGGER log_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, t_name, id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;


DROP TRIGGER IF EXISTS log_catalogs;
delimiter //
CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, t_name, id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;


delimiter //
CREATE TRIGGER log_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, t_name, id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;

-- SELECT * FROM users;
-- SELECT * FROM logs;

INSERT INTO users (name, birthday_at)
VALUES ('Антон', '2002-01-01');

-- SELECT * FROM users;
SELECT * FROM logs;

INSERT INTO catalogs (name) VALUES ('Моноблоки');

INSERT INTO products (name, description, price, catalog_id)
VALUES ('Процессор Intel Core', 'Процессор', 31000.00, 1);
