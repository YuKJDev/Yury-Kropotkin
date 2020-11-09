SELECT 
    COUNT(*) as 'Всего сотрудников'
FROM
    employees AS e
        JOIN
    dept_emp AS de ON de.emp_no = e.emp_no
WHERE
    de.from_date <= CURDATE()
        AND de.to_date > CURDATE();