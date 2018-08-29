set serveroutput on;

DECLARE
    cursor cur_com is select * from COMMANDES where ETAT_CDE = 'TRAITEE' ORDER BY DATE_ENVOI;
    var_com cur_com%rowtype;
BEGIN
    IF NOT cur_com%isopen THEN
        OPEN cur_com;
    END IF;
    FETCH cur_com into var_com;
    WHILE cur_com%found LOOP
    DBMS_OUTPUT.PUT_LINE(var_com.NUMERO_CDE || ' ' || var_com.ETAT_CDE);
    FETCH cur_com into var_com;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Nombre de commandes traitées : ' || cur_com%ROWCOUNT);
    CLOSE cur_com;
    
END;
/