-- Drop if necessary and create a temporary table for raising orders
drop table reorders;
drop trigger trig_reorder on stock;
drop function reorders(int4);
drop function reorder_trigger();
drop trigger trig_customer on customer;
drop function customer_trigger();

create table reorders 
( 
  item_id integer,
  message text
);

-- reorders
-- scan the stock table to raise re orders of item low on stock

create function reorders(min_stock int4) returns integer as $$
declare
    reorder_item integer;
    reorder_count integer;
    stock_row stock%rowtype;
    msg text;
begin
    select count(*) into reorder_count from stock
           where quantity <= min_stock;
    for stock_row in select * from stock 
                     where quantity <= min_stock
    loop
        declare
            item_row item%rowtype;
        begin
            select * into item_row from item
            where item_id = stock_row.item_id;
                msg = 'order more ' || 
                       item_row.description || 's at ' || 
                       to_char(item_row.cost_price,'99.99');
            insert into reorders 
                values (stock_row.item_id, msg);
        end;
    end loop;
    return reorder_count;
end;
$$ language plpgsql;

create function reorder_trigger() returns trigger AS $$
declare
    mq integer;
    item_record record;
begin
    mq := tg_argv[0];
    raise notice 'in trigger, mq is %', mq;
    if new.quantity <= mq
    then
        select * into item_record from item 
        where item_id = new.item_id;
        insert into reorders 
          values (new.item_id, item_record.description);
    end if;
    return NULL;
end;
$$ language plpgsql;

create trigger trig_reorder 
after insert or update ON stock
for each row execute procedure reorder_trigger(3);

create function customer_trigger() returns trigger AS $$
declare
    order_record record;
begin
    -- about to delete a customer
    -- disallow if orders pending
    select * into order_record from orderinfo
    where customer_id = old.customer_id
          and date_shipped is NULL;
    if not found
    then
        -- all OK, delete of customer can proceed
        raise notice 'deletion allowed: no outstanding orders';
        raise notice 'old.customer_id is %', old.customer_id;
        return NULL;

        -- for referential integrity we have to tidy up
        -- we will need to delete all completed orders
        -- but first delete the information about the orders
        for order_record in select * from orderinfo
            where customer_id = old.customer_id
        loop
            delete from orderline 
               where orderinfo_id = order_record.orderinfo_id;
        end loop;
        
        -- now delete the order records
        delete from orderinfo
               where customer_id = old.customer_id;

        -- return the old record to allow customer to be deleted
        return old;
    else
        -- orders present return NULL to prevent deletion
        raise notice 'deletion aborted: outstanding orders present';
        return NULL;
    end if;
end;
$$ language plpgsql;

create trigger trig_customer before delete on customer
for each row execute procedure customer_trigger();

