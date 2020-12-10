# Solução Lista de Exercícios - Capítulo 9

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap9")
getwd()


# Exercício 1 - Gere 1000 números de uma distribuição normal com média 3 e sd = .25 e grave no objeto chamado x.

x <- rnorm(1000, 3, 0.25)

# Exercício 2 - Crie o histograma dos dados gerados no item anterior e adicione uma camada com a curva da normal.

hist(x, prob = TRUE, breaks = 20, main = 'Histograma de x')
curve(dnorm(x, 3, 0.25), add = TRUE, col = 'red')

# Exercício 3 - Suponha que 80% dos adultos com alergias relatem alívio sintomático com uma medicação específica. 
# Se o medicamento é dado a 10 novos pacientes com alergias, qual é a probabilidade de que ele seja 
# eficaz em exatamente sete?

dbinom(7, 10, 0.8)

graph <- function(n,p){
  x <- dbinom(0:n, size = n, prob = p)
  barplot(x, ylim = c(0, 0.4), names.arg = 0:n,
  main = sprintf(paste('Binomial Distribution(n,p)', n,p,sep = ',')))
}

graph(10, 0.8)

# Exercício 4 - Suponha que os resultados dos testes de um vestibular se ajustem a uma distribuição normal. 
# Além disso, a pontuação média do teste é de 72 e o desvio padrão é de 15,2. 
# Qual é a porcentagem de alunos que pontuaram 84 ou mais no exame?

# Estamos interessados em encontrar a cauda superior (lower.tail = false)
pnorm(84, mean = 72, sd = 15.2, lower.tail = FALSE)

# Exercício 5 - Suponha que o tempo médio de check-out de um caixa de supermercado seja de três minutos. 
# Encontre a probabilidade de um check-out do cliente ser concluído pelo caixa em menos de dois minutos.

# A taxa de processamento é 1/3 de check out por minuto.
pexp(2, rate = 1/3)

# Exercício 6 - Selecione dez números aleatórios entre um e três.
# Aplicamos a função de geração runif da distribuição uniforme para gerar dez números aleatórios entre um e três.

x <- runif(10,1,3)
x

# Exercício 7 - Se houver 12 carros atravessando uma ponte por minuto, em média, 
# encontre a probabilidade de ter 15 ou mais carros cruzando a ponte em um determinado minuto.

ppois(14, lambda = 12) # lower tail

ppois(15, lambda = 12, lower = FALSE) # upper tail

# Exercício 8 - Suponha que haja 12 questões de múltipla escolha em um questionário de inglês. 
# Cada questão tem cinco respostas possíveis e apenas uma delas está correta. 
# Encontre a probabilidade de ter quatro ou menos respostas corretas se um aluno tentar 
# responder a cada pergunta aleatoriamente.

prob = 1/5 # probabilidade de acertar uma questão
dbinom(4, size = 12, prob = prob) # probabilidade de acertar exatamente 4 questões
pbinom(4, size = 12, prob = prob)




