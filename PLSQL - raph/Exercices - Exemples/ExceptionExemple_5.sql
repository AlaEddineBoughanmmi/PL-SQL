declare
--déclarer une exception utilisateur
    date_envoi_nonvalide exception;
    var_date_envoi Commandes.DATE_ENVOI%type := '20/07/2010';
    var_date_cde Commandes.DATE_CDE%type;
    var_numero_cde Commandes.NUMERO_CDE%type := 1001;
begin
    select date_cde into var_date_cde from commandes
    where numero_cde = var_numero_cde;
    update commandes set date_envoi = var_date_envoi
    where numero_cde = var_numero_cde;
    if var_date_envoi < var_date_cde then
    raise date_envoi_nonvalide; -- lancer une exception utilisateur
    end if;
    
    exception
        when date_envoi_nonvalide then
            DBMS_OUTPUT.PUT_LINE('La date d''envoi ' || var_date_envoi || ' est antérieure à  ' || var_date_cde);
            
end;
/