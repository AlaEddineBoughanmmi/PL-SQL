declare
    exception_de_test exception;

begin
    begin
        begin
            raise exception_de_test;
            DBMS_OUTPUT.PUT_LINE('Je suis dans le bloc 3');      
        end;
        DBMS_OUTPUT.PUT_LINE('Je suis dans le bloc 2');

    end;
    DBMS_OUTPUT.PUT_LINE('Je suis dans le bloc 1');
    exception
        when exception_de_test then
            DBMS_OUTPUT.PUT_LINE('L''exception de test est déclenchée'); 
end;
/