temperatures <- data.frame(City = character(), Temperature = numeric(), stringsAsFactors = FALSE)

for (city in cities) {
  # Codificar o nome da cidade para a URL
  link_temp <- paste0('https://api.openweathermap.org/data/2.5/weather?q=', URLencode(city), '&appid=', API_KEY, '&lang=pt_br')
  response <- GET(link_temp)
  
  if (status_code(response) == 200) {
    # Parsear o conteúdo JSON da resposta
    dictionary_res <- content(response, as = "parsed")
    temp_celsius <- dictionary_res$main$temp - 273.15 # Converter para Celsius
    
    # Adicionar à tabela de dados
    temperatures <- rbind(temperatures, data.frame(City = city, Temperature = round(temp_celsius, 2)))
  } else {
    cat("Erro ao obter dados para a cidade:", city, "\n")
  }
}
