-- Question 1: Check which users have access to the database
SELECT USER_ID, USERNAME, CREATED, PASSWORD_CHANGE_DATE
FROM USER_USERS;

-- Question 2: Check what tables are present in the database
SELECT *
FROM USER_TABLES;

-- Question 3: Describe each table specifically
DESCRIBE ORDERS;
DESCRIBE PRODUCTLIST;
DESCRIBE REVIEWS;
DESCRIBE STOREFRONT;
DESCRIBE USERBASE;
DESCRIBE USERLIBRARY;


-- Question 4: Display all data in each table specifically
SELECT * FROM ORDERS;
SELECT * FROM PRODUCTLIST;
SELECT * FROM REVIEWS;
SELECT * FROM STOREFRONT;
SELECT * FROM USERBASE;
SELECT * FROM USERLIBRARY;


-- Question 5: Check what constraints are present in the database
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS
FROM USER_CONSTRAINTS;

-- Question 6: Check what views are present in the database
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS;

-- Question 7: Display every USERNAME in alphabetical order
SELECT USERNAME
FROM USERBASE
ORDER BY USERNAME;

-- Question 8: Display users with a Yahoo email address
SELECT FIRSTNAME, LASTNAME, USERNAME, PASSWORD, EMAIL
FROM USERBASE
WHERE EMAIL LIKE '%@yahoo.%';

-- Question 9: Display users with less than $25 in wallet funds
SELECT USERNAME, BIRTHDAY, WALLETFUNDS
FROM USERBASE
WHERE WALLETFUNDS < 25;

-- Question 10: Display users with more than 100 hours played
SELECT USERID, PRODUCTCODE
FROM USERLIBRARY
WHERE HOURSPLAYED > 100;

-- Question 11: Display games with less than 10 hours played
SELECT PRODUCTCODE
FROM USERLIBRARY
WHERE HOURSPLAYED < 10;

-- Question 12: Display every unique publisher
SELECT DISTINCT PUBLISHER
FROM PRODUCTLIST;

-- Question 13: Display products sorted by genre
SELECT PRODUCTNAME, RELEASEDATE, PUBLISHER, GENRE
FROM PRODUCTLIST
ORDER BY GENRE;

-- Question 14: Display strategy genre products
SELECT PRODUCTCODE, PUBLISHER
FROM PRODUCTLIST
WHERE GENRE = 'Strategy';

-- Question 15: Display products costing more than $25, sorted by price descending
SELECT PRODUCTCODE, DESCRIPTION, PRICE
FROM PRODUCTLIST
WHERE PRICE > 25
ORDER BY PRICE DESC;

-- Question 16: Display storefront inventory sorted by ascending price
SELECT INVENTORYID, PRICE
FROM STOREFRONT
ORDER BY PRICE ASC;

-- Question 17: Display products with a rating of 1
SELECT PRODUCTCODE, REVIEW
FROM REVIEWS
WHERE RATING = 1;

-- Question 18: Display products with a rating of 4 or higher
SELECT PRODUCTCODE, REVIEW
FROM REVIEWS
WHERE RATING >= 4;

-- Question 19: Display unique users who have placed an order
SELECT DISTINCT USERID
FROM ORDERS;

-- Question 20: Display all order data sorted by earliest purchase date
SELECT *
FROM ORDERS
ORDER BY PURCHASEDATE ASC;
