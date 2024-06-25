drop database if exists investment;
create database investment;
use investment;
-- drop database if exists investment;




-- For debugging
drop table if exists  stocks_t;
drop table if exists  crypto_t;
drop table if exists  userprofile_t;
drop table if exists  realestate_t;
drop table if exists  asset_summary_t;
drop table if exists  fixeddeposits_t;
drop table if exists  mutualfunds_t;
drop table if exists  commodities_t;
drop table if exists  provident_fund_t;
drop table if exists  insurance_t;
drop table if exists  personalsavings_t;
drop table if exists  collectables_t;



show tables;


create table provident_fund_t
(
pf_id integer primary key,
pf_start_date date,
monthly_deduction_percentage float);




CREATE TABLE userprofile_t(ssn integer PRIMARY KEY,
pf_id integer,
foreign key (pf_id) references provident_fund_t(pf_id) ,
firstname varchar(20),
lastname varchar(20),
age varchar(20),
edu_level varchar(20),
state varchar(20)
);



create table crypto_t
(
ssn integer ,
cryptoname varchar(100),
cryptosymbol varchar(20),
buying_price float ,
current_price float,
no_of_coin_holding float,
foreign key (ssn) references userprofile_t(ssn)
);
create table stocks_t
(
ssn integer ,
stock_name varchar(255),
stock_symbol varchar(255),
share_quantity float,
purchase_price float,
selling_price float,
quantity_sold float,
foreign key (ssn) references userprofile_t(ssn)
);



create table realestate_t
(
ssn integer ,
yard_size_acers float,
yard_purchase_price float,
current_rate_yard_price float,
foreign key (ssn) references userprofile_t(ssn)
);



create table asset_summary_t
(
ssn integer ,
asset_name varchar(6),
profit_loss varchar(6),
foreign key(ssn) references userprofile_t(ssn)
);



create table commodities_t
(
ssn integer ,
commodity_name varchar(20),
quantity_kgs float,
purchase_rate float,
current_rate float,
foreign key(ssn) references userprofile_t(ssn)
);



create table collectables_t
(
ssn integer ,
collectable_name varchar(255),
collectable_category varchar(255),
purchased_item_value decimal(10,2),
value_current_rate float,
date_of_purchase date,
foreign key(ssn) references userprofile_t(ssn)
);



create table insurance_t
(
ssn integer ,
policy_id varchar(20),
policy_type varchar(20),
expiry_date date,
claim_value float,
premium_value float,
foreign key(ssn) references userprofile_t(ssn)
);



create table mutualfunds_t
(
ssn integer ,
mfund_name varchar(255),
mfund_returns float,
mfund_quantity float,
mfund_purchase_price float,
mfund_selling_price float null,
mfund_quantity_sold float null,
foreign key (ssn) references userprofile_t(ssn)
);



create table fixeddeposits_t
(
ssn integer,
bank_name varchar(255),
fd_percentage_returns float,
fd_deposit_date date,
fd_duration_years float,
fd_deposit_amount float,
fd_current_balance float,
foreign key (ssn) references userprofile_t(ssn)
);






create table personalsavings_t
(
ssn integer ,
purpose varchar(20),
deposit_date date,
deposit_amount float,
withdrawal_date date,
withdrawal_amount float,
foreign key (ssn) references userprofile_t(ssn)
);



create table incometax_t
(
ssn integer,
annual_income float(20),
state varchar(20),
city varchar(20),
tax_percentage float,
tax_amount float,
foreign key (ssn) references userprofile_t(ssn)
);

----------

insert into provident_fund_t values 
(789567,'2000-01-30',12),
(87658,'1999-01-20',17),
(87906,'2005-09-15',10),
(234567,'1970-12-12',38);


insert into userprofile_t(ssn,firstname,lastname,age,edu_level,state) values(
123,'Balakrisna','Nanadamuri',50,'Bachelors','Texas'),
(234,'Tarak','Nanadamuri',30,'Bachelors','California'),
(235,'mahesh Babu','Ghattamaneni',28,'Masters','New jersy'),
(456,'Chandrababu','Nara',70,'PHD','Kentucy');

insert into insurance_t(ssn,policy_id,policy_type,expiry_date,claim_value,premium_value) values
(123,56789,'Car insurance','2023-12-12',50000,1500),
(123,35798,'Health insurance','2022-12-03',100000,3500),
(123,35679,'Home insurance','2021-09-30',150000,5000),
(234,67788,'Car insurance','2025-12-12',5000,300),
(234,56778,'Health insurance','2024-12-31',4000,200),
(235,66667,'Health insurance','2022-03-31',35000,4000),
(456,76890,'Health insurance','2023-03-31',100000,10000),
(456,76890,'car insurance','2024-04-01',50000,4500);

insert into incometax_t values
(123,500000, 'Texas','Dallas',0,0),
(234,100000,'California','Seatlle',23,23000),
(235,180000,'New jersy','New jersy',10.5,18900),
(456,12000,'Kentucy','Louisville',5,600);

insert into mutualfunds_t values 
(123,'Marcus',16,500,50000,60000,10),
(123,'Fidelity',17.3,40,1000,2500,40),
(234,'NASDX',28,73,60000,NUll,null),
(234,'IRLNX',19.8,100,6700,5000,100),
(235,'IRLNX',10,108,9800,6000,52),
(456,'NUESX',17.3,90,9000,null,null);

insert into realestate_t(ssn, yard_size_acers, yard_purchase_price, current_rate_yard_price) values
 (123, 6, 55000, 60000), 
 (123, 3, 40050, 80050),
 
 (234, 7, 65000, 50000),
 (234, 1, 30000, 66000),
 
(235, 8, 80500, 70500),

(456, 9, 86000, 91000),
(456, 1, 30000, 35000);

insert into stocks_t (ssn, stock_name, stock_symbol, share_quantity, purchase_price, selling_price, quantity_sold) values
(123, 'GUCCI', 'GC', 1050, 10000, 20000, 50),
(123, 'AIRTEL', 'AT', 1003, 5000, 4000, 60),
(123, 'TESLA',  'T', 1001,  6000, 8000, 70),
(123, 'APPLE','AAPL', 1500, 1300, 1400, 80),

(234, 'Agilent Technologies', 'A', 1150, 10500, 90000, 58),
(234, 'Alcoa Corp', 'AA', 1503, 5800, 7600, 66),
(234, 'Bank of America Corp', 'BAC', 1071,  6800, 3000, 79),
(234, 'Chubb Ltd','CB', 1800, 17000, 11600, 81),

(235, 'Center Coast MLP & Infrastructure', 'CEN', 1140, 21600, 20000, 78),
(235, '	Delta Air Lines Inc', 'DAL', 1563, 5100, 7100, 36),
(235, 'Globant S.A.',  'GLOB', 1671,  9000, 8000, 49),
(235, 'Gxo Logistics Inc','GXO', 1900, 11000, 11600, 31),

(456, 'Gabelli Equity Trust Inc ', 'GAB', 1340, 12600, 12000, 78),
(456, '	G&P Acquisition Corp', 'GAP', 1463, 6100, 4000, 36),
(456, 'Generation Asia I Acquisition', 'GAQ', 1271,  12000, 11000, 49),
(456, 'Godaddy Inc','GADDY', 1600, 1000, 1100, 31);

insert into collectables_t(ssn, collectable_name, collectable_category, purchased_item_value, value_current_rate, date_of_purchase) values 
(123,'Vintage Dodge Charger','Car',30000,990000,'2002-11-29'),
(234,'Newyork Stamp','Stamp',2000,15000,'2015-11-14'),
(235,'1930 cent','Coin',10,164723,'1997-06-12'),
(456,' 1947 Jeep','Car',2000,70000,'2006-06-06'),
(234,'India Stamp','Stamp',3000,55000,'2019-01-14'),
(123,'Vintage Limousine','Car',50000,1890000,'2000-10-22');

insert into commodities_t(ssn, commodity_name, quantity_kgs, purchase_rate, current_rate) values 
(123,'Gold',2,90000,120000),
(123,'Silver',100,60000,200000),
(234,'Silver',10,5000,100000),
(235,'Natural Gas',660,300000,720000),
(456,'Wheat', 500,3900,7000),
(235,'Diamonds',0.003,2300000,6720000);

insert into crypto_t(ssn, cryptoname, cryptosymbol, buying_price, current_price, no_of_coin_holding) values 
(123,'Bitcoin','BTC',12000,16483,2.3),
(123,'Ethereum','ETH',800,1198,80),
(123,'Tether','USDT','0.2','1',179893146),
(234,'Ethereum','ETH',800,1198,35.8),
(235,'Bitcoin','BTC',12000,16483,6),
(235,'Tether','USDT','0.2','1',79543146),
(456,'Dogecoin','DOGE','0.092','0.12',76834366875),
(235,'Dogecoin','DOGE','0.092','0.12',87666875),
(456,'Polygon','MATIC','0.8452','0.6720',9934366875);

insert into personalsavings_t(ssn, purpose, deposit_date, deposit_amount, withdrawal_date, withdrawal_amount) values 
(123,'Marriage','2002-11-29',97000,Null,Null),
(123,'Personal',Null,Null,'2011-12-04','30000'),
(123,'Education','2008-02-03',100000,Null,Null),
(235,'Tour','2018-02-03',67000,Null,Null),
(456,'House construction','2017-02-04',7700000,Null,Null),
(235,'Car',Null,Null,'2021-06-12',50000),
(456,'Leisure',Null,Null,'2020-03-02',30000),
(456,'Children Education','2022-01-01',600000,Null,Null);

insert into fixeddeposits_t ( ssn,bank_name, fd_percentage_returns, fd_deposit_date, fd_duration_years, fd_deposit_amount, fd_current_balance) values
(123,'Chase', 26, '2019-06-06', 10, 51000, 110000),
(123,'B0FA', 31, '2016-05-05', 16, 21000, 46000),
(234,'Discover', 51, '2011-01-01',11, 31600, 15000),
(456,'CITI', 33, '2013-03-09',12, 13000, 26000),
(234,'TRUIST', 41, '2001-07-09',16, 11000, 23000),
(456,'UNITED', 46, '2021-01-09',21, 12300, 45600),
(123,'COMMUNITY', 51, '2023-03-03',11, 23000, 46000),
(234,'AMEX', 61, '2026-06-09', 18,1000, 2000),
(456,'WaFd', 31, '2023-06-03', 14,12360, 24169);

select * from crypto_t;
select * from incometax_t;
select * from personalsavings_t;


						########################## Queries ##########################
                        
select * from userprofile_t where age>50 and state='Kentucy';
#This gives us the users from the state kentucy and age more than 50.

-- ---------------------------------------------------------------------------------------------------------------------------------------

select u.ssn,concat(u.firstname," ",u.lastname) as username, round(sum((current_price-buying_price)*no_of_coin_holding)) as profit from crypto_t c join userprofile_t u on u.ssn=c.ssn  group by ssn order by profit;
#This gives us the total profit for each user across all his crypto holdings from crypto table.

-- ---------------------------------------------------------------------------------------------------------------------------------------

select * from incometax_t;
update personalsavings_t set withdrawal_amount=0 where withdrawal_amount is null;
update personalsavings_t set deposit_amount=0 where deposit_amount is null;
#This helps in making null values equal to zero, because if there is no deposit and withdrawl then that means zero in that particular record. 
select ssn,sum(deposit_amount-withdrawal_amount) as total_savings from personalsavings_t where ssn in ( select ssn from incometax_t where tax_percentage>4) group by ssn;
# This gives us the savings of the people who pay taxes.

-- ---------------------------------------------------------------------------------------------------------------------------------------
#join
select r.ssn,sum((r.current_rate_yard_price-r.yard_purchase_price)*r.yard_size_acers) as realestateprofit,
sum((m.mfund_selling_price-m.mfund_purchase_price)*m.mfund_quantity_sold) as mututalfundsprofit,
sum((s.selling_price-s.purchase_price)*s.quantity_sold) as stocksprofit
from realestate_t r 
join mutualfunds_t m on r.ssn=m.ssn
join stocks_t s on r.ssn=s.ssn
group by ssn;
#This gives profit and loss across realestate, mutualfunds and stocks for 4 users.
-- ---------------------------------------------------------------------------------------------------------------------------------------
#view
create or replace view carcollectibles
as select * from collectables_t where collectable_category='Car' order by ssn;
select * from carcollectibles; #view name
#This creates a view which shows us the list of people who have car in their collectables.

-- ---------------------------------------------------------------------------------------------------------------------------------------

select * from insurance_t;
select ssn, sum(premium_value) as total_premium,sum(claim_value) as total_claim from insurance_t group by ssn having total_premium>1000 and total_claim<50000;
# This gives us the users who pay total premimum more than 1000 and total claim less than 50000.

-- ---------------------------------------------------------------------------------------------------------------------------------------

SELECT ssn,sum((current_price-buying_price)*no_of_coin_holding) as crypto_profit from crypto_t group by ssn having crypto_profit>1000000
union
SELECT ssn,sum((selling_price-purchase_price)*quantity_sold) as stocks_profit from stocks_t group by ssn having stocks_profit>1000000;

#This gives us the users who have profit more than a million from either crypto or stocks.

-- ---------------------------------------------------------------------------------------------------------------------------------------

select * from stocks_t where stock_name like 'G%' order by selling_price limit 5;

						########################## functions ##########################

#function to categorize assets based on their profits

drop function if exists categorize_assets;
delimiter $$
create function categorize_assets(profit decimal(10,2)) returns varchar(50)
deterministic
Begin
	Declare user_level varchar(20) ;
    If profit > 70 then
		Set user_level = 'High returns';
	elseif (profit <= 70 and profit > 30) then
		set user_level = 'Medium returns';
	elseif (profit <=30 and profit>0) then
		set user_level = 'Low returns';
	else 
    set user_level="Loss";
	End if;
    return (user_level);
END $$


select ssn,categorize_assets(c.stocks_profit) from (
SELECT ssn,(sum((selling_price-purchase_price)*quantity_sold)*100/sum(purchase_price)) as stocks_profit from stocks_t group by ssn) c;



						########################## procedures ##########################
#stored procedure for profits/loss for a certain users across all assets.

drop procedure if exists getprofits;

delimiter $$
create procedure getprofits(in ssn_in int)
begin
select sum((s.selling_price-s.purchase_price)*s.quantity_sold) as profit_stocks, sum((c.current_price-c.buying_price)*c.no_of_coin_holding) as crypto_profits,c.ssn from stocks_t s 
join crypto_t c on c.ssn=s.ssn
join realestate_t r on c.ssn=r.ssn
join mutualfunds_t m on m.ssn=r.ssn
where c.ssn=ssn_in GROUP by c.ssn;
end$$
delimiter ;
call getprofits(234);

-- ---------------------------------------------------------------------------------------------------------------------------------------
#stored procedure for mfund asset performance

drop procedure if exists mfund_assetperformance;
delimiter $$
create procedure mfund_assetperformance(in ssn_in int)
begin
select ssn,categorize_assets(m.profit_percentage) 
from (select ssn,(sum(mfund_quantity*(mfund_selling_price-mfund_purchase_price))*100/sum(mfund_purchase_price)) as profit_percentage from mutualfunds_t group by ssn) m where ssn=ssn_in;
end $$
delimiter ;

call mfund_assetperformance(234);
-- ---------------------------------------------------------------------------------------------------------------------------------------
# stored procedure to calculate total investments in crypto at any given time

drop procedure if exists crypto_calculator;
delimiter $$
create procedure crypto_calculator()
begin
select round(sum(buying_price*no_of_coin_holding)) as total_crypto_holdings ,ssn from crypto_t group by ssn;
end $$

call crypto_calculator;

-- ---------------------------------------------------------------------------------------------------------------------------------------



-- ---------------------------------------------------------------------------------------------------------------------------------------


						########################## triggers ##########################
                        
#pre delete trigger on users_t
drop table if exists users_audit;


create table users_audit(
id INT auto_increment primary key,
ssn INT not null,
firstname varchar(50) not null,
lastname varchar(50) Not null,
educ_level varchar(10) not null,
changedate datetime default null,
action varchar(50) default null);


drop trigger if exists beforeuserdelete;
create trigger beforeuserdelete
before delete on userprofile_t
for each row
insert into users_audit
set action="delete",
ssn=old.ssn,
firstname=old.firstname,
lastname=old.lastname,
educ_level=old.edu_level,
changedate=now();
-- ---------------------------------------------------------------------------------------------------------------------------------------
#post update trigger for stocks_t

drop table if exists stocks_audit;
create table stocks_audit(
id INT auto_increment primary key,
ssn INT not null,
stock_name varchar(50) not null,
stock_symbol varchar(50) Not null,
share_quantity decimal(10,2) not null,
changedate datetime default null,
action varchar(50) default null);


drop trigger if exists afterstocksupdate;
create trigger afterstocksupdate
after update on stocks_t
for each row
insert into stocks_audit
set action="update",
ssn=new.ssn,
stock_name=new.stock_name,
stock_sybmbol=new.stock_symbol,
share_quantity=new.share_quantity,
changedate=now();

-- ---------------------------------------------------------------------------------------------------------------------------------------
#pre update trigger on incometax_audit

drop table if exists incometax_audit;
create table incometax_audit(
id INT auto_increment primary key,
ssn INT not null,
annual_income varchar(50) not null,
tax_percentage varchar(50) Not null,
tax_amount decimal(10,2) not null,
changedate datetime default null,
action varchar(50) default null);

drop trigger if exists beforeincometax;
create trigger beforeincometax
before update on incometax_t
for each row
insert into incometax_audit
set action="update",
ssn=old.ssn,
annual_income=old.annual_income,
tax_percentage=old.tax_percentage,
tax_amout=old.tax_amount,
changedate=now();

show triggers;


 

