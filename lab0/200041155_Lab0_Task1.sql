drop table grade;
drop table student_course;
drop table student;
drop table teacher_course;
drop table teacher;
drop table course;
drop table class;
drop table school;
drop SEQUENCE seq_student_id;


create table school(
    schoolid INT PRIMARY KEY,
    schoolname varchar2(20) UNIQUE,
    description VARCHAR2(30),
    address varchar2(40) DEFAULT 'IUT, BoardBazar, Gazipur, Bangladesh',
    phone VARCHAR2(20),
    postcode VARCHAR2(20),
    postaddress VARCHAR2(20)
);

create table class(
    schoolid INT,
    classid INT PRIMARY KEY,
    classname varchar2(20) UNIQUE,
    description VARCHAR2(20),
    CONSTRAINT fk_class FOREIGN KEY (schoolid) REFERENCES school(schoolid)
);

create table course(
    schoolid INT,
    courseid INT PRIMARY KEY,
    coursename varchar2(20) UNIQUE,
    description VARCHAR2(20),
    CONSTRAINT fk_course FOREIGN KEY (schoolid) REFERENCES school(schoolid)
);

create table teacher(
    schoolid INT,
    teacherid INT PRIMARY KEY,
    teachername varchar2(20),
    description VARCHAR2(20),
    CONSTRAINT fk_teacher FOREIGN KEY (schoolid) REFERENCES school(schoolid)
);

create table teacher_course(
    courseid INT,
    teacherid INT,
    CONSTRAINT fk_tcc FOREIGN KEY (courseid) REFERENCES course(courseid),
    CONSTRAINT fk_tct FOREIGN KEY (teacherid) REFERENCES teacher(teacherid)
);


create table student(
    studentid INT PRIMARY KEY,
    classid INT,
    studentname varchar2(20),
    studentnumber INT,
    totalgrade INT,
    address varchar2(40),
    phone VARCHAR2(20),
    email varchar2(20),
    CONSTRAINT fk_student FOREIGN KEY (classid) REFERENCES class(classid),
    CONSTRAINT chk_stu CHECK (totalgrade >= 2.0 AND totalgrade <= 4.0),
    CONSTRAINT chk_mail CHECK (email like '%@gmail.com')
);

create table student_course(
    courseid INT,
    studentid INT,
    CONSTRAINT fk_scc FOREIGN KEY (courseid) REFERENCES course(courseid),
    CONSTRAINT fk_scs FOREIGN KEY (studentid) REFERENCES student(studentid)
);

create table grade(
    courseid INT,
    studentid INT,
    grades INT,
    comments VARCHAR2(20),
    CONSTRAINT fk_grc FOREIGN KEY (courseid) REFERENCES course(courseid),
    CONSTRAINT fk_grs FOREIGN KEY (studentid) REFERENCES student(studentid),
    CONSTRAINT chk_grd CHECK (grades >= 2.0 AND grades <= 4.0)
);

CREATE SEQUENCE seq_student_id
MINVALUE 200041100
START WITH 200041100
INCREMENT BY 1;


-- insert into tablename values();

insert into school values(1, 'Mini school', 'Good school' , DEFAULT , '09834092' , 'kndsfkjsn' , 'kjhdsfkjhsak');
insert into school values(2, 'Horse school', 'Cute school' , DEFAULT , '099834092' , 'kndsfjkdjkjsn' , 'kjhdsfqwekjhsak');
insert into school values(3, 'Cat school', 'Cute school' , DEFAULT , '09823092' , 'kndsfkjkdjsn' , 'kjhdsfkjhksajsak');

insert into class values(1, 1, 'my class' , 'beautiful');
insert into class values(2, 4, 'my class4' , 'beautiful');
insert into class values(3, 5, 'my class5' , 'beautiful');

insert into course values(2, 51, 'science' , 'cool');
insert into course values(3, 52, 'my math' , 'bad');
insert into course values(3, 53, 'my bds' , 'worst');

insert into teacher values(1, 90, 'Karayel' , 'hihihi');
insert into teacher values(3, 91, 'Mimi' , 'hohoho');
insert into teacher values(3, 92, 'Mina Mina' , 'hahaha');

insert into teacher_course values(53 , 91);
insert into teacher_course values(52 , 92);
insert into teacher_course values(52 , 90);

insert into student values(seq_student_id.nextval, 4, 'Suleiman' , 34 , 2.0 , 'my home' , '98374892','abc@gmail.com');
insert into student values(seq_student_id.nextval, 4, 'Selim' , 35 , 3.0 , 'my home1' , '9837392','abcd@gmail.com');
insert into student values(seq_student_id.nextval, 4, 'Mehmet' , 36 , 4.0 , 'my home2' , '98354892','abcde@gmail.com');

insert into student_course values(52 ,200041101);
insert into student_course values(52 ,200041102);
insert into student_course values(53 ,200041100);

insert into grade values(51 , 200041101 , 2.0 , 'bad');
insert into grade values(52 , 200041102 , 3.0 , 'good');
insert into grade values(52 , 200041100 , 4.0 , 'best');
