set serveroutput on;
create or replace package VariablesConstantes
is
dateSysteme date := sysdate;
nomUser varchar2(50) := user;
end VariablesConstantes;
/

-- utilisation du package

    begin
    DBMS_OUTPUT.PUT_LINE('date système est  ' || VARIABLESCONSTANTES.dateSysteme);
    DBMS_OUTPUT.PUT_LINE('L''user est       ' || VARIABLESCONSTANTES.nomUser);
    end;
    /