set SERVEROUTPUT on;
declare

begin
    for i in -2000..0 loop
       DBMS_OUTPUT.PUT_LINE(substr (SQLERRM(i), 1, 100));
    end loop;
end;
/