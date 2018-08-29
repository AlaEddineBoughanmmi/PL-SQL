SET SERVEROUTPUT ON;

ACCEPT p_lettre prompt 'Choisir une lettre : ';
VARIABLE var_char VARCHAR2(50);

DECLARE
   --cursor cur_cli(var_nom VARCHAR2) is select * from CLIENTS where Nom like var_nom;
BEGIN
    :var_char := '&p_lettre' || '%';
    DBMS_OUTPUT.PUT_LINE(:var_char);

    FOR var_cli in (select * from CLIENTS where Nom like :var_char) LOOP  --cur_cli(var_nom => :var_char) LOOP
    DBMS_OUTPUT.PUT_LINE(var_cli.NOM || ' ' || var_cli.PRENOM || ' ' ||var_cli.NUMERO_CLI);
    END LOOP;
    
END;
/