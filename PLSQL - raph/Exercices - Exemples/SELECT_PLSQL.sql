set SERVEROUTPUT ON;
declare

var_categories categories%rowtype;

begin
select CODE_CAT, LIBELLE_CAT into
var_categories from categories where code_cat = 1;
DBMS_OUTPUT.PUT_LINE ('L''enregistrement est ' || var_categories.code_cat );
DBMS_OUTPUT.PUT_LINE ('L''enregistrement est ' || var_categories.libelle_cat );
end;
/

-- select * from categories;