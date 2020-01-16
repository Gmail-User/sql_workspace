-- sample2.sql

-- ******************************************************
-- SELECT 문의 기본구조와 각 절의 실행순서
-- ******************************************************
--  - Clauses -                 - 실행순서 -
--
-- SELECT clause                    (5)
-- FROM clause                      (1)
-- WHERE clause                     (2)
-- GROUP BY clause                  (3)
-- HAVING clause                    (4)
-- ORDER BY clause                  (6)
-- ******************************************************

-- ------------------------------------------------------
-- 1. 단일(행) (반환)함수
-- ------------------------------------------------------
-- 단일(행) (반환)함수의 구분:
--
--  (1) 문자 (처리)함수 : 문자와 관련된 특별한 조작을 위한 함수
--  (2) 숫자 (처리)함수 : 
--      a. ROUND     - 지정한 자리 수 이하에서 반올림
--      b. TRUNC     - 지정한 자리 수 이하에서 절삭
--      c. MOD       - 나누기 연산을 한 후에 나머지 값을 반환
--      d. CEIL      - 주어진 숫자값보다 크거나 같은 최소 정수값을 반환
--      e. FLOOR     - 주어진 숫자값보다 작거나 같은 최대 정수값을 반환
--      f. SIGN      - 주어진 값이 양수인지 음수인지 0인지 식별할 수 있는 값을 반환
--  (3) 날짜 (처리)함수
--  (4) 변환 (처리)함수
--  (5) 일반 (처리)함수
--
--  단일(행) (반환)함수는, 테이블의 행 단위로 처리됨!
-- ------------------------------------------------------

-- ------------------------------------------------------
-- (1) 숫자 (처리)함수 - ROUND
-- ------------------------------------------------------
-- 지정한 자리 수 이하에서 반올림
-- ------------------------------------------------------

-- 1. ROUND 함수 (양수)
SELECT round( 456.789, 2 )
FROM dual;


-- 2. ROUND 함수 (음수)
SELECT round( 456.789, -1 )
FROM dual;


-- 3. ROUND 함수 (양수/음숫 미지정 -- 소숫점 자리에서 반올림)
SELECT round( 456.789 )
FROM dual;

-- ------------------------------------------------------
-- (2) 숫자 (처리)함수 - TRUNC
-- ------------------------------------------------------
-- 지정한 자리 수 이하에서 절삭
-- ------------------------------------------------------

-- 1. TRUNC 함수 (양수)
SELECT trunc( 456.789, 2 )
FROM dual;


-- 2. TRUNC 함수 (음수)
SELECT trunc( 456.789, -1 )
FROM dual;


-- 3. TRUNC 함수 (양수/음숫 미지정 -- 소숫점 자리에서 절삭)
SELECT trunc( 456.789 )
FROM dual;

-- ------------------------------------------------------
-- (3) 숫자 (처리)함수 - MOD (Modular)
-- ------------------------------------------------------
-- 나누기 연산을 한 후에 나머지 값을 반환
-- ------------------------------------------------------
SELECT 
    mod(10, 3) ,    -- 3으로 나눔
    mod(10, 0)      -- 0으로 나누면???
FROM 
    dual;


-- MOD 함수의 응용 (홀수 판단)
SELECT employee_id, last_name, salary
FROM employees
-- WHERE mod(employee_id, 2) = 1;
WHERE mod(employee_id, 2) != 0;

-- if ( 사원번호 % 2) != 0 :


-- ------------------------------------------------------
-- (4) 숫자 (처리)함수 - CEIL
-- ------------------------------------------------------
-- 주어진 숫자값보다 크거나 같은 최소 정수값을 반환
-- ------------------------------------------------------
SELECT 
    ceil(10.6), 
    ceil(-10.6)
FROM 
    dual;


-- ------------------------------------------------------
-- (5) 숫자 (처리)함수 - FLOOR
-- ------------------------------------------------------
-- 주어진 숫자값보다 작거나 같은 최대 정수값을 반환
-- ------------------------------------------------------
SELECT 
    floor(10),
    floor(10.6), 
    floor(-10.6)
FROM 
    dual;


-- ------------------------------------------------------
-- (6) 숫자 (처리)함수 - SIGN
-- ------------------------------------------------------
-- 주어진 값이 양수인지 음수인지 0인지 식별할 수 있는 값을 반환
-- ------------------------------------------------------
SELECT sign( 100 ) , sign(-20) , sign(0)
FROM dual;

-- SIGN 함수의 응용
SELECT employee_id, last_name, salary
FROM employees
-- WHERE sign(salary - 15000) = 1;   
WHERE sign(salary - 15000) != -1;  
-- if salay > 15000 와 같음
-- sign 함수는, 비교연산자를 대체할 수 있음(>,<,=,>=,<=)





