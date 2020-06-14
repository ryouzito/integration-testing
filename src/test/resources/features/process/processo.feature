#language: pt
@run
Funcionalidade: Cria, lê, altera e deleta processos

  Fundo:
    Dado que o usuario esteja no site do processo
    E que o usuario preencha o campo "vara" com o valor "Vara"
    E que o usuario preencha o campo "natureza" com o valor "Guarda"
    E que o usuario preencha o campo "partes" com o valor "DC x Marvel"
    E que o usuario preencha o campo "urgente" com o valor "N"
    E que o usuario preencha o campo "arbitramento" com o valor "N"
    E que o usuario preencha o campo "assistente_social" com o valor "Tony Stark"
    E que o usuario preencha o campo "data_entrada" com o valor "01/01/2000"
    E que o usuario preencha o campo "data_saida" com o valor "05/10/2018"
    E que o usuario preencha o campo "data_agendamento" com o valor "02/07/1998"
    E que o usuario preencha o campo "status" com o valor "Aguardando"
    E que o usuario preencha o campo "observacao" com o valor "Marvel é muito melhor"

  Cenario: POST e GET - Criar processo e ler em seguida
    Dado que o usuario preencha o campo "numero_processo" com o valor "123456"
    Quando o usuario clique no botao salvar processo
    Entao o usuario deveria ver a mensagem de "processo criado com sucesso"

    Quando o usuario buscar o ultimo processo criado
    Entao o usuario deveria ver a mensagem de "sucesso"

  Esquema do Cenario: POST - Cria processo com outline - <descricao>
    Dado que o usuario preencha o campo "numero_processo" com o valor "<numero_processo>"
    Quando o usuario clique no botao salvar processo sem numero
    Entao o usuario deveria ver a mensagem de "<statusCode>"

    Exemplos:
      | descricao            | statusCode                  | numero_processo |
      | numero informado     | processo criado com sucesso | 123456          |
      | numero nao informado | entidade nao processada     |                 |

  Cenario: PUT e GET - Atualizar processo e ler em seguida
    Dado que o usuario preencha o campo "numero_processo" com o valor "123456"
    E o usuario clique no botao salvar processo
    E o usuario atualizar "status" com o valor "Finalizado"
    Quando o usuario clicar no botao atualizar processo
    Quando o usuario buscar o ultimo processo criado
    Entao o usuario deveria ver a mensagem de "sucesso"

  Cenario: DELETE e GET - Deletar processo e tentar ler sem sucesso
    Dado que o usuario preencha o campo "numero_processo" com o valor "123456"
    E o usuario clique no botao salvar processo
    Quando o usuario clicar no botao deletar
    Entao o usuario deveria ver a mensagem de "sem conteúdo"

    Quando o usuario buscar o ultimo processo criado
    Entao o usuario deveria ver a mensagem de "não encontrado"