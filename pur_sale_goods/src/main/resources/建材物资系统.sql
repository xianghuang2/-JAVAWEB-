
-- 启动资金为250000，分别买了1000个商品1，2000个商品2，2000个商品3

drop database if exists warestore;
create database warestore;
use warestore;
drop table if exists manager;
create table manager(
    id int(32) not null auto_increment,
	name varchar(32) not null,
	sex varchar(32) not null,
	password varchar(32) not null,
	primary key(id)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
drop table if exists customer;
create table customer(
         id int(32) not null auto_increment,
         password varchar(32) not null,
         name varchar(32) not null,
         sex varchar(32) not null,
         primary key(id)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
drop table if exists goods;
create table goods(
	 id int(32) not null auto_increment,
     name varchar(32) not null,
     purprice double not null,
     offprice double not null,
     count int(32),
     data datetime,
     primary key(id)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
drop table if exists supplier;
create table supplier(
     id int(32) not null auto_increment,
     phone bigint(20) not null,
     name varchar(32) not null,
     primary key(id)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
drop table if exists purform;
create table purform(
    id int(32) not null auto_increment,
	goodsid int(32) not null,
    supplierid int(32) not null,
    managerid int(32) not null,
    count int(32) not null,
    data  datetime not null,
    primary key(id)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
drop table if exists saleform;
create table saleform(
	id int(32) not null auto_increment,
    customerid int(32) not null,
	managerid int(32) not null,
    goodsid int(32) not null,
    count int(32) not null,
    data  datetime not null,
    primary key(id)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



ALTER TABLE saleform AUTO_INCREMENT = 1;

ALTER TABLE purform AUTO_INCREMENT = 1;
alter table purform add foreign key(managerid) references manager(id);
alter table purform add foreign key(goodsid) references goods(id);
alter table purform add foreign key(supplierid) references supplier(id);
alter table saleform add foreign key(managerid) references manager(id);
alter table saleform add foreign key(goodsid) references goods(id);
alter table saleform add foreign key(customerid) references customer(id);


INSERT INTO `warestore`.`goods` (`id`, `name`, `purprice`, `offprice`, `count`, `data`) VALUES ('1', '木材', '30', '35', '1000', '2021-12-30');
INSERT INTO `warestore`.`goods` (`id`, `name`, `purprice`, `offprice`, `count`, `data`) VALUES ('2', '钢铁', '50', '55', '2000', '2021-12-30 09:45:16');
INSERT INTO `warestore`.`goods` (`id`, `name`, `purprice`, `offprice`, `count`, `data`) VALUES ('3', '玻璃', '60', '65', '2000', '2021-12-30 10:09:09');


INSERT INTO `warestore`.`customer` (`id`, `password`, `name`, `sex`) VALUES ('1', '123456', 'admin', '男');
INSERT INTO `warestore`.`customer` (`id`, `password`, `name`, `sex`) VALUES ('2', '123456', '黄祥', '男');
INSERT INTO `warestore`.`customer` (`id`, `password`, `name`, `sex`) VALUES ('3', '123456', '李四', '女');

INSERT INTO `warestore`.`manager` (`id`, `name`, `sex`, `password`) VALUES ('1', '刘强', '男', '123456');
INSERT INTO `warestore`.`manager` (`id`, `name`, `sex`, `password`) VALUES ('2', '小明', '男', '123456');

INSERT INTO `warestore`.`supplier` (`id`, `phone`, `name`) VALUES ('1', '1786423', '李强');
INSERT INTO `warestore`.`supplier` (`id`, `phone`, `name`) VALUES ('2', '1987658', '刘洋');

drop trigger if exists purchase_goods;
delimiter ##
create trigger purchase_goods after insert on purform for each row
  begin
   
    update goods set count = count + new.count where id = new.goodsid;
	update goods set data = new.data where id=new.goodsid;
    
    update goods set income=income-new.count*purprice where id = new.goodsid;
  end
##


drop trigger if exists sale_goods;
delimiter ##
create trigger sale_goods after insert on saleform for each row
begin
   
    update goods set count = count - new.count where id = new.goodsid;
	update goods set data = new.data where id=new.goodsid;
    
    update goods set income = income+new.count*saleprice where id = new.goodsid;
end
##



drop procedure if exists pur_sale_count;
delimiter ##
CREATE procedure pur_sale_count(in data1 datetime,in data2 datetime)
begin
     select sale_goods.id as id,sale_goods.name as name,
     COALESCE(sale_goods.sale_count,0) as sale_count,
	 COALESCE(pur_goods.pur_count,0) as pur_counr
	 from
	 (select g.id as id,g.name as name,sale.sale_count as sale_count 
	 from 
	goods g 
	left join
	(select goodsid,sum(count) as sale_count from saleform where data between data1 and data2 group by id)
	sale 
	on sale.goodsid=g.id  order by g.id) sale_goods
	left join
	(select g.id as id,pur.pur_count as pur_count 
	from 
	goods g 
	left join
	(select goodsid,sum(count) as pur_count from purform where data between data1 and data2 group by id)
	pur 
	on pur.goodsid=g.id  order by g.id) pur_goods
	on sale_goods.id=pur_goods.id;

end 
##

call pur_sale_count('2021-12-30 10:00:00','2021-12-31 13:00:00');


drop procedure if exists pur_sale_income;
delimiter ##
CREATE procedure pur_sale_income(in data1 datetime,in data2 datetime)
begin
           select  g.id as id,g.name as name,pur_sale.sale_count*g.saleprice as saleincome,
   pur_sale.pur_count*g.purprice as puroff,
   (pur_sale.sale_count-pur_sale.pur_count)*(g.saleprice-g.purprice) as income
   from
    (select sale_goods.id as id,sale_goods.name as name,
     COALESCE(sale_goods.sale_count,0) as sale_count,
	 COALESCE(pur_goods.pur_count,0) as pur_count
	 from
	 (select g.id as id,g.name as name,sale.sale_count as sale_count 
	 from 
	goods g 
	left join
	(select goodsid,sum(count) as sale_count from saleform where data between data1 and data2 group by id)
	sale 
	on sale.goodsid=g.id  order by g.id) sale_goods
	left join
	(select g.id as id,pur.pur_count as pur_count 
	from 
	goods g 
	left join
	(select goodsid,sum(count) as pur_count from purform where data between data1 and data2 group by id)
	pur 
	on pur.goodsid=g.id  order by g.id) pur_goods
	on sale_goods.id=pur_goods.id) 
    pur_sale,
    goods g
    where g.id=pur_sale.id;
end
##
call pur_sale_income('2021-12-30 10:00:00','2021-12-31 13:00:00');

 
    
     


