library(httr)
library(jsonlite)
library(magrittr)
library(tibble)

# URL da DCA do Governo de Santa Catarina no ano de 2020 
url_dca <- paste("https://apidatalake.tesouro.gov.br/ords/siconfi/tt/dca?", # URL base para a chamada 
                 "an_exercicio=", 2020, "&", # Insere o parâmetro de Ano do exercício 
                 "no_anexo=", "DCA-Anexo+I-D","&", # Insere o parâmetro do Anexo que se deseja obter 
                 "id_ente=", "42", sep = "") # Insere o parâmetro do Ente de acordo com o código IBGE do mesmo

api_dca <- GET(url_dca)

# A chamada irá nos retornar os dados requisitados. Agora só precisamos extrair o conteúdo que nos interessa

json_dca <- api_dca %>% content(as = "text", encoding = "UTF-8") %>% fromJSON(flatten = FALSE)

# E após isso transforma-los em um tibble

dca_tb <- as.tibble(json_dca[["items"]])

