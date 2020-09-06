-- join таблиц для получения цены товара
select * from books b join prices as p on b.id = p.price_id;

-- join для получения размера скидки на определенный товар
select * from books b join prices as p on b.id = p.price_id
join discs on b.id = disc_id order by 'id';

-- join группировки товаров по жанрам
select * from books b join genres as g on b.genre_id = g.id join prices as p on b.id = p.price_id order by 'id';

-- представление для отображения новинок магазина
create view newcomings_v as
select b.id, b.author, b.year, b.weight, g.genre, p.price, n.phrase from books b join genres as g on b.genre_id = g.id
join prices as p on b.id = p.price_id join newcomings as n on b.id = n.id_new order by 'id';

-- select на отображение товара в наличииalterselect * from books b join genres as g on b.genre_id = g.id
select * from books b join genres as g on b.genre_id = g.id
join prices as p on b.id = p.price_id join in_stock as i on b.id = i.id_book order by 'id';

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

-- представление товаров в коризне покупателей
create view goods_in_bin as
select c.name as 'Имя клиента', bi.id_client as 'Код клиента', b.name as 'Товары в корзине' from clients c
join bin as bi on bi.id_client = c.id_client join books as b on bi.id_book = b.id;