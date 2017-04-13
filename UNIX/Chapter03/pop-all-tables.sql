
-- Customers


insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Miss','Jenny','Stones','27 Rowan Avenue','Hightown','NT2 1AQ','023 9876');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Andrew','Stones','52 The Willows','Lowtown','LT5 7RA','876 3527');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Miss','Alex','Matthew','4 The Street','Nicetown','NT2 2TX','010 4567');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Adrian','Matthew','The Barn','Yuleville','YV67 2WR','487 3871');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Simon','Cozens','7 Shady Lane','Oakenham','OA3 6QW','514 5926');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Neil','Matthew','5 Pasture Lane','Nicetown','NT3 7RT','267 1232');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Richard','Stones','34 Holly Way','Bingham','BG4 2WE','342 5982');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mrs','Ann','Stones','34 Holly Way','Bingham','BG4 2WE','342 5982');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mrs','Christine','Hickman','36 Queen Street','Histon','HT3 5EM','342 5432');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Mike','Howard','86 Dysart Street','Tibsville','TB3 7FG','505 5482');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Dave','Jones','54 Vale Rise','Bingham','BG3 8GD','342 8264');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Richard','Neill','42 Thatched Way','Winnersby','WB3 6GQ','505 6482');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mrs','Laura','Hardy','73 Margarita Way','Oxbridge','OX2 3HX','821 2335');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Bill','O''Neill','2 Beamer Street','Welltown','WT3 8GM','435 1234');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','David','Hudson','4 The Square','Milltown','MT2 6RT','961 4526');

-- Items

insert into item(description, cost_price, sell_price) values('Wood Puzzle', 15.23, 21.95);
insert into item(description, cost_price, sell_price) values('Rubik Cube', 7.45, 11.49);
insert into item(description, cost_price, sell_price) values('Linux CD', 1.99, 2.49);
insert into item(description, cost_price, sell_price) values('Tissues', 2.11, 3.99);
insert into item(description, cost_price, sell_price) values('Picture Frame', 7.54, 9.95);
insert into item(description, cost_price, sell_price) values('Fan Small', 9.23, 15.75);
insert into item(description, cost_price, sell_price) values('Fan Large', 13.36, 19.95);
insert into item(description, cost_price, sell_price) values('Toothbrush', 0.75, 1.45);
insert into item(description, cost_price, sell_price) values('Roman Coin', 2.34, 2.45);
insert into item(description, cost_price, sell_price) values('Carrier Bag', 0.01, 0.0);
insert into item(description, cost_price, sell_price) values('Speakers', 19.73, 25.32);

-- Barcodes

insert into barcode(barcode_ean, item_id) values('6241527836173', 1);
insert into barcode(barcode_ean, item_id) values('6241574635234', 2);
insert into barcode(barcode_ean, item_id) values('6264537836173', 3);
insert into barcode(barcode_ean, item_id) values('6241527746363', 3);
insert into barcode(barcode_ean, item_id) values('7465743843764', 4);
insert into barcode(barcode_ean, item_id) values('3453458677628', 5);
insert into barcode(barcode_ean, item_id) values('6434564564544', 6);
insert into barcode(barcode_ean, item_id) values('8476736836876', 7);
insert into barcode(barcode_ean, item_id) values('6241234586487', 8);
insert into barcode(barcode_ean, item_id) values('9473625532534', 8);
insert into barcode(barcode_ean, item_id) values('9473627464543', 8);
insert into barcode(barcode_ean, item_id) values('4587263646878', 9);
insert into barcode(barcode_ean, item_id) values('9879879837489', 11);
insert into barcode(barcode_ean, item_id) values('2239872376872', 11);

-- Stock

insert into stock(item_id, quantity) values(1,12);
insert into stock(item_id, quantity) values(2,2);
insert into stock(item_id, quantity) values(4,8);
insert into stock(item_id, quantity) values(5,3);
insert into stock(item_id, quantity) values(7,8);
insert into stock(item_id, quantity) values(8,18);
insert into stock(item_id, quantity) values(10,1);

-- Order info

insert into orderinfo(customer_id, date_placed, date_shipped, shipping) values(3,'03-13-2004','03-17-2004', 2.99);
insert into orderinfo(customer_id, date_placed, date_shipped, shipping) values(8,'06-23-2004','06-24-2004', 0.00);
insert into orderinfo(customer_id, date_placed, date_shipped, shipping) values(15,'09-02-2004','09-12-2004', 3.99);
insert into orderinfo(customer_id, date_placed, date_shipped, shipping) values(13,'09-03-2004','09-10-2004', 2.99);
insert into orderinfo(customer_id, date_placed, date_shipped, shipping) values(8,'07-21-2004','07-24-2004', 0.00);

-- Order line

insert into orderline(orderinfo_id, item_id, quantity) values(1, 4, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(1, 7, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(1, 9, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(2, 1, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(2, 10, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(2, 7, 2);
insert into orderline(orderinfo_id, item_id, quantity) values(2, 4, 2);
insert into orderline(orderinfo_id, item_id, quantity) values(3, 2, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(3, 1, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(4, 5, 2);
insert into orderline(orderinfo_id, item_id, quantity) values(5, 1, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(5, 3, 1);


