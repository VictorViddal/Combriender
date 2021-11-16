v1
#Framework

Combine

-Future: Variante de publisher q eventualmente retorna um caso de erro ou um caso de sucesso, ele é extremamente util para requisições assíncronas de APIs e HTTP, pq ele permite vc tratar os casos de erro e acerto que eventualmente venha a acontecer, no nosso caso usamos para facilitar o preenchimento de dados nas telas q recebem informações da API do Pokemon.

-Publisher: publisher entrega elementos para uma ou mais instâncias de Assinante. Os tipos associados de entrada e falha do assinante devem corresponder aos tipos de saída e falha declarados pelo editor. O editor implementa o método receive (subscriber :) para aceitar um assinante. Depois disso, o editor pode chamar alguns métodos receber (assinatura :): Reconhece a solicitação de assinatura e retorna uma instância de Assinatura. O assinante usa a assinatura para exigir elementos do editor e pode usá-la para cancelar a publicação.

#Diario de Bordo 

   Durante a criação da funcionalidade do Combine o q leva mais tempo para ser feito foi preparar a UI com  a célula, nao entrando em detalhes da criação dela em si, a parte importante se dar ao fato de criar uma view model com variável Publisher q contém a model para podermos alterar os valores da célula no momento q atualizarmos o model 
    Depois disso partimos para a criação da feature principal de pegar os dados da API e usar o combine para auxiliar nessa tarefa, para isso depois de criarmos o model com a response da API e habilitarmos o view model para a gerar as células da tableview,  assim podemos usar o Future para trabalharmos assincronamente com a resposta da Ali, como o future ja foi explicado no inicio do arquivo podemos focar na sua sintaxe “<Resposta_sucesso, Resposta_Error>”, como nele esperamos um caso de sucesso ou um caso de falha, temos de forma assertiva nosso caso de sucesso sendo a resposta da API, portanto como primeiro parâmetro passamos o model da response da Ali, como nao tens tratamento de erro por enquanto, deixamos a opção de error como “Never”, assim nao esperamos que um resultado de erro possa ser retornado, como tudo setado agora basta chamar a função na ViewController através do sink e carregar os dados na tableView

#Sugestão
 - Tratamento de erro da resposta da API - Timer com som genérico de Pokemon saindo - tratamento de nextPokemon

v2

  
