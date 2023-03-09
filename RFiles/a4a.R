library(MASS)
set.seed(123)  # Set seed for reproducibility

# Create a matrix to store the randomized distribution of soil additives
dist_mat <- matrix(0, nrow = 6, ncol = 4)

# Randomly assign soil additives to each block
for (i in 1:6) {
  dist_mat[i, ] <- sample(c(1,1,0,0), 4)
}

# Verify that each soil additive is received by exactly two plots within each block
colSums(dist_mat)  # The sum of each column should be 2
rowSums(dist_mat)  # The sum of each row should be 2

# Combine the block information and the soil additive distribution
npk_dist <- data.frame(npk, dist_mat)

# In this code, we use the sample function to randomly assign soil additives to each block. We specify the probability of each soil additive (1 = applied, 0 = not applied) using a vector of length 4 with two 1's and two 0's, which we then randomly sample from using the sample function. We repeat this process for each block, and store the resulting distribution in a matrix called dist_mat. We then verify that each soil additive is received by exactly two plots within each block by checking the column and row sums of dist_mat. Finally, we combine the block information and the soil additive distribution into a data frame called npk_dist.
