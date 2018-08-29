create table LOG_MAJ_CLIENTS(
    date_maj date,
    utilisateur varchar2(30),
    old_numCli number,
    new_numCli number,
    old_nomCli varchar2(30),
    new_nomCli varchar2(30),
    old_prenCli varchar2(30),
    new_prenCli varchar2(30),
    old_adrCli varchar2(50),
    new_adrCli varchar2(50),
    old_cpCli number,
    new_cpCli number,
    old_locaCli varchar2(30),
    new_locaCli varchar2(30),
    old_phoneCli number,
    new_phoneCli number)

create or replace trigger afterCUDClients
after insert or update or delete on clients
begin
    if inserting then
        insert into LOG_MAJ_CLIENTS values (sysdate, user, null, :new.numero_cli, null, :new.nom, null, :new.prenom, null, :new.adresse, null, :new.code_postal, null, :new.ville, null, :new.telephone);
    end if;
    if updating then
        insert into LOG_MAJ_CLIENTS values (sysdate, user, :old.numero_cli, :new.numero_cli, :old.nom, :new.nom, :old.prenom, :new.prenom, :old.adresse, :new.adresse, :old.code_postal, :new.code_postal, :old.ville, :new.ville, :old.telephone, :new.telephone);
    end if;
    if deleting then
        insert into LOG_MAJ_CLIENTS values (sysdate, user, :old.numero_cli, null, :old.nom, null, :old.prenom, null, :old.adresse, null, :old.code_postal, null, :old.ville, null, :old.telephone, null);
    end if;
end afterCUDClients;