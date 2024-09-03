# Fazendo a requisição para a API
API_KEY <- 'c60a4792ccbe5983e113c048825b78fb'
CITY = 'Juiz de Fora'
CITY2 = 'Belém'
cities <- c('Juiz de Fora', 'São Paulo', 'Rio de Janeiro', 'Belo Horizonte', 'Brasília')

link_rain <- paste0("https://api.openweathermap.org/data/2.5/forecast?q=", URLencode(CITY2), "&appid=", API_KEY, "&units=metric")

response <- GET(link_rain)

# Verificar o status da resposta
if (response$status_code == 200) {
  # Processar os dados se a resposta for bem-sucedida
  data <- fromJSON(content(response, "text", encoding = "UTF-8"))
  
  # Extrair as informações de interesse
  previsao <- data$list
  
  # Criar um dataframe com a data e probabilidade de chuva
  dados_chuva <- data.frame(
    data = as.POSIXct(previsao$dt, origin = "1970-01-01", tz = "UTC"),
    prob_chuva = sapply(previsao$pop, function(x) x * 100)  # 'pop' representa a "probability of precipitation" (0 a 1)
  )
  
  print(dados_chuva) # Mostrar os dados extraídos
  
} else {
  # Exibir o erro caso a resposta não seja bem-sucedida
  print(paste("Erro na requisição. Status code:", response$status_code))
}