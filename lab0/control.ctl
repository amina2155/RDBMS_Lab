LOAD DATA
INFILE 'load_file.csv'
INSERT INTO TABLE salary
FIELDS TERMINATED BY ','OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id,
name,
city,
amount
)

