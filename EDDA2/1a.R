# Read the data from treeVolume.txt file
tree_data <- read.table("treeVolume.txt", header = TRUE)

# Perform one-way ANOVA test
anova_result <- aov(volume ~ type, data = tree_data)

# Print the ANOVA summary
summary(anova_result)

# Calculate mean volumes for each tree type
mean_volumes <- aggregate(volume ~ type, data = tree_data, mean)

# Print the mean volumes
mean_volumes
