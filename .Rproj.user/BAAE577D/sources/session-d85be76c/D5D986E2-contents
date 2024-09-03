# Criar o link da API, codificando os espaços na cidade
link_temp <- paste0('https://api.openweathermap.org/data/2.5/weather?q=', URLencode(CITY), '&appid=', API_KEY, '&lang=pt_br')

# Fazer a requisição GET para a API
response <- GET(link_temp)

# Verificar se a resposta foi bem-sucedida
if (status_code(response) == 200) {
  # Parsear o conteúdo JSON da resposta
  dictionary_res <- content(response, as = "parsed")
  
  # Extrair as informações do clima e temperatura
  climate <- dictionary_res$weather[[1]]$description
  temperature <- dictionary_res$main$temp - 273.15
  
  # Mostrar o resultado
  
  formatted_string <- sprintf("Em %s, o clima está de %s, a temperatura é de %.2f°C\n", CITY, climate, round(temperature, 2))
  
  cat(formatted_string)
} else {
  # Mostrar mensagem de erro se a requisição falhar
  cat("Erro na requisição:", status_code(response), "\n")
}