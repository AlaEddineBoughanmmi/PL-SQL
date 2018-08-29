create or replace package gestEmp
is
    cursor cur_salaries return salaries%rowtype;
    nbre_lignes number;
    function verifSalarie (arg_numsal SALARIES.NUMERO_SAL%type) return boolean;
    procedure supprimer_sal(arg_numsal SALARIES.NUMERO_SAL%type);
    procedure augmenter_sal(arg_numsal SALARIES.NUMERO_SAL%type, arg_taux NUMBER);
    procedure affichage_hautsal;
    
end gestEmp;
/

create or replace package body gestEmp
as
    cursor cur_salaries return salaries%rowtype
        is SELECT * from SALARIES where salaire = (SELECT avg(salaire) from SALARIES);
     
    function verifSalarie (arg_numsal SALARIES.NUMERO_SAL%TYPE) return boolean
    is
    begin
        gestEmp.nbre_lignes := 0;
    SELECT count(*) into gestEmp.nbre_lignes from SALARIES where NUMERO_SAL = arg_numsal;
    IF gestEmp.nbre_lignes > 0 THEN
        return true;
    ELSE
        return false;
    END IF;
    end verifSalarie;

    procedure supprimer_sal(arg_numsal SALARIES.NUMERO_SAL%type)
    is
    begin
        Delete from SALARIES where NUMERO_SAL = arg_numsal;
    end supprimer_sal;

    procedure augmenter_sal(arg_numsal SALARIES.NUMERO_SAL%type, arg_taux NUMBER)
    is
    begin
        update SALARIES set SALAIRE = SALAIRE * ((100 + arg_taux) / 100) where NUMERO_SAL = arg_numsal;
    end augmenter_sal;

    procedure affichage_hautsal
    is
    begin
        FOR i in cur_salaries LOOP
        DBMS_OUTPUT.PUT_LINE(i.nom_sal || '  ' || i.prenom_sal);
        END LOOP;
    end affichage_hautsal;
    
end gestEmp;
/