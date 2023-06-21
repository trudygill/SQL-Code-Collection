/* 
Created by: T.GILL
Create date: 06-03-2023
Description: Project - Design a store database. Create your own store! Your store should sell one type of things, like clothing or bikes, whatever you want your store to specialize in. You should have a table for all the items in your store, and at least 5 columns for the kind of data you think you'd need to store. You should sell at least 15 items, and use select statements to order your items by price and show at least one statistic about the items.
*/
CREATE TABLE bookstore (id INTEGER PRIMARY KEY, name TEXT, author TEXT, genre TEXT, price INTEGER, rating INTEGER);

INSERT INTO bookstore VALUES (1, "Anne of Green Gables", "Lucy Montgomery", "Novel", 5.99, 4);
INSERT INTO bookstore VALUES (2, "The English Spy", "Daniel Silva", "Mystery", 11.99, 4.5);
INSERT INTO bookstore VALUES (3, "Atomic Habits", "James Clear", "Self-Improvement", 7.99, 4);
INSERT INTO bookstore VALUES (4, "Pride and Prejudice", "Jane Austen", "Novel", 6.99, 4.5);
INSERT INTO bookstore VALUES (5, "A Chance For Love", "Tricia Gill", "Fiction", 3.99, 4);
INSERT INTO bookstore VALUES (6, "Passport to Heaven", "Micah Wilder", "Non-Fiction", 8.95, 4);
INSERT INTO bookstore VALUES (7, "Once upon a Prince", "Rachel Hauck", "Romance", 2.99, 4);
INSERT INTO bookstore VALUES (8, "A Reluctant Queen", "Joan Wolf", "Romance", 3.95, 4.5);
INSERT INTO bookstore VALUES (9, "Yellow Wife", "Sadeqa Johnson", "Fiction", 5.99, 4); 
INSERT INTO bookstore VALUES (10, "The EX Assignment", "Victoria Page", "Romance", 4.99, 4);
INSERT INTO bookstore VALUES (11, "Harvest of Gold", "Tessa Afshar", "Romance", 3.99, 5); 
INSERT INTO bookstore VALUES (12, "A Vow of Hate", "Lylah James", "Novel", 1.99, 3);
INSERT INTO bookstore VALUES (13, "Still Me", "JoJo Moyes", "Novel", 2.99, 3.5);
INSERT INTO bookstore VALUES (14, "Period Power", "Maisie Hill", "Health", 9.99, 4);
INSERT INTO bookstore VALUES (15, "Love Your Gut", "Megan Rossi", "Health", 9.99, 4);


SELECT * FROM bookstore ORDER BY price DESC;
SELECT * FROM bookstore WHERE price < 2; 
