# Fit a full two-way ANOVA model with the response variable yield and the two factors block and N
npk_anova <- aov(yield ~ block + N, data = npk_dist)
summary(npk_anova)