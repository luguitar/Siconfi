library(httr)
library(jsonlite)
library(stringr)
library(dplyr)
library(tidyr)

# parâmetros de consulta ao RREO
base_url_rgf <- "apidatalake.tesouro.gov.br/ords/siconfi/tt/rgf"
ano <- "2018"
quadrimestral<- "Q"
quadrimestre <- "1"
tipo_relatorio <- "RGF"
anexo <- "RGF-Anexo+01"
esfera<- "E"
poder<- "E"
ibge <- "42" 

#"no_anexo=",anexo,"&", #opcional
#"co_esfera=", esfera, "&",
chamada_api_rgf <- paste(base_url_rgf,
                         "an_exercicio=", ano, "&", 
                         "in_periodicidade=", quadrimestral, "&",
                         "nr_periodo=", quadrimestre, "&",
                         "co_tipo_demonstrativo=", tipo_relatorio, "&",
                         "co_poder=", poder, "&",
                         "id_ente=", ibge, sep = "")
rgf <- GET(chamada_api_rgf)
rgf_txt <- content(rgf, as="text", encoding="UTF-8")
rgf_json <- fromJSON(rgf_txt, flatten = FALSE) 
rgf_df <- as.data.frame(rgf_json[["items"]]) 

#Teste 2
url2<- "http://apidatalake.tesouro.gov.br/ords/siconfi/tt/rgf?,("an_exercicio=",exercicio,"&in_periodicidade=",periodicidade,"&nr_periodo=",periodo,"&co_tipo_demonstrativo=",RGF, "&co_poder=",poder,"&id_ente=",cod_ibge)"
