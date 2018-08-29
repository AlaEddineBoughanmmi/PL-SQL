--set serveroutput on;
-- attributs old et new
DROP table LOG_MAJ_SALAIRE;
create table LOG_MAJ_SALAIRE (date_maj date,
utilisateur varchar2(30),
numero_sal number,
ancien_salaire number,
nouveau_salaire number,
ancien_commission number,
nouveau_commission number)
-- attributs old et new
create or replace trigger log_modif_trigger 
before update of salaire on salaries for each row
-- referencing old as ancien_sal new as nouveau_sal
begin
IF :new.salaire > :old.salaire*3 
THEN
    RAISE_APPLICATION_ERROR(-20002, 'Erreur de l''augmentation');
ELSIF :new.salaire < :old.salaire 
THEN
    RAISE_APPLICATION_ERROR(-20005, 'Erreur de diminution');
END IF;
end log_modif_trigger;

update salaries set salaire = salaire * 1.10;
select * from log_maj_salaire;
rollback;