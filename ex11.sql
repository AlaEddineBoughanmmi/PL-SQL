/* Ecrire un script permettant :
�	De d�finir une variable de type structure permettant d�ins�rer un enregistrement dans la table 
Salaries (travailler avec les variables bas�es colonnes)
�	De cr�er un tableau de type record (ou structure) � partir de la variable pr�c�dente
�	Remplir le tableau avec 3 nouveaux salari�s
�	Ins�rer le contenu du tableau dans la table salaries (avec structure r�p�titive)
�	V�rifier le contenu de la table salaries
�	Annuler la transaction */

declare
type salarie is record(numSal SALARIES.NUMERO_SAL%type, nomSal SALARIES.NOM_SAL%type,
prenomSal SALARIES.PRENOM_SAL%type, fctSal SALARIES.FONCTION%type,
salaireSal SALARIES.SALAIRE%type, commissionSal SALARIES.COMISSION%type);
-- On d�clare le tableau
type tableau_salarie is table of salarie not null index by binary_integer;
tabSal tableau_salarie;
begin
tabSal(1).numSal        := 50;
tabSal(1).nomSal        := 'Buxin';
tabSal(1).prenomSal     := 'Brandon';
tabSal(1).fctSal        := 'Sound Designer';
tabSal(1).salaireSal    := 4700;
tabSal(1).commissionSal := 2;

tabSal(2).numSal        := 51;
tabSal(2).nomSal        := 'Dispaux';
tabSal(2).prenomSal     := 'Rapha�l';
tabSal(2).fctSal        := 'Pr�sident';
tabSal(2).salaireSal    := 8000;
tabSal(2).commissionSal := 10;

tabSal(3).numSal        := 52;
tabSal(3).nomSal        := 'Stalon';
tabSal(3).prenomSal     := 'Pierre';
tabSal(3).fctSal        := 'Photoshopiste';
tabSal(3).salaireSal    := 3000;
tabSal(3).commissionSal := 6;
FOR x IN 1..3 LOOP
insert into salaries (NUMERO_SAL, NOM_SAL, PRENOM_SAL, FONCTION, SALAIRE, COMISSION)
values (tabSal(x).numSal, tabSal(x).nomSal, tabSal(x).prenomSal, tabSal(x).fctSal, tabSal(x).salaireSal,
tabSal(x).commissionSal);
END LOOP;
end;
/

select * from Salaries;
rollback;