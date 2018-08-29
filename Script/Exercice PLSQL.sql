-- Permet d'activer les fonctions du paquetage DBMS_OUTPUT
SET SERVEROUTPUT ON;
DBMS_OUTPUT.PUT_LINE('petit texte');

-- Exercice 1 (part 1)

SET SERVEROUTPUT ON;
DECLARE 
	dateJour DATE :=SYSDATE;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Premier exercice de PL/SQL effectué à la date du ' || dateJour);
END;

-- Exercice 1 (part 2)

SET SERVEROUTPUT ON;
DECLARE
v_phrase VARCHAR2(50) := 'Premier exercice PL/SQL';
v_jour Date := SYSDATE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_phrase || ' ' || v_jour);
    INSERT INTO CATEGORIES VALUES (5, 'composants');
END;
/

-- Exercice 3

SET SERVEROUTPUT ON;

accept s_nbr1 prompt 'Entrez un premier nombre';
accept s_nbr2 prompt 'Entrez un deuxième nombre';

VARIABLE NBR1 number; 
VARIABLE NBR2 number; 

declare

  facteur number;

begin

  :NBR1 := &s_nbr1;
  :NBR2 := &s_nbr2;
  
  facteur := :NBR1*:NBR2;
  if facteur < 100 then
  	DBMS_OUTPUT.PUT_LINE('!!!! Trop facile !!!!');
  else
  	DBMS_OUTPUT.PUT_LINE('!!!! Trop dur !!!!');
  end if;
  DBMS_OUTPUT.PUT_LINE(:NBR1 || ' * ' || :NBR2 || ' = ' || facteur);
end;

-- Exercice 4

SET SERVEROUTPUT ON;

accept s_nom prompt 'Entrez votre nom';
accept s_nbr1 prompt 'Entrez nbr 1';
accept s_nbr2 prompt 'Entrez nbr 2';
var NOM VARCHAR2(25);
var NBR1 NUMBER;
var NBR2 NUMBER;
DECLARE

somme number;
BEGIN
    DECLARE
    BEGIN
    :NOM := '&s_nom';
    :NBR1 := &s_nbr1;
    :NBR2 := &s_nbr2;
    somme := :NBR1+:NBR2;
     DBMS_OUTPUT.PUT_LINE('Bonjour : ' || :NOM);
     DBMS_OUTPUT.PUT_LINE('Vous avez entré les nombres : ' || :NBR1 || ' et ' || :NBR2);
        DECLARE
        BEGIN
            :NBR1 := &s_nbr1;
            :NBR2 := &s_nbr2;
            IF (:NBR1 < 100 and :NBR2 <100) THEN
              DBMS_OUTPUT.PUT_LINE('la somme des nombres est : ' || (somme));
            ELSIF (:NBR1 > 100 AND :NBR2 >100) THEN
              DBMS_OUTPUT.PUT_LINE('la difference des nombres est : ' || (:NBR1-:NBR2));
            ELSE
               DBMS_OUTPUT.PUT_LINE('le produit des nombres est : ' || (:NBR1*:NBR2));
            END IF;
        END;
    END;
END;
/

-- Exercice 6
SET SERVEROUTPUT ON;

DECLARE
jour Date := sysdate;
maVariable varchar2(25);
BEGIN
    maVariable := 'Bloc 1';
    DBMS_OUTPUT.PUT_LINE(maVariable);
    DBMS_OUTPUT.PUT_LINE(jour);
    DECLARE
    BEGIN
        maVariable := 'Bloc 2';
        DBMS_OUTPUT.PUT_LINE(maVariable);
        DBMS_OUTPUT.PUT_LINE(jour);
        DECLARE
        BEGIN
            maVariable := 'Bloc 3';
            DBMS_OUTPUT.PUT_LINE(maVariable);
            DBMS_OUTPUT.PUT_LINE(jour);
        END;
    END;
END;
/

SET SERVEROUTPUT ON;
ACCEPT s_numCom PROMPT 'Numéro de la commande';

DECLARE
v_numCom COMMANDES.NUMERO_CDE%TYPE;
v_dateSys Date := SYSDATE;
v_commande COMMANDES%ROWTYPE;
v_dateCom COMMANDES.DATE_CDE%TYPE;

-- Exercice 7
BEGIN
    v_numCom := &s_numCom;
    
    SELECT DATE_CDE INTO v_dateCom
    FROM COMMANDES
    WHERE NUMERO_CDE = v_numCom;

    DBMS_OUTPUT.PUT_LINE('Commande N°: ' || v_numCom || ' en date du ' || v_dateCOm);

    IF (v_dateCom IS NULL)
        THEN 
            UPDATE COMMANDES
            SET DATE_CDE = v_dateSys,
                ETAT_CDE ='TRAITEE'
            WHERE NUMERO_CDE = v_numCom;
    END IF;
    SELECT DATE_CDE INTO v_dateCom
    FROM COMMANDES
    WHERE NUMERO_CDE = v_numCom;
    DBMS_OUTPUT.PUT_LINE('Commande N°: ' || v_numCom || ' en date du ' || v_dateCOm);
END;
/

-- Exercice 8 (part 1)


SET SERVEROUTPUT ON;
accept s_nbr1 prompt 'Entrez un nombre';
var NBR1 number;
declare
	compteur number;
	resultat number;
begin
	compteur := 1;
	:NBR1 := &s_nbr1;
	resultat := 0;
 LOOP
 resultat := compteur * :NBR1;
 DBMS_OUTPUT.PUT_LINE(:NBR1 || ' * ' || compteur || ' = ' || resultat);
 compteur := compteur + 1;
 EXIT WHEN compteur > 10;
 END LOOP;
end;
/

-- Exercices 10
SET SERVEROUTPUT ON;

declare
type tableau is table of integer not null index by binary_integer;
compteur number;
constante number;
somme number;
begin
	compteur := 1;
    constante :=100;
    somme :=0;
    FOR compteur IN 0..9 LOOP
      somme := compteur * constante;
      tableau(compteur):=somme;
    END LOOP;
    
end;
/

-- Exercices 11
--SET SERVEROUTPUT ON;
DECLARE
	type salarie is record (nom salaries.NOM_SAL%TYPE, prenom varchar2(25), fonction varchar2(25), salaire number, commission number);
	type tableau_record is table of salarie not null index by binary_integer;
	tab_salarié tableau_record;
	compteur number :=0;
BEGIN
	tab_salarié(0).nom :='Paimparet';
	tab_salarié(0).prenom :='Denis';
	tab_salarié(0).fonction :='Informaticien';
	tab_salarié(0).salaire := 2500;
	tab_salarié(0).commission := 100;

	tab_salarié(1).nom :='Baude';
	tab_salarié(1).prenom :='Sandra';
	tab_salarié(1).fonction :='CallCenter';
	tab_salarié(1).salaire := 1700;
	tab_salarié(1).commission := 250;

	tab_salarié(2).nom :='Miraglia';
	tab_salarié(2).prenom :='Maxime';
	tab_salarié(2).fonction :='Clown de rue';
	tab_salarié(2).salaire := 300;
	tab_salarié(2).commission := 1000;

	LOOP
	INSERT INTO SALARIES (NUMERO_SAL, NOM_SAL, PRENOM_SAL, FONCTION, SALAIRE, COMISSION)
    	VALUES(compteur+4,tab_salarié(compteur).nom, tab_salarié(compteur).prenom,tab_salarié(compteur).fonction,tab_salarié(compteur).salaire,tab_salarié(compteur).commission);
    	compteur++;
    EXIT WHEN (compteur>2);
    END LOOP;
END;
/

-- Exercices 12 // terminer l'exercice avec variable basé de type ligne
--SET SERVEROUTPUT ON;
DECLARE
	type tableau_salarie is record(salaries SALARIES%ROWTYPE)
	-- on déclare le tableau
	type tableau_salarie is table of salarie not null INDEX by binary_integer;
	-- où on fait : type tableau is table of sa
	tab_salarié tableau_salarie;
BEGIN
	tab_salarié(0).nom :='Paimparet';
	tab_salarié(0).prenom :='Denis';
	tab_salarié(0).fonction :='Informaticien';
	tab_salarié(0).salaire := 2500;
	tab_salarié(0).commission := 100;

	tab_salarié(1).nom :='Baude';
	tab_salarié(1).prenom :='Sandra';
	tab_salarié(1).fonction :='CallCenter';
	tab_salarié(1).salaire := 1700;
	tab_salarié(1).commission := 250;

	tab_salarié(2).nom :='Miraglia';
	tab_salarié(2).prenom :='Maxime';
	tab_salarié(2).fonction :='Clown de rue';
	tab_salarié(2).salaire := 300;
	tab_salarié(2).commission := 1000;

	FOR x IN 1..2 LOOP
		INSERT INTO salaries VALUES (tab_salarié(x).nom, tab_salarié(x).prenom, tab_salarié(x).fonction,tab_salarié(x).salaire, tab_salarié(x).commission);
	END LOOP;
END;
/

--Exercice13
--Le script a pour but d’afficher le nombre d’articles dans la table articles

SET SERVEROUTPUT ON;

declare
	nbr_article NUMBER;
begin
	SELECT count(*) INTO nbr_article FROM ARTICLES;
	DBMS_OUTPUT.PUT_LINE ('Le nombre article est ' || nbr_article);
    
end;
/

--Exercice 14
--Afficher le prix hors tva article et le prix total htva pour la quantité en stock

SET SERVEROUTPUT ON;

declare
	totalHTVA number;
	prixHTVA NUMBER;
begin
	SELECT SUM(PRIX_HT) INTO prixHTVA FROM ARTICLES;
	SELECT SUM(PRIX_HT * QUANTITE_STOCK) INTO totalHTVA FROM ARTICLES;
	DBMS_OUTPUT.PUT_LINE ('Le prix hors TVA des articles est de ' || prixHTVA);
	DBMS_OUTPUT.PUT_LINE ('Le prix hors TVA des articles en stock est de ' || totalHTVA);
    
end;
/

--Exercice 15
--Quel est le salaire moyen des employés si le type de l’attribut salaire n’est pas connu
SET SERVEROUTPUT ON;

declare
	salaire SALARIES.SALAIRE%TYPE;
begin
	SELECT  AVG(SALAIRE) INTO salaire FROM SALARIES;
	DBMS_OUTPUT.PUT_LINE ('Le salaire moyen est de ' || salaire);
end;
/

-- Exercice 16
-- Afficher le code catégorie et le libellé de la catégorie d’un article choisi par l’utilisateur ;
-- Travailler avec des variables de type structure
SET SERVEROUTPUT ON;
accept article prompt 'Entrez le nom d un article';
declare
    nomArticle VARCHAR2(25):='&article';
	type choixArticle is record(code CATEGORIES.CODE_CAT%type,libelle CATEGORIES.LIBELLE_CAT%type);
    info choixArticle;
begin
	SELECT C.CODE_CAT, C.LIBELLE_CAT INTO info FROM ARTICLES A INNER JOIN CATEGORIES C ON A.CODE_CAT=C.CODE_CAT WHERE DESIGNATION_ART = nomArticle;
	DBMS_OUTPUT.PUT_LINE ('L article est un ' || info.libelle);
end;
/

--Exercice 17
--Afficher le nombre d’articles par catégorie et le code catégorie:  …. Problème ?
SET SERVEROUTPUT ON;
DECLARE

type grp_article is record(code_cat CATEGORIES.CODE_CAT%type, info_cat CATEGORIES.LIBELLE_CAT%type, nbr_article integer);
type tableau_article is table of grp_article index by binary_integer;
tab_art tableau_article;

BEGIN
SELECT C.CODE_CAT, C.LIBELLE_CAT, count(*) BULK COLLECT into tab_art FROM ARTICLES A INNER JOIN CATEGORIES C ON A.CODE_CAT = C.CODE_CAT GROUP BY C.CODE_CAT,C.LIBELLE_CAT;
	FOR x IN 1..tab_art.count LOOP
		DBMS_OUTPUT.PUT_LINE('Le code de la catégorie est : ' || tab_art(x).code_cat ||' la designation de l article est : ' || tab_art(x).info_cat || ' sont nombre est de ' || tab_art(x).nbr_article);	
	END LOOP;
end;
/

--Exercice 18
--Afficher le nombre d’articles différents concernant chaque commande (numéro de commande et nom du client) si ce nombre est supérieur à 2
SET SERVEROUTPUT ON;
DECLARE
type cmd_article is record(num_commande COMMANDES.NUMERO_CDE%type, nom_client CLIENTS.NOM%type, nbr_article number);
type tableau_cmd is table of cmd_article index by binary_integer;
tab_cmd tableau_cmd;
BEGIN
	SELECT C.NUMERO_CDE, CL.NOM, count(*) BULK COLLECT into tab_cmd FROM ARTICLES A INNER JOIN LIGNES_COMMANDES LC ON A.REFERENCE_ART = LC.REFERENCE_ART INNER JOIN COMMANDES C ON LC.NUMERO_CDE = C.NUMERO_CDE INNER JOIN CLIENTS CL ON C.NUMERO_CLI = CL.NUMERO_CLI HAVING count(*)>2 GROUP BY C.NUMERO_CDE, CL.NOM ORDER BY 1 ASC;
	FOR x IN 1..tab_cmd.count LOOP
		DBMS_OUTPUT.PUT_LINE('Le numéro de la commande : ' || tab_cmd(x).num_commande ||' ,le client est : ' || tab_cmd(x).nom_client || ' et le nombre d''article est de ' || tab_cmd(x).nbr_article);	
	END LOOP;
end;
/
--Exercice 19
--Ecrire un script permettant de récupérer toutes les commandes qui sont traitées.  
SET SERVEROUTPUT ON;
DECLARE
type commande is table of COMMANDES%ROWTYPE index by binary_integer;
all_cmd commande;
BEGIN
SELECT * BULK COLLECT into all_cmd FROM COMMANDES WHERE COMMANDES.ETAT_CDE like 'TRAITEE';
FOR x IN 1..all_cmd.count LOOP
		DBMS_OUTPUT.PUT_LINE('Numéro de commande : ' || all_cmd(x).NUMERO_CDE || ' Numéro de client : ' || all_cmd(x).NUMERO_CLI );
	END LOOP;
end;
/

--Exercice 20
-- Ecrire un script permettant à l’utilisateur d’introduire la désignation d’un article.
-- Le script doit permettre d’afficher les commandes relatives à 
-- cet article (numéro de commande, désignation de l’article, total à payer pour cet article)
SET SERVEROUTPUT ON
ACCEPT p_article prompt 'De quel article désirez-vous voir les commandes ? : ';
VARIABLE des_art VARCHAR2(50);
DECLARE
    type rec_com is record (design ARTICLES.DESIGNATION_ART%TYPE, numCo COMMANDES.NUMERO_CDE%TYPE, qttCo LIGNES_COMMANDES.QUANTITE_CDE%TYPE, prixA ARTICLES.PRIX_HT%TYPE);
    type tableau_commande is table of rec_com index by BINARY_INTEGER;
    tab_com tableau_commande;
    
BEGIN
    :des_art := '&p_article';
    SELECT A.DESIGNATION_ART, C.NUMERO_CDE, L.QUANTITE_CDE, A.PRIX_HT BULK COLLECT INTO tab_com
    FROM ARTICLES A INNER JOIN LIGNES_COMMANDES L ON A.REFERENCE_ART = L.REFERENCE_ART
                    INNER JOIN COMMANDES C ON C.NUMERO_CDE = L.NUMERO_CDE
    WHERE A.DESIGNATION_ART = :des_art;
    IF 
        tab_com.FIRST IS NOT NULL
    THEN
        FOR x IN 1..tab_com.count LOOP
        DBMS_OUTPUT.PUT_LINE('Numero de commande : ' || tab_com(x).numCo || ' Désignation de l''article : ' || tab_com(x).design || ' Total à payer pour l''article : ' || (tab_com(x).qttCo * tab_com(x).prixA));
        END LOOP; 
    ELSE
        DBMS_OUTPUT.PUT_LINE('Article non trouvé');
    END IF;
END;
/

--Exercice 21
--Créer un bloc PL/SQL permettant :
-- •	De mettre à jour un enregistrement de la table commande (le numéro de la cde est introduit par l’utilisateur)
-- •	Si la date d’envoi est nulle, introduire la date système et modifier l’état de la commande qui devient ‘traitée’
-- •	Travailler avec les variables basées
-- •	Afficher la commande avant la mise à jour et après la mise à jour 
--SET SERVEROUTPUT ON;
ACCEPT p_cde prompt 'Quelle commande a été traitée ? : ';

DECLARE
    
    var_num COMMANDES.NUMERO_CDE%TYPE;
    var_cde COMMANDES%ROWTYPE;
        
BEGIN
    var_num := '&p_cde';
    SELECT * INTO var_cde FROM COMMANDES WHERE NUMERO_CDE = var_num;
    DBMS_OUTPUT.PUT_LINE(   'Numero Cde : ' || var_cde.NUMERO_CDE || 
                            ' Numero Salarié : ' || var_cde.NUMERO_SAL || 
                            ' Numero Client : ' || var_cde.NUMERO_CLI ||
                            ' Date Cde : ' || var_cde.DATE_CDE ||
                            ' Taux Remise : ' || var_cde.TAUX_REMISE ||
                            ' Etat de la Cde : ' || var_cde.ETAT_CDE ||
                            ' Date d''envoi : ' || var_cde.DATE_ENVOI ||
                            ' Taux TVA : ' || var_cde.TAUX_TVA);
    IF var_cde.DATE_ENVOI IS NULL
        THEN
            var_cde.DATE_ENVOI := SYSDATE;
            var_cde.ETAT_CDE := 'TRAITEE';
            UPDATE commandes set row = var_cde
            WHERE NUMERO_CDE = var_cde.NUMERO_CDE;
            DBMS_OUTPUT.PUT_LINE(   'Numero Cde : ' || var_cde.NUMERO_CDE || 
                            ' Numero Salarié : ' || var_cde.NUMERO_SAL || 
                            ' Numero Client : ' || var_cde.NUMERO_CLI ||
                            ' Date Cde : ' || var_cde.DATE_CDE ||
                            ' Taux Remise : ' || var_cde.TAUX_REMISE ||
                            ' Etat de la Cde : ' || var_cde.ETAT_CDE ||
                            ' Date d''envoi : ' || var_cde.DATE_ENVOI ||
                            ' Taux TVA : ' || var_cde.TAUX_TVA);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Commande déjà traitée');
    END IF;
END;
/

ROLLBACK;

-- Exercice 22: instruction bulk collect et mise à jour
-- créer un bloc PL/SQL permettant :
-- •	De récupérer l’ensemble des enregistrements de la table salarié et d’afficher les renseignements concernant les salariés dont le nom est choisi par l’utilisateur.
-- •	De récupérer les numéros de commandes, les taux de tva et les taux de remise et les numéros de client. 
-- •	De modifier les commandes : le taux de tva passe à 21% et si le taux de remise est nul, il passe à 5% après 
-- •	Afficher les renseignements après la modification.

--Exercice 23
-- Écrire un script permettant
-- •	D’introduire le numéro d’un salarié
-- •	De mettre à jour le salaire du salarié (le % d’augmentation est introduit à l’écran)
-- •	Si la mise à jour a été effectuée de récupérer le nouveau salaire
-- •	Travailler avec les variables basées

-- Exercice 24
-- On demande de modifier le script précédent pour gérer le cas d’une mise à jour non exécutée

-- Exercice 25
-- On demande d’écrire le script permettant de modifier la commission des vendeurs (diviser le salaire par 3) si cette commission est non nulle.
-- Si la modification est validée, afficher le nombre de modifications.

-- Exercice 26 : la clause returning
-- On demande d’écrire le script permettant d’introduire un nouveau salarié et d’afficher le nom et le prénom et la fonction du nouveau salarié.
-- Travailler avec les variables basées (2 façons)
SET SERVEROUTPUT ON;

ACCEPT p_nom prompt 'Nom du nouveau salarié : ';
ACCEPT p_prenom prompt 'Prenom du nouveau salarié : ';
ACCEPT p_fonction prompt 'Fonction du nouveau salarié : ';
ACCEPT p_salaire prompt 'Salaire du nouveau salarié : ';

VARIABLE var_nom VARCHAR2(50);
VARIABLE var_pren VARCHAR2(50);
VARIABLE var_fonc VARCHAR2(50);
VARIABLE var_sala NUMBER;

DECLARE


    var_nom2 salaries.nom_sal%TYPE;
    var_prenom salaries.prenom_sal%TYPE;
    var_fonction salaries.fonction%TYPE;

BEGIN
    :var_nom := '&p_nom';
    :var_pren := '&p_prenom';
    :var_fonc := '&p_fonction';
    :var_sala := '&p_salaire';
    
    insert into salaries
    values(15 ,:var_nom, :var_pren, :var_fonc, :var_sala, null)
    RETURNING nom_sal, prenom_sal, fonction
    into var_nom2, var_prenom, var_fonction;
    
    DBMS_OUTPUT.PUT_LINE('Nom inséré ' || var_nom2);
    DBMS_OUTPUT.PUT_LINE('Prenom inséré ' || var_prenom);
    DBMS_OUTPUT.PUT_LINE('Fonction insérée ' || var_fonction);
    
END;
/

ROLLBACK;
SET SERVEROUTPUT ON;

ACCEPT p_nom prompt 'Nom du nouveau salarié : ';
ACCEPT p_prenom prompt 'Prenom du nouveau salarié : ';
ACCEPT p_fonction prompt 'Fonction du nouveau salarié : ';
ACCEPT p_salaire prompt 'Salaire du nouveau salarié : ';

DECLARE

    var_nom salaries.nom_sal%TYPE;
    var_pren salaries.prenom_sal%TYPE;
    var_fonc salaries.fonction%TYPE;
    var_sala salaries.salaire%TYPE;
    
    var_nom2 salaries.nom_sal%TYPE;
    var_prenom salaries.prenom_sal%TYPE;
    var_fonction salaries.fonction%TYPE;

BEGIN
    var_nom := '&p_nom';
    var_pren := '&p_prenom';
    var_fonc := '&p_fonction';
    var_sala := '&p_salaire';
    
    insert into salaries
    values(15 ,var_nom, var_pren, var_fonc, var_sala, null)
    RETURNING nom_sal, prenom_sal, fonction
    into var_nom2, var_prenom, var_fonction;
    
    DBMS_OUTPUT.PUT_LINE('Nom inséré ' || var_nom2);
    DBMS_OUTPUT.PUT_LINE('Prenom inséré ' || var_prenom);
    DBMS_OUTPUT.PUT_LINE('Fonction insérée ' || var_fonction);
    
END;
/

ROLLBACK;

-- Exercice 27
-- On demande d’écrire le script permettant :
-- •	Mettre à jour toute la table Salaries en modifiant les commissions (salaire * pourcentage)
-- •	Afficher les nouvelles commissions

-- Exercice 28
-- Ecrire un bloc PL/SQL permettant d’afficher les commandes triées par rapport à la date de commande si la commande est traitée.
-- Afficher le nombre de commandes traitées
set serveroutput on;
declare
	cursor cur_commandes(var_etat commandes.etat_cde%type:='TRAITEE') is 
	SELECT * FROM commandes WHERE Etat_cde=var_etat ORDER BY DATE_CDE ASC;
	type tableau_commandes is table of cur_commandes%rowtype index by binary_integer;
	var_commandes tableau_commandes;
begin
	open cur_commandes;
		fetch cur_commandes bulk collect into var_commandes;
		FOR x IN 1..cur_commandes%rowcount LOOP
		DBMS_OUTPUT.PUT_LINE(var_commandes(x).etat_cde|| ' ' || var_commandes(x).date_cde);
		END LOOP;
		DBMS_OUTPUT.PUT_LINE(cur_commandes%rowcount);
	close cur_commandes;
end;
/

-- Exercice 29 : les curseurs
-- Afficher le nombre de commandes par client (numéro et nom) trié par rapport au nombre de commandes

DECLARE
    cursor cur_client is select count(*) Nbr, C.NUMERO_CLI Numero, C.NOM Nom from CLIENTS C 
        inner join COMMANDES O on C.NUMERO_CLI = O.NUMERO_CLI
        GROUP BY C.NUMERO_CLI, C.NOM
        ORDER BY 1 DESC;
    var_cli cur_client%rowtype;

BEGIN
    IF NOT cur_client%isopen THEN
        OPEN cur_client;
    END IF;
    LOOP
        FETCH cur_client into var_cli;
        EXIT WHEN cur_client%notfound;
        DBMS_OUTPUT.PUT_LINE('Nombre de commandes : ' || var_cli.Nbr 
    || ' / Nom Client : ' || var_cli.Nom 
    || ' / Numéro Client : ' || var_cli.Numero);
    END LOOP;
    CLOSE cur_client;
    
END;
/
-- Exercice 30 : les curseurs
-- Afficher la liste des clients dont le nom commence par une lettre choisie par l’utilisateur

ACCEPT p_lettre prompt 'Choisir une lettre : ';
VARIABLE var_char VARCHAR2(50);

DECLARE
   --cursor cur_cli(var_nom VARCHAR2) is select * from CLIENTS where Nom like var_nom;
BEGIN
    :var_char := '&p_lettre' || '%';
    DBMS_OUTPUT.PUT_LINE(:var_char);

    FOR var_cli in (select * from CLIENTS where Nom like :var_char) LOOP  --cur_cli(var_nom => :var_char) LOOP
    DBMS_OUTPUT.PUT_LINE(var_cli.NOM || ' ' || var_cli.PRENOM || ' ' ||var_cli.NUMERO_CLI);
    END LOOP;
    
END;
/
-- Exercice 31
-- Créer un bloc PL/SQL qui permet d’afficher le nombre de produits commandé par client.  Le pays du client sera passé en paramètre au curseur avec une valeur entré par l’utilisateur.  Utilisez la boucle for spécifique au curseur.

ACCEPT p_lettre prompt 'Indiquez le pays du client : ';
VARIABLE var_char VARCHAR2(50);

DECLARE
    cursor cur_cli(var_pays CLIENTS.pays%type) 
        IS SELECT count(*) Nbr, C.NUMERO_CLI, C.NOM, C.PAYS
        FROM CLIENTS C
        inner join COMMANDES CO on C.NUMERO_CLI = CO.NUMERO_CLI 
        inner join LIGNES_COMMANDES L on CO.NUMERO_CDE = L.NUMERO_CDE
        where C.pays = var_pays
        group by C.NUMERO_CLI, C.NOM, C.PAYS;

BEGIN
    for var_clients in cur_cli(var_pays => '&p_lettre') LOOP
        DBMS_OUTPUT.PUT_LINE('Numero Client : ' || var_clients.NUMERO_CLI 
            || ' / Nom : ' || var_clients.NOM 
            || ' / Nbr de Produits commandés : ' ||var_clients.Nbr); 
    end loop;
END;
/
-- Exercice32
-- Créer un bloc PL/SQL qui permet de mettre à jour la date d’envoi des commandes à la date du jour et l’état de la commande à « traitée » pour les commandes dont la date d’envoi est nul.  Utiliser la clause returning pour afficher les commandes modifiées.
DECLARE
    CURSOR cur_cmd is select * from COMMANDES where DATE_ENVOI = null for update;
    var_num COMMANDES.NUMERO_CDE%type;
    var_etat COMMANDES.ETAT_CDE%type;
    var_date COMMANDES.DATE_ENVOI%type;
    var_cmd cur_cmd%rowtype;
BEGIN
    FOR var_cmd IN cur_cmd LOOP
        DBMS_OUTPUT.PUT_LINE(var_cmd.NUMERO_CDE || ' ' || var_cdm.ETAT_CDE || ' ' || var_cmd.DATE_ENVOI);
        update COMMANDES
        set DATE_ENVOI = SYSDATE, ETAT_CDE = 'Traitée'
        returning
        NUMERO_CDE, ETAT_CDE, DATE_ENVOI
        into var_num, var_etat, var_date;
        DBMS_OUTPUT.PUT_LINE(
            var_num || '    ' || 
            var_etat || '  ' || 
            var_date);
    END LOOP;
    
END;
/
-- Exercice 33
-- Ajouter 2 nouvelles commandes pour le client 17 et une pour le client 10.
-- Créer un bloc PL/SQL qui permet d’afficher la liste des 3 clients qui ont passé le plus grand nombre de commandes au cours des 60 derniers mois et établissez également la liste des trois membres qui ont emprunté le moins (travailler de deux façons différentes) ;
---set serveroutput on;
declare
 cursor ccur_croissant  is select cl.numero_cli,cl.nom, count(*) nb from commandes co
 inner join clients cl on cl.numero_cli = co.numero_cli where  months_between (sysdate, date_cde) <= 84 group by cl.numero_cli, cl.nom order by 2 asc;
 v_cde ccur_croissant%rowtype;
 i number; 
 
begin 
 open ccur_croissant;
 for i in 1..3 loop
 fetch ccur_croissant into v_cde;
  if ccur_croissant%notfound
  then exit;
  end if;
 DBMS_OUTPUT.PUT_LINE(v_cde.nom || '  '|| v_cde.nb );
 end loop;
 close ccur_croissant;
end;
/
-- Exercice 34
-- On désire modifier le stock minimum et le stock maximum des articles en fonction du nombre de fois où l’article a été commandé.
-- Travailler en deux étapes
-- •	Modification de la structure : pour chaque article, afficher le nombre d’articles commandés à ce jour (cette colonne aura la propriété invisible) (nre_articles)
-- •	Mise à jour : modifier la table articles en fonction du nombre d’emprunts
--		o	Si nbre_articles <2 alors le stock maximum est diminué de 20%
--		o	Si nbre_articles est compris entre 2 et 5, alors les stocks minimum et maximum sont multipliés par 2
--		o	Si nbre_articles est >5, alors les stocks minimum et maximum sont multipliés par 3
-- •	Travailler avec la clause returning 
-- •	Veiller à verrouiller le curseur pendant la mise à jour
declare
 nbre_articles number(3);
 CURSOR cur_articles is select * from articles for update of stock_min,stock_max;
 var_articles cur_articles%rowtype;

 begin
  for var_articles in cur_articles loop
  select count(*) into nbre_articles from lignes_commandes L inner join articles a on a.reference_art=L.reference_art and var_articles.reference_art= a.reference_art;
if nbre_articles<2 then
  update articles set stock_max=stock_max-(stock_max*0.2) where current of cur_articles;
  end if;
  if nbre_articles<2 then
  update articles set stock_max=stock_max-(stock_max*0.2) where current of cur_articles;
  end if;
  if nbre_articles>=2 and nbre_articles <=5 then
  update articles set stock_max=stock_max*2 ,stock_min = stock_min*2 where current of cur_articles;
  end if;
    if nbre_articles>5 then
  update articles set stock_max=stock_max*3 ,stock_min = stock_min*3 where current of cur_articles;
  end if;
  end loop;


--Les procédures et les fonctions stockées 

--Exercice 35

--Créer une procédure stockée permettant la mise à jour du salaire des salariés :
--•	Le numéro du salarié et le taux d’augmentation du salaire sont introduits par l’utilisateur
--•	le taux d’augmentation est inférieur à 20%
--•	Travailler avec la clause returning

create or replace 
PROCEDURE augmentation_procedure_param(p_nom SALARIES.NOM_SAL%TYPE, p_taux NUMBER)
IS

r_taux NUMBER;
r_Numero SALARIES.NUMERO_SAL%TYPE;
r_Nom SALARIES.NOM_SAL%TYPE;
r_Prenom SALARIES.PRENOM_SAL%TYPE;
r_Fonction SALARIES.FONCTION%TYPE;
r_Salaire SALARIES.SALAIRE%TYPE;
r_Comission SALARIES.COMISSION%TYPE;

BEGIN
r_taux := p_taux;
IF r_taux > 20 THEN
    r_taux := 20;
update salaries set salaire = salaire * (1+p_taux/100) where NOM_SAL = p_nom 
returning NUMERO_SAL, NOM_SAL, PRENOM_SAL, FONCTION, SALAIRE, COMISSION 
    into r_Numero, r_Nom, r_Prenom, r_Fonction, r_Salaire, r_Comission;
END IF;

IF SQL%FOUND THEN
	DBMS_OUTPUT.PUT_LINE('Nom du salarié : ' || r_Nom);
	DBMS_OUTPUT.PUT_LINE('Prenom du salarié : ' || r_Prenom);
	DBMS_OUTPUT.PUT_LINE('Salaire : ' || r_Salaire);
	DBMS_OUTPUT.PUT_LINE('Fonction : ' || r_Fonction);
	DBMS_OUTPUT.PUT_LINE('Comission : ' || r_Comission);
END IF;

EXCEPTION
    WHEN no_data_found then
        DBMS_OUTPUT.PUT_LINE('Le salarié ' || p_nom || ' n''existe pas.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Autre Exception');

END augmentation_procedure_param;

--Exercice 36 : création et appel d’une fonction 
--Créer deux fonctions stockée dans un package permettant :
--•	De calculer la somme et la moyenne des salaires dans la table salaries 
SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE calculSalaire
IS
	function avg_salaire RETURN number;
	function sum_salaire RETURN number;
	sum_sal number;
	avg_sal number;
END calculSalaire;
/

CREATE OR REPLACE PACKAGE BODY calculSalaire
IS
	function avg_salaire RETURN number
	AS
	BEGIN
		SELECT avg(salaire) INTO avg_sal FROM salaries;
		RETURN avg_sal;
	END avg_salaire;

	function sum_salaire RETURN number
	AS
	BEGIN
		SELECT sum(salaire) INTO sum_sal FROM salaries;
		RETURN sum_sal;
	END sum_salaire;
END calculSalaire;
/

DECLARE
	sum_var number;
	avg_var number;
BEGIN
  sum_var := calculSalaire.sum_salaire;
  avg_var := calculSalaire.avg_salaire;
  DBMS_OUTPUT.PUT_LINE('Moyenne : ' || avg_var || ' / Somme : ' || sum_var);
END;
/
--Exercice 37 : création et appel d’une fonction (avec arguments)
--Créer une fonction stockée permettant :
--•	D’introduire le numéro d’un salarié
--•	De calculer son salaire annuel en tenant compte des commissions (utiliser la fonction nvl)
--•	Gérer les exceptions
create or replace function calculerSalaire(numSal IN Salaries.numero_sal%type)
return salaries.salaire%type
is
salaireAnnuel salaries.salaire%type;
begin
    select salaire*12+nvl(comission,0) into salaireAnnuel from salaries where NUMERO_SAL = numSal;
    return salaireAnnuel;

    EXCEPTION 
	when NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE("Le salarié " ||numSal|| " n\'existe pas !");
	RETURN 0;
end calculerSalaire;

set serveroutput on;
accept p_num prompt 'Entrez le numéro du salarié :'
declare 
salaireAnnuel salaries.salaire%type;
begin
    salaireAnnuel := calculerSalaire('&p_num');
    DBMS_OUTPUT.PUT_LINE('Salaire annuel : ' || salaireAnnuel);
end;
/
--Exercice 38 : création d’une fonction dans un bloc anonyme 
--Créer une fonction permettant :
--•	De calculer le nombre de commandes par client (numéro et nom)
--•	De travailler avec les variables de type tableau et de type structure

--set SERVEROUTPUT ON;
declare
type structure_comcli is record (nom_client clients.nom%type, nombre_com number);
type tab_comcli is table of structure_comcli index by binary_integer;
t_comcli tab_comcli;
var_ligne number;

--appel d'une fonction (non stockée) dans un bloc pl/sql
function nbrComcli return tab_comcli
is
  t_comcli tab_comcli;
begin
 select cl.nom, count(*)  bulk collect into t_comcli from commandes C
 inner join clients cl on c.numero_cli = cl.NUMERO_CLI  
 group by cl.nom;
 return t_comcli;
 end;
 
 begin
  t_comcli := nbrComcli;
  var_ligne := t_comcli.count;   --retourne le nbre de lignes du tableau
 for i in 1..var_ligne loop
  DBMS_OUTPUT.PUT_LINE(t_comcli(i).nom_client ||' a passé : '|| t_comcli(i).nombre_com);
 end loop;
 
 end;
 /
--Exercice 39 : création d’une procédure dans un bloc anonyme
--Ecrire la procédure qui permet de supprimer les clients qui n’ont pas de fax ni de téléphone.
-- Comment pourrait-on écrire la procédure pour éviter l’inconvénient suivant : 
-- Aucun membre ne sera supprimé si un seul membre n’est pas supprimé ?
-- Afficher le nombre de lignes qui ont été supprimées.

create or replace procedure suppressionClients is
cursor C_Client is
select numero_cli from clients 
where telephone is null and fax is null;
begin
	for vnumero in C_clients loop
		begin
		delete from clients where numero_cli = vnumero;
		commit;
	exception 
		when others  then null;
	end;
	end loop;
end;
/
--Exercice 40 : les packages
--Créez un package nommé gestEmp avec les objets suivants :
--Une fonction qui contrôle l’existence d’un salarié à partir de son numéro.
--Une procédure qui permet de supprimer un salarié à partir de son numéro.
--Une procédure qui permet d’augmenter le salaire d’un salarié. La procédure doit recevoir deux arguments : 
-- •	Le premier est le numéro du salarié, le deuxième le pourcentage d’augmentions.
-- •	Une procédure qui affiche tous les salariés dont le salaire est supérieur à la moyenne des salaires (cette procédure devra s’appuyer sur un curseur nommé « cur_sal »)
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

--Exercice 41 : les déclencheurs
--Créer un déclencheur LMD qui se déclenche après toute instruction INSERT, UPDATE ou DELETE sur la table CLIENTS.
--Le trigger doit tracer les informations ci-dessous dans une table créée au préalable :
--•	La date d’exécution et le user ayant effectué l’instruction
--•	La valeur AVANT et APRES pour les colonnes relatives aux numéros de client, noms, adresses, code-postaux, villes et téléphones.
create table LOG_MAJ_CLIENTS(
    date_maj date,
    utilisateur varchar2(30),
    old_numCli number,
    new_numCli number,
    old_nomCli varchar2(30),
    new_nomCli varchar2(30),
    old_prenCli varchar2(30),
    new_prenCli varchar2(30),
    old_adrCli varchar2(50),
    new_adrCli varchar2(50),
    old_cpCli number,
    new_cpCli number,
    old_locaCli varchar2(30),
    new_locaCli varchar2(30),
    old_phoneCli number,
    new_phoneCli number)

create or replace trigger afterCUDClients
after insert or update or delete on clients
begin
    if inserting then
        insert into LOG_MAJ_CLIENTS values (sysdate, user, null, :new.numero_cli, null, :new.nom, null,
	 :new.prenom, null, :new.adresse, null, :new.code_postal, null, :new.ville, null, :new.telephone);
    end if;
    if updating then
        insert into LOG_MAJ_CLIENTS values (sysdate, user, :old.numero_cli, :new.numero_cli, :old.nom, :new.nom,
	 :old.prenom, :new.prenom, :old.adresse, :new.adresse, :old.code_postal, :new.code_postal, :old.ville, 
	:new.ville, :old.telephone, :new.telephone);
    end if;
    if deleting then
        insert into LOG_MAJ_CLIENTS values (sysdate, user, :old.numero_cli, null, :old.nom, null, :old.prenom, 
	null, :old.adresse, null, :old.code_postal, null, :old.ville, null, :old.telephone, null);
    end if;
end afterCUDClients;
--Exercice 42 
--On désire gérer l’ajout de cartes de fidélité pour les clients :
--•	On crée une table « fidelité »liée à la table clients : numéro carte, date ouverture, nombre de commandes
--•	Cette colonne sera mise à jour à l’aide d’un trigger à chaque nouvelle commande d’un client
--•	Il faut gérer la validité de la carte qui est de 1 an
--•	Le calcul de la remise après 10 commandes sera effectué à l’aide d’une fonction



-- ///////////////////////////// Exemple Théorie //////////////////////////////


-- Exemple d'initialisation de variable et d'un traitement d'exception
SET SERVEROUTPUT ON;
ACCEPT article prompt 'Entrez le nom d''un article';
DECLARE
    num VARCHAR2(50 BYTE);
    nom VARCHAR2(30):= '&article';
BEGIN
    SELECT REFERENCE_ART INTO num
    FROM ARTICLES
    WHERE DESIGNATION_ART = nom ;
    DBMS_OUTPUT.PUT_LINE('L''article ' || nom || ' a pour numéro de référence ' || num ) ;
    
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE ('Pas trouvé');
            DBMS_OUTPUT.PUT_LINE ( 'SQLCODE = ' || SQLCODE ) ;
            DBMS_OUTPUT.PUT_LINE ( 'SQLERRM = ' || SQLERRM ) ;
END;
/


-- Exemple de table de structure
--SET SERVEROUTPUT ON;
DECLARE
	-- Déclare une table
	type salarié is record (nom varchar2(50), fonction varchar(20));
	type tableau_salarié is table of salarié not null index by binary_integer;
	tab_salarié tableau_salarié;
BEGIN
	tab_salarié(1).nom :='Copin';
	tab_salarié(1).fonction :='PDG';

	tab_salarié(1).nom :='Dalton';
	tab_salarié(1).fonction :='Bandit';
END;
/

-- Exemple d'exercice sur les variables composées type colonne
--SET SERVEROUTPUT ON;
DECLARE
	cp CLIENTS.CODE_POSTAL%TYPE :=6000;
BEGIN
	INSERT into clients (NUMERO_CLI, NOM, PRENOM, CODE_POSTAL, VILLE) VALUES (87, 'platini', 'michel',cp, 'charleroi');
END;
/
select * from clients;
rollback;

-- Exemple d'exercice sur les variables composées type ligne
DECLARE
categorie categories%ROWTYPE;
BEGIN
	categorie.code_cat :=140;
	categorie.libelle_cat := 'biberons';
	INSERT INTO categorie VALUES (categorie.code_cat, categorie.libelle_cat);
END;
/

--set SERVEROUTPUT ON;
DECLARE
	type tableau_categorie is table of categorie%ROWTYPE NOT NULL INDEX by binary_integer;
	tab_cat tableau_categorie;
BEGIN
	tab_cat(1).code_cat :=160;
	tab_cat(1).libelle_cat := 'tables';
	tab_cat(2).code_cat :=170;
	tab_cat(2).libelle_cat := 'chaises';

	FOR x IN 1..2 LOOP
		INSERT INTO categories VALUES (tab_cat(x).code_cat, tab_cat(x).libelle_cat);
	END LOOP;
END;
/
SELECT * FROM categories;
ROOLBACK;

-- exemple de select , le into renvoie qu'une seul ligne
SELECT libelcat INTO VAR1 FROM CATEGORIES;

--set SERVEROUTPUT ON;
DECLARE
var_categories categorie%ROWTYPE;
BEGIN
	SELECT CODE_CAT, LIBELLE_CAT INTO var_categories FROM categories WHERE code_cat = 1;
	DBMS_OUTPUT.PUT_LINE ('L enregistrement est ' || var_categories.code_cat);
	DBMS_OUTPUT.PUT_LINE ('L enregistrement est ' || var_categories.libelle_cat);
end;
/

--Exemple avec BULK COLLECT
SET SERVEROUTPUT ON;
DECLARE
	type tableau_article is table of articles%rowtype index by binary_integer;
	tab_art tableau_article;
BEGIN
	SELECT * BULK COLLECT into tab_art FROM ARTICLES;
	DBMS_OUTPUT.PUT_LINE(' La designation de l article est : ' || tab_art(1).designation_art);
	DBMS_OUTPUT.PUT_LINE(' La quantité en stock est: ' || tab_art(1).quantite_stock);
	DBMS_OUTPUT.PUT_LINE(' La designation de l article est : ' || tab_art(2).designation_art);
	DBMS_OUTPUT.PUT_LINE(' La quantité en stock est: ' || tab_art(1).quantite_stock);
END;
/


----- Les curseurs -----

-- Déclaration d'un curseur --
-- set serveroutput on;
declare
	cursor cur_clients
	is select * from clients;
begin
	DBMS_OUTPUT.PUT_LINE ('déclaration d''un curseur');
end;
/

-- Curseur 2 : valeur par défaut
DECLARE
	cursor cur_clients (var_ville clients.ville%type:='Toulouse', var_pays clients.pays%type := 'France')
	is select * from clients where ville = var_ville AND pays = var_pays;
BEGIN
	DBMS_OUTPUT.PUT_LINE('déclaration d''un curseur');
END;
/

-- Curseur 3 : Fermeture
DECLARE
	cursor cur_clients (var_ville clients.ville%type:='Toulouse', var_pays clients.pays%type :='France')
	is select * from clients WHERE ville = var_ville AND pays = var_pays;
BEGIN
	open cur_clients;
	if cur_clients%isopen then
		DBMS_OUTPUT.PUT_LINE('curseur ouvert ');
	else
		DBMS_OUTPUT.PUT_LINE('curseur fermé');
	end if;
	close cur_clients;
END;
/

-- Curseur 4 : association par position
DECLARE
	cursor cur_clients (var_ville clients.ville%type, var_pays clients.pays%type)
	is select * from clients WHERE ville = var_ville AND pays = var_pays;

	/* Association par position */
BEGIN
	open cur_clients('Toulouse','France');
	if cur_clients%isopen then
		DBMS_OUTPUT.PUT_LINE('curseur ouvert');
	else
		DBMS_OUTPUT.PUT_LINE('curseur fermé');
	end if;
	close cur_clients;
END;
/

-- Curseur 5 : attribut
DECLARE
	cursor cur_clients (var_ville clients.ville%type, var_pays clients.pays%type)
	is select * from clients WHERE ville = var_ville AND pays = var_pays;

	/* Association par position */
BEGIN
	open cur_clients('Toulouse','France');
	if not cur_clients%isopen then /* pas fermé */
		DBMS_OUTPUT.PUT_LINE('curseur fermé');
	else
		DBMS_OUTPUT.PUT_LINE('curseur ouvert');
	end if;
	close cur_clients;
END;
/

-- Curseur 6 : association par nom + fetch (record)
DECLARE
	cursor cur_clients (var_ville clients.ville%type, var_pays clients.pays%type)
	is select * from clients WHERE ville = var_ville AND pays = var_pays;
	var_clients cur_clients%ROWTYPE; -- type ligne de curseur de même structure que le select
	/* Association par nom */
BEGIN
	open cur_clients(var_ville => 'Toulouse', var_pays => 'France'); -- execution de la requête select
		fetch cur_clients into var_clients;
		DBMS_OUTPUT.PUT_LINE(var_clients.nom || ' ' || var_clients.pays);
	close cur_clients;
END;
/

-- Curseur 7 : fetch(RECORD) + boucle loop
DECLARE
	cursor cur_clients (var_ville clients.ville%type, var_pays clients.pays%type)
	is select * from clients WHERE ville = var_ville AND pays = var_pays;
	var_clients cur_clients%ROWTYPE; -- type ligne de curseur de même structure que le select
	/* Association par nom */
BEGIN
	open cur_clients(var_ville => 'Toulouse', var_pays => 'France');
		if cur_clients%isopen then
			loop
				fetch cur_clients into var_clients;
				exit when cur_clients%notfound;
				DBMS_OUTPUT.PUT_LINE(var_clients.nom || ' ' || var_clients.pays);
			end loop;
		end if;
	close cur_clients;
END;
/

-- Curseur 8 : boucle for + fetch (tableau)
DECLARE
	type sal_nom is table of SALARIES.NOM_SAL%type;
	type sal_prenom is table of SALARIES.PRENOM_SAL%type;
	tab_sal_nom sal_nom;
	tab_sal_prenom sal_prenom;
	cursor cur_salaries is select nom_sal, prenom_sal from salaries;
	nbre_salaries number(2) := 4;
BEGIN
	open cur_salaries;
	fetch cur_salaries bulk collect into tab_sal_nom, tab_sal_prenom;
		for i IN 1..nbre_salaries
			LOOP
				DBMS_OUTPUT.PUT_LINE(tab_sal_nom(i) || ' ' || tab_sal_prenom(i));
			END LOOP;
	close cur_salaries;
END;
/

-- Curseur 9 
DECLARE
	cursor cur_salaries (nom salaries.nom_sal%type := 'Toto')
	is SELECT nom_sal FROM salaries where nom_sal = nom;
	var_nom salaries.nom%type;
Begin
	open cur_salaries;
		fetch cur_salaries into var_nom;
		if cur_salaries%notfound THEN
			DBMS_OUTPUT.PUT_LINE('Erreur');
		else
			DBMS_OUTPUT.PUT_LINE('Ok');
		end if;
	close cur_salaries;
END;
/

-- Curseur 10
DECLARE
	cursor cur_clients is select * from clients;
	var_clients cur_clients%rowtype;
Begin
	open cur_clients;
		DBMS_OUTPUT.PUT_LINE(var_clients.nom || ' ' || cur_clients%rowcount);  /* Ce compteur est incrémenté chaque fois qu'une ligne est traité */
		LOOP
			fetch cur_clients into var_clients;
			exit when cur_clients%notfound;
			-- le %rowcount est associé au curseur et compte le nbre de ligne traitées
			DBMS_OUTPUT.PUT_LINE(var_clients.nom || ' ' cur_clients%rowcount);
		end loop;
	close cur_clients;
END;
/



-- Exemple curseur update
DECLARE
	cursor cur_salaries is select * from salaries FOR UPDATE;
	var_sal cur_salaries%rowtype;
BEGIN
	OPEN cur_salaries;
		FETCH cur_salaries into var_sal;
		UPDATE salaries set comission = salaire/2 WHERE fonction='Vendeur';
		commit;
	CLOSE cur_salaries;
end;
/

-- Exemple boucle du curseur
set SERVEROUTPUT ON;
DECLARE
	cursor cur_clients (var_pays clients.pays%type)is 
	 SELECT * FROM clients
	 WHERE pays = var_pays;
BEGIN
	for var_clients in cur_clients(var_pays => 'France')
		LOOP
			DBMS_OUTPUT.PUT_LINE(var_clients.nom || ' ' || var_clients.prenom);
		end loop;
end;
/

-- Curseur

alter table articles add (nbrecdes number(3) default 0);

SELECT * from articles;
DECLARE
	nbr_articles number(3);
	CURSOR cur_articles is SELECT * from ARTICLES
		for UPDATE of nbrecdes;
		var_articles cur_articles%rowtype;
BEGIN
	for var_article in cur_articles LOOP
		SELECT count(*) into nbr_articles FROM LIGNES_COMMANDES LIBELLE_CAT INNER JOIN articles a ON a.REFERENCE_ART = L.REFERENCE_ART AND var_articles.REFERENCE_ART = a.REFERENCE_ART;
		
		update articles set nbrecdes = nbrecdes +nbr_articles
		where current of cur_articles;
		-- maj sur la ligne en cours récupèrée par le curseur
	end loop;
	commit;
END;
/


-- Exception gérer par oracle
set SERVEROUTPUT ON;
DECLARE
	var_nom salaries.nom_sal%type := 'Monsieur_heureux';
BEGIN
	SELECT nom_sal into var_nom FROM salaries WHERE nom_sal = var_nom;
	EXCEPTION
		WHEN no_data_found then DBMS_OUTPUT.PUT_LINE('Ce salarié ' || var_nom || ' n"existe pas');
END;
/

-- Exception gérer par oracle
set SERVEROUTPUT ON;
prompt var_nom accept 'Entrez un nom';
DECLARE
	sal_nom varchar2(50):= '&var_nom';
    CURSOR cur_salarie is SELECT * FROM SALARIES WHERE NOM_SAL = sal_nom;
BEGIN
	open cur_salarie;
    open cur_salarie;
	exception
		WHEN no_data_found then DBMS_OUTPUT.PUT_LINE('Ce salarié ' || sal_nom || ' n"existe pas');
        WHEN CURSOR_ALREADY_OPEN then DBMS_OUTPUT.PUT_LINE('Ce curseur  est déjà ouvert');
END;
/

-- Exception gérer par oracle et utilisé par l utilisateur
DECLARE 
	fk_suppression_client exception;
	pragma EXCEPTION_INIT(fk_suppression_client, -2292);
BEGIN
	delete from clients WHERE numero_cli = 10;
	exception
		WHEN fk_suppression_client then DBMS_OUTPUT.PUT_LINE('Violation d"une contrainte clé étrangère');
END;
/

-- Affichage des erreurs system 
set SERVEROUTPUT ON;
BEGIN 
	for i in -2000..0 LOOP
	DBMS_OUTPUT.PUT_LINE(substr (SQLERRM(i),1,100));
	end loop;
end;
/

-- exemple exception gérer par utilisateur
set SERVEROUTPUT ON;

DECLARE
	--Déclarer une exception utilisateur
	date_envoi_nonvalide exception;
	var_date_envoi COMMANDES.DATE_ENVOI%type := '20/07/2010';
	var_date_cde COMMANDES.DATE_CDE%type;
	var_numero_cde COMMANDES.NUMERO_CDE%type:=1001;
BEGIN
	SELECT date_cde into var_date_cde FROM commandes WHERE numero_cde = var_numero_cde;
	UPDATE commandes set DATE_ENVOI = var_date_envoi WHERE numero_cde = var_numero_cde;
	if var_date_envoi < var_date_cde then RAISE date_envoi_nonvalide;
	end if;

	Exception
	WHEN date_envoi_nonvalide then DBMS_OUTPUT.PUT_LINE('La date d"envoi ' || var_date_envoi || ' est antérieure à ' || var_date_cde);
END;
/

-- dés que je déclenche une exception dans un bloc
-- je bascule automatiquement dans le gestionnaire d'exception
set SERVEROUTPUT ON;
DECLARE
	exception_de_test exception;
BEGIN -- niveau1
	BEGIN --niveau2
		BEGIN --niveau3

			raise exception_de_test;
			DBMS_OUTPUT.PUT_LINE('Je suis dans le bloc niveau 3');

			exception
			WHEN exception_de_test then DBMS_OUTPUT.PUT_LINE('L"exception de test est déclenchée');
		end;
		DBMS_OUTPUT.PUT_LINE('Je suis dans le bloc 2');
	end;
	DBMS_OUTPUT.PUT_LINE('Je suis dans le bloc 1');
end;
/

-- Exemple package 1
-- création du package
CREATE OR REPLACE PACKAGE VariablesConstantes is 
datesysteme date := sysdate;
nomuser VARCHAR2(50) := user;
end VariablesConstantes;

-- utilisation du package
BEGIN
	DBMS_OUTPUT.PUT_LINE('date système est' || VariablesConstantes.datesysteme);
	DBMS_OUTPUT.PUT_LINE('le user est ' || VariablesConstantes.nomuser);
end;
/

-- Exemple package 2
-- création du package
create or replace package PaVille
	is
	ville clients.ville%type := 'Toulouse';
	pays constant clients.pays%type := 'France';
end PaVille;

--utilisation du package
DECLARE
	var_number number;
BEGIN
	select count(*) into var_number from clients
		where ville = PaVille.ville and pays = PaVille.pays;
	DBMS_OUTPUT.PUT_LINE('le nombre de clients de france habitant Toulouse est ' || var_number);
end;
/

-- Exemple package 3
-- création du package
-- la première fonction retourne la valeur true si un client existe
-- la deuxième retourne la valeur true si un salarié existe

create or replace package verifData
is
	function verifClient(arg_numcli clients.numero_cli%type)return boolean;
	function verifSalarie(arg_num_sal SALARIES.NUMERO_SAL%type) return boolean;
	nbre_lignes number;
end verifData;

-- création du package 2

create or replace package body verifData
is
	function verifClient (arg_numcli clients.numero_cli%type)return boolean
as
BEGIN
	verifData.nbre_lignes:=0;
		select count(*) into verifData.nbre_lignes from clients where NUMERO_CLI = arg_numcli;
		if verifData.nbre_lignes > 0 then
		 return true;
		else
			return false;
		end if;
	end verifClient;
	
	function verifSalarie (arg_num_sal salaries.NUMERO_SAL%type)return boolean
as
BEGIN
	verifData.nbre_lignes :=0;
	select count(*) into verifData.nbre_lignes from salaries where NUMERO_SAL = arg_num_sal;
	if verifData.nbre_lignes > 0 then
		 return true;
		else
			return false;
		end if;
	end verifSalarie;
end verifData;

-- utilisation package 2
set SERVEROUTPUT ON;
DECLARE
	var_bool boolean;
BEGIN
	var_bool := verifData.verifClient(10); -- 10 reprend le numéro du client
	if var_bool then
		DBMS_OUTPUT.PUT_LINE('Le client existe');
	else
		DBMS_OUTPUT.PUT_LINE('Le client n existe pas');
	end if;
end;
/

-- exemple package avec un curseur
-- déclaration du package
create or replace package gestion_clients
as
	cursor cur_clients(arg_ville clients.ville%type) return clients%ROWTYPE;
	procedure afficher_clients;
end gestion_clients;

-- création du corps du package
create or replace package body gestion_clients
as
	cursor cur_clients(arg_ville clients.ville%type) return clients%ROWTYPE
	is 
	select * from clients where ville = arg_ville;
	procedure afficher_clients
	is
		BEGIN
			for i in cur_clients (arg_ville => 'Toulouse')
			LOOP
				DBMS_OUTPUT.PUT_LINE(i.numero_cli || ' ' || i.nom);
			end loop;
	end afficher_clients;
end gestion_clients;

-- utilisation du package
set SERVEROUTPUT ON;
BEGIN
	gestion_clients.afficher_clients;
end;
/


-- Exemple sur les trigger
DROP table log_trigger;
DROP SEQUENCE seq_cpt2;
DROP TRIGGER avantInsertion;
DROP TRIGGER apresInsertion;
create table log_trigger(num number(10), texte varchar2(100));
create SEQUENCE seq_cpt2 start with 1 increment by 1;

-- Teste de nextval et currval. currval = valeur courante et nextval = valeur suivante
--select seq_cpt2.nextval from DUAL;
--select seq_cpt2.currval from DUAL;
create or replace TRIGGER avantInsertion before INSERT on categories
begin
-- insert or update or delete on categorie
	insert into log_trigger values (seq_cpt2.nextval, 'test trigger before');
end avantInsertion;

create or replace TRIGGER apresInsertion after INSERT on categories
Begin
	insert into log_trigger values(seq_cpt2.nextval, 'test trigger après after');
end apresInsertion;

-- Affichage
select * from CATEGORIES;
select * from log_trigger;

insert into categories values(62, 'valeur de la sequence: ' || seq_cpt2.nextval);

select * from log_trigger;
rollback;

-- Déclencheur simple de type table
-- exemple trigger mise à jours de la table en fixant des jours présit et des heure
create or replace trigger triggerPlage
before insert or update or delete on Categories
declare
    var_joursemaine number (1):= To_char(sysdate, 'D');
    var_heurejour number (2):= To_char(sysdate, 'HH24');
begin
    if var_joursemaine > 5 or var_heurejour not between 8 and 20 then
    	-- erreur system ) utiliser , erreur utilisateur ne fonctionne pas
        RAISE_APPLICATION_ERROR(-20001, 'Problème de disponibilité.');
    end if;
end triggerPlage;

-- Déclencheur sur plusieurs ligne
DROP table log_trigger;
DROP SEQUENCE seq_cpt2;
--DROP TRIGGER avantInsertion;
--DROP TRIGGER apresInsertion;
create table log_trigger(num number(10), texte varchar2(100));
create SEQUENCE seq_cpt2 start with 1 increment by 1;

-- déclenche une seul fois lors de la mise à jours
create or replace TRIGGER avantInsertion before UPDATE on categories
begin
-- insert or update or delete on categorie
insert into log_trigger values (seq_cpt2.nextval, 'test trigger before');
end avantInsertion;

--déclenche sur chaque ligne lors de la mise à jours
create or replace TRIGGER apresInsertionUpdate after UPDATE on categories 
for each row
Begin
insert into log_trigger values(seq_cpt2.nextval, 'test trigger après after');
end apresInsertion;

-- Affichage
select * from CATEGORIES;
select * from log_trigger;

update CATEGORIES set LIBELLE_CAT = 'Je Suis Maxime';

select * from log_trigger;
rollback;

-- Exemple déclancheur avec old et new
--set serveroutput on;
-- attributs old et new
DROP table LOG_MAJ_SALAIRE;
create table LOG_MAJ_SALAIRE (date_maj date,
utilisateur varchar2(30),
numero_sal number,
ancien_salaire number,
nouveau_salaire number,
ancien_commission number,
nouveau_commission number)
-- attributs old et new
create or replace trigger log_modif_salaire after update on salaries for each row
begin
	insert into LOG_MAJ_SALAIRE values (sysdate, user, :old.numero_sal, :old.salaire, :new.salaire, :old.comission, :new.comission);
end log_modif_salaire;

update salaries set salaire = salaire * 1.10;
select * from log_maj_salaire;
rollback;


-- Exemple déclancheur avec old et new
--set serveroutput on;
-- attributs old et new
DROP table LOG_MAJ_SALAIRE;
create table LOG_MAJ_SALAIRE (date_maj date,
utilisateur varchar2(30),
numero_sal number,
ancien_salaire number,
nouveau_salaire number,
ancien_commission number,
nouveau_commission number)
-- attributs old et new
create or replace trigger log_modif_trigger 
before update of salaire on salaries for each row  -- of salaire pour indiquer qu'il ne travaille pas sur l'enregistrement au complet mais que sur l'attribut salaire
-- referencing old as ancien_sal new as nouveau_sal
begin
IF :new.salaire > :old.salaire*3 
THEN
    RAISE_APPLICATION_ERROR(-20002, 'Erreur de l''augmentation');
ELSIF :new.salaire < :old.salaire 
THEN
    RAISE_APPLICATION_ERROR(-20005, 'Erreur de diminution');
END IF;
end log_modif_trigger;

update salaries set salaire = salaire * 1.10;
select * from log_maj_salaire;
rollback;