SET SERVEROUTPUT ON
ACCEPT p_article prompt 'De quel article désirez-vous voir les commandes ? : ';
VARIABLE des_art VARCHAR2(50);
DECLARE
    type rec_com is record (design ARTICLES.DESIGNATION_ART%TYPE, numCo COMMANDES.NUMERO_CDE%TYPE, qttCo LIGNES_COMMANDES.QUANTITE_CDE%TYPE, prixA ARTICLES.PRIX_HT%TYPE);
    type tableau_commande is table of rec_com index by BINARY_INTEGER;
    tab_com tableau_commande;
    
BEGIN
    :des_art := '&p_article';
    SELECT A.DESIGNATION_ART, C.NUMERO_CDE, L.QUANTITE_CDE, A.PRIX_HT BULK COLLECT INTO tab_com
    FROM ARTICLES A INNER JOIN LIGNES_COMMANDES L ON A.REFERENCE_ART = L.REFERENCE_ART
                    INNER JOIN COMMANDES C ON C.NUMERO_CDE = L.NUMERO_CDE
    WHERE A.DESIGNATION_ART = :des_art;
    IF 
        tab_com.FIRST IS NOT NULL
    THEN
        FOR x IN 1..tab_com.count LOOP
        DBMS_OUTPUT.PUT_LINE('Numero de commande : ' || tab_com(x).numCo || ' Désignation de l''article : ' || tab_com(x).design || ' Total à payer pour l''article : ' || (tab_com(x).qttCo * tab_com(x).prixA));
        END LOOP; 
    ELSE
        DBMS_OUTPUT.PUT_LINE('Article non trouvé');
    END IF;
END;
/