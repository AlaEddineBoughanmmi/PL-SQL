--Création d'un package nommé verifData qui contient deux fonctions
--la premiere retourne true si un client existe
--la deuxieme retourne true si un salarié existe

create or replace package body verifData
is
    function verifclient (arg_numcli CLIENTS.NUMERO_CLI%TYPE) return boolean
    as
    begin
        VERIFDATA.nbre_lignes := 0;
        SELECT count(*) into VERIFDATA.nbre_lignes FROM clients where arg_numcli = numero_cli;
    IF VERIFDATA.nbre_lignes > 0 THEN
        return true;
    ELSE
        return false;
    END IF;
    END verifclient;
    
    function verifSalarie (arg_numsal SALARIES.NUMERO_SAL%TYPE) return boolean
    as
    begin
    VERIFDATA.nbre_lignes := 0;
    SELECT count(*) into VERIFDATA.nbre_lignes from SALARIES where NUMERO_SAL = arg_numsal;
    IF VERIFDATA.nbre_lignes > 0 THEN
        return true;
    ELSE
        return false;
    END IF;
    end verifSalarie;
    
end verifData;