--SET SERVEROUTPUT ON;
ACCEPT p_cde prompt 'Quelle commande a été traitée ? : ';

DECLARE
    
    var_num COMMANDES.NUMERO_CDE%TYPE;
    var_cde COMMANDES%ROWTYPE;
        
BEGIN
    var_num := '&p_cde';
    SELECT * INTO var_cde FROM COMMANDES WHERE NUMERO_CDE = var_num;
    DBMS_OUTPUT.PUT_LINE(   'Numero Cde : ' || var_cde.NUMERO_CDE || 
                            ' Numero Salarié : ' || var_cde.NUMERO_SAL || 
                            ' Numero Client : ' || var_cde.NUMERO_CLI ||
                            ' Date Cde : ' || var_cde.DATE_CDE ||
                            ' Taux Remise : ' || var_cde.TAUX_REMISE ||
                            ' Etat de la Cde : ' || var_cde.ETAT_CDE ||
                            ' Date d''envoi : ' || var_cde.DATE_ENVOI ||
                            ' Taux TVA : ' || var_cde.TAUX_TVA);
    IF var_cde.DATE_ENVOI IS NULL
        THEN
            var_cde.DATE_ENVOI := SYSDATE;
            var_cde.ETAT_CDE := 'TRAITEE';
            UPDATE commandes set row = var_cde
            WHERE NUMERO_CDE = var_cde.NUMERO_CDE;
            DBMS_OUTPUT.PUT_LINE(   'Numero Cde : ' || var_cde.NUMERO_CDE || 
                            ' Numero Salarié : ' || var_cde.NUMERO_SAL || 
                            ' Numero Client : ' || var_cde.NUMERO_CLI ||
                            ' Date Cde : ' || var_cde.DATE_CDE ||
                            ' Taux Remise : ' || var_cde.TAUX_REMISE ||
                            ' Etat de la Cde : ' || var_cde.ETAT_CDE ||
                            ' Date d''envoi : ' || var_cde.DATE_ENVOI ||
                            ' Taux TVA : ' || var_cde.TAUX_TVA);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Commande déjà traitée');
    END IF;
END;
/

ROLLBACK;
    