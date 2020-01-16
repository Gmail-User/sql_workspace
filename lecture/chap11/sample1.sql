-- sample1.sql


-- ------------------------------------------------------
-- 1. 사용자 관리
-- ------------------------------------------------------
--  가. 다수의 사용자들이 하나의 데이터베이스를 공유하여 사용
--  나. 정보의 공유상, 
--      a. 정보의 유출
--      b. 불법적인 접근
--      에 대한 접근통제(Access Control) 필요
--  다. Oracle은 접근통제(보안대책)을 위해, 아래 접근통제를 사용
--      a. 인증(Authentication)
--      b. 인가(Authorization)
--      각 사용자의 DB 접근/사용에 대해 보안 유지
--  라. 인증(Authentication)
--      사용자 계정의 생성/암호변경/DB자원사용을 통제를 위해,
--      DB 접근 및 사용을 통제하는 것을 의미
--  마. 인가(Authorization)
--      DB 객체에 대한 사용자의 접근/사용을 통제하는 포괄적 개념
-- ------------------------------------------------------


-- ------------------------------------------------------
-- 1-1. 사용자 계정 생성
-- ------------------------------------------------------
--  가. DB 관리자(SYSDBA role 가진)만 가능
--  나. 생성된 사용자는 아무런 권한(Privileges) 도 없음
--  다. 생성된 사용자는, 가장 기본적인 DB 접속조차 불가
-- ------------------------------------------------------
-- Basic syntax:
--
--  CREATE USER 사용자계정
--  IDENTIFIED BY 비밀번호;
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 사용자 계정 생성시, 암호의 길이가 12 바이트 미만인 경우 오류발생
-- ------------------------------------------------------
-- *** 암호생성규칙 (Oracle12c 이상부터) ***
-- ------------------------------------------------------
--  a. 총 12문자 이상
--  b. 최소 1개 이상의 영문 대문자와 소문자 포함
--  c. 최소 1개 이상의 숫자 포함
--  d. 이전 암호 재사용 불가
--  e. 사용자계정명을 암호에 포함불가
-- ------------------------------------------------------

-- ORA-28003: password verification for the specified password failed
CREATE USER user01

-- IDENTIFIED BY user01;            -- XX : 암호생성규칙미달
IDENTIFIED BY Oracle123456;         -- OK : 암호생성규칙준수


-- ------------------------------------------------------
-- 1-2. 사용자 계정 암호변경
-- ------------------------------------------------------
--  가. 생성된 사용자 계정의 암호를 변경
-- ------------------------------------------------------
-- Basic syntax:
--
--  ALTER USER 사용자계정
--  IDENTIFIED BY 비밀번호;
-- ------------------------------------------------------

-- ORA-28003: password verification for the specified password failed
ALTER USER user01

-- ORA-20000: password length less than 12 bytes
IDENTIFIED BY oracle;           -- XX : 암호생성규칙미달

-- ORA-20000: password must contain 1 or more lowercase characters
-- IDENTIFIED BY USER12345678;     -- XX : 암호생성규칙미달

-- ORA-28007: the password cannot be reused
-- IDENTIFIED BY User12345678;         -- XX : 암호생성규칙미달


-- ------------------------------------------------------
-- 1-3. 시스템권한 할당전 접속시도
-- ------------------------------------------------------
--  가. 생성된 사용자 계정은 아무런 권한(Privileges)이 없음
--  나. 생성된 사용자 계정으로 DB에 접속하려면,
--      아래의 시스템 권한(System Prvilges) 할당받아야 함
--      
--      CREATE SESSION 시스템 권한    
--  
--  다. 시스템 권한은, DB관리자(SYSDBA role)만이 할당가능
-- ------------------------------------------------------

-- 시스템 권한 CREATE SESSION 을 할당받기 전에 접속시도

-- ORA-01045: user USER01 lacks CREATE SESSION privilege; logon denied
-- {VSC | Oracle SQL*Developer | Oracle SQL*PLUS} 통해 접속시도     -- XX : 접속실패



