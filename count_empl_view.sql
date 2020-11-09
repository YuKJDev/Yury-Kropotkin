CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `count_eml_view` AS
    SELECT 
        COUNT(0) AS `Всего сотрудников`
    FROM
        (`employees` `e`
        JOIN `dept_emp` `de` ON ((`de`.`emp_no` = `e`.`emp_no`)))
    WHERE
        ((`de`.`from_date` <= CURDATE())
            AND (`de`.`to_date` > CURDATE()))