create or replace trigger afterUpdateCategories
after update on categories
begin
    insert into log_trigger values
        (seq_cpt3.nextval, 'test trigger niveau table');
end afterUpdateCategories;

create or replace trigger beforeUpdateCategories
before update on categories
for each row
begin
    insert into log_trigger values
        (seq_cpt3.nextval, 'test trigger niveau table');
end beforeUpdateCategories;

--execution du trigger_ligne
select * from Categories;
insert into categories values (4, 'trigger');

select * from log_trigger;

delete from log_trigger;
update categories set LIBELLE_CAT = libelle_cat || 'trigger';
rollback;