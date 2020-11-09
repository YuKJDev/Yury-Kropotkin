CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sum_sal_view` AS
    SELECT 
        `de`.`dept_no` AS `dept_no`,
        `dep`.`dept_name` AS `dept_name`,
        COUNT(0) AS `COUNT(*)`,
        SUM(`sal`.`salary`) AS `SUM(sal.salary)`
    FROM
        (((`employees` `emp`
        JOIN `salaries` `sal` ON ((`emp`.`emp_no` = `sal`.`emp_no`)))
        JOIN `dept_emp` `de` ON ((`de`.`emp_no` = `emp`.`emp_no`)))
        JOIN `departments` `dep` ON ((`dep`.`dept_no` = `de`.`dept_no`)))
    WHERE
        ((`de`.`to_date` = '9999-01-01')
            AND (`sal`.`to_date` = '9999-01-01'))
    GROUP BY `dep`.`dept_no`
    ORDER BY `de`.`dept_no`