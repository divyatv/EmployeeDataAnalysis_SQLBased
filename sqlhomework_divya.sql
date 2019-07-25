---1. List the following details of each employee:
---employee number, last name, first name, gender, and salary.

SELECT E.EMP_NO, E.FIRST_NAME, E.LAST_NAME, E.GENDER, S.SALARY
FROM EMPLOYEES E
JOIN SALARIES S
ON(E.EMP_NO=S.EMP_NO)
WHERE E.EMP_NO=S.EMP_NO;

--2. List employees who were hired in 1986.
SELECT * FROM EMPLOYEES WHERE HIRE_DATE > '01-01-1986' and HIRE_DATE < '12-31-1986';
--- using date part function
SELECT * FROM EMPLOYEES WHERE date_part('year', HIRE_DATE) = '1986'


---3. List the manager of each department with the following information:
---department number, department name,
---the manager's employee number, last name, first name, and start and end employment dates
---SELECT * FROM a JOIN (b JOIN c ON (b.ref = c.id)) ON (a.id = b.id);
SELECT D.DEPT_NO, D.DEPT_NAME, DM.EMP_NO,DM.FROM_DATE, DM.TO_DATE, 
E.FIRST_NAME, E.LAST_NAME , E.HIRE_DATE
FROM DEPARTMENTS D
JOIN (DEPARTMENT_MANAGER DM JOIN EMPLOYEES E ON(DM.EMP_NO=E.EMP_NO)) ON (D.DEPT_NO=DM.DEPT_NO);

---4. List the department of each employee with the following information: 
---employee number, last name, first name, and department name.
SELECT D.DEPT_NAME, E.EMP_NO, E.LAST_NAME, E.FIRST_NAME
FROM EMPLOYEES E
JOIN (DEPARTMENT_EMPLOYEE DE JOIN DEPARTMENTS D ON (D.DEPT_NO=DE.DEPT_NO))
ON(E.EMP_NO=DE.EMP_NO);

---5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM EMPLOYEES WHERE FIRST_NAME='Hercules' 
AND LAST_NAME LIKE 'B%';

---6. List all employees in the Sales department, 
---including their employee number, last name, first name, and department name.
SELECT DEPT_NO FROM DEPARTMENTS WHERE DEPT_NAME like 'Sales%';

SELECT E.EMP_NO, E.LAST_NAME, E.FIRST_NAME, D.DEPT_NAME
FROM EMPLOYEES E
JOIN (DEPARTMENT_EMPLOYEE DE JOIN DEPARTMENTS D ON (DE.DEPT_NO=D.DEPT_NO)) 
ON (E.EMP_NO=DE.EMP_NO)
WHERE D.DEPT_NAME='Sales';

---7. List all employees in the Sales and Development departments, 
---including their employee number, last name, first name, and department name.
SELECT E.EMP_NO, E.LAST_NAME, E.FIRST_NAME, D.DEPT_NAME
FROM EMPLOYEES E
JOIN (DEPARTMENT_EMPLOYEE DE JOIN DEPARTMENTS D ON (DE.DEPT_NO=D.DEPT_NO)) 
ON (E.EMP_NO=DE.EMP_NO)
WHERE D.DEPT_NAME='Sales' OR D.DEPT_NAME like 'Develop%';

---8. In descending order, list the frequency count of employee last names, 
---i.e., how many employees share each last name.
SELECT LAST_NAME, COUNT(LAST_NAME) AS "COUNT OF LAST NAME" FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY "COUNT OF LAST NAME" DESC;


