# Zelig 4 code:
library(Zelig)
data(macro)
z.out1 <- zelig(unem ~ gdp + capmob + trade, model = "normal",
                data = macro)
summary(z.out1)
x.high <- setx(z.out1, trade = 50)
set.seed(42)
s.out1 <- sim(z.out1, x = x.high)
summary(s.out1)

# Zelig 5 code:
data(macro)
z5 <- znormal$new()
z5$zelig(unem ~ gdp + capmob + trade, data=macro)
z5
z5$setx(trade = 50)
set.seed(42)
z5$sim(num=1000)
statmat(z5$sim.out$x$ev[[1]])
statmat(z5$sim.out$x$pv[[1]])
z5$summarize()
z5$cite()