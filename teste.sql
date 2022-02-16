##1 Tabela que contenha o id, país e estado de todos os clientes.
select distinct
    id,
    country,
    state
from `psychic-cascade-340311.e_commerce.customers`
order by id asc;

##2 Preços distintos dos produtos, mas ordenados de forma decrescente
select
    id as id_product,
    name,
    price
from `psychic-cascade-340311.e_commerce.products`
order by id desc

##3 Retornar a data (ANO-MÊS-DIA) de criação dos primeiros 5 registros da tabela customers
select 
    id,
    first_name,
    date(created_at) as dia
from `psychic-cascade-340311.e_commerce.customers`
order by dia asc 
limit 5

##4 E-mail de todos os clientes que moram no Piauí



