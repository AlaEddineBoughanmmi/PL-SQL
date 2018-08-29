--SET SERVEROUTPUT ON
declare

type tableau_article is table of ARTICLES%ROWTYPE index by binary_integer;
tab_art tableau_article;

begin
select * BULK COLLECT into tab_art from ARTICLES;
DBMS_OUTPUT.PUT_LINE('La désignation de l''article est : ' || tab_art(1).designation_art);
DBMS_OUTPUT.PUT_LINE('La quantité en stock est : ' || tab_art(1).quantite_stock);
DBMS_OUTPUT.PUT_LINE('La désignation de l''article est : ' || tab_art(2).designation_art);
DBMS_OUTPUT.PUT_LINE('La quantité en stock est : ' || tab_art(2).quantite_stock);

end;
/