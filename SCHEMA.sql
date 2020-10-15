CREATE TABLE STUDENT_DBR
(
STUDENT_ID int NOT NULL,
FIRST_NAME VARCHAR(20) NOT NULL,
LAST_NAME VARCHAR(20) NOT NULL,
MAIL VARCHAR(30) NOT NULL,
AGE INT NOT NULL,
JOIN_DATE DATE NOT NULL,
STUDY_YEAR INT NOT NULL,
PRIMARY KEY(STUDENT_ID)
);

CREATE TABLE PROF_DBR
(
PROF_ID int NOT NULL,
FIRST_NAME VARCHAR(20) NOT NULL,
LAST_NAME VARCHAR(20) NOT NULL,
MAIL VARCHAR(30) NOT NULL,
AGE INT NOT NULL,
JOIN_DATE DATE NOT NULL,
TEACH VARCHAR(30) NOT NULL,
PRIMARY KEY(PROF_ID)
);

CREATE TABLE REGISTER_DBR
(
REGISTER_ID INT NOT NULL,
STUDENT_ID INT NOT NULL,
GRADE_1 INT,
GRADE_2 INT,
GRADE_3 INT,
CLASS_NAME_1 VARCHAR(30),
CLASS_NAME_2 VARCHAR(30),
CLASS_NAME_3 VARCHAR(30),
PRIMARY KEY(REGISTER_ID),
FOREIGN KEY(STUDENT_ID) REFERENCES STUDENT_DBR(STUDENT_ID)
);

CREATE TABLE CLASSROOMS_DBR
(
CLASSROOM_ID INT,
FLOOR INT,
SEATS INT,
PRIMARY KEY(CLASSROOM_ID)
);

CREATE TABLE CLASSES_DBR
(
CLASS_ID INT NOT NULL,
CLASS_NAME VARCHAR(30),
PROF_ID INT NOT NULL,
DAY_OF_WEEK INT CHECK (DAY_OF_WEEK BETWEEN 1 AND 7),
START_TIME VARCHAR(10) CHECK (START_TIME LIKE '__:__'),
CLASSROOM INT,
PRIMARY KEY(CLASS_ID),
FOREIGN KEY(CLASSROOM) REFERENCES CLASSROOMS_DBR(CLASSROOM_ID),
FOREIGN KEY(PROF_ID) REFERENCES PROF_DBR(PROF_ID)
);

--STUDENTS

INSERT INTO STUDENT_DBR(student_id,first_name,last_name,mail,age,join_date,study_year) VALUES
(1,'Bratu','Dragos','bratudragos@yahoo.com',20,TO_DATE('13-NOV-15','DD-MON-YY'),2);

INSERT INTO STUDENT_DBR(student_id,first_name,last_name,mail,age,join_date,study_year) VALUES
(2,'Mocanu','Andrei','mocandrei29@yahoo.com',18,TO_DATE('13-NOV-16','DD-MON-YY'),1);

INSERT INTO STUDENT_DBR(student_id,first_name,last_name,mail,age,join_date,study_year) VALUES
(3,'Popescu','Radu','radupop66@yahoo.com',19,TO_DATE('20-DEC-20','DD-MON-YY'),2);

INSERT INTO STUDENT_DBR(student_id,first_name,last_name,mail,age,join_date,study_year) VALUES
(4,'Hughin','Melesc','hughmel2@yahoo.com',25,TO_DATE('10-JAN-17','DD-MON-YY'),4);

INSERT INTO STUDENT_DBR(student_id,first_name,last_name,mail,age,join_date,study_year) VALUES
(5,'Ardelean','Andreea','aardelean22@yahoo.com',22,TO_DATE('17-MAR-19','DD-MON-YY'),3);

INSERT INTO STUDENT_DBR(student_id,first_name,last_name,mail,age,join_date,study_year) VALUES
(6,'Nemtescu','Florin','nemflorin89@gmail.com',26,TO_DATE('06-JUL-13','DD-MON-YY'),5);

INSERT INTO STUDENT_DBR(student_id,first_name,last_name,mail,age,join_date,study_year) VALUES
(7,'Boza','Horia','horboz10@yahoo.com',19,TO_DATE('11-JUL-15','DD-MON-YY'),4);

INSERT INTO STUDENT_DBR(student_id,first_name,last_name,mail,age,join_date,study_year) VALUES
(8,'Urduza','Mihai','urdumihai2@yahoo.com',23,TO_DATE('09-DEC-18','DD-MON-YY'),3);

INSERT INTO STUDENT_DBR(student_id,first_name,last_name,mail,age,join_date,study_year) VALUES
(9,'Ceptan','Raul','raulcepy@yahoo.com',25,TO_DATE('21-SEP-18','DD-MON-YY'),2);

INSERT INTO STUDENT_DBR(student_id,first_name,last_name,mail,age,join_date,study_year) VALUES
(10,'Budescu','Marian','budmarian@gmail.com',22,TO_DATE('09-SEP-18','DD-MON-YY'),4);

--PROF

INSERT INTO PROF_DBR(prof_id,first_name,last_name,mail,age,join_date,teach) VALUES
(1,'Girgian','Mihai','girgianmihai@yahoo.com',45,TO_DATE('20-JAN-98','DD-MON-YY'),'OOP');

INSERT INTO PROF_DBR(prof_id,first_name,last_name,mail,age,join_date,teach) VALUES
(2,'Clopotel','Maria','maryclopotel@yahoo.com',38,TO_DATE('10-DEC-99','DD-MON-YY'),'OOP');

INSERT INTO PROF_DBR(prof_id,first_name,last_name,mail,age,join_date,teach) VALUES
(3,'Radu','Andrei','profraduandrei@yahoo.com',46,TO_DATE('05-JAN-00','DD-MON-YY'),'SDA');

INSERT INTO PROF_DBR(prof_id,first_name,last_name,mail,age,join_date,teach) VALUES
(4,'Singh','Urdu','singhurdur@yahoo.com',35,TO_DATE('18-JUL-00','DD-MON-YY'),'SDA');

INSERT INTO PROF_DBR(prof_id,first_name,last_name,mail,age,join_date,teach) VALUES
(5,'Parlog','Diana','didiparlog@gmail.com',42,TO_DATE('24-SEP-06','DD-MON-YY'),'AT');

INSERT INTO PROF_DBR(prof_id,first_name,last_name,mail,age,join_date,teach) VALUES
(6,'Dinescu','Mirel','mirdinescu@gmail.com',50,TO_DATE('10-DEC-08','DD-MON-YY'),'ROBO');

INSERT INTO PROF_DBR(prof_id,first_name,last_name,mail,age,join_date,teach) VALUES
(7,'Sobrea','Daniel','sobdaniel@gmail.com',47,TO_DATE('02-MAR-11','DD-MON-YY'),'ROBO');

INSERT INTO PROF_DBR(prof_id,first_name,last_name,mail,age,join_date,teach) VALUES
(8,'Titescu','Ion','tition@gmail.com',44,TO_DATE('25-JUL-10','DD-MON-YY'),'AI');

INSERT INTO PROF_DBR(prof_id,first_name,last_name,mail,age,join_date,teach) VALUES
(9,'Georgescu','Radu','georgeradu24@gmail.com',52,TO_DATE('02-DEC-00','DD-MON-YY'),'AI');

INSERT INTO PROF_DBR(prof_id,first_name,last_name,mail,age,join_date,teach) VALUES
(10,'Popescu','George','popygeorge@gmail.com',33,TO_DATE('10-SEP-14','DD-MON-YY'),'RPA');

--CLASSROOMS

INSERT INTO CLASSROOMS_DBR(classroom_id,floor,seats) VALUES
(1,0,50);

INSERT INTO CLASSROOMS_DBR(classroom_id,floor,seats) VALUES
(2,0,15);

INSERT INTO CLASSROOMS_DBR(classroom_id,floor,seats) VALUES
(3,0,15);

INSERT INTO CLASSROOMS_DBR(classroom_id,floor,seats) VALUES
(4,1,50);

INSERT INTO CLASSROOMS_DBR(classroom_id,floor,seats) VALUES
(5,1,20);

INSERT INTO CLASSROOMS_DBR(classroom_id,floor,seats) VALUES
(6,1,25);

INSERT INTO CLASSROOMS_DBR(classroom_id,floor,seats) VALUES
(7,2,15);

INSERT INTO CLASSROOMS_DBR(classroom_id,floor,seats) VALUES
(8,2,10);

--CLASSES

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(1,'OOP',1,1,'10:00',1);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(2,'OOP',1,1,'12:00',1);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(3,'OOP',1,1,'14:00',1);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(4,'ROBO',7,1,'12:00',2);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(5,'ROBO',6,1,'12:00',3);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(6,'ROBO',10,1,'14:00',2);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(7,'AT',5,2,'10:00',1);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(8,'AT',5,2,'12:00',4);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(9,'SDA',4,2,'12:00',2);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(10,'AI',8,3,'10:00',2);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(11,'AI',8,3,'12:00',1);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(12,'OOP',1,4,'14:00',1);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(13,'OOP',1,4,'16:00',6);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(14,'SDA',3,5,'10:00',1);

INSERT INTO CLASSES_DBR(class_id,class_name,prof_id,day_of_week,start_time,classroom) VALUES
(15,'SDA',3,5,'12:00',1);


--REGISTER

INSERT INTO REGISTER_DBR(register_id,student_id,grade_1,grade_2,grade_3,class_name_1,class_name_2,class_name_3) VALUES
(1,1,4,6,10,'OOP','SDA','AT');

INSERT INTO REGISTER_DBR(register_id,student_id,grade_1,grade_2,grade_3,class_name_1,class_name_2,class_name_3) VALUES
(2,2,8,9,10,'OOP','SDA','AT');

INSERT INTO REGISTER_DBR(register_id,student_id,grade_1,grade_2,grade_3,class_name_1,class_name_2,class_name_3) VALUES
(3,3,2,5,6,'OOP','SDA','AT');

INSERT INTO REGISTER_DBR(register_id,student_id,grade_1,grade_2,grade_3,class_name_1,class_name_2,class_name_3) VALUES
(4,4,3,3,3,'OOP','SDA','ROBO');

INSERT INTO REGISTER_DBR(register_id,student_id,grade_1,grade_2,grade_3,class_name_1,class_name_2,class_name_3) VALUES
(5,5,10,10,10,'AI','RPA','AT');

INSERT INTO REGISTER_DBR(register_id,student_id,grade_1,grade_2,grade_3,class_name_1,class_name_2,class_name_3) VALUES
(6,6,6,8,9,'AI','RPA','AT');

INSERT INTO REGISTER_DBR(register_id,student_id,grade_1,grade_2,grade_3,class_name_1,class_name_2,class_name_3) VALUES
(7,7,9,8,9,'OOP','RPA','AI');

INSERT INTO REGISTER_DBR(register_id,student_id,grade_1,grade_2,grade_3,class_name_1,class_name_2,class_name_3) VALUES
(8,8,7,5,6,'OOP','AT','AI');

INSERT INTO REGISTER_DBR(register_id,student_id,grade_1,grade_2,grade_3,class_name_1,class_name_2,class_name_3) VALUES
(9,9,9,4,6,'OOP','ROBO','SDA');

INSERT INTO REGISTER_DBR(register_id,student_id,grade_1,grade_2,grade_3,class_name_1,class_name_2,class_name_3) VALUES
(10,10,5,5,5,'OOP','AI','SDA');