# 导入数据 Import data
birthweight <- read.table("birthweight.txt", header = TRUE)

# 1. 正态性检验 Normality test
shapiro.test(birthweight$birthweight)

# 2. 构建 96% 置信区间 Construct 96% confidence interval
n <- length(birthweight$birthweight)
alpha <- 0.04 / 2
mean_bw <- mean(birthweight$birthweight)
std_error <- sd(birthweight$birthweight) / sqrt(n)
lower_bound <- mean_bw - qt(1-alpha, n-1) * std_error
upper_bound <- mean_bw + qt(1-alpha, n-1) * std_error
cat("The 96% CI for mean birthweight is [", round(lower_bound, 2), ", ", round(upper_bound, 2), "]\n")

# 3. 计算样本大小 Calculate sample size
max_length <- 100
std_error_max <- max_length / (2 * qt(1-alpha, n-1))
n_min <- ceiling((2 * sd(birthweight$birthweight) / std_error_max)^2)
cat("The minimum sample size needed to achieve the maximum length of 100 for the 96% CI is", n_min, "\n")

# 4. 计算 bootstrap 96% CI
set.seed(123) # 设置随机种子，以便结果可重复 Calculate bootstrap 96% CI 
# Set random seed for reproducibility
bootstrap_mean <- replicate(10000, mean(sample(birthweight$birthweight, n, replace = TRUE)))
bootstrap_ci <- quantile(bootstrap_mean, c(alpha, 1-alpha))
cat("The 96% bootstrap CI for mean birthweight is [", round(bootstrap_ci[1], 2), ", ", round(bootstrap_ci[2], 2), "]\n")

# 代码说明：
# 1 导入数据：首先需要将数据文件导入 R 中，这里使用 read.table 函数读取名为 birthweight.txt 的数据文件。
# 2 正态性检验：使用 shapiro.test 函数检验数据是否符合正态分布。
# 3 构建置信区间：基于已知数据符合正态分布的假设，计算样本均值的 96% 置信区间，其中 t 分布的自由度为 n-1。
# 4 计算样本大小：基于最大置信区间长度为 100 的限制条件，计算需要的最小样本大小。
# 5 计算 bootstrap 置信区间：使用 bootstrap 方法，对样本数据进行 10000 次有放回抽样，计算样本均值的置信区间。
# 通过这些计算，我们得到了基于正态性假设的置信区间，以及基于 bootstrap 方法的置信区间，可以比较两者的结果，从而评估正态性假设的适用性。同时，我们也得到了样本大小的估计，以确保置信区间的长度满足要求。

# Code explanation:
# 1 Import data: The first step is to import the data file into R, using the read.table function to read the file named birthweight.txt.
# 2 Normality test: Use the shapiro.test function to check if the data follows a normal distribution.
# 3 Construct confidence interval: Based on the assumption that the data follows a normal distribution, calculate the 96% confidence interval for the sample mean, where the t-distribution has degrees of freedom n-1.
# 4 Calculate sample size: Based on the constraint that the maximum confidence interval length is 100, calculate the minimum sample size required.
# 5 Calculate bootstrap confidence interval: Use the bootstrap method to perform 10,000 resamples with replacement on the sample data, and calculate the confidence interval for the sample mean.
# With these calculations, we obtain the confidence interval based on the normality assumption and the confidence interval based on the bootstrap method, allowing us to compare the results and evaluate the suitability of the normality assumption. We also obtain an estimate of the required sample size to ensure that the confidence interval length meets the requirement.