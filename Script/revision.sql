/* Révision SQL */
1.	Afficher la liste des salariés qui ont réalisé plus de deux commandes
SELECT * FROM SALARIES 
WHERE NUMERO_SAL 
IN (SELECT NUMERO_SAL FROM COMMANDES HAVING count(*) > 2 GROUP BY NUMERO_SAL);
2.	Créer une vue reprenant par client (numéro, nom et prénom) qui habitent en France le nombre de commandes réalisées comprenant les articles 1 et 2 trié par rapport au nombre de commandes
CREATE VIEW view_client AS
SELECT  C.NUMERO_CLI, C.NOM, C.PRENOM FROM CLIENTS C WHERE C.PAYS = 'France' AND C.NUMERO_CLI IN
        (SELECT CO.NUMERO_CLI FROM COMMANDES CO WHERE CO.NUMERO_CDE IN
          (SELECT L.NUMERO_CDE FROM LIGNES_COMMANDES L WHERE L.REFERENCE_ART = 'INFYBVF12024'  AND L.REFERENCE_ART = 'INFYBVF12027')) GROUP BY C.NUMERO_CLI, C.NOM, C.PRENOM ORDER BY 4;
3.	Créer une vue reprenant par client (numéro, nom et prénom) qui habitent en France le nombre de commandes réalisées comprenant les articles 1 ou 2
CREATE VIEW view_client AS
SELECT  C.NUMERO_CLI, C.NOM, C.PRENOM FROM CLIENTS C WHERE C.PAYS = 'France' AND C.NUMERO_CLI IN
        (SELECT CO.NUMERO_CLI FROM COMMANDES CO WHERE CO.NUMERO_CDE IN
          (SELECT L.NUMERO_CDE FROM LIGNES_COMMANDES L WHERE L.REFERENCE_ART = 'INFYBVF12024' OR L.REFERENCE_ART = 'INFYBVF12027'));
4.	Afficher la liste des articles de catégorie informatique ou des articles qu’il faut recommander
SELECT * FROM ARTICLES A INNER JOIN CATEGORIES C 
ON C.CODE_CAT = A.CODE_CAT
WHERE C.LIBELLE_CAT = 'Informatique' OR A.QUANTITE_STOCK <= A.STOCK_MIN;

SELECT A.REFERENCE_ART , A.DESIGNATION_ART FROM ARTICLES A INNER JOIN CATEGORIES C 
ON C.CODE_CAT = A.CODE_CAT
WHERE C.LIBELLE_CAT = 'Informatique'
UNION
SELECT REFERENCE_ART , DESIGNATION_ART FROM ARTICLES
WHERE QUANTITE_STOCK <= STOCK_MIN;
5.	Afficher la liste des articles de catégorie informatique et qu’il faut recommander
SELECT A.REFERENCE_ART , A.DESIGNATION_ART FROM ARTICLES A INNER JOIN CATEGORIES C 
ON C.CODE_CAT = A.CODE_CAT
WHERE C.LIBELLE_CAT = 'Informatique'
INTERSECT
SELECT REFERENCE_ART , DESIGNATION_ART FROM ARTICLES
WHERE QUANTITE_STOCK <= STOCK_MIN;
6.	Quels sont les clients qui n’ont jamais passé de commandes ?
SELECT NOM,PRENOM
FROM CLIENTS
MINUS
SELECT C.NOM, C.PRENOM
FROM CLIENTS C INNER JOIN COMMANDES CO
ON C.NUMERO_CLI = CO.NUMERO_CLI;

7.	Afficher la liste des commandes qui comprennent plus de lignes commandes que la commande 1006
SELECT * FROM COMMANDES C INNER JOIN  
(SELECT NUMERO_CDE , count(*) NbrCommande FROM LIGNES_COMMANDES HAVING count(*) > (SELECT count(*) FROM LIGNES_COMMANDES WHERE NUMERO_CDE = 1006 GROUP BY NUMERO_CDE)
 GROUP BY NUMERO_CDE) R ON C.NUMERO_CDE = R.NUMERO_CDE;
8.	Quel est le salarié qui a travaillé le moins ? // A vérifier
SELECT NOM_SAL FROM SALARIES S INNER JOIN (
SELECT NUMERO_SAL , count(*) FROM COMMANDES
HAVING COUNT(*) <= ALL
(SELECT NUMERO_SAL, count(*) FROM COMMANDES GROUP BY NUMERO_SAL)
GROUP BY NUMERO_SAL) R
ON S.NUMERO_SAL = R.NUMERO_SAL;

9.	Afficher la liste des clients qui ont été servis par le salarié Michel Andrieu (travailler avec le prédicat exists)

10.	Quel est le nom du client (et le nombre de commandes) qui a passé le plus grand nombre de commandes pour des articles qui ne sont pas de la catégorie informatique.

11.	Modifier le salaire des salariés : +2% pour les vendeurs, -3% pour les autres.

12.	Afficher la liste des articles dont le stock maximum est supérieur ou égal au prix de n’importe quel article dont la catégorie est « livre »

