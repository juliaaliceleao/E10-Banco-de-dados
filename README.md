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