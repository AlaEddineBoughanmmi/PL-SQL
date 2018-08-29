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