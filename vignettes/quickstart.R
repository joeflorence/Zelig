## ----zelig-5-pseudo, eval=FALSE------------------------------------------
#  z5 <- zls$new()
#  z5$zelig(Y ~ X1 + X ~ X, weights = w, data = mydata)
#  z5$setx()
#  z5$sim()
#  z5$graph()

## ----zelig-4-pseudo, eval=FALSE------------------------------------------
#  z.out <- zelig(Y ~ X1 + X2, model = "ls", weights = w, data = mydata)
#  x.out <- setx(z.out)
#  s.out <- sim(z.out, x = x.out)
#  plot(s.out)

## ----eval=FALSE----------------------------------------------------------
#  install.packages('Zelig')

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github('IQSS/Zelig')

## ----message=FALSE-------------------------------------------------------
library(Zelig)

## ------------------------------------------------------------------------
# initialize Zelig5 least squares object
z5 <- zls$new()

## ------------------------------------------------------------------------
# estimate ls model
z5$zelig(Fertility ~ Education, data = swiss)

# model summary
summary(z5)

## ----include=FALSE-------------------------------------------------------
edu_coef <- round(z5$get_coef()[[1]][2], digits = 4)

## ------------------------------------------------------------------------
# set education to 5
z5$setx(Education = 5)

# set education to 15
z5$setx1(Education = 15)

# model summary
summary(z5)

## ------------------------------------------------------------------------
# run simulations and estimate quantities of interest
z5$sim()

# model summary
summary(z5)

## ----example_plot_graph, fig.height=11, fig.width=7----------------------
z5$graph()

## ------------------------------------------------------------------------
z5 <- zls$new()
z5$zelig(Fertility ~ Education, data = swiss)

# set Education to range from 5 to 15 at single integer increments
z5$setrange(Education = 5:15)

# run simulations and estimate quantities of interest
z5$sim()

## ----example_plot_ci_plot, fig.height=5, fig.width=5---------------------

z5$graph()

