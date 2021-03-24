/*
return product details and their categories which are in stock and sorted by their adding time.
*/
select 
    p.productID , p.name , p.price , c.categoryName  from products p inner join productCategory pc on p.productID = pc.productId 
    inner join categories c on pc.categoryId = c.categoryID order by p.addedOn DESC;


select p.* from products p where p.productID not in (select productID from images);

select c.categoryID , c.categoryName , 
    CASE WHEN d.categoryName is NULL THEN "Top Category" ELSE d.categoryName END as parentCategory 
    from categories c left join 
    (select categoryID , categoryName from categories) d on d.categoryID = c.parentCatId 
    order by d.categoryName , c.categoryName ;

select c.categoryID , c.categoryName , 
    d.categoryName as parentCategory 
    from categories c inner join 
    (select categoryID , categoryName from categories) d on d.categoryID = c.parentCatId ;


select pro.name,pro.price,pro.description 
    from categories c right join
    (select p.name , p.price , p.description , pc.categoryId from 
    products p left join productCategory pc on p.productID = pc.productId ) pro
    on c.categoryID = pro.categoryId where c.categoryName = "mobile";

select * from products where quantity < 50;












