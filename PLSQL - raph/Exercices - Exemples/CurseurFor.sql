-- boucle et curseur
set serveroutput on;

declare
    cursor cur_clients (var_pays clients.pays%type) is select * from clients where pays = var_pays;
    -- var_clients cur_clients%rowtype;
    -- cur_clients : %rowtype du type record et dont les colonnes correspondent aux colonnes de l'objet cur_clients

begin
    FOR var_clients in cur_clients(var_pays => 'France') LOOP
    DBMS_OUTPUT.PUT_LINE(var_clients.nom || ' ' || var_clients.prenom);
    END LOOP;
    
end;
/