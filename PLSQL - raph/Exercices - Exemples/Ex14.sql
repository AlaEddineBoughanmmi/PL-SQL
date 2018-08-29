set SERVEROUTPUT ON;
declare

var_prix NUMBER;
var_total NUMBER;

begin
select sum(prix_HT) into var_prix from ARTICLES;
select sum(prix_HT * QUANTITE_STOCK) into var_total from ARTICLES;
DBMS_OUTPUT.PUT_LINE ('Le prix HTVA de l''ensemble est ' || var_prix );
DBMS_OUTPUT.PUT_LINE ('Le prix HTVA du stock est ' || var_total );
end;
/

-- select * from categories;

declare

type var_article is RECORD (ref_Art ARTCILES.REFERENCE_ART%TYPE, prix ARTICLES.PRIX_HT%TYPE, prix_Tot NUMBER);
var_art var_article;
var_card NUMBER;

begin
select count(*) into var_card from ARTICLES;
FOR x IN 1..var_card LOOP
  select ;
END LOOP;