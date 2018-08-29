--set serveroutput on;
create or replace package PaVille
is
ville clients.ville%type := 'Toulouse';
pays constant clients.pays%type := 'France';
end PaVille;
/

declare
    var_number number;
begin
    select count(*) into var_number from clients
    where ville = PaVille.ville and pays = PaVille.pays;
    DBMS_OUTPUT.PUT_LINE('Le nombre d''habitants de ' || PaVille.ville || ' en ' || PaVille.pays || ' qui sont client est ' || var_number || '.');
    end;
    /