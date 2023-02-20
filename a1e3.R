# 导入数据
birthweight <- read.table("birthweight.txt", header = TRUE)

# 把数据分成两组：体重小于 2600g 和体重大于等于 2600g 的婴儿
less_than_2600 <- subset(birthweight, birthweight < 2600)
greater_than_or_equal_to_2600 <- subset(birthweight, birthweight >= 2600)

# 对体重小于 2600g 的婴儿按性别分组
male_female_lt_2600 <- table(less_than_2600$sex)

# 对体重大于等于 2600g 的婴儿按性别分组
male_female_ge_2600 <- table(greater_than_or_equal_to_2600$sex)

# 对于体重小于 2600g 的婴儿，检验男女婴的出生体重均值是否相等
alpha <- 0.05
male_lt_2600 <- subset(less_than_2600, sex == "M")
female_lt_2600 <- subset(less_than_2600, sex == "F")
test_result <- t.test(male_lt_2600$Birthweight, female_lt_2600$Birthweight, var.equal = TRUE)
p_value <- test_result$p.value
cat("For babies with birthweight < 2600g:\n")
cat("Test statistic:", round(test_result$statistic, 2), "\n")
cat("P-value:", round(p_value, 4), "\n")
if (p_value < alpha) {
  cat("Reject null hypothesis. There is evidence that the mean birthweight of male and female babies is different.\n")
} else {
  cat("Fail to reject null hypothesis. There is no evidence that the mean birthweight of male and female babies is different.\n")
}

# 对于体重大于等于 2600g 的婴儿，检验男女婴的出生体重均值是否相等
male_ge_2600 <- subset(greater_than_or_equal_to_2600, Sex == "M")
female_ge_2600 <- subset(greater_than_or_equal_to_2600, Sex == "F")
test_result <- t.test(male_ge_2600$Birthweight, female_ge_2600$Birthweight, var.equal = TRUE)
p_value <- test_result$p.value
cat("\nFor babies with birthweight >= 2600g:\n")
cat("Test statistic:", round(test_result$statistic, 2), "\n")
cat("P-value:", round(p_value, 4), "\n")
if (p_value < alpha) {
  cat("Reject null hypothesis. There is evidence that the mean birthweight of male and female babies is different.\n")
} else {
  cat("Fail to reject null hypothesis. There is no evidence that the mean birthweight of male and female babies is different.\n")
}
