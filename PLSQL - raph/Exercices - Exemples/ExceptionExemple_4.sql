--refuser la suppression d'une cl� primaire quand utilis�e comme cl� 
--oracle n'a pas nomm� cette erreur

declare
    fk_suppression_client exception;
    pragma exception_init (fk_suppression_client, -2292);
    -- on associe le nom d'exception au code
begin
    delete from clients where numero_cli = 10;
    exception
        when fk_suppression_client then
            DBMS_OUTPUT.PUT_LINE('Violation d''une contrainte cl� �trang�re');
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Autre exception');
end;
/