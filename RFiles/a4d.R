# Model 1: Including the interaction between N and block
npk_model1 <- lm(yield ~ N*block + P + K, data = npk_dist)
summary(npk_model1)

# Model 2: Including the interaction between P and block
npk_model2 <- lm(yield ~ P*block + N + K, data = npk_dist)
summary(npk_model2)

# Model without the main effect of N
npk_model_noN <- lm(yield ~ block + P + K, data = npk_dist)

# Compare models with and without the main effect of N
anova(npk_model_noN, npk_model1)