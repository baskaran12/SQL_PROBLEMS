insert into hospital values ('1', 'in', '2019-12-22 09:00:00');
insert into hospital values ('1', 'out', TO_TIMESTAMP('2019-12-22 09:15:00','YYYY-MM-DD HH:MI:SS'));
insert into hospital values ('2', 'in',  TO_TIMESTAMP('2019-12-22 09:00:00','YYYY-MM-DD HH:MI:SS'));
insert into hospital values ('2', 'out', TO_TIMESTAMP('2019-12-22 09:15:00','YYYY-MM-DD HH:MI:SS'));
insert into hospital values ('2', 'in',  TO_TIMESTAMP('2019-12-22 09:30:00','YYYY-MM-DD HH:MI:SS'));
insert into hospital values ('3', 'out', TO_TIMESTAMP('2019-12-22 09:00:00','YYYY-MM-DD HH:MI:SS'));
insert into hospital values ('3', 'in',  TO_TIMESTAMP('2019-12-22 09:15:00','YYYY-MM-DD HH:MI:SS'));
insert into hospital values ('3', 'out', TO_TIMESTAMP('2019-12-22 09:30:00','YYYY-MM-DD HH:MI:SS'));
insert into hospital values ('3', 'in',  TO_TIMESTAMP('2019-12-22 09:45:00','YYYY-MM-DD HH:MI:SS'));
insert into hospital values ('4', 'in',  TO_TIMESTAMP('2019-12-22 09:45:00','YYYY-MM-DD HH:MI:SS'));
insert into hospital values ('5', 'out', TO_TIMESTAMP('2019-12-22 09:40:00','YYYY-MM-DD HH:MI:SS'));

---FIND THE TOTAL IN TIME

---SOLUTION
---METHOD 1
SELECT EMP_ID 
FROM hospital
GROUP BY EMP_ID
HAVING MAX (CASE WHEN ACTION='in' THEN REPORT_TIME END )>= MAX (CASE WHEN ACTION='out' THEN REPORT_TIME ELSE REPORT_TIME END );

----------METHOD 2
WITH CTE AS (
SELECT EMP_ID ,MAX (REPORT_TIME) MAX_TIME
FROM hospital
GROUP BY EMP_ID)

SELECT * 
FROM CTE INNER JOIN HOSPITAL H
ON CTE.EMP_ID=H.EMP_ID AND CTE.MAX_TIME=H.REPORT_TIME AND ACTION='in';