create or replace package SUM_AVG_SAL
is
    sum_return number;
    avg_return number;
    function Sumsal return number;
    function Avgsal return number;
end SUM_AVG_SAL;

create or replace package body SUM_AVG_SAL
is
    function Sumsal return number
    is
        begin
        select sum(salaire) into sum_return from salaries;
        return sum_return;
        end SumSal;
    function Avgsal return number    
    is
        begin
        select avg(salaire) into avg_return from salaries;
        return avg_return;
        end AvgSal;
end SUM_AVG_SAL;

