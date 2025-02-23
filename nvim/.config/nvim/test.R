print("hello")

f <- function(x = "foo") {
  print(x)
  invisible(x)
}

library(OPSR)

## move curser over opsr and press "gd" for go to definition
## or press K to get help-page
## => magic!
sim_dat <- opsr_simulate()
dat <- sim_dat$data
model <- ys | yo ~ xs1 + xs2 | xo1 + xo2
fit <- opsr(model, dat)
summary(fit)
