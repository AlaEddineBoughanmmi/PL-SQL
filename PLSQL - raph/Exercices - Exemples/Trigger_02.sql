-- gestion des plages horaires avec un trigger
Select * from Categories;
Delete from Categories where CODE_CAT = 50;

-- Afficher la date_systeme sous un format précis
    Select to_char(sysdate, 'DD-MM-YY hh24:MI:SS') from DUAL;