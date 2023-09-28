-- Создание таблицы 1: Продавцы
use new_schema;
DROP TABLE IF EXISTS salespeople;
CREATE TABLE salespeople (
	id_sales INT auto_increment PRIMARY KEY, 
	sname VARCHAR(45),
	city VARCHAR(45),
	age VARCHAR(45)

);

-- Наполнение данными
INSERT INTO salespeople (sname, city, age)
VALUES
('Peel', 'London', 57),
('Serres', 'San Jose', 23),
('Motika', 'London', 28),
('Rifkin', 'Barcelona', 40),
('Axelrod', 'New York', 35);



-- Создание таблицы 2: Заказчики

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
	id_cust INT auto_increment PRIMARY KEY, 
	cname VARCHAR(45),
	city VARCHAR(45),
	rating INT,
    id_sales INT ,
	FOREIGN KEY(id_sales) REFERENCES salespeople(id_sales)
);

-- Наполнение данными
INSERT INTO customers (cname, city, rating, id_sales)
VALUES
('Hoffman', 'London', 100, 1),
('Giovanni', 'Rome', 200, 3),
('Liu', 'SanJose', 200, 2),
('Grass', 'Berlin', 300, 2),
('Clemens', 'London', 100, 1),
('Cisneros', 'SanJose', 300, 5),
('Pereira', 'Rome', 100, 4);



-- Создание таблицы 3: Заказы

DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
	id_order SERIAL PRIMARY KEY, 
	amt DECIMAL(10,2),
	odate DATE,
    id_sales INT ,
    id_cust INT ,
	FOREIGN KEY(id_sales) REFERENCES salespeople(id_sales),
	FOREIGN KEY(id_cust) REFERENCES customers(id_cust)
);

-- Наполнение данными
INSERT INTO orders (amt, odate, id_sales, id_cust)
VALUES
(  18.69, '1990-03-10', 3, 2),
( 767.19, '1990-03-10', 1, 1),
(1900.10, '1990-03-10', 3, 2),
(5160.45, '1990-03-10', 2, 4),
(1098.16, '1990-03-10', 1, 5),
(1713.23, '1990-04-10', 2, 3),
( 765.75, '1990-04-10', 5, 6),
(4723.00, '1990-05-10', 4, 7),
(1309.95, '1990-06-10', 2, 3),
(9891.88, '1990-06-10', 4, 7);




















-- 1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: sname, city, age
SELECT sname, city, age FROM salespeople;

-- 2. Напишите команду, которая вывела бы оценку, сопровождаемую именем каждого заказчика в городе San Jose. 
SELECT rating, cname 
FROM customers 
WHERE city = 'SanJose' ;

-- Напишите запрос, который вывел бы значения id_sales всех продавцов из таблицы заказов 
SELECT DISTINCT(id_sales) FROM orders;

-- 4. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
SELECT *
FROM customers
WHERE cname LIKE 'G%';

-- 5. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. 
SELECT *
FROM orders
WHERE amt > 1000;

-- 6. Напишите запрос который выбрал бы наименьшую сумму заказа.
SELECT MIN(amt) AS 'мин.заказ' FROM orders;

-- 7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме. 
SELECT * FROM customers
WHERE rating > 100 AND NOT city = 'Rome';

-- 8. Изменим запись из таблицы  salespeople
UPDATE  salespeople
SET city = 'Moscow'
WHERE id_sales = 2;

-- 9. Удалим запись из таблмцы orders
DELETE FROM orders
WHERE id_order = 4;

-- 10. Соединим таблицы salespeople и customers
SELECT * FROM salespeople
JOIN customers
USING(id_sales);

-- 11. Выведем заказы в порядке убывания суммы
SELECT * FROM orders
ORDER BY amt DESC;






