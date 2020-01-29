# Description: This R script is a simple application which aims to demonstrate the law of large numbers with 
# the assumption that the sample API is inherintly random. 
# 
# Designer and Developer: Justin Cervantes
#
# Date: January 28, 2020

# RollSomeDice
# Description: Rolls m dice at a time, checks how many 3s came up, and adds that amount to a list
# called DiceRollTests. As n increases, we observe a shift from right skew to zero skewness.
# 
# n is the number of times the test is run
# m is the number of dice in each test
RollSomeDice=function(n,m)
{
  DiceRollTests<-c(1:n)
  for(i in 1:n)
  {
    # roll the dice m times (m rolls per test)
    # store the results in CurentTest, add it to a master list of tests
    CurrentTest = sample(1:6, m, repl=TRUE)
    DiceRollTests[i] = sum(CurrentTest == 3)
  }
  
  DiceRollTestsTable = table(DiceRollTests)
  # Use barplot if running this in RStudio
  # barplot(DiceRollTestsTable, xlab=paste("Number of times a 3 was rolled among", m, "die"), ylab="Number of times outcome happened", main=paste("Number of 3's obtained in rolling", m, "dice" ))
  return(DiceRollTestsTable)
}

print(paste("Your files are being saved to:", getwd()))

png("onedie.png", 550, 300)
barplot(RollSomeDice(10000, 1), xlab="Number of times a 3 was rolled among 1 die", ylab="Number of times outcome happened", main="Number of 3's obtained in rolling 1 die" )
dev.off()

png("twodice.png", 550, 300)
barplot(RollSomeDice(10000, 2), xlab="Number of times a 3 was rolled among 2 dice", ylab="Number of times outcome happened", main="Number of 3's obtained in rolling 2 die" )
dev.off()

png("sixdice.png", 550, 300)
barplot(RollSomeDice(10000, 6), xlab="Number of times a 3 was rolled among 6 dice", ylab="Number of times outcome happened", main="Number of 3's obtained in rolling 6 die" )
dev.off()

png("tendice.png", 550, 300)
barplot(RollSomeDice(10000, 10), xlab="Number of times a 3 was rolled among 10 dice", ylab="Number of times outcome happened", main="Number of 3's obtained in rolling 10 die" )
dev.off()

png("onehundreddice.png", 550, 300)
barplot(RollSomeDice(10000, 100), xlab="Number of times a 3 was rolled among 100 dice", ylab="Number of times outcome happened", main="Number of 3's obtained in rolling 100 die" )
dev.off()