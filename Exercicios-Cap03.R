# Lista de Exercícios - Capítulo 3

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap02")
getwd()

# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
list.files()

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
vec1 <- c('A', 'B', 'C', 'D', 'E')
vec2 <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
vec3 <- c(rnorm(5))
df <- data.frame(vec1, vec2, vec3)
df
  
# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.

# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1

for (i in vec1){
  if (i > 10){
    print(i)
    print('Este elemento do vetor é maior que 10')
  } else{
    print(i)
    print('Este elemento do vetor é menor que 10')
  }
}
 

# Exercício 4 - Considere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2

for (i in lst2){
  print(i)
}

# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as materizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise - elemento por elemento
mult <- mat1*mat2
mult

# Multiplicação de matrizes
m_prod <- mat1 %*% mat2
m_prod

# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos

# Vetor
vec1 <- c('Nelson', 'Mandela', 'Otavio', 'Santos', 'Issa', 'Neto', 'Gabriel', 'Santos')
names(vec1) <- c('Nome', 'Sobrenome', 'Nome', 'Sobrenome', 'Nome', 'Sobrenome', 'Nome', 'Sobrenome')
vec1

# Matriz
matriz <- matrix(c(1:20), nrow = 4, ncol = 5, byrow = TRUE)
matriz
dimnames(matriz) <- list(c('A', 'B', 'C', 'D'), c('A', 'B', 'C','D', 'E'))
matriz

# Lista
lst <- list(1:20)
names(lst) <- c('Números')
lst

# DataFrame
pais = c("Portugal", "Inglaterra", "Irlanda", "Egito", "Brasil")
nome = c("Bruno", "Tiago", "Amanda", "Bianca", "Marta")
altura = c(1.88, 1.76, 1.53, 1.69, 1.68)
codigo = c(5001, 2183, 4702, 7965, 8890)
df <- data.frame(pais, nome, altura, codigo)

colnames(df) <- c('País', 'Nome', 'Altura', 'Código')
rownames(df) <- c('Obs1', 'Obs2', 'Obs3', 'Obs4', 'Obs5')
df


# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2

mat2[sample(1:50, 10)] = NA
mat2

# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

apply(mat1, 1, sum)
apply(mat1, 2, sum)


# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a

sort(a)
sort(a , decreasing = TRUE) # ordem decrescente

order(a)
a[order(a)]

# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

for (i in mat1){
  if(i >  15){
    print(i)
  }  
}
