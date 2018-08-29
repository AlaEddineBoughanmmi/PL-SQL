SET SERVEROUTPUT ON;

ACCEPT p_nom prompt 'Nom du nouveau salarié : ';
ACCEPT p_prenom prompt 'Prenom du nouveau salarié : ';
ACCEPT p_fonction prompt 'Fonction du nouveau salarié : ';
ACCEPT p_salaire prompt 'Salaire du nouveau salarié : ';

VARIABLE var_nom VARCHAR2(50);
VARIABLE var_pren VARCHAR2(50);
VARIABLE var_fonc VARCHAR2(50);
VARIABLE var_sala NUMBER;

DECLARE


    var_nom2 salaries.nom_sal%TYPE;
    var_prenom salaries.prenom_sal%TYPE;
    var_fonction salaries.fonction%TYPE;

BEGIN
    :var_nom := '&p_nom';
    :var_pren := '&p_prenom';
    :var_fonc := '&p_fonction';
    :var_sala := '&p_salaire';
    
    insert into salaries
    values(15 ,:var_nom, :var_pren, :var_fonc, :var_sala, null)
    RETURNING nom_sal, prenom_sal, fonction
    into var_nom2, var_prenom, var_fonction;
    
    DBMS_OUTPUT.PUT_LINE('Nom inséré ' || var_nom2);
    DBMS_OUTPUT.PUT_LINE('Prenom inséré ' || var_prenom);
    DBMS_OUTPUT.PUT_LINE('Fonction insérée ' || var_fonction);
    
END;
/

ROLLBACK;