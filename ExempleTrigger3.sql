DROP table log_trigger;
DROP SEQUENCE seq_cpt2;
--DROP TRIGGER avantInsertion;
--DROP TRIGGER apresInsertion;
create table log_trigger(num number(10), texte varchar2(100));
create SEQUENCE seq_cpt2 start with 1 increment by 1;

create or replace TRIGGER avantInsertion before UPDATE on categories
begin
-- insert or update or delete on categorie
insert into log_trigger values (seq_cpt2.nextval, 'test trigger before');
end avantInsertion;

create or replace TRIGGER apresInsertionUpdate after UPDATE on categories 
for each row
Begin
insert into log_trigger values(seq_cpt2.nextval, 'test trigger après after');

end apresInsertion;

-- Affichage
select * from CATEGORIES;
select * from log_trigger;

update CATEGORIES set LIBELLE_CAT = 'Je Suis Maxime';

select * from log_trigger;
rollback;