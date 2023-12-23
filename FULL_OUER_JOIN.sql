create table emp_2020
(
emp_id int,
designation varchar(20)
);

create table emp_2021
(
emp_id int,
designation varchar(20)
);
SELECT * FROM emp_2020;
insert into emp_2020 values (1,'Trainee');
insert into emp_2020 values (2,'Developer');
insert into emp_2020 values (3,'Senior Developer');
insert into emp_2020 values (4,'Manager');
insert into emp_2021 values (1,'Developer');
insert into emp_2021 values(2,'Developer');
insert into emp_2021 values(3,'Manager');
insert into emp_2021 values(5,'Trainee');
-------------SOLUTION


SELECT NVL(E1.EMP_ID,E2.EMP_ID),
    MAX(CASE WHEN E2.EMP_ID IS NULL THEN 'RESIGNED' WHEN E1.EMP_ID IS NULL THEN 'NEW' ELSE 'PROMOTED' END) COMMENTS
    FROM emp_2020 E1 FULL OUTER JOIN  EMP_2021 E2
    ON E1.EMP_ID=E2.EMP_ID AND E1.DESIGNATION<>E2.DESIGNATION
    GROUP BY NVL(E1.EMP_ID,E2.EMP_ID) HAVING COUNT(*)=1
    ORDER BY 1;
