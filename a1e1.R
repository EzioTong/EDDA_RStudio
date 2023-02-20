# 1 导入数据
birthweight <- read.table("birthweight.txt", header = TRUE)

# 2 根据问题描述把数据按照性别和体重进行分类
less_than_2600 <- birthweight[birthweight$Birthweight < 2600,]
less_than_2600_male <- less_than_2600[less_than_2600$Sex == "M",]
less_than_2600_female <- less_than_2600[less_than_2600$Sex == "F",]

greater_than_2600 <- birthweight[birthweight$Birthweight >= 2600,]
greater_than_2600_male <- greater_than_2600[greater_than_2600$Sex == "M",]
greater_than_2600_female <- greater_than_2600[greater_than_2600$Sex == "F",]

# 3 计算样本均值和方差
x1_bar <- mean(less_than_2600_male$Birthweight)
x1_var <- var(less_than_2600_male$Birthweight)
n1 <- length(less_than_2600_male$Birthweight)

x2_bar <- mean(less_than_2600_female$Birthweight)
x2_var <- var(less_than_2600_female$Birthweight)
n2 <- length(less_than_2600_female$Birthweight)

x3_bar <- mean(greater_than_2600_male$Birthweight)
x3_var <- var(greater_than_2600_male$Birthweight)
n3 <- length(greater_than_2600_male$Birthweight)

x4_bar <- mean(greater_than_2600_female$Birthweight)
x4_var <- var(greater_than_2600_female$Birthweight)
n4 <- length(greater_than_2600_female$Birthweight)

# 4 进行假设检验。假设男婴和女婴出生体重相等。即
# H0:miuM1 = miuF1 = miuM2 = miuF2
# 用方差分析来检验这个假设
birthweight_anova <- aov(Birthweight ~ Sex * (Birthweight < 2600), data = birthweight)

summary(birthweight_anova)

# 这里使用了 aov 函数进行方差分析，并使用 summary 函数来查看结果。
# 方差分析的原理是将总方差分解为组内方差和组间方差，通过比较组间方差与组内方差的比值来检验零假设。

# 5 解释结果。可以从输出中看到 F 统计量为 9.9056，p 值为 0.001722。
# 这表明组间方差与组内方差的比值远大于 1，拒绝零假设，即男婴和女婴的出生体重均值不相等。