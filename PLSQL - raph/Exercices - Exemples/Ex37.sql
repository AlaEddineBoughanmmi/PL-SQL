set serveroutput ON;
ACCEPT p_number prompt 'Indiquez votre numéro de salarié : ';
declare


begin

CALCUL_SALAIRE_PROCEDURE_PARAM(&p_number);

end;
/