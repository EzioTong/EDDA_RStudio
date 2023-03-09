library(ggplot2) # Load the ggplot2 package

# Compute the average yield by block and additive
npk_avg <- npk %>%
  group_by(block, N) %>%
  summarize(avg_yield = mean(yield))

# Make a plot of the average yield by block and additive
ggplot(npk_avg, aes(x = factor(block), y = avg_yield, fill = factor(N))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Block", y = "Average Yield", fill = "Nitrogen Applied") +
  scale_fill_manual(values = c("gray70", "darkred"), labels = c("No", "Yes"))
