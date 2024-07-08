-- task 1

create table UserInfo(
	userId int,
	name varchar(10)
);

INSERT INTO UserInfo (name) VALUES ('monir');
INSERT INTO UserInfo (name) VALUES ('shabnur');
INSERT INTO UserInfo (name) VALUES ('nargis');
INSERT INTO UserInfo (name) VALUES ('jalil');

select * from UserInfo;

--Ids should be 1 to 4


-- task 2

create table FrndList(
	userId1 int,
	userId2 int
);

EXECUTE makeFriends(1,2);
EXECUTE makeFriends(8,2);
EXECUTE makeFriends(1,13);
EXECUTE makeFriends(3,2);
EXECUTE makeFriends(2,2);
EXECUTE makeFriends(1,3);
EXECUTE makeFriends(17,17);
EXECUTE makeFriends(4,2);

select * from FrndList;

--should show 8 rows

-- task 3

create table Message(
senderId int,
recieverId int,
text varchar(56)
);

INSERT INTO Message (senderId,recieverId,text) VALUES (13,2,'Should raise error 2');
INSERT INTO Message (senderId,recieverId,text) VALUES (4,4,'Should raise error 3');
INSERT INTO Message (senderId,recieverId,text) VALUES (3,1,'Hi');
INSERT INTO Message (senderId,recieverId,text) VALUES (1,3,'Hello');
INSERT INTO Message (senderId,recieverId,text) VALUES (4,1,'Should raise error 4');
INSERT INTO Message (senderId,recieverId,text) VALUES (3,1,'How are you ?');
INSERT INTO Message (senderId,recieverId,text) VALUES (4,2,'Give me the solution of todays task.');
INSERT INTO Message (senderId,recieverId,text) VALUES (1,3,'Fine.');
INSERT INTO Message (senderId,recieverId,text) VALUES (2,1,'Jalil is asking for task again. Should I give it to him?');
INSERT INTO Message (senderId,recieverId,text) VALUES (3,1,'Do you have a girlfriend?');
INSERT INTO Message (senderId,recieverId,text) VALUES (3,4,'Should raise error 5');
INSERT INTO Message (senderId,recieverId,text) VALUES (1,2,'No.');
INSERT INTO Message (senderId,recieverId,text) VALUES (1,4,'Should raise error 6');
INSERT INTO Message (senderId,recieverId,text) VALUES (1,3,'Yes, her name is Shabnur.');

select * from Message;

--should show only 9 messages

-- task 4

Execute unfriend(1,13);
Execute unfriend(1,3);

select * from Message;

--after executing unfriend(1,3) Message should only contain conversation between (4,2),(2,1),(1,2)



-- task 5

create table Post(
postId int PRIMARY key,
userId int,
text varchar(56)
);

create table PostNotification(
userId int,
frndId int,
postId int,
CONSTRAINT FK_postId FOREIGN KEY (postId) REFERENCES Post(postId)
);

Insert into Post (postId,userId,text) values (1,4,'I am lonely.');
select * from PostNotification;
-- should show one row with post id as 1
Insert into Post (postId,userId,text) values (2,4,'I need friends.');
select * from PostNotification;
-- should show one row with post id as 2
