set SERVEROUTPUT ON;
accept p_article prompt 'De quel article d�sirez-vous la cat�gorie ? : ';
declare

type var_set is RECORD (var_ref ARTICLES.REFERENCE_ART%TYPE, var_code CATEGORIES.CODE_CAT%TYPE, var_libel CATEGORIES.LIBELLE_CAT%TYPE);
var_cat var_set;

begin

select A.REFERENCE_ART, C.CODE_CAT, C.LIBELLE_CAT 
into var_cat 
FROM ARTICLES A INNER JOIN CATEGORIES C ON C.CODE_CAT = A.CODE_CAT 
WHERE A.REFERENCE_ART = '&p_article';

DBMS_OUTPUT.PUT_LINE ('La r�f�rence d''article est ' || var_cat.var_ref );
DBMS_OUTPUT.PUT_LINE ('Le code de la cat�gorie est ' || var_cat.var_code );
DBMS_OUTPUT.PUT_LINE ('Le libell� de la cat�gorie est ' || var_cat.var_libel );
end;
/

-- select * from categories;