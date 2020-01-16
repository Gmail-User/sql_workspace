-- sample7.sql


-- SQL for Analysis and Reporting:
--  The RANK function


-- Syntax: RANK() OVER ( [query_partition_clause] order_by_clause )
--
--  1. [query_partition_clause]
--     divides the query result set into groups
--     within which the RANK function operates.
--
--  2. order_by_clause
--     specifies the measures based on which ranking is done.

EXPLAIN PLAN
    SET statement_id = 'stmt_rank'
    INTO plan_table
FOR
    select
        department_id, last_name, salary, 
        RANK() OVER ( PARTITION BY department_id ORDER BY salary DESC ) "Rank"
    from employees
    where department_id = 60
    order by department_id, "Rank", salary;

SELECT * 
FROM table( DBMS_XPLAN.display() );

-----------------------------------------------------------------------------------

select department_id, last_name, salary
from employees
where department_id is not null;

-----------------------------------------------------------------------------------

select
    department_id, last_name, salary,
    RANK() OVER ( PARTITION BY department_id ORDER BY salary DESC ) "Rank",
    DENSE_RANK() OVER ( PARTITION BY department_id ORDER BY salary DESC ) "DenseRank"
from employees
where department_id is not null
order by department_id, salary DESC;

-----------------------------------------------------------------------------------

select
    last_name, salary,
    NTILE(4) OVER ( ORDER BY salary DESC ) as quartile
from employees
where department_id is not null;
-- order by last_name, salary, quartile;

-----------------------------------------------------------------------------------

-- on Oracle12c above
select last_name, salary, RATIO_TO_REPORT(salary) as rr
from employees
where job_id = 'PU_CLERK'
order by last_name, salary, rr;

-----------------------------------------------------------------------------------

select
    employee_id, last_name, salary,
    LAG(salary, 1, 0) OVER (ORDER BY salary) AS sal_prev,
    salary - LAG(salary, 1, 0) OVER (ORDER BY salary) AS sal_diff
from employees
where job_id = 'IT_PROG';

-----------------------------------------------------------------------------------

select
    employee_id, last_name, salary,
    LEAD(salary, 1, 0) OVER (ORDER BY salary) AS sal_next,
    LEAD(salary, 1, 0) OVER (ORDER BY salary) - salary AS sal_diff
from employees;