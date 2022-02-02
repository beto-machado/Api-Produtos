# Api Produtos

### Funcionalidadess:
1. Paginação api de produtos com o valor padrão de 20 itens por página.

2. Ordenar por nome (crescente).

3. Filtrar por nome e preço.

### Lista de Produtos
```
GET /products
```

```json
// response body, status: 200
[
  {
    "id": 1,
    "name": "Product test",
    "description": "Description of product test",
    "price": "10.99",
    "quantity": 50,
    "created_at": "2021-07-05T23:13:17.383Z",
    "created_at": "2021-07-05T23:13:17.383Z"
  }
]
```

### Detalhes do Produto
```
GET /products/:id
```

```json
// response body, status: 200
{
  "id": 1,
  "name": "Product test",
  "description": "Description of product test",
  "price": "10.99",
  "quantity": 50,
}
```

```json
// response body, status: 404
{
  "errors": ["Couldn't find Product with 'id'=22"]
}
```

### Criar um Produto
```
POST /products
```

```json
// request body
{
  "name": "Product test",
  "description": "Description of product test",
  "price": "10.99",
  "quantity": 50,
}
```

```json
// response body, status: 201
{
  "id": 1,
  "name": "Product test",
  "description": "Description of product test",
  "price": "10.99",
  "quantity": 50,
  "created_at": "2021-07-05T23:13:17.383Z",
  "created_at": "2021-07-05T23:13:17.383Z"
}
```

```json
// response body, status: 422
{
  "errors": ["Name has already been taken"]
}
```

### Atualizar um Produto
```
PUT/PATCH /products
```

```json
// request body
{
  "description": "NEW Description of product test",
}
```

```json
// response body, status: 201
{
  "id": 1,
  "name": "Product test",
  "description": "NEW Description of product test",
  "price": "10.99",
  "quantity": 50,
  "created_at": "2021-07-05T23:13:17.383Z",
  "created_at": "2021-07-05T23:13:17.383Z"
}
```

```json
// response body, status: 422
{
  "errors": ["Description can't be blank"]
}
```

### Deletar um Produto

```
DELETE /products/:id
```

```json
// response body, status: 204
null
```

```json
// response body, status: 404
{
  "errors": ["Couldn't find Product with 'id'=22"]
}
```

## Rodando o projeto:

Requisitos:
  - Ruby 3.0.2
  - Rails 6.1.4
  - Postgresql

Comandos:

```bash
git clone https://github.com/beto-machado/Api-Produtos.git
```

```bash
bundle install
```

```bash
rails db:create db:migrate db:seed && RAILS_ENV=test rails db:migrate
```

Rodando os testes:
```bash
rspec -f doc
```

