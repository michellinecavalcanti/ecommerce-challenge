const products = require("./products.json");

function StockItems() {
    let numStockItems = 0
    for (let i = 0; i < product.length; i++){
        numStockItems = numStockItems + product[i].qtdEstoque
    }
    console.log(`Quantidade total de itens em estoque: ${numStockItems}`)
}
StockItems()

function HighlightItems() {
    let numHighlightItems = 0
    for(let i = 0; i < product.length; i++){
        if(product[i].emDestaque === "sim"){
            numHighlightItems = numHighlightItems + product[i].qtdEstoque
        }
    }
    console.log(`Quantidade total de itens em destaque: ${numHighlightItems}`)
}
HighlightItems()

function AvailableItems() {
    let numAvailableItems = 0
    for(let i = 0; i < product.length; i++){
        if(product[i].disponivel === "sim"){
            numAvailableItems = numAvailableItems + product[i].qtdEstoque
        }
    }
    console.log(`Quantidade total de itens disponíveis: ${numAvailableItems}`)
}
AvailableItems()

function totalInventory() {
    let Inventory = 0
    for(let i = 0; i < product.length; i++){
        Inventory = Inventory + (product[i].preco * product[i].qtdEstoque)
    }
    console.log(`Valor total do inventário da empresa: ${Inventory}`)
}
totalInventory()

// Somatória de itens por departamento
function totalItemsDepartment(idDept) {
    let ItemsDepartment = 0
    let nameDepartment = '';
    for(let i = 0; i < product.length; i++){
        if(idDept === product[i].departament.idDept){
            nameDepartment = product[i].departament.nameDept
            ItemsDepartment = ItemsDepartment + product[i].qtdEstoque
        }
    }
    console.log({nameDepartment, ItemsDepartment})    
}
totalItemsDepartment()

function totalInventoryDepartment(idDept) {
    let nameDepartment = '';
    let InventoryDepartment = 0
    for(let i = 0; i < product.length; i++){
        if(idDept === product[i].departament.idDept){
            nameDepartment = product[i].departament.nameDept
            InventoryDepartment = InventoryDepartment + (product[i].preco * product[i].qtdEstoque)
        }
    }
    console.log(`Valor total do inventário por departamento: ${nameDepartment}: ${InventoryDepartment}`)
}
totalInventoryDepartment()

function AverageTicket() {
    let Inventory = 0
    let numStockItems = 0
    let Average = 0
    for(let i = 0; i < product.length; i++){
        Inventory = Inventory + (product[i].preco * product[i].qtdEstoque)
        numStockItems = numStockItems + product[i].qtdEstoque
    }
    Average = (Inventory / numStockItems)
    console.log(`Valor do ticket médio dos produtos da empresa: ${Average}`)
}
AverageTicket()

// Valor do ticket médio dos produtos por departamento
function AverageTicketDepartment(idDept) {
    let Inventory = 0
    let numStockItems = 0
    let ticket = 0
    let nameDepartment = ''
    for(let i = 0; i < product.length; i++){
        if(idDept === product[i].departament.idDept){
            nameDepartment = product[i].departament.nameDept
            Inventory = Inventory + (product[i].preco * product[i].qtdEstoque)
            numStockItems = numStockItems + product[i].qtdEstoque
        }
    }
    ticket = (Inventory / numStockItems)
    console.log({nameDepartment, ticket})
}
AverageTicketDepartment()

function ValuableDepartment(idDept) {
    let nameDepartment = '';
    let ValuableDepartment = 0
    for(let i = 0; i < product.length; i++){
        if(idDept === product[i].departament.idDept){
            nameDepartment = product[i].departament.nameDept
            ValuableDepartment = ValuableDepartment + (product[i].preco * product[i].qtdEstoque)
        }
    }
    console.log(`O departamento mais valioso é: ${nameDepartment}: ${ValuableDepartment}`)
}
ValuableDepartment()

function ExpensiveProduct() {
    let comparation = product[0].preco
    let nameDepartment = ''
    let nameProduct = ''
    for(let i = 0; i < product.length; i++){
        if (comparation < product[i].preco){
            comparation = product[i].preco
            nameDepartment = product[i].departament.nameDept
            nameProduct = product[i].descricao
        }
    }
    console.log(`O produto mais caro da loja é: ${nameProduct}. Departamento: ${nameDepartment}`)
}
ExpensiveProduct()

function CheapProduct() {
    let comparation = product[0].preco
    let nameDepartment =''
    let nameProduct = ''
    for(let i = 0; i < product.length; i++){
        if (comparation > product[i].preco){
            comparation = product[i].preco
            nameDepartment = product[i].departament.nameDept
            nameProduct = product[i].descricao
        }
    }
    console.log(`O produto mais barato da loja é: ${nameProduct}. Departamento: ${nameDepartment}`)
}
CheapProduct()
