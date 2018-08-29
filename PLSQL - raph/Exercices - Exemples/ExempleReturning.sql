--SET SERVEROUTPUT ON;
DECLARE
    var_nom salaries.nom_sal%TYPE;
    var_prenom salaries.prenom_sal%TYPE;
    var_fonction salaries.fonction%TYPE;

BEGIN
    insert into salaries
    values(17,'Basso', 'Karter', 'Vendeur', 70, null)
    RETURNING nom_sal, prenom_sal, fonction
    into var_nom, var_prenom, var_fonction;
    
    DBMS_OUTPUT.PUT_LINE('Nom ins�r� ' || var_nom);
    DBMS_OUTPUT.PUT_LINE('Prenom ins�r� ' || var_prenom);
    DBMS_OUTPUT.PUT_LINE('Fonction ins�r�e ' || var_fonction);
    
END;
/

ROLLBACK;