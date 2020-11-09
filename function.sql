CREATE DEFINER=`root`@`localhost` FUNCTION `findManager`( first_name varchar(14), last_name varchar(16) ) RETURNS int
    READS SQL DATA
begin
    declare empNo int;
	set empNo = (
		select de.emp_no
        from dept_manager de
        join employees as e 
        using (emp_no)
        where
			e.first_name = first_name
        and e.last_name = last_name
        );
    set @empNo = empNo;    
    return empNo;
end