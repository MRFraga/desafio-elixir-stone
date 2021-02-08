# desafio-elixir-stone


Olá!

Nesse projeto, começo a usar Elixir para resolver o problema detalhado em: https://gist.github.com/programa-elixir/1bd50a6d97909f2daa5809c7bb5b9a8a

Minha experiência é primariamente com linguagens com Orientação a Objetos. Usei a oportunidade como um desafio para tentar praticar com o paradigma funcional, e tentar transferir habilidades entre linguagens.

O objetivo foi criar um problema simples e claro, dividido em funções privadas chamadas pela função principal sum_bill():

-- É esperado que a entrada seja de duas listas - uma lista de tuplas, contendo o nome do produto na primeira posição (preferencialmente como um string) e com a quantidade e o preço dos produtos nas posições seguintes (ambos campos como int); e uma lista contendo emails distintos (preferencialmente strings)

-- Em caso de listas vazias, ou de valores inteiros negativos em quantidade/preço, o programa aborta a execução (usando raise())

-- O resultado final é um mapa com a lista dos emails e o valor total a ser pago por cada um

-- Dada a estrutura de mapas da linguagem, é esperado que os emails da lista sejam unívocos


--- A projeto foi realizado usando Mix em conjunto com VSCode (vscode-elixir), e a execução foi através do terminal ('iex -S mix', na pasta do projeto compilado). O programa espera as entradas no formato padrão: Bill.sum_bill([tuplas de produtos],[emails])

--- Os arquivos do projeto são o código (/lib/bill.ex) e os script de testes (/test/bill_test.exs)
