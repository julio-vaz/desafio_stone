# Desafio Stone
### Questão 1: 
Aqui o objetivo era trazer quantos contratos (tokens) estavam sendo criados por bloco. O que eu fiz foi contar a coluna de tokens da tabela tokens, selecionar a coluna de blocos fazendo um join com a tabela blocks e agrupando por blocos, assim, eu consigo ver quantos contratos são criados por blocos. 

### Questão 2:
Aqui o objetivo era mostrar quantos blocos são criados em um dia. O que eu fiz foi contar a quantidade e blocos, selecionar a coluna *timestamp* e pra uma melhor visualização converter ele para *Date* e agrupar por data. Também fiz um order by desc para ter uma visualização da data mais recente até a mais antiga.

### Questão 3: 
Aqui o objetivo era mostrar qual foi a variação na quantidade de blocos contendo tokens em um dia em relação aos últimos 15 dias. O Primeiro passo foi criar uma subquery onde eu teria o valor único por dia em relação aos últimos 15 dias. Então eu comecei com o mesmo princípio da questão anterior, contar a quantidade de blocos e agrupar por data, mas também, colocar no meu filtro que eu queria somente os últimos 15 dias à partir do momento em que a query é rodada, pra isso eu usei o CURRENT_DATE() então sempre que a query for rodada ela pegará o dia atual e os últimos 15 dias correspondentes. Uma vez que eu tenho os dados desses últimos 15 dias na minha subquery, eu dou um AVG no meu select para conseguir ver a média da quantidade de blocos contendo tokens em um dia em relação aos últimos 15 dias.

### Questão 4: 
Aqui o objetivo era pegar o bloco que gerou tokens e utilizou mais gás e informar o nome de todos os tokens contidos neste bloco. Essa query foi feita em 3 etapas. A Primeira consistia em uma subquery para pegar os blocos que continham tokens, e pra conseguir isso eu selecionei a coluna dos nomes dos tokens fazendo um join com a coluna 'hash' da tabela bloco. A segunda parte consistia em pegar somente o bloco que utilizou mais gás e, pra isso, eu selecionei o bloco e o valor do gás usado da tabela que eu acabei de criar dando um orer by em ordem decrescente e pegando somente a primeira linha, assim, pegando o maior valor.
Por fim, selecionei o nome dos tokens, o bloco com gás mais usado e o maior valor de gás fazendo um join entre as duas subqueries para assim trazer o dado correto.


Aqui o intuito seria schedular essas queries para serem rodadas todos os dias e, com isso, ter os dados atualizados de maneira server side para uma boa análise.
