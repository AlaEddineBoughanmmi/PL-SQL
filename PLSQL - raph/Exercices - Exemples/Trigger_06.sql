--attributs OLD & NEW
create table LOG_MAJ_SALAIRE
(   date_maj date,
    utilisateur varchar2(30),
    numero_sal number,
    ancien_salaire number,
    nouveau_salaire number,
    ancien_commission number,
    nouveau_commission number)

create or replace trigger log_modif_salaire
after update on salaries for each row
begin 
    insert into LOG_MAJ_SALAIRE values(sysdate, user, :old.numero_sal, :old.salaire, :new.salaire, :old.commission, :new.commission);
end log_modif_salaire;

update salaries set salaire = salaire * 1.10;
select * from LOG_MAJ_SALAIRE;