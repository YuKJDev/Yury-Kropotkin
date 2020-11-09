CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `depart_avgsel_view` AS
    SELECT 
        `d`.`dept_no` AS `id`,
        `d`.`dept_name` AS `Департамент`,
        ROUND(AVG(`s`.`salary`), 2) AS `Средняя зарплата`
    FROM
        (((`departments` `d`
        JOIN `dept_emp` `de` ON ((`d`.`dept_no` = `de`.`dept_no`)))
        JOIN `salaries` `s` ON ((`s`.`emp_no` = `de`.`emp_no`)))
        JOIN `employees` `e` ON ((`de`.`emp_no` = `e`.`emp_no`)))
    WHERE
        (CURDATE() BETWEEN `s`.`from_date` AND `s`.`to_date`)
    GROUP BY `d`.`dept_no`