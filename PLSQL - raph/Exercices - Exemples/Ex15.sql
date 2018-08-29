set SERVEROUTPUT ON;
declare

var_sal SALARIES.SALAIRE%TYPE;

begin
select avg(salaire) into var_sal from SALARIES;
DBMS_OUTPUT.PUT_LINE ('Le salaire moyen est ' || var_sal );
end;
/

-- select * from categories;