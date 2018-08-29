create or replace 
PROCEDURE augmentation_procedure_param(p_nom SALARIES.NOM_SAL%TYPE, p_taux NUMBER)
IS

r_taux NUMBER;
r_Numero SALARIES.NUMERO_SAL%TYPE;
r_Nom SALARIES.NOM_SAL%TYPE;
r_Prenom SALARIES.PRENOM_SAL%TYPE;
r_Fonction SALARIES.FONCTION%TYPE;
r_Salaire SALARIES.SALAIRE%TYPE;
r_Comission SALARIES.COMISSION%TYPE;

BEGIN
r_taux := p_taux;
IF r_taux > 20 THEN
    r_taux := 20;
update salaries set salaire = salaire * (1+p_taux/100) where NOM_SAL = p_nom 
returning NUMERO_SAL, NOM_SAL, PRENOM_SAL, FONCTION, SALAIRE, COMISSION 
    into r_Numero, r_Nom, r_Prenom, r_Fonction, r_Salaire, r_Comission;
END IF;

IF SQL%FOUND THEN
	DBMS_OUTPUT.PUT_LINE('Nom du salarié : ' || r_Nom);
	DBMS_OUTPUT.PUT_LINE('Prenom du salarié : ' || r_Prenom);
	DBMS_OUTPUT.PUT_LINE('Salaire : ' || r_Salaire);
	DBMS_OUTPUT.PUT_LINE('Fonction : ' || r_Fonction);
	DBMS_OUTPUT.PUT_LINE('Comission : ' || r_Comission);
END IF;

EXCEPTION
    WHEN no_data_found then
        DBMS_OUTPUT.PUT_LINE('Le salarié ' || p_nom || ' n''existe pas.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Autre Exception');

END augmentation_procedure_param;