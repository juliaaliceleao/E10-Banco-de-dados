# Banco de Dados: Sistema Bancário

Um grande banco brasileiro requisitou a sua equipe o desenvolvimento de um sistema de internet banking para que os usuários possam acessar os dados de suas contas.

Antes de iniciar o desenvolvimento do sistema em si, sua equipe se reuniu com o gerente de produto responsável por levantar as informações do sistema para entender melhor quais dados serão gerenciados. 
Finalizada a reunião, foi definido que o sistema deverá ser capaz de gerenciar o saldo e movimentações financeiras entre as contas dos diversos clientes do banco.

Para isso, foi identificado a necessidade de armazenamento dos seguintes dados:
* Clientes: dados pessoais dos clientes do banco
* Agências: dados das agências pertencentes aos bancos
* Contas: dados das contas bancárias existentes dentro do banco
* Transações: Histórico de transações realizadas nas contas do banco

Foi levantado também quais informações deverão ser armazenadas para os dados levantados acima:
* Clientes: Nome, CPF, data de nascimento, endereço residencial, telefone de contato
* Agências: Código da agência, nome, endereço, data de criação
* Contas: Código da conta, agência detentora da conta, dono da conta, saldo, tipo da conta
* Transações: Tipo da transação, conta de origem, valor

Por fim, foi listado os seguintes relacionamentos entre os dados levantados:

* Um cliente pode ter uma ou mais contas
* Uma conta pertence necessáriamente a uma agência
* Uma agência pode ter várias contas
* As transações podem ser de duas naturezas: depósito ou saque
* Uma conta pode ter várias transações
* Uma transação parte necessáriamente de uma conta


## 01: Modelo Entidade-Relacionamento

Com base nas informações descritas acima, foi pedido que você gere o Diagrama Entidade-Relacionamento que represente os dados descritos acima. 
Para desenho do DER, você pode utilizar um dos seguintes softwares:

* [TerraER](http://www.terraer.com.br/)
* [draw.io](https://app.diagrams.net/)

## 02: Modelo Relacional

Com base no Modelo Entidade Relacionamento implementado, desenhe o Diagrama Relacional da respectiva base de dados.
Para o desenho do DR, utilize o software [MySQL Workbench](https://www.mysql.com/products/workbench/).

## 03: SQL

### Estrutura do SGBD

Agora que o modelo do sistema está pronto, é hora de criar sua estrutura no SGBD!! 
Utilize os comandos aprendidos na aula para criar a estrutura do banco de dados. 
Você deverá entregar os scripts SQL utilizados para criação do banco.

### Inserindo novos dados

Popule o banco de dados com **informações reais** de Clientes, Agências, Contas, e Transações. 
Seu banco de dados deverá ter, pelo menos:

* 3 clientes
* agências
* 2 contas
* 10 transações

Você deverá entregar os scripts SQL utilizados para criação do banco.

### Realizando consultas

Com os dados cadastrados, implemente o código SQL que realize as consultas abaixo:

1. Listar o nome de todos os clientes
1. Listar o nome de todas as agências criadas após 2020
1. Listar as contas que são poupança
1. Listar as contas criadas na agência central
1. Listar as transações realizadas a partir da conta do 'João'
1. Listar as transações realizadas pelo 'João' para a conta do 'Pedro'
1. Listar as agências que possuem pelo menos 3 contas
1. Listar as contas com pelo menos 4 transações
1. Listar os clientes que não realizaram transações 

Você deverá entregar os scripts SQL utilizados para criação do banco.