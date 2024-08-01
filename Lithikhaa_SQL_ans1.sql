-- SQL QUESTION 1

create database Indiancricket;
use Indiancricket;
create table poll_investers (
    user_id VARCHAR(10),
    poll_id VARCHAR(10),
    poll_option_id CHAR(1),
    amount DECIMAL(10, 2),
    created_dt DATE
);
select * from poll_investers;
insert into poll_investers (user_id, poll_id, poll_option_id, amount, created_dt) VALUES
('id1', 'p1', 'A', 200, '2021-12-01'),
('id2', 'p1', 'C', 250, '2021-12-01'),
('id3', 'p1', 'A', 200, '2021-12-01'),
('id4', 'p1', 'B', 500, '2021-12-01'),
('id5', 'p1', 'C', 50, '2021-12-01'),
('id6', 'p1', 'D', 500, '2021-12-01'),
('id7', 'p1', 'C', 200, '2021-12-01'),
('id8', 'p1', 'A', 100, '2021-12-01');

select * from poll_investers;

-- Identifying and adding total amount of (A,B,D) that losers_investors, invested for polling
SELECT SUM(amount) AS nonwinning_amount FROM poll_investers
WHERE poll_option_id IN ('A', 'B', 'D'); 

-- identifying the winning investors option 'c'
select user_id, amount from poll_investers
where poll_option_id = 'C';

-- Total winning amount of option 'c'
select SUM(amount) AS winning_amount from poll_investers
where poll_option_id = 'C';

-- the amount is equally distrubuting, who have selected the 'c' option
select user_id, amount, (amount / 500) * 1500 AS equal_amount from poll_investers
where poll_option_id = 'C';


select user_id, amount, floor((amount / 500) * 1500) AS equal_amount from poll_investers
where poll_option_id = 'C';

-- final output
select user_id, floor(amount + ((amount / 500) * 1500)) as returns from poll_investers
where poll_option_id = 'C';







