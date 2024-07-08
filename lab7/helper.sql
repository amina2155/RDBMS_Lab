--taskA input values

INSERT INTO CustomerData (userId,name,status) VALUES (1,'sumon1','normal');
INSERT INTO CustomerData (userId,name,status) VALUES (2,'sumon2','normal');
INSERT INTO CustomerData (userId,name,status) VALUES (3,'sumon3','normal');
INSERT INTO CustomerData (userId,name,status) VALUES (4,'sumon4','member');
INSERT INTO CustomerData (userId,name,status) VALUES (5,'sumon5','regular');
INSERT INTO CustomerData (userId,name,status) VALUES (6,'sumon6','regular');
INSERT INTO CustomerData (userId,name,status) VALUES (7,'sumon7','member');
INSERT INTO CustomerData (userId,name,status) VALUES (8,'sumon8','normal');
INSERT INTO CustomerData (userId,name,status) VALUES (9,'sumon8','member');

INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (1,900,1);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (2,1900,1);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (3,2000,1);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (4,750,2);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (5,3375,2);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (6,3395,2);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (7,750,3);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (8,1200,3);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (9,2015,3);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (10,36,4);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (11,4500,4);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (12,2167,4);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (13,4000,5);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (14,139,5);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (15,3373,5);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (16,10,6);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (17,3017,9);
INSERT INTO PurchaseData (purchaseId,purchaseAmt,userId) VALUES (18,2133,9);


--taskB tables and input values

CREATE TABLE PlayerPoint (
    playerId int NOT null,
	dTP int Not Null,
	gPD Date not null
);

Create table Ranking(
	rankName varchar(6) not null,
	rLP int not null,
	rHP int not null
);

INSERT INTO PlayerPoint (playerId,dTP,gPD) VALUES (1,100,DATE '2020-12-12');
INSERT INTO PlayerPoint (playerId,dTP,gPD) VALUES (1,200,DATE '2019-11-01');
INSERT INTO PlayerPoint (playerId,dTP,gPD) VALUES (1,100,DATE '2022-01-03');
INSERT INTO PlayerPoint (playerId,dTP,gPD) VALUES (1,400,DATE '2021-07-26');
INSERT INTO PlayerPoint (playerId,dTP,gPD) VALUES (2,300,DATE '2019-01-23');
INSERT INTO PlayerPoint (playerId,dTP,gPD) VALUES (2,50,DATE '2021-07-06');
INSERT INTO PlayerPoint (playerId,dTP,gPD) VALUES (2,10,DATE '2022-06-05');
INSERT INTO PlayerPoint (playerId,dTP,gPD) VALUES (2,1000,DATE '2023-10-13');
INSERT INTO PlayerPoint (playerId,dTP,gPD) VALUES (3,300,DATE '2020-04-14');
INSERT INTO PlayerPoint (playerId,dTP,gPD) VALUES (3,100,DATE '2021-03-09');
INSERT INTO PlayerPoint (playerId,dTP,gPD) VALUES (3,200,DATE '2022-02-16');
INSERT INTO PlayerPoint (playerId,dTP,gPD) VALUES (3,400,DATE '2023-09-27');

INSERT INTO Ranking (rankName,rLP,rHP) VALUES ('newbie',0,499);
INSERT INTO Ranking (rankName,rLP,rHP) VALUES ('pupil',500,999);
INSERT INTO Ranking (rankName,rLP,rHP) VALUES ('expert',1000,1e9);