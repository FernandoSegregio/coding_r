# Criar o gráfico de probabilidade de chuva usando ggplot2

ggplot(data = dados_chuva, aes(x = data, y = prob_chuva)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 2) +
  labs(title = paste("Probabilidade de Chuva em", CITY2),
       x = "Data e Hora",
       y = "Probabilidade de Chuva (%)") +
  theme_minimal() +
  scale_x_datetime(date_labels = "%d-%b %H:%M", date_breaks = "12 hours") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
