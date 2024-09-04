ggplot(temperatures, aes(x = City, y = Temperature, fill = City)) +
  geom_bar(stat = "identity") +
  labs(title = "Temperatura Atual em Várias Cidades",
       x = "Cidade",
       y = "Temperatura (°C)") +
  theme_minimal()