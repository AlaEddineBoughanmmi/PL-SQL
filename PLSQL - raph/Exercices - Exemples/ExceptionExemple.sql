set SERVEROUTPUT ON;
accept p_nom prompt 'Quel salarié cherchez-vous ?';

declare
    var_nom salaries.nom_sal%type := '&p_nom';
begin
    select nom_sal into var_nom from salaries
    where nom_sal = var_nom;
    exception
        when no_data_found then
        DBMS_OUTPUT.PUT_LINE('Ce salarié ' || var_nom || ' n''existe pas !');
        when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Autre Exception');
end;
/