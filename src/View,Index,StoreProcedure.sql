create DATABASE demo;
use demo;
create table products
(
    Id                 int auto_increment
        primary key,
    productCode        varchar(20) not null,
    productName        varchar(50) not null,
    productPrice       double      null,
    productAmount      double      null,
    productDescription varchar(60) null,
    productStatus      tinyint(1)  not null
);
INSERT INTO products(productcode, productname, productprice, productamount, productdescription, productstatus) values ('vc13','gsdgvs',70.5,80,'',true), ('wq46','fzf',90.2,100,'',false),('fd22','âfca',200,700,'',true);
ALTER TABLE products ADD UNIQUE INDEX uidx_proCode(productCode);
ALTER TABLE products ADD INDEX compositeidx_proCode(productName,productPrice);
EXPLAIN SELECT * FROM products where productCode = 'vc13';
EXPLAIN SELECT * FROM products where productName = 'agfagg';
CREATE view product_views AS SELECT productCode, productName, productPrice, productStatus from products;
CREATE OR REPLACE VIEW product_views AS SELECT productCode, productName, productPrice, productStatus from products where productPrice <100;
DROP VIEW product_views;
CREATE PROCEDURE getAllProduct()
begin
    SELECT * from products;
end;
CREATE PROCEDURE addnewProduct(IN proCode varchar(20),IN proName varchar(50),IN proPrice double,IN proAmount double,IN proDescription varchar(60),IN proStatus tinyint(1))
begin
    INSERT INTO products( productcode, productname, productprice, productamount, productdescription, productstatus) values (proCode,proName,proPrice,proAmount,proDescription,proStatus);
end;
CREATE PROCEDURE setProduct(IN proId int,IN proCode varchar(20),IN proName varchar(50),IN proPrice double,IN proAmount double,IN proDescription varchar(60),IN proStatus tinyint(1))
begin
    UPDATE products SET productCode = proCode,productName = proName,productPrice = proPrice, productAmount = proAmount, productDescription = proDescription, productStatus = proStatus where Id=proId;
end;
CREATE PROCEDURE deleteProduct(IN proId int)
begin
    DELETE FROM products where Id = proId;
end;