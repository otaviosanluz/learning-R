# Solução Lista de Exercícios - Capítulo 5

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap05")
getwd()


# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = N, qmethod = "double")

# Resolução:

# Error: objeto N não encontrado

?write.table 

write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")

# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
library(readr)
df_iris <- read_csv("iris.csv", col_types = matrix(
  Sepal.Length = col_double(1),
  Sepal.Width = col_double(1),
  Petal.Length = col_double(1),
  Petal.Width = col_double(1),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

# Resolução:

?read_csv

df_iris <- read_csv("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

?col_double
df_iris

# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")

# Resolução:

# Utilizar add = T, para sobrepor os dois gráficos
# Estar atento aos limites do eixo x e y de ambos os gráficos e fazer os ajustes necessários

par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , ylim = c(0, 350), col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , ylim = c(0, 350), col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="", add = TRUE)

# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("plotly")
library(plotly)
head(iris)

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = Species , marker=list(size=20 , opacity=0.5))

# Resolução:

# Error: color = Species não encontrado

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = ~Species , marker=list(size=20 , opacity=0.5))

?plot_ly

# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico que resulta nesta imagem.
library(plotly)
head(volcano)

p = plot_ly(z = volcano, type = 'surface')
p

# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson
install.packages('rjson')
library(rjson)

json_data <- fromJSON(file = 'input.json')
View(json_data) 
class(json_data)
  
# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.

df <- as.data.frame(json_data)
df
class(df)
View(df)

# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML
install.packages('XML')
library(XML)
library(methods)

result <- xmlParse(file = 'input.xml')
result
class(result)

# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe
df2 <- xmlToDataFrame('input.xml')
class(df2)

# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às seguintes perguntas:

data_csv <- read.csv(file = 'input.csv', header = TRUE, sep = ',')
data_csv
class(data_csv)

# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?sudescribe(data_csv)
print(ncol(data_csv))
print(nrow(data_csv))

# Pergunta 2 - Qual o maior salário?
maior_salario <- max(data_csv$salary)
print(maior_salario)

# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.
nome_salario <- subset(data_csv, salary == max(salary))
print(nome_salario)

# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.
IT <- subset(data_csv, dept == 'IT')
print(IT)

# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600. 
pessoas <- subset(data_csv, salary > 600 & dept == 'IT')
print(pessoas)