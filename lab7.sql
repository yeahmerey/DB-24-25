--task1 :
create index ind_products_name on products(product_name) ;
--task2 :
create index ind_first_and_last_name on customers(first_name , last_name);
--task3 :
create unique index ind_ord_total on orders(order_total);
--task4 :
create index idx_low_email on customers(lower(email));
--task5 :
create index idx_order_total on orders(order_total) ;
create index idx_order_items_quantity on order_items(order_id , quantity) ;