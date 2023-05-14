-- membuat tabel shipping_summary
create table shipping_summary
(
	shipping_date date,
	seller_name character varying(255),
	buyer_name character varying(255),
	buyer_address character varying(255),
	buyer_city character varying(255),
	buyer_zipcode character varying(255),
	kode_resi character varying(255)
)

-- resi = concat(shipping id - purchase date - shipping date - buyer id - seller id
select concat(a.shipping_id, '-', to_char(a.purchase_date, 'YYYYMMDD'), '-', 
			  to_char(a.shipping_date, 'YYYYMMDD'), '-', a.buyer_id, '-', a.seller_id) resi 
from shipping_table a

-- memasukkan value ke dalam table shipping_summary
insert into shipping_summary (shipping_date, seller_name, buyer_name, buyer_address, buyer_city, buyer_zipcode, kode_resi)
select a.shipping_date, s.seller_name, b.buyer_name, b.address, b.city, b.zipcode,
(select concat(a.shipping_id, '-', to_char(a.purchase_date, 'YYYYMMDD'), '-', 
			  to_char(a.shipping_date, 'YYYYMMDD'), '-', a.buyer_id, '-', a.seller_id) resi) 
from shipping_table a
left join buyer_table b
on a.buyer_id = b.buyer_id
left join seller_table s
on a.seller_id = s.seller_id

select * from shipping_summary