-- sample1.sql

-- ------------------------------------------------------
-- 1. To change the password of the specified user
-- ------------------------------------------------------
-- ALTER USER <사용자명> IDENTIFIED BY <비밀번호>;
-- ------------------------------------------------------
ALTER USER hr identified by hr;

-- ------------------------------------------------------
-- 2. To lock the specified user
-- ------------------------------------------------------
-- ALTER USER <사용자명> ACCOUNT LOCK;
-- ------------------------------------------------------
ALTER USER hr ACCOUNT LOCK;

DESC DBA_USERS;
SELECT USERNAME, ACCOUNT_STATUS FROM DBA_USERS;

-- ------------------------------------------------------
-- 3. To unlock the specified user
-- ------------------------------------------------------
-- ALTER USER <사용자명> ACCOUNT UNLOCK;
-- ------------------------------------------------------
ALTER USER hr ACCOUNT UNLOCK;

DESC DBA_USERS;
SELECT USERNAME, ACCOUNT_STATUS FROM DBA_USERS;

-- ------------------------------------------------------
-- 4. To change the password and [un]lock 
--    of the specified user 
-- ------------------------------------------------------
-- ALTER USER <사용자명> ACCOUNT LOCK IDENTIFIED BY <비밀번호>;
-- ALTER USER <사용자명> ACCOUNT UNLOCK IDENTIFIED BY <비밀번호>;
--
-- ALTER USER <사용자명> IDENTIFIED BY <비밀번호> ACCOUNT LOCK ;
-- ALTER USER <사용자명> IDENTIFIED BY <비밀번호>ACCOUNT UNLOCK ;
-- ------------------------------------------------------
ALTER USER hr ACCOUNT LOCK IDENTIFIED BY hr;
ALTER USER hr ACCOUNT UNLOCK IDENTIFIED BY hr;

ALTER USER hr IDENTIFIED BY hr ACCOUNT LOCK;
ALTER USER hr IDENTIFIED BY hr ACCOUNT UNLOCK;

DESC DBA_USERS;
SELECT USERNAME, PASSWORD, ACCOUNT_STATUS FROM DBA_USERS;