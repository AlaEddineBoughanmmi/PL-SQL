--select * from commandes;
--set serveuroutput on;

DECLARE
    var_commande commandes%ROWTYPE;

BEGIN
    select * into var_commande
    from COMMANDES
    where NUMERO_CDE = 1001;
    DBMS_OUTPUT.PUT_LINE('There are avant mise à jour : ' || var_commande.DATE_ENVOI);
    var_commande.date_envoi := SYSDATE;
    UPDATE commandes set row = var_commande
    where numero_cde = var_commande.numero_cde;
    DBMS_OUTPUT.PUT_LINE('There are après mise à jour : ' || var_commande.date_envoi);
    
END;
/

ROLLBACK;