
create table customer
(
    customer_id                     serial,
    title                           char(4),
    fname                           varchar(32),
    lname                           varchar(32) not null,
    addressline                     varchar(64),
    town                            varchar(32),
    zipcode                         char(10) not null,
    phone                           varchar(16),
    CONSTRAINT                      customer_pk PRIMARY KEY(customer_id)
);

create table orderinfo
(
    orderinfo_id                    serial,
    customer_id                     integer not null,
    date_placed                     date not null,
    date_shipped                    date,
    shipping                        numeric(7,2) ,
    CONSTRAINT                      orderinfo_pk PRIMARY KEY(orderinfo_id),
    CONSTRAINT orderinfo_customer_id_fk FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

create table item
(
    item_id                         serial,
    description                     varchar(64) not null,
    cost_price                      numeric(7,2),
    sell_price                      numeric(7,2),
    CONSTRAINT                      item_pk PRIMARY KEY(item_id)
);
 

create table orderline
(
    orderinfo_id                    integer not null,
    item_id                         integer not null,
    quantity                        integer not null,
    CONSTRAINT                      orderline_pk PRIMARY KEY(orderinfo_id, item_id),
    CONSTRAINT orderline_orderinfo_id_fk FOREIGN KEY(orderinfo_id) REFERENCES orderinfo(orderinfo_id),
    CONSTRAINT orderline_item_id_fk FOREIGN KEY(item_id) REFERENCES item(item_id)
);

create table stock
(
    item_id                         integer not null,
    quantity                        integer  not null,
    CONSTRAINT                      stock_pk PRIMARY KEY(item_id),
    CONSTRAINT stock_item_id_fk FOREIGN KEY(item_id) REFERENCES item(item_id)
);

create table barcode
(
    barcode_ean                     char(13) not null,
    item_id                         integer not null,
    CONSTRAINT                      barcode_pk PRIMARY KEY(barcode_ean),
    CONSTRAINT barcode_item_id_fk FOREIGN KEY(item_id) REFERENCES item(item_id)
);



