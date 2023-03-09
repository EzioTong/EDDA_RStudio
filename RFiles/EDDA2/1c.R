# Print the coefficients and their significance
coef(summary(model))

# Predict volume for a tree with average diameter and height
mean_diameter <- mean(tree_data$diameter)
mean_height <- mean(tree_data$height)

predict(model, newdata = data.frame(type = "Beech", diameter = mean_diameter, height = mean_height))
