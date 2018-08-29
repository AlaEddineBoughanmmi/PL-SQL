--SET SERVEROUTPUT ON
DECLARE
    type tableau_commande is table of COMMANDES%ROWTYPE INDEX BY BINARY_INTEGER;
    tab_com tableau_commande;
    
BEGIN
    SELECT * BULK COLLECT INTO tab_com
    FROM COMMANDES
    WHERE ETAT_CDE = 'TRAITEE';
    
    FOR x IN 1..tab_com.count LOOP
        DBMS_OUTPUT.PUT_LINE('Numero de commande : ' || tab_com(x).NUMERO_CDE || ' Etat commande : ' || tab_com(x).ETAT_CDE);
    END LOOP;
END;
/