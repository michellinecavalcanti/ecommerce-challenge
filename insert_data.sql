# Arquivo SQL com os scripts de inserção de dados, respeitando as restrições de chaves estrangeiras

# Departamentos 
INSERT INTO departamentos (nome)
VALUES ('Informática e Acessórios'), ('Ferramentas'), ('Eletrônicos');

# Produtos
INSERT INTO produtos (descricao, preco, qtdEstoque, disponivel, destaque, deptid)
VALUES ('Notebook Samsung, Intel Core i7 10510U, 16GB, 1TB + 128GB SSD, Tela de 15,6', '5.400', '10', '1', '1', '1'), 
('CADEADO SEGURANCA PARA NOTEBOOK HLD F\u0026K LLAVE', '6.5', '2', '1', '0', '2'),
('PC Gamer Completo Intel Core i7, Geforce GTX 1650 4GB, 8GB, Monitor 21.5 Full HD, HD 1TB', '5.800', '5', '1', '1', '3'),
('ANTENA P/TV DIGITAL KOLKE KVV288 INTERNA VHF/UHF/FHD PRETO', '9.0', '6', '1', '1', '4');

# Clientes
INSERT INTO clientes (nome, email, whatsapp, senha)
VALUES ('Michelline Cavalcanti', 'michelline@gmail.com', '(81)99999-9995', 'senha123'),
('Amanda Cruz', 'amandacruz@gmail.com', '(11)99999-9996', 'senha1234'),
('Marcela Figueredo', 'marcelafigueredo@gmail.com', '(11)99999-9997', 'senha12345'),
('Lucas Santos', 'lucassantos@gmail.com', '(81)99999-9998', 'senha123456');

# Cidades
INSERT INTO cidades (cidade, estado)
VALUES ('Recife', 'Pernambuco'), ('São Paulo', 'São Paulo'), ('Porto Alegre', 'Rio Grande do Sul');

# Tipos de Endereços
INSERT INTO tipo_enderecos (nome)
VALUES ('Residencial'), ('Comercial'), ('Presente');

# Endereços
INSERT INTO enderecos (tipoenderecoid, tipologradouro, logradouro, numero, complemento, bairro, cep, cidadeid)
VALUES ('1', 'Rua', 'Campo Grande', '5895', 'Apt 202', 'Candeias','01234567', '2'),
('2', 'Avenida', ' Boturussu', '146', 'Apt 305', 'Ermelino Matarazzo', '01234000', '2'),
('1', 'Rua', 'Antonio Luiz', '456', 'Apt 77', 'Penha', '77767290', '1'),
('1', 'Rua', 'Miguel Rachid', '230', 'Bloco B Apt 22', 'Ermelino Matarazzo','03808120', '3'),
('1', 'Rua', 'Augusto Lins', '66', 'Apt 99', 'Centro','03808130', '3');

# Conexão entre Clientes e Endereços
INSERT INTO cliente_enderecos(clienteid, enderecoid)
VALUES ('1', '2'), ('1', '4'), ('2', '1'), ('3', '3'), ('4', '5');

# Status do Pedido 
INSERT INTO status_pedido(nome)
VALUES ('Novo Pedido'), ('Aguardando Pagamento'),  ('Pagamento Autorizado'),  ('Em Separação'),
('Em Transporte'), ('Entregue'), ('Pagamento Negado'), ('Cancelado');

# Pedidos
INSERT INTO pedidos (data, clienteid, statusid)
VALUES ('2021-09-11',  '1', '3'), ('2021-03-08',  '4', '3'), ('2021-08-21', '2', '3'), 
('2021-02-18',  '3', '8');

# Produtos em Pedido
INSERT INTO pedidos_produtos (pedidoid, produtoid, valorindividual, quantidade, valortotal)
VALUES ('1', '4', '87', '1', (quantidade * valorindividual)), ('2', '4', '87', '1', (quantidade * valorindividual)), 
('3', '3', '41', '1', (quantidade * valorindividual)), ('4', '1', '5', '1', (quantidade * valorindividual))