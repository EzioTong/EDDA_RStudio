# Build a multiple linear regression model
model <- lm(volume ~ type + diameter + height, data = tree_data)

# Print the model summary
summary(model)

# Build a model with interaction term between type and diameter
model_interaction <- lm(volume ~ type * diameter + height, data = tree_data)

# Print the model summary
summary(model_interaction)

# Build a model with interaction term between type and height
model_interaction2 <- lm(volume ~ type + diameter + height + type*height, data = tree_data)

# Print the model summary
summary(model_interaction2)
