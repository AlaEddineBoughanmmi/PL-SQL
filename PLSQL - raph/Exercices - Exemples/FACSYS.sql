create or replace function salaireAnnuel(p_number NUMBER)
return number

is

var_salaire salaries.salaire%type;

begin

	select ((salaire*12)+nvl(COMISSION, 0)) into var_salaire from salaries where NUMERO_SAL = p_number;
	IF SQL%FOUND THEN
    return var_salaire;
    ELSE
    DBMS_OUTPUT.PUT_LINE('Salarié non existant');
    END IF;

end salaireAnnuel;