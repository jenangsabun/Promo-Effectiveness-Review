--query membuat tabel baru
create table promo_code
(
	promo_id int,
	promo_name varchar(255),
	price_deduction int,
	description varchar(255),
	duration int,
	constraint promo_code_pkey primary key (promo_id)
);

--query untuk mengetahui purchase_date, harga, dan promo yang berlaku
(
	select a.purchase_date, a.quantity, b.price, a.promo_id, 
	coalesce(c.price_deduction, 0) as discount
	from sales_table a
	left join marketplace_table b
		on a.item_id = b.item_id
	left join promo_code c
		on a.promo_id = c.promo_id
)

--query tabel q3_q4_review
insert into Q3_Q4_Review (purchase_date, total_price, promo_code, sales_after_promo)
select a.purchase_date, (a.quantity * b.price), coalesce(a.promo_id,0), ((a.quantity * b.price) - coalesce(c.price_deduction,0))
from (
	select a.item_id, a.quantity, a.promo_id,
	a.purchase_date, case when c.promo_name is null
		then 'TANPA PROMO' else c.promo_name end promo_name,
	(a.quantity * b.price) total_price,
	(a.quantity * b.price) - coalesce(c.price_deduction,0) sales_after_promo
	from sales_table a
	left join marketplace_table b
		on a.item_id = b.item_id
	left join promo_code c
		on a.promo_id = c.promo_id 
) a
left join marketplace_table b
	on a.item_id = b.item_id
left join promo_code c
	on a.promo_id = c.promo_id
where purchase_date between '2022-07-01' and '2022-12-31'
group by purchase_date, c.promo_name, quantity, price, a.promo_id, c.price_deduction
order by purchase_date
select * from q3_q4_review

--query untuk melihat total sales dan nett sales periode q3-q4
select purchase_date, promo_name, count(promo_name) total_transaksi, 
	sum(total_price) total_sales_per_campaign,
	sum(nett_sales) nett_sales_campaign
from (
	select a.purchase_date, case when c.promo_name is null
		then 'TANPA PROMO' else c.promo_name end promo_name,
	(a.quantity * b.price) total_price,
	(a.quantity * b.price) - coalesce(c.price_deduction,0) nett_sales
	from sales_table a
	left join marketplace_table b
		on a.item_id = b.item_id
	left join promo_code c
		on a.promo_id = c.promo_id
) x
where purchase_date between '2022-07-01' and '2022-12-31'
group by purchase_date, promo_name
order by purchase_date