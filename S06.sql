##1 Retornar os valores de média, máximo, mínimo, contagem e soma do campo ‘total_price’ da tabela items
select
    round(avg(total_price), 2) as media_total_price,
    max(total_price) as max_total_price,
    min(total_price) as min_total_price,
    count(total_price) as count_total_price,
    sum(total_price) as sum_total_price
from `psychic-cascade-340311.e_commerce.items`;

##2 Retornar a qtde de pedidos de cada status por dia, ordenando pelo dia, de forma decrescente
select
    count(id) as numero_pedidos,
    status,
    format_timestamp("%Y-%m-%d", created_at) as dia
from `psychic-cascade-340311.e_commerce.orders`
group by status, dia
order by dia desc;

##3 Retorne a quantidade total de itens por pedido.
select 
    count(quantity) as total_quantity_items,
    order_id
from `psychic-cascade-340311.e_commerce.items`
group by order_id;

##4 Na base de dados ‘covid19_italy’ (bigquery-public-data) e tabela ‘data_by_region’ encontre a coluna
##‘tests_performed’. Retorne a soma de testes realizados por dia (considerando todas as regiões)
select 
    date(date) as dia,
    sum(tests_performed) as testes_realizados,
from `bigquery-public-data.covid19_italy.data_by_region`
group by dia
order by dia desc;


select 
    date(date) as dia,
    sum(tests_performed) as testes_realizados,
    sum(total_confirmed_cases) as total_casos_confirmados,
    round(((sum(total_confirmed_cases) / sum(tests_performed)) * 100), 2) as porcentagem
from `bigquery-public-data.covid19_italy.data_by_region`
group by dia
order by dia desc;

##5 DESAFIO: Retornar a diferença da soma de recuperados (coluna recovered) com
##a soma de mortes (coluna deaths) por dia, apenas para a região Toscana
select 
    region_name,
    date(date) as dia,
    recovered,
    deaths,
    sum(recovered) - sum(deaths) as difference_recovered_death
from `bigquery-public-data.covid19_italy.data_by_region`
where region_name = "Toscana"
group by region_name, dia, recovered, deaths
order by dia desc;
