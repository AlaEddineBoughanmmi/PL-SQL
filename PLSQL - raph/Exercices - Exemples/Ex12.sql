--set SERVEROUTPUT ON
declare
type tableau_categorie is table of categories%ROWTYPE NOT NULL INDEX BY binary_integer;
tab_cat tableau_categorie;

begin
tab_cat(1).code_cat := 160;
tab_cat(1).libelle_cat := 'tables';

tab_cat(2).code_cat := 170;
tab_cat(2).libelle_cat := 'chaises';

FOR x IN 1..2 LOOP
INSERT into categories
values(tab_cat(x).code_cat, tab_cat(x).libelle_cat);
END LOOP;
end;
/
select * from categories;
rollback;