-- sample3.sql

DESC emp;

SELECT DISTINCT empno, sal
FROM emp
WHERE empno = 7369;

CREATE OR REPLACE PROCEDURE raise_salary
( p_empno IN emp.empno%TYPE )
IS
    v_sal IN emp.sal%TYPE
BEGIN
    UPDATE emp
        SET sal = sal * 1.1
        WHERE empno = p_empno;

    SELECT sal INTO v_sal
    FROM emp
    WHERE empno = p_empno;
END;

CREATE OR REPLACE PROCEDURE my_test
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Procedure Test');
END;

CREATE OR REPLACE PROCEDURE gugudan( 
    dansu NUMBER 
) IS
BEGIN
    FOR i IN 1..9 LOOP
        DBMS_OUTPUT.PUT_LINE( dansu || ' x ' || i || ' = ' || dansu*i );
    END LOOP;
END;