/*
create or replace package gestion_clients
as
    cursor cur_clients(arg_vill clients.ville%type) return clients%rowtype;
    procedure afficher_clients;   
end gestion_clients;
*/
/*
create or replace package body gestion_clients
as
    cursor cur_clients(arg_vill clients.ville%type) return clients%rowtype
        is select * from clients where ville = arg_vill;
    
    procedure afficher_clients
    is
        begin
        
        for i in cur_clients(arg_vill => 'Toulouse') loop
            DBMS_OUTPUT.PUT_LINE(i.numero_cli || ' ' || i.nom);
        end loop;
    end afficher_clients;
end gestion_clients;
*/

set serveroutput on;

begin
    GESTION_CLIENTS.AFFICHER_CLIENTS;
end;
/