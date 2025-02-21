use hr;

-- Fundamentals of Structured Query Language - 1 

-- 1. Retrieve all details of employees. (details_of_employees)
SELECT * FROM employees;

-- 2. Display the first name, last name, and email of all employees. (first_name_last_name_email_of_employees)
SELECT first_name, last_name, email from employees;

-- 3. Retrieve the distinct job titles from the jobs table. (distinct_jobs)
SELECT DISTINCT job_title as distinct_jobs from jobs;

-- 4. Find the total number of employees in the company. (number_of_employees)
SELECT count(*) from employees;

-- 5. Retrieve the employees who were hired after January 1, 2000. (hired_2000_onwards)
SELECT * FROM employees WHERE hire_date > '2000-01-01';

-- Fundamentals of Structured Query Language - 2 

-- 6. List all employees who have a salary greater than 5000. (salary_5000)
SELECT * FROM employees WHERE salary > 5000;

-- 7. Retrieve employees with job titles containing the word ‘Manager.’ (titles_with_manager)
SELECT employees.employee_id, employees.first_name, employees.last_name, jobs.job_title
FROM employees
RIGHT JOIN jobs ON employees.job_id = jobs.job_id
WHERE jobs.job_title LIKE '%Manager%';

-- 8. Retrieve all employees whose first name starts with ‘A’ and ends with ‘n.’ (start_A_end_n)
SELECT * FROM employees WHERE first_name LIKE 'A%n';

-- 9. Display the employees who do not have a commission. (dont_have_commission)
SELECT * FROM employees WHERE commission_pct IS NULL;

-- 10. Retrieve the top 5 highest-paid employees.  (highest_paid_5)
SELECT * FROM employees ORDER BY salary DESC  LIMIT 5;

-- SQL Functions 

-- 11. Find the average salary of all employees. (avg_salary)
SELECT AVG(salary) as average_salary from employees;

-- 12. Retrieve the total number of employees working in each department. (number_of_employees_in_department)
SELECT count(*) as number_of_employees, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id
GROUP BY departments.department_name;

-- 13. Display the employee's first name and the length of their first name. (name_length)
SELECT first_name, LENGTH(first_name) AS name_length FROM employees;

-- 14. Convert the hire_date of employees to display only the year. (hire_year)
SELECT employee_id, first_name,last_name, EXTRACT(YEAR FROM hire_date) AS hire_year FROM employees;

-- 15. Retrieve the minimum and maximum salary for each job title. (min_max_salary_title)
SELECT jobs.job_title, MIN(employees.salary) AS min_salary, MAX(employees.salary) AS max_salary
FROM employees
JOIN jobs ON employees.job_id = jobs.job_id
GROUP BY jobs.job_title;

-- SQL Tables, Joins 

-- 16. Retrieve the employee names along with their department names.  (names_with_department)
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id;

-- 17. List the employees along with their job titles and the location of their department. (emp_job_title_location)
SELECT employees.first_name, employees.last_name, jobs.job_title, locations.city, locations.state_province, locations.country_id
FROM employees
JOIN jobs ON employees.job_id = jobs.job_id
JOIN departments ON employees.department_id = departments.department_id
JOIN locations ON departments.location_id = locations.location_id;

-- 18. Retrieve the department names along with the count of employees in each department. (department_emp_count)
SELECT departments.department_name, COUNT(employees.employee_id) AS employee_count
FROM departments
LEFT JOIN employees ON departments.department_id = employees.department_id
GROUP BY departments.department_name;

-- 19. Find employees who have the same job as their manager. (emp_manager_same_job)
SELECT e1.first_name, e1.last_name, e2.first_name AS manager_first_name, e2.last_name AS manager_last_name, jobs.job_title
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.employee_id
JOIN jobs ON e1.job_id = jobs.job_id AND e2.job_id = jobs.job_id;

-- 20. Display the names of employees who worked in different jobs in the past (use job_history). (diff_job_history)
SELECT DISTINCT employees.first_name, employees.last_name
FROM employees
JOIN job_history ON employees.employee_id = job_history.employee_id
WHERE employees.job_id != job_history.job_id;
