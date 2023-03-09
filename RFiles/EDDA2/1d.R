# Load the data from treeVolume.txt file
tree_data <- read.table("treeVolume.txt", header = TRUE)

# Check the structure of the data
str(tree_data)

# Fit the initial linear model with diameter and height as explanatory variables
initial_model <- lm(volume ~ diameter + height, data = tree_data)

# Check the summary of the initial model
summary(initial_model)

# Create a scatter plot matrix of the variables in the initial model
plot(tree_data[,c("volume","diameter","height")])

# Check the correlation matrix of the variables in the initial model
cor(tree_data[,c("volume","diameter","height")])

# Propose a logarithmic transformation of the explanatory variables diameter and height
tree_data$log_diameter <- log(tree_data$diameter)
tree_data$log_height <- log(tree_data$height)

# Fit the transformed linear model with log-transformed diameter and height as explanatory variables
transformed_model <- lm(volume ~ log_diameter + log_height, data = tree_data)

# Check the summary of the transformed model
summary(transformed_model)

# Compare the initial and transformed models using ANOVA
anova(initial_model, transformed_model)

# Generate diagnostic plots for the transformed model
par(mfrow=c(2,2))
plot(transformed_model)
