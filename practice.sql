SELECT * FROM demo.`shipment new`;

select * from `shipment new` n
where n.date between '2023-01-01' and '2023-01-31';


select * from `shipment new` n
where n.`sales person` in ("sp15", "sp14", "sp06", "sp02") and n.product = 'p02' and n.date between '2023-01-01' and '2023-01-31' and n.amount between '100' and '3000'
order by n.`sales person` desc ;


select * from products p
where p.Product like '%chips%';

select * from people m
where m. `Sales Person` like 's%' and m.Location = 'Hyderabad';


select n.date, n.amount, n.boxes, round(n.amount/n.boxes,1) as 'amount per boxe' from `shipment new` n
where n.date between '2023-02-01' and '2023-02-28';
