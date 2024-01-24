/* 1. Count the customers with grades above Bangalore’s average */
select
    count(*) as count
from
    customer where grade > (
        select avg(grade)
        from customer
        where city ='Bengaluru'
    );

/* 2. Find the name and numbers of all salesman who had more than one customer */

select
    s.salesman_id,s.name,count(customer_id)
from
    salesman s, customer c
where
    s.salesman_id = c.salesman_id
group by
    s.salesman_id,s.name
having
    count(customer_id)>1;


/* 3. List all the salesman and indicate those who have and don’t have customers in their cities (Use UNION operation.) */

select
    name,'exists' as same_city
from
    salesman s
where city in (
    select
        city
    from
        customer
    where
        s.salesman_id = salesman_id
)
union
    select
        name,'not exists' as same_city
    from
        salesman s
    where
        city not in (select city
    from
        customer
    where 
        s.salesman_id = salesman_id);


/* 4. Create a view that finds the salesman who has the customer with the highest order of a day. */

create view highest_order as
    select
        s.salesman_id,s.name,o.purchase_amt,o.ord_date
    from 
        salesman s, orders o
    where 
        s. salesman_id = o.salesman_id;


select
    name,ord_date
from 
    highest_order h
where 
    purchase_amt = (
        select 
            max(purchase_amt)
        from 
            highest_order
        where 
            h.ord_date = ord_date
    );



/* 5. Demonstrate the DELETE operation by removing salesman with id 1000. All his orders must also be deleted. */

/* delete from salesman where salesman_id =3; */


/* DONE */
