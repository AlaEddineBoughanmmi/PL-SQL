--refuser la suppression d'une clé primaire quand utilisée comme clé 
--oracle n'a pas nommé cette erreur

declare
    fk_suppression_client exception;
    pragma exception_init (fk_suppression_client, -2292);
    -- on associe le nom d'exception au code
begin
    delete from clients where numero_cli = 10;
    exception
        when fk_suppression_client then
            DBMS_OUTPUT.PUT_LINE('Violation d''une contrainte clé étrangère');
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Autre exception');
end;
/