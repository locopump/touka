-- general
select * from areas;
select * from counts;
select * from tenants;
select * from ss_tenants;
select * from sales;
--querys
-- total ventas por modulo de ventas
select
    ss_tenant_name,
    sum(num_sales) monto_total,
    sum(num_transactions) total_ventas
from sales
group by ss_tenant_name
;
-- total ventas por fecha
select
    date(s.date) fecha,
    sum(s.num_sales) monto_total,
    sum(s.num_transactions) total_ventas
from sales s
group by date(s.date)
;
select * from tenants; -- tenant_id
select * from ss_tenants; -- fk
select * from areas; -- fk
--querys
-- marcas x categoria
select category,
       count(*)
from tenants
group by category;

select * from venues;
select * from areas;
select * from sales;
select * from ss_tenants;
select *from visits;
--querys
-- areas detallado
select
       a.id,
       t.brand marca_locatario,
       v.name centro_comercial,
       a.m2,
       a.floor_num nro_piso,
--        a.tenant_id,
--        a.venue_id,
       a.group_id
from areas a
         left join venues v on a.venue_id = v.id
         left join tenants t on a.tenant_id = t.id
;

select * from areas;
select * from counts;
select * from ss_tenants;
--querys
-- nro de areas por grupo de area
select
    group_id,
    count(id) areas
from areas
group by group_id
;
-- ingresos y transito por fecha
select date(c.date),
       sum(c.num_ingress),
       sum(c.num_transit)
from counts c
group by date(c.date)
;
select * from counts



select * from visits;
select * from visitors;
select * from likes;
--querys
-- likes x email
select
    email,
    count(*) marcas_con_like
from likes
group by email
;
-- nro Visitas x Genero
select
    gender,
    count(*)
from visitors
group by gender
;
-- nro de likes x genero
select
    v.gender,
    count(l.*)
from likes l
right join visitors v on l.email = v.email
group by v.gender
;


select * from tenants;
select * from likes;
select * from pages;
-- -- querys
-- select
--        t.brand,
--        p.clean_name,
--        count(l.clean_name)
-- from tenants t
-- left join pages p on t.brand = p.brand
-- inner join likes l on p.clean_name = l.clean_name
-- group by t.brand, p.clean_name
-- ;
-- likes x locatario
select
    t.id,
    count(l.*)
from tenants t
inner join pages p on t.brand = p.brand
inner join likes l on p.clean_name = l.clean_name
group by t.id
order by t.id asc
;
-- likes por marca
select
    p.brand, -- tenant
    count(l.clean_name)
from pages p
inner join likes l on p.clean_name = l.clean_name
group by p.brand
order by p.brand asc
;
-- -- likes por pagina
-- select
--     l.clean_name,
--     count(*)
-- from likes l
-- group by l.clean_name
-- ;
