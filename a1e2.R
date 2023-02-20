# 导入数据
birthweight <- read.table("birthweight.txt", header = TRUE)

# 将数据按性别拆分
male <- birthweight[birthweight$Sex == "M",]
female <- birthweight[birthweight$Sex == "F",]

# 计算小于2600克的男婴和女婴的数量
less_than_2600 <- birthweight[birthweight$Birthweight < 2600,]

male_idx <- which(less_than_2600$Sex == "Male")

male <- less_than_2600[male_idx,]

female_idx <- which(less_than_2600$Sex == "Female")

female <- less_than_2600[female_idx,]

# 计算其余体重的男婴和女婴的数量
male_other <- nrow(male) - male_less_than_2600
female_other <- nrow(female) - female_less_than_2600

# 构建列联表
table_data <- matrix(c(male_less_than_2600, male_other, female_less_than_2600, female_other), nrow = 2, byrow = TRUE)
colnames(table_data) <- c("Less than 2600g", "Other")
rownames(table_data) <- c("Male", "Female")
table_data

# 进行卡方检验
chisq.test(table_data)
