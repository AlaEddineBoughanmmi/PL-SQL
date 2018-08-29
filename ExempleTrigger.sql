DROP table log_trigger;
DROP SEQUENCE seq_cpt2;
DROP TRIGGER avantInsertion;
DROP TRIGGER apresInsertion;
create table log_trigger(num number(10), texte varchar2(100));
create SEQUENCE seq_cpt2 start with 1 increment by 1;

-- Teste de nextval et currval. currval = valeur courante et nextval = valeur suivante
--select seq_cpt2.nextval from DUAL;
--select seq_cpt2.currval from DUAL;
create or replace TRIGGER avantInsertion before INSERT on categories
begin
-- insert or update or delete on categorie
insert into log_trigger values (seq_cpt2.nextval, 'test trigger before');
end avantInsertion;

create or replace TRIGGER apresInsertion after INSERT on categories
Begin
insert into log_trigger values(seq_cpt2.nextval, 'test trigger après after');
end apresInsertion;

-- Affichage
select * from CATEGORIES;
select * from log_trigger;

insert into categories
values(62, 'valeur de la sequence: ' || seq_cpt2.nextval);

select * from log_trigger;
rollback;