/*
Assignment 3
*/


select * from orders order by orderDate DESC LIMIT 50;

select * from orders order by orderTotal DESC LIMIT 10;

select od.orderID , ord.orderDate , ord.orderTotal ,count(od.orderID) as remainingOrder  from orderdetails od right join 
    (select * from orders where orderDate >= NOW() - INTERVAL 10 DAY) ord 
    on ord.orderID = od.orderID 
    where od.shipped = 0
    group by od.orderID;
    

select * from user u where u.userID not in (
    select sl.userID from 
    (select * from user where admin = false) sl 
    right join 
    (select * from orders where orderDate >= NOW() - INTERVAL 30 DAY) ord
    on sl.userID = ord.userID group by sl.userID);

select * from user u left join (select * from orders where orderDate >= NOW() - INTERVAL 15 DAY) ord on u.userID = ord.userID;


select * from orderdetails ord where ord.shipped = 0 && ord.orderID = 1; 

select ord.orderID , ord.productID , o.orderDate from 
    orders o left join orderdetails ord on o.orderID = ord.orderID
    where o.orderTotal >= 20 && o.orderTotal <= 50;  





    
    
