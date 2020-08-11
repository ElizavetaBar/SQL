
-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
select * from users; -- 1- 6
select * from orders;
INSERT INTO orders VALUES
  (1, 2, null, null),
  (2, 2, null, null),
  (3, 1, null, null),
  (4, 3, null, null);
  
  select u.id as user_id, u.name, o.id AS order_id from users as u
  right join
  orders as o
  on u.id = o.user_id;
  
   --  Выведите список товаров products и разделов catalogs, который соответствует товару.
   select * from products;
   select p.id, p.name, c.name  from catalogs as c
   join
   products as p
   on c.id = p.catalog_id;