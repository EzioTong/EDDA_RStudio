# 导入数据
birthweight <- read.table("birthweight.txt", header = TRUE)

# 将数据按性别拆分
male <- birthweight[birthweight$Sex == "Male", ]
female <- birthweight[birthweight$Sex == "Female", ]

# 根据体重阈值将数据拆分
less_than_2600 <- birthweight[birthweight$Birthweight < 2600, ]
more_than_2600 <- birthweight[birthweight$Birthweight >= 2600, ]

# 分别计算男性和女性体重小于2600g的数量
male_lt_2600 <- nrow(less_than_2600[less_than_2600$Sex == "Male", ])
female_lt_2600 <- nrow(less_than_2600[less_than_2600$Sex == "Female", ])

# 分别计算男性和女性体重大于等于2600g的数量
male_mt_2600 <- nrow(more_than_2600[more_than_2600$Sex == "Male", ])
female_mt_2600 <- nrow(more_than_2600[more_than_2600$Sex == "Female", ])

# 计算男性和女性体重小于2600g的比例
p_male_lt_2600 <- male_lt_2600 / nrow(male)
p_female_lt_2600 <- female_lt_2600 / nrow(female)

# 计算男性和女性体重大于等于2600g的比例
p_male_mt_2600 <- male_mt_2600 / nrow(male)
p_female_mt_2600 <- female_mt_2600 / nrow(female)

# 计算比例之差的估计值和标准误差
p_diff <- p_male_lt_2600 - p_female_lt_2600
se_p_diff <- sqrt(p_male_lt_2600*(1-p_male_lt_2600)/nrow(male) + 
                    p_female_lt_2600*(1-p_female_lt_2600)/nrow(female))

# 计算置信区间
alpha <- 0.05
z <- qnorm(1-alpha/2)
lower_bound <- p_diff - z * se_p_diff
upper_bound <- p_diff + z * se_p_diff
cat("The 95% CI for the difference in proportions is [", round(lower_bound, 2), ", ", round(upper_bound, 2), "]\n")

# 进行假设检验
H0 <- 0
H1 <- p_male_lt_2600 - p_female_lt_2600
z_score <- (H1 - H0) / se_p_diff
p_value <- 2 * (1 - pnorm(abs(z_score)))
cat("The p-value for the two-sided test is", p_value, "\n")
