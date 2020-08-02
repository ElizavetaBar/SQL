-- задание 2
select * from users u join messages as p on u.id = to_user_id where u.id = 1;
select * from users u join messages as p on u.id = to_user_id where u.id = 2;
-- запрс с прочитанными сообщениями
select * from users u join messages as p on u.id = to_user_id where is_read = 1;
select * from messages;
-- задание 3
select id, gender,
timestampdiff(year, birthday, now()) as age, 
name, surname from profiles
where id 
in (
select initiator_user_id from friend_requests where target_user_id = 1 and status = 'approved'
union
select target_user_id from friend_requests where initiator_user_id = 1 and status = 'approved'
);
-- всего один пользователь
-- 10 самых молодых пользователей
select id, gender,
timestampdiff(year, birthday, now()) as age, 
name, surname from profiles group by age order by age limit 10;

select count(id) total_likes , photo_id,
(select concat(name,' ',surname) from profiles where id =
(select id,
timestampdiff(year, birthday, now()) as age from profiles group by age order by age limit 10)) as 'author' 
from likes_photo group by photo_id order by total_likes desc limit 10;

select * from likes_photo where id =
(
select id, gender,
timestampdiff(year, birthday, now()) as age, 
name, surname from profiles group by age order by age limit 10
);
-- join
select * from users u join messages as p on u.id = to_user_id where u.id = 1;
select user_id, gender,
timestampdiff(year, birthday, now()) as age, 
name, surname from profiles p join likes_photo as l on p.user_id = l.id group by age order by age limit 10;
-- join

select l.id, l.photo_id, l.user_id, 
(select user_id, gender, timestampdiff(year, birthday, now()) as age, name, surname from profiles where user_id = l.user_id) as 'author'
from likes_photo l;
-- пример из урока
select p.name, p. lastname, p.hometown, 
(select file from photos where profile_id = p.id ) as 'photo', 
(select phone from users where id = p.user_id) as 'phone' 
from profiles p
where p.id = 1;
-- конец примера

select p.id, p.gender,
timestampdiff(year, birthday, now()) as age, 
p.name, p.surname,
(select user_id from likes_photo where id = p.id) from profiles p group by age order by age limit 10;


-- на БД snet_v1

select count(profile_id) total_likes , photo_id,
(select concat(name,' ',lastname) from profiles where id = (select profile_id from photos where id = photo_id)) as 'author' 
from likes_photo group by photo_id order by total_likes desc limit 10;

select p.id, p.gender,
timestampdiff(year, birthday, now()) as age, 
p.name, p.lastname,
(select id from likes_photo where profile_id = p.id)
from profiles p group by age order by age limit 10;

select p.id, p.gender,
timestampdiff(year, birthday, now()) as age, 
p.name, p.lastname,
(select user_id from likes_photo where id = p.id) from profiles p group by age order by age limit 10;

-- решение задания 3
select id, name, lastname, timestampdiff(year, birthday, now()) as 'age', mylikes.tl from profiles, (
select tl_photo + tl_post as tl, t1.prof_id as p1 from (
	(select count(ph_l) as tl_photo, prof_id from (select count(*) as ph_l, photo_id,
			(select profile_id from photos where id = photo_id)
		as prof_id from likes_photo group by photo_id) as total_photo_likes group by prof_id) as t1,
	
    (select count(po_l) as tl_post, prof_id from (select count(*) as po_l, post_id,
		
	(select profile_id from photos where id = post_id)
        as prof_id from likes_posts group by post_id) as total_post_likes group by prof_id) as t2
        ) where t1.prof_id = t2.prof_id) as mylikes where p1 = profiles.id order by age, tl desc limit 10;
        
        -- задание 4 Определить кто больше поставил лайков (всего) - мужчины или женщины?
select p.id, p.gender, p.name, p.lastname,
(select id from likes_photo where id = p.id) from profiles p group by gender;
select p.id, p.gender, p.name, p.lastname,
(select id from likes_photo where id = p.id) from profiles p;
select count(*) gender, p.id,
(select id from likes_photo where id = p.id) from profiles p group by gender;
-- работающий вариант
select count(*),
(select id from likes_photo where id = p.id) from profiles p group by gender;
-- 
select count(*), l.profile_id, (select gender from profiles where user_id = l.profile_id) as gen
from likes_photo group by gen;

select count(*), (select concat(name,' ',lastname) from profiles where id = from_profile_id) as sender 
from messages where to_profile_id = 1 and is_read = 0 group by from_profile_id;
-- задание 5 Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
-- 1) 10 пользователей с наименьшим количеством сообщений
select count(from_profile_id), id from messages group by from_profile_id;
select count(from_profile_id), id from messages group by from_profile_id order by id;
-- 2) 10 пользователей с наименьшим количеством постов

select count(profile_id), id from posts group by profile_id order by count(profile_id);
-- мало friend_requests
select count(initiator_profile_id), initiator_profile_id from friend_requests group by initiator_profile_id order by count(initiator_profile_id);