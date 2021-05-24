# Arquivo SQL contendo pelo menos 5 consultas contemplando cada condição

# Consulta contemplando contagem ou totalização:
# Situação 1: Quantidade total de itens em estoque
select sum(qtdEstoque) as StockItems from products;
# Situação 2: Quantidade total de itens em destaque
select count(destaque) as HighlightItems from products
where destaque = 1;

# Consulta contemplando a junção entre 2 tabelas:
# Situação: Listar todos os pedidos não finalizados, contemplando data de realização, atual status e os principais dados de contato do cliente responsável (nome, cpf e email)
select requests.id, clientes.nome, clientes.email, requests.data, request_status.name as statusdopedido from requests
inner join request_status on requests.statusid = request_status.id
inner join clientes on requests.customerid = customerid
where requests.statusid != 8;

# Consulta contemplando a junção entre 3 tabelas:
# Situação: Mostrar todos os pedidos do cliente 'Michelline', o item da compra e o valor total
select customers.name, products.descricao, requests_products.totalvalue from requests
inner join customers on requests.customerid = customers.id
inner join requests_products on requests.id = requests_products.requestid
inner join products on requests_products.requestid = products.id
where customerid = 2;

# Consulta contemplando a junção entre 2 tabelas + uma operação de totalização e agrupamento:
# Situação: Listar todos os produtos vendidos, mostrando nome, departamento e preço individual. Listar quantas vezes eles foram vendidos, e o valor total de vendas de cada produto
select departaments.name as departament, products.descricao as product, products.preco, count(requests_products.productid) as quantsales, sum(products.preco) as salestotal from requests_products
inner join products on requests_products.productid = product.id
inner join departaments on products.deptid = departaments.id
group by products.id;

# Consulta contemplando a junção entre 3 ou mais tabelas + uma operação de totalização e agrupamento:
# Situação: Listar por nome todos os clientes que realizaram pedidos, mostrar seu endereço e o valor total do pedido
select customers.name, adresses_type.name as adressestype, adresses.logradourotype, 
adresses.logradouro, adresses.number, adresses.complement, adresses.district, adresses.cep, cities.city, 
sum(requests_products.totalvalue) as totalrequestvalue from adresses_customer

inner join customers on customers.id = adresses_customer.customerid
inner join adresses on adresses.id = adresses_customer.adressesid
inner join adresses_type on adresses_type.id = adresses.adressestypeid
inner join cities on cities.id = adresses.cityid
inner join requests on adresses_customer.customerid = requests.customerid
inner join requests_products on requests.id = requests_products.requestid
inner join products on requests_products.productid = products.id
group by requests.id