-- update
update friend_requests
	set status = 'approved'
where initiator_user_id = 1 and target_user_id = 1;

-- select
select name, surname from profiles; 
select * from dislikes_photo limit 10;
select * from communities limit 3 offset 6;
select * from communities limit 6,3;
select * from profiles where name = 'ipsa';
select * from profiles where name like 'i%';
select * from profiles where id>=80 and id<=93;

select concat(name,' ', surname) as profiles_list from profiles;
select * from friend_requests where status = 'approved' or status = 'requested';
select * from friend_requests where status in ('approved','requested');
select count(*) from profiles where name = 'ipsa';
-- select name, count(*);

-- delete
-- delete from profiles where id > 89;
