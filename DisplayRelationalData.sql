--AUBREY- QUESTION 1
SELECT u.username, MIN(r.rating) AS lowest_rating
FROM USERBASE u
JOIN reviews r ON u.userid = r.userid
GROUP BY u.username;

--AUBREY- QUESTION 2
SELECT B.email, A.question, A.answer 
FROM SECURITYQUESTION a
INNER JOIN USERBASE b on A.USERID = B.USERID;

--AUBREY- QUESTION 3
SELECT u.firstname, u.email, u.walletfunds
FROM userBASE u
LEFT JOIN wishlist w ON u.userid = w.userid
WHERE w.userid IS NULL;

--AUBREY- QUESTION 4
SELECT u.username, COUNT(o.productCODE) AS total_orders
FROM userBASE u
JOIN orders o ON u.userid = o.userid
GROUP BY u.username;

--AUBREY- QUESTION 5
SELECT DISTINCT FLOOR(MONTHS_BETWEEN(SYSDATE, u.birthday)/12) AS age
FROM userBASE u
JOIN orders o ON u.userid = o.userid
WHERE o.PURCHASEdate >= ADD_MONTHS(SYSDATE, -6);

--AUBREY- QUESTION 6
SELECT username, birthday
FROM userBASE
WHERE friendcount = (SELECT MAX(friendcount) FROM userbase);

--AUBREY- QUESTION 7
SELECT DISTINCT p.productname, p.releasedate, p.price, p.description
FROM productlist p
JOIN wishlist w ON p.productcode = w.productcode;

--AUBREY- QUESTION 8
SELECT p.productname,
       MAX(r.rating) AS highest_rating,
       COUNT(r.productcode) AS review_count
FROM productlist p
JOIN reviews r ON p.productcode = r.productcode
GROUP BY p.productname
ORDER BY highest_rating DESC;

--AUBREY- QUESTION 9
CREATE VIEW product_rating_view AS
SELECT p.productname, p.genre, r.rating
FROM productlist p
JOIN reviews r ON p.productcode = r.productcode
WHERE r.rating IN (1, 5)
ORDER BY r.rating ASC;

--AUBREY- QUESTION 10
SELECT p.genre, COUNT(o.productcode) AS total_orders
FROM productlist p
JOIN orders o ON p.productcode = o.productcode
GROUP BY p.genre
ORDER BY p.genre ASC;

--AUBREY- QUESTION 11
CREATE VIEW publisher_stats AS
SELECT p.publisher, 
       AVG(p.price) AS avg_price,
       SUM(a.hoursplayed) AS total_hours
FROM productlist p
inner join userlibrary a on p.productcode = a.productcode
GROUP BY p.publisher;

--AUBREY- QUESTION 12
SELECT p.publisher,
       SUM(p.price) AS total_spent
FROM orders o
JOIN productlist p ON o.productcode = p.productcode
GROUP BY p.publisher
ORDER BY total_spent DESC;

--AUBREY- QUESTION 13
SELECT ticketid, STATUS, email, issue
FROM USERSUPPORT
WHERE status IN ('NEW', 'IN PROGRESS')
ORDER BY dateupdated DESC;

--AUBREY- QUESTION 14
SELECT STATUS, COUNT(ticketid) AS ticket_count
FROM USERSUPPORT
GROUP BY status;

--AUBREY- QUESTION 15
SELECT userid, email
FROM userbase
WHERE LOWER(email) LIKE '%' || LOWER(firstname) || '%'
   OR LOWER(email) LIKE '%' || LOWER(lastname) || '%'
   OR LOWER(email) LIKE '%' || LOWER(firstname || lastname) || '%';

--AUBREY- QUESTION 16
SELECT DISTINCT email
FROM USERSUPPORT
WHERE status IN ('NEW', 'IN PROGRESS')
AND email NOT IN (SELECT email FROM userBASE);

--AUBREY- QUESTION 17
SELECT st.ticketid, u.firstname, u.lastname, STATUS
FROM USERSUPPORT st
JOIN userBASE u
ON LOWER(st.issue) LIKE '%' || LOWER(STATUS) || '%';

--AUBREY- QUESTION 18
SELECT u.username, u.password
FROM userBASE u
JOIN USERsupport st ON u.email = st.email;

--AUBREY- QUESTION 19
CREATE VIEW recent_penalties AS
SELECT i.username, i.dateassigned, i.penalty
FROM infractions i
JOIN userBASE u ON i.userid = u.userid
WHERE i.penalty IS NOT NULL
AND i.dateassigned >= ADD_MONTHS(SYSDATE, -1);

--AUBREY- QUESTION 20
SELECT u.username, u.email
FROM userbase u
WHERE FLOOR(MONTHS_BETWEEN(SYSDATE, u.birthday)/12) >= 18
AND u.userid NOT IN (
    SELECT i.userid
    FROM infractions i
    WHERE i.dateassigned >= ADD_MONTHS(SYSDATE, -4)

--AUBREY- QUESTION 21
SELECT u.username,
       i.dateassigned,
       g.rulenum || ' ' || g.title AS guideline
FROM infractions i
JOIN userbase u ON i.userid = u.userid
JOIN communityrules g ON i.rulenum = g.rulenum;

--AUBREY- QUESTION 22
SELECT u.userid, u.username, u.email,
       SUM(i.severitypoint) AS total_severity
FROM userbase u
JOIN infractions i ON u.userid = i.userid
GROUP BY u.userid, u.username, u.email;

--AUBREY- QUESTION 23
SELECT g.title, g.description, i.penalty
FROM infractions i
JOIN communityrules g ON i.rulenum = g.rulenum;

--AUBREY- QUESTION 24
SELECT u.username, COUNT(i.infractionid) AS infraction_count
FROM userbase u
JOIN infractions i ON u.userid = i.userid
GROUP BY u.username
HAVING COUNT(i.infractionid) >= 15;
