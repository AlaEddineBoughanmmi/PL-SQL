-- curseur for update

--set serveroutput on;
declare
	cursor cur_salaries is select * from salaries for update;
	var_sal cur_salaries%rowtype;
begin
	IF NOT cur_salaries%isopen THEN
		open cur_salaries;
	END IF;
	fetch cur_salaries into var_sal;
	update salaries set comission = null
	where fonction = 'Vendeur';
	commit;
	close cur_salaries;
end;
/