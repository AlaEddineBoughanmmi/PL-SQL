--SET SERVEROUTPUT ON

ACCEPT p_lettre prompt 'Indiquez le pays du client : ';
VARIABLE var_char VARCHAR2(50);

DECLARE
    cursor cur_cli(var_pays CLIENTS.pays%type) is select count(*) Nbr, C.NUMERO_CLI, C.NOM, C.PAYS from CLIENTS C
        inner join COMMANDES CO on C.NUMERO_CLI = CO.NUMERO_CLI 
        inner join LIGNES_COMMANDES L on CO.NUMERO_CDE = L.NUMERO_CDE
        where C.pays = var_pays
        group by C.NUMERO_CLI, C.NOM, C.PAYS;

BEGIN
    for var_clients in cur_cli(var_pays => '&p_lettre') LOOP
        DBMS_OUTPUT.PUT_LINE('Numero Client : ' || var_clients.NUMERO_CLI 
            || ' / Nom : ' || var_clients.NOM 
            || ' / Nbr de Produits commandés : ' ||var_clients.Nbr); 
    end loop;
END;
/