CREATE DEFINER=`root`@`localhost` TRIGGER `employees_AFTER_INSERT` AFTER INSERT ON `employees` FOR EACH ROW BEGIN
	insert INTO salaries
    (`emp_no` , `salary` , `from_date` , `to_date` )
    values (NEW.emp_no, '2000', New.hire_date, New.hire_date);
END