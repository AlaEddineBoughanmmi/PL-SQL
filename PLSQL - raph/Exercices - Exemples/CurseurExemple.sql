SET SERVEROUTPUT ON;
--alter table articles
--add (nbrecdes number(3) default 0);
select * from articles;

declare
nbre_articles number(3);
CURSOR cur_articles is select * from ARTICLES FOR UPDATE OF nbrecdes;
    var_articles cur_articles%rowtype;
begin
    for var_articles in cur_articles loop
        select count(*) into nbre_articles from lignes_commandes L 
        inner join articles A on A.reference_art = L.reference_art
        and var_articles.reference_art = a.reference_art;
        
    update articles set nbrecdes = nbrecdes +nbre_articles
    where current of cur_articles;
    --maj sur la ligne en cours récupérée par le curseur
    end loop;
end;
/