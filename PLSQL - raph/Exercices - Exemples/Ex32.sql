SET SERVEROUTPUT ON
/*
Cr�er un bloc PL/SQL qui permet de mettre � jour la date d�envoi 
des commandes � la date du jour et l��tat de la commande � � trait�e � 
pour les commandes dont la date d�envoi est nul.  
Utiliser la clause returning pour afficher les commandes modifi�es.
*/

DECLARE
    CURSOR cur_cmd is select * from COMMANDES where DATE_ENVOI = null for update;
    var_num COMMANDES.NUMERO_CDE%type;
    var_etat COMMANDES.ETAT_CDE%type;
    var_date COMMANDES.DATE_ENVOI%type;
    var_cmd cur_cmd%rowtype;
BEGIN
    FOR var_cmd IN cur_cmd LOOP
        DBMS_OUTPUT.PUT_LINE(var_cmd.NUMERO_CDE || ' ' || var_cdm.ETAT_CDE || ' ' || var_cmd.DATE_ENVOI);
        update COMMANDES
        set DATE_ENVOI = SYSDATE, ETAT_CDE = 'Trait�e'
        returning
        NUMERO_CDE, ETAT_CDE, DATE_ENVOI
        into var_num, var_etat, var_date;
        DBMS_OUTPUT.PUT_LINE(
            var_num || '    ' || 
            var_etat || '  ' || 
            var_date);
    END LOOP;
    
END;
/