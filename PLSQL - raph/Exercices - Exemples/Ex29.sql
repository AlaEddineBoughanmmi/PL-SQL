set serveroutput on;

DECLARE
    cursor cur_client is select count(*) Nbr, C.NUMERO_CLI Numero, C.NOM Nom from CLIENTS C 
        inner join COMMANDES O on C.NUMERO_CLI = O.NUMERO_CLI
        GROUP BY C.NUMERO_CLI, C.NOM
        ORDER BY 1 DESC;
    var_cli cur_client%rowtype;

BEGIN
    IF NOT cur_client%isopen THEN
        OPEN cur_client;
    END IF;
    LOOP
        FETCH cur_client into var_cli;
        EXIT WHEN cur_client%notfound;
        DBMS_OUTPUT.PUT_LINE('Nombre de commandes : ' || var_cli.Nbr 
	|| ' / Nom Client : ' || var_cli.Nom 
	|| ' / Numéro Client : ' || var_cli.Numero);
    END LOOP;
    CLOSE cur_client;
    
END;
/