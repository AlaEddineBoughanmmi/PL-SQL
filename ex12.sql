-- Idem exercice 11 mais travailler avec les variables basées lignes
--set serveroutput on;
declare
type salarie is record(sala SALARIES%rowtype);

-- On déclare le tableau
type tableau_salarie is table of salarie not null index by binary_integer;
-- Ou on fait: type tableau_salarie is table of sala SALARIES%rowtype not null index by binary_integer;
tabSal tableau_salarie;
begin
tabSal(1).sala.NUMERO_SAL   := 50;
tabSal(1).sala.NOM_SAL      := 'Buxin';
tabSal(1).sala.PRENOM_SAL   := 'Brandon';
tabSal(1).sala.FONCTION     := 'Sound Designer';
tabSal(1).sala.SALAIRE      := 4700;
tabSal(1).sala.COMISSION    := 2;

tabSal(2).sala.NUMERO_SAL   := 51;
tabSal(2).sala.NOM_SAL      := 'Dispaux';
tabSal(2).sala.PRENOM_SAL   := 'Raphaël';
tabSal(2).sala.FONCTION     := 'Président';
tabSal(2).sala.SALAIRE      := 8000;
tabSal(2).sala.COMISSION    := 10;

tabSal(3).sala.NUMERO_SAL   := 52;
tabSal(3).sala.NOM_SAL      := 'Stalon';
tabSal(3).sala.PRENOM_SAL   := 'Pierre';
tabSal(3).sala.FONCTION     := 'Photoshopiste';
tabSal(3).sala.SALAIRE      := 3000;
tabSal(3).sala.COMISSION    := 6;
FOR x IN 1..3 LOOP
insert into salaries (NUMERO_SAL, NOM_SAL, PRENOM_SAL, FONCTION, SALAIRE, COMISSION)
values (
tabSal(x).sala.NUMERO_SAL, 
tabSal(x).sala.NOM_SAL, 
tabSal(x).sala.PRENOM_SAL, 
tabSal(x).sala.FONCTION, 
tabSal(x).sala.SALAIRE,
tabSal(x).sala.COMISSION);
END LOOP;
end;
/

select * from Salaries;
rollback;