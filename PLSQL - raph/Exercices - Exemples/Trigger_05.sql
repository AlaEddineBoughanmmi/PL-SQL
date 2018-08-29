create or replace trigger old_salaire
    --avec update on peut préciser les colonnes mises à jour
before update of salaire on salaries
referencing old as ancien_salaire new as nouveau_salaire  --On donne un alias à OLD & NEW
for each row
begin
if :nouveau_salaire.salaire > :ancien_salaire.salaire * 3 then
    raise_application_error (-20000, 'Augmentation de salaire trop importante');
end if;
if :nouveau_salaire.salaire < :ancien_salaire.salaire then
    raise_application_error (-20001, 'Diminution de salaire interdite');
end if;
end old_salaire;