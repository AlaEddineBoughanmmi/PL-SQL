set serveroutput ON;
ACCEPT p_number prompt 'Indiquez votre num�ro de salari� : ';
declare


begin

CALCUL_SALAIRE_PROCEDURE_PARAM(&p_number);

end;
/