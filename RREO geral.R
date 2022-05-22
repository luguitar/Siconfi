library(httr)
library(jsonlite)
library(stringr)
library(dplyr)
library(tidyr)

# parâmetros de consulta ao RREO
base_url_rreo <- "apidatalake.tesouro.gov.br/ords/siconfi/tt/rreo?"
ano <- "2021"
bimestre <- "4"
tipo_relatorio <- "RREO"
num_anexo <- "RREO-Anexo+01"
ente <- "42" 

chamada_api_rreo <- paste(base_url_rreo,
                          "an_exercicio=", ano, "&",
                          "nr_periodo=", bimestre, "&",
                          "co_tipo_demonstrativo=", tipo_relatorio, "&",
                          "id_ente=", ente, sep = "")
rreo <- GET(chamada_api_rreo)
rreo_txt <- content(rreo, as="text", encoding="UTF-8")
rreo_json <- fromJSON(rreo_txt, flatten = FALSE) 
rreo_df <- as.data.frame(rreo_json[["items"]]) 
