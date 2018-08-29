declare
var_bool boolean;
begin var_bool := verifdata.verifclient(10);
if var_bool then
    DBMS_OUTPUT.PUT_LINE('Le client existe.');
ELSE
    DBMS_OUTPUT.PUT_LINE('Le client n''existe pas.');
end if;
end;
/