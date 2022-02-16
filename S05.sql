##1 Tabela que contenha o id, país e estado de todos os clientes
select distinct
    id,
    country,
    state
from `psychic-cascade-340311.e_commerce.customers`
order by id asc;

##2 Selecione os preços distintos de nossos produtos, mas ordenados de forma decrescente
select
    id as id_product,
    name,
    price
from `psychic-cascade-340311.e_commerce.products`
order by id desc

##3 Retorne a data (ANO-MÊS-DIA) de criação dos primeiros 5 registros da tabela customers.
select 
    id,
    first_name,
    date(created_at) as dia
from `psychic-cascade-340311.e_commerce.customers`
order by dia asc 
limit 5

##4 E-mail de todos os clientes que moram na Bahia
select
    concat(first_name, " ", last_name) as customer_name,
    email
from `psychic-cascade-340311.e_commerce.customers`
where state in ("Bahia")
    and email is not null
order by email asc;

##5 Ir até a tabela items e retornar o campo ‘total_price’ de forma distinta utilizando o GROUP BY
select
    product_id,
    sum(total_price) as total_order_price
from `psychic-cascade-340311.e_commerce.items`
group by 1;

##6 Selecionar todos os pedidos em que o status é cancelado OU entrega_pendente
## Retornar também o mesmo resultado, mas utilizando o operador IN.
select 
    *
from `psychic-cascade-340311.e_commerce.orders`
#where status like "cancelado" or status like "entrega_pendente";
where status in ("cancelado", "entrega_pendente");

##7 Retornar todos os registros em que o campo ‘additionals’ é nulo na tabela customers
select 
    *
from `psychic-cascade-340311.e_commerce.customers`
where additionals is null;

##8 Join para trazer a informação de status do pedido juntamente das informações (colunas) da tabela de itens
select 
    i.*,
    o.status as order_status
from `psychic-cascade-340311.e_commerce.items` as i
join `psychic-cascade-340311.e_commerce.orders` as o on i.order_id = o.id;

##9 Na tabela de pedidos, além das colunas existentes, adicionar informações de nome do cliente e seu telefone.
select
    o.*,
    concat(info.first_name, " ", info.last_name) as customer_name,
    info.cell_phone
from `psychic-cascade-340311.e_commerce.orders` as o
join `psychic-cascade-340311.e_commerce.customers` as info on o.customer_id = info.id;

##10 DESAFIO: Pesquise sobre o comando like e retorne os nomes dos produtos que tenham somente 4 caracteres
select 
    p.*,
    c.name as category_name
from `psychic-cascade-340311.e_commerce.products` as p
join `psychic-cascade-340311.e_commerce.categories` as c on p.category_id = c.id
where p.name like "____"
