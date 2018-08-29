create or replace procedure suppClients
is
    cursor c_client is
        select numero_cli from clients
        where telephone is null and fax is null;
begin
    for vnumero in c_client loop
        begin
        delete from clients where numero_cli = vnumero;
        commit;
    exception
        when others then null;
    end;
    end loop;
    DBMS_OUTPUT.PUT_LINE('Le nombre de lignes supprimée : ' || c_client%rowcount);
end;
/