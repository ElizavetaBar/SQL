-- триггер проверки цены
delimiter //
CREATE TRIGGER check_price_before_update BEFORE UPDATE ON prices
FOR EACH ROW
begin
    if new.price <= '0' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Операция отменена. Цена должна быть больше 0.';
    end if;
END//
DELIMITER ;
-- проверка:
update prices set price = '0' where id = '10';
select * from bin;

    
    
-- процедура для определения одинаковых книг в корзине у разных пользователей
delimiter //
create procedure common_books(in id_book int)
begin
	select distinct b2.id_book, b2.id_client
	from bin b1
	join bin b2
		on (b2.id_book = id_book);
end//
delimiter ;


-- процедура для отработки ошибок по добавлению дублирующих значений в уникальный столбцы
DROP PROCEDURE IF EXISTS insert_wrong;
delimiter //
CREATE PROCEDURE insert_wrong (IN id bigint(20))
BEGIN
  DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @error = 'Ошибка вставки значения. Такое значение уже есть.';
  INSERT INTO clients VALUES(id);
  IF @error IS NOT NULL THEN
	SELECT @error;
  END IF;
END//
delimiter //
