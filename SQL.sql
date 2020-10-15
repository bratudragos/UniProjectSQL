--1.Sa se afiseze numele si prenumele studentilor care au adrese yahoo de mail, ordonat descendent dupa anul de studiu 

SELECT first_name,last_name,mail,study_year FROM STUDENT_DBR WHERE LOWER(MAIL) LIKE '%@yahoo.com' ORDER BY STUDY_YEAR DESC;

--2.Sa se afiseze numele si prenumele studentilor care au anul de studiu egal cu media anilor de studiu a tuturor studentilor

SELECT first_name,last_name FROM STUDENT_DBR WHERE STUDY_YEAR=(SELECT AVG(STUDY_YEAR) FROM STUDENT_DBR);

--3.Sa se afiseze cati studenti s-au inscris la facultate in luna iulie

SELECT COUNT(STUDENT_ID) FROM STUDENT_DBR WHERE SUBSTR((TO_CHAR(JOIN_DATE)),4,3)='JUL';

--4.Sa se afiseze care este cel mai recent inscris student

SELECT last_name,first_name FROM STUDENT_DBR 
WHERE MONTHS_BETWEEN(join_date,SYSDATE)=(SELECT MAX(MONTHS_BETWEEN(join_date,SYSDATE)) FROM STUDENT_DBR);

--5.Sa se afiseze cate cursuri sustine fiecare profesor

SELECT COUNT(class_id) as "Numar cursuri",p.first_name FROM CLASSES_DBR c JOIN PROF_DBR p ON p.prof_id=c.prof_id GROUP BY p.first_name;

--6.Sa se afiseze materiile pentru care se tin cel putin 3 cursuri de-alungul saptamanii

SELECT class_name as "Materie",COUNT(class_id) as "Numar cursuri" 
FROM CLASSES_DBR GROUP BY class_name HAVING COUNT(class_id) >= 3 ORDER BY COUNT(class_id) DESC;

--7.Sa se afiseze cati studenti pot fi prezenti simultan la cursuri

SELECT SUM(seats) FROM CLASSROOMS_DBR;

--8.Sa se afiseze cate sali de clasa au numar de locuri egal cu media numerelor de locuri din toate salile de clasa

SELECT COUNT(classroom_id) FROM CLASSROOMS_DBR WHERE seats=(SELECT AVG(seats) FROM CLASSROOMS_DBR);

--9.Sa se afiseze numele,prenumele studentilor, si in functie de anul de studiu sa se afiseze 
--boboc pentru anul 1, terminal pentru anul 5, intermediar pentru restul

SELECT last_name,first_name,DECODE(study_year, 1,'boboc',5,'terminal','intermediar') FROM STUDENT_DBR;

--10.Sa se afiseze studentul cu cea mai apropiata data de inscriere fata de studentul Mocanu Andrei

SELECT last_name,first_name FROM STUDENT_DBR 
WHERE (ABS(join_date-(SELECT join_date FROM STUDENT_DBR WHERE LOWER(first_name)='mocanu' AND UPPER(last_name)='ANDREI')))=
(SELECT MIN(ABS(join_date-(SELECT join_date FROM STUDENT_DBR WHERE LOWER(first_name)='mocanu' AND UPPER(last_name)='ANDREI')))
FROM student_dbr WHERE LOWER(first_name)!='mocanu' AND UPPER(last_name)!='ANDREI');

--11.Sa se afiseze cate locuri sunt ocupate de studenti lunea

SELECT SUM(cl.seats) as "Numar studenti" FROM CLASSES_DBR c JOIN CLASSROOMS_DBR cl ON cl.classroom_id=c.classroom WHERE c.day_of_week=1;

--12.Sa se afiseze studentii care promoveaza toate materiile la care au cursuri

SELECT first_name,last_name,
CASE
WHEN grade_1>=5 AND grade_2>=5 AND grade_3>=5 THEN 'Promoveaza'
ELSE 'Nu promoveaza'
END AS Stare    
FROM STUDENT_DBR JOIN REGISTER_DBR USING(student_id);
                    
--13.Sa se afiseze profesorul care tine cele mai multe cursuri

SELECT last_name,first_name FROM PROF_DBR WHERE prof_id=(SELECT prof_id FROM(
(SELECT MAX(total),prof_id FROM (SELECT COUNT(class_id) as total,prof_id 
FROM CLASSES_DBR GROUP BY prof_id) JOIN PROF_DBR USING(prof_id) WHERE ROWNUM=1 GROUP BY prof_id)));

--14.Sa se afiseze numele si prenumele studentilor care au litera b in adresa lor de mail

SELECT last_name,first_name FROM STUDENT_DBR WHERE INSTR(mail,'b')!=0;

--15.Afisati daca exista profesorul care tine toate cursurile in ziua de vineri

SELECT DISTINCT last_name,first_name
FROM PROF_DBR p
WHERE NOT EXISTS
(SELECT class_name
FROM CLASSES_DBR c
WHERE day_of_week=5
AND NOT EXISTS
(SELECT prof_id
FROM PROF_DBR p2
WHERE p2.prof_id = c.prof_id
AND p.prof_id = p2.prof_id));
