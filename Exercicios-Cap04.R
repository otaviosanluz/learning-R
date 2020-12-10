# Lista de Exercícios - Capítulo 4

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap04")
getwd()

# Exercicio 1 - Crie uma função que receba os dois vetores abaixo como parâmetro, 
# converta-os em um dataframe e imprima no console
vec1 <- (10:13)
vec2 <- c("a", "b", "c", "d")

myfunc <- function(a, b){
  df <- data.frame(a, b)
  print(df)
}

myfunc(vec1, vec2)


# Exercicio 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com 
# números inteiros e calcule a média de cada linha

# Criando a matriz
?matrix
mat <- matrix(data = c(1:16), nrow = 4, ncol = 4)
mat

# Calculando a média de cada linha
?apply
apply(mat, 1, mean)

# Exercicio 3 - Considere o dataframe abaixo. 
# Calcule a média por disciplina e depois calcule a média de apenas uma disciplina
escola <- data.frame(Aluno = c('Alan', 'Alice', 'Alana', 'Aline', 'Alex', 'Ajay'),
                     Matematica = c(90, 80, 85, 87, 56, 79),
                     Geografia = c(100, 78, 86, 90, 98, 67),
                     Quimica = c(76, 56, 89, 90, 100, 87))

escola

# Média por disciplina

# Matemática
mean_mat <- apply(escola[2], 2, mean)
mean_mat

# Geografia
mean_geo <- apply(escola[3], 2, mean)
mean_geo

# Química
mean_quim <- apply(escola[4], 2, mean)
mean_quim

# Média por aluno

escola$Media = NA
escola

escola$Media <- apply(escola[, c(2,3,4)], 1, mean)
escola

# Arredondando os valores da média

escola$Media <- round(escola$Media)
escola



# Exercicio 4 - Cria uma lista com 3 elementos, todos numéricos 
# e calcule a soma de todos os elementos da lista

list <- list(10, 15, 209)
list

# Soma dos elementos
?do.call
soma <- do.call(sum, list)
soma

# Exercicio 5 - Transforme a lista anterior um vetor

vec <- unlist(list)
vec

# Exercicio 6 - Considere a string abaixo. Substitua a palavra "textos" por "frases"
str <- c("Expressoes", "regulares", "em linguagem R", 
         "permitem a busca de padroes", "e exploracao de textos",
         "podemos buscar padroes em digitos",
         "como por exemplo",
         "10992451280")
str

gsub('textos', 'frases', str)

# Exercicio 7 - Usando o dataset mtcars, crie um gráfico com ggplot do tipo 
# scatter plot. Use as colunas disp e mpg nos eixos x e y respectivamente

library(ggplot2)
View(mtcars)

ggplot(mtcars, aes(x = disp, y = mpg)) +
  geom_point(color = 'red')

# Exercicio 8 - Considere a matriz abaixo.
# Crie um bar plot que represente os dados em barras individuais.
mat1 <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
mat1

?barplot()

barplot(mat1, beside = T)

# Exercício 9 - Qual o erro do código abaixo?
data(diamonds)
ggplot(data = diamonds, aes(x = price, group = fill, fill = cut)) + 
  geom_density(adjust = 1.5)

# group = fill
# Objeto fill não encontrado

# Exercício 10 - Qual o erro do código abaixo?
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_barplot() +
  labs(fill = "cyl")

# geom_barplot()
# O nome da função é geom_bar()

