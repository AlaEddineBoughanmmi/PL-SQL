set SERVEROUTPUT ON;
declare

var_article NUMBER;

begin
select count(*) into
var_article from ARTICLES;
DBMS_OUTPUT.PUT_LINE ('Le nombre d''articles est ' || var_article );
end;
/

-- select * from categories;