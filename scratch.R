

# packages ----------------------------------------------------------------


library(learnr)
library(tidyverse)
library(skimr)




# visualize normal --------------------------------------------------------
base_layer <- ggplot()
# base_layer

base_layer + 
    # add limits for x axis 
    xlim(0, 10)


base_layer + 
    # x axis limits
    xlim(0, 10) +
    # add normal distribution layer
    geom_function(
        # dnorm is the normal distribution function
        fun = dnorm, 
        # the args are stored in a list(mean, sd)
            args = list(mean = 5, 
                        sd = 1))
    
base_layer + 
    # x axis limits
    xlim(-4, 4) +
    # add normal distribution layer
    geom_function(
    # dnorm is the normal distribution function
        fun = dnorm, 
        # enter the new value below
            n = 10) 


base_layer + 
    # x axis limits
    xlim(-4, 4) +
    # add normal distribution layer
    geom_function(
    # dnorm is the normal distribution function
        fun = dnorm, 
        # enter the new value below
            n = 10) + 
    stat_function(
        fun = dnorm, 
        geom = "point", 
        n = 10
    )

base_layer + 
    xlim(-4, 4) +
    geom_function(
        fun = dnorm, 
        # enter the new value below
        n = 100) + 
    stat_function(
        fun = dnorm, 
        geom = "point", 
        # enter the new value below
        n = 100
    )


# parameters that will be passed to ``stat_function``
n = 1000
mean = 0
sd = 1
# passed to geom_histogram and stat_function
binwidth = 0.4
set.seed(1)
df <- data.frame(x = rnorm(n, 
                           mean, 
                           sd))

ggplot(df, aes(x = x, 
               mean = mean, 
               sd = sd, 
               binwidth = binwidth, 
               n = n)) +
    geom_histogram(binwidth = binwidth, 
        color = "white", 
        fill = "dodgerblue", 
        size = 0.1) +
stat_function(fun = function(x) 
        dnorm(x, mean = mean, sd = sd) * n * binwidth, 
        color = "firebrick", 
        size = 1)
