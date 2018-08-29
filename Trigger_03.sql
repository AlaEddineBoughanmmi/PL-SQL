create or replace trigger triggerPlage
before insert or update or delete on Categories
declare
    var_joursemaine number (1):= To_char(sysdate, 'D');
    var_heurejour number (2):= To_char(sysdate, 'HH24');
begin
    if var_joursemaine > 5 or var_heurejour not between 8 and 20 then
        RAISE_APPLICATION_ERROR(-20001, 'Problème de disponibilité.');
    end if;
end triggerPlage;

