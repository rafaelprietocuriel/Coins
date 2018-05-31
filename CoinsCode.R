#### code created on June, 2018 by Rafael Prieto Curiel
#### this project allows you to count th number of different distributions
#### you can change the number of coins Q and the amount of money M
M <- 1653  # so 16.53 pounds
Q <- 593   # so 593 coins

#### we only use as variables q5, q10 and q20, the number of 
#### coins which are 5p, 10p and 20p respectively
q5  <- 0:340
q10 <- 0:180
q20 <- 0:90

#### notice that we can use less 20p coins, since having 90 20p coins
#### would give us more than the M money

#### we then write them as integer lattice points
Q5 <- rep(q5 , length(q10) * length(q20))
Q10 <- rep(rep(q10, each = length(q5 )), length(q20))
Q20 <- rep(q20, each = length(q5) * length(q10))

Q1 <- 2*Q - M + 3*Q5 + 8*Q10 + 18*Q20
Q2 <- M - Q - 4*Q5 - 9*Q10 - 19*Q20

#### from the integer lattice for Q1 and Q2, those who are non-negative
#### are a solution for our problem
Inside <- (Q1 >= 0) & (Q2 >=0)
S <- sum(Inside)
cat("There are ", S, " different distributions with \n",
    Q, " coins, using only 1p, 2p, 5p, 10p and 20p coins \n",
    "which have exactly ", M, " pence in total.")
