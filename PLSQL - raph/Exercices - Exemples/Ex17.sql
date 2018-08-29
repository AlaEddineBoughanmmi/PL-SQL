--SET SERVEROUTPUT ON
declare
    type rec_articles is record (nombre INTEGER, libel CATEGORIES.LIBELLE_CAT%TYPE);
    type tableau_article is table of rec_articles index by binary_integer;
    tab_art tableau_article;
    
BEGIN
    SELECT count(*), C.LIBELLE_CAT BULK COLLECT INTO tab_art 
    FROM ARTICLES A INNER JOIN CATEGORIES C ON C.CODE_CAT = A.CODE_CAT
    GROUP BY C.LIBELLE_CAT;
    
    FOR x IN 1..tab_art.count LOOP
        DBMS_OUTPUT.PUT_LINE('Categorie : ' || tab_art(x).libel || chr(10) || 'Nombre d''articles : ' || tab_art(x).nombre || chr(10));
    END LOOP;
end;
/