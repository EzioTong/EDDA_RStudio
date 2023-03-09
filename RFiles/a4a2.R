library(MASS) # Load the MASS package
library(magrittr)
library(dplyr)

set.seed(123) # Set the seed for reproducibility

# Create a data frame with the plot, block, and additive information
npk_df <- data.frame(plot = 1:24, block = rep(1:6, each = 4), N = rep(c(1,0), each = 12), 
                     P = rep(c(1,0), times = 6), K = rep(c(1,0), times = 6))

# Randomize the distribution of additives within each block
npk_random <- npk_df %>%
  group_by(block) %>%
  sample_n(2, replace = FALSE, weight = c(0.5, 0.5)) %>%
  ungroup()

# View the randomized data frame
npk_random
