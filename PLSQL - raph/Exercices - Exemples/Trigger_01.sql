-- create table log_trigger (num number(10), taxte varchar2(100));
-- create SEQUENCE seq_cpt start with 1 increment by 1;
-- Select seq_cpt2.CURRVAL from DUAL;
create or replace TRIGGER avantInsertion
before INSERT on Categories
BEGIN
    insert into log_trigger values (seq_cpt.nextval, 'test trigger before');
END avantInsertion;

Create or replace TRIGGER apresInsertion
after INSERT on Categories
BEGIN
    insert into log_trigger values(seq_cpt.nextval, 'test trigger after');
END apresInsertion;

--insertion dans la table Categories

select * from Categories;
select * from log_trigger;

insert into Categories values (61, 'Valeur de la sequence : ' || seq_cpt.nextval);
rollback;