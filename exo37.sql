create or replace function calculerSalaire(numSal IN Salaries.numero_sal%type)
return salaries.salaire%type
is
salaireAnnuel salaries.salaire%type;
begin
    select salaire*12+nvl(comission,0) into salaireAnnuel from salaries where NUMERO_SAL = numSal;
    return salaireAnnuel;

    EXCEPTION 
	when NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE("Le salarié " ||numSal|| " n\'existe pas !");
	RETURN 0;
end calculerSalaire;

set serveroutput on;
accept p_num prompt 'Entrez le numéro du salarié :'
declare 
salaireAnnuel salaries.salaire%type;
begin
    salaireAnnuel := calculerSalaire('&p_num');
    DBMS_OUTPUT.PUT_LINE('Salaire annuel : ' || salaireAnnuel);
end;
/