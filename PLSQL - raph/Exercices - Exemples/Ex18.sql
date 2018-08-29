--SET SERVEROUTPUT ON

DECLARE
    type rec_art is record (nbr NUMBER, numCo COMMANDES.NUMERO_CDE%TYPE, nomCl CLIENTS.NOM%TYPE);
    type rec_tableau is table of rec_art index by BINARY_INTEGER;
    rec_tab rec_tableau;
    
BEGIN
    SELECT COUNT(*), B.NUMERO_CDE, C.NOM BULK COLLECT INTO rec_tab
    FROM CLIENTS C  INNER JOIN COMMANDES B ON C.NUMERO_CLI = B.NUMERO_CLI
                    INNER JOIN LIGNES_COMMANDES A ON B.NUMERO_CDE = A.NUMERO_CDE
    GROUP BY B.NUMERO_CDE, C.NOM
    HAVING COUNT(*) > 2;
    
    FOR x IN 1..rec_tab.count LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre d''articles : ' || rec_tab(x).nbr || ' Numéro de commande : ' || rec_tab(x).numCo || ' Nom du client : ' || rec_tab(x).nomCl);
    END LOOP;

END;
/