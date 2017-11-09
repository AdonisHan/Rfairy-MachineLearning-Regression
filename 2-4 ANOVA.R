##----------------------------------------------------------
## One-way ANOVA : aov(), oneway.test
##----------------------------------------------------------

# ���� ) �����翡�� �µ�(Factor, one-way)�� ���� �ֹ��� ���귮�� 
# ��ȭ�� �ִ��� (��, ������ �ִ���) �˾ƺ��� ���Ͽ� 
# �µ��� 3���� ����(3 Factor Levels)���� ���輳�踦 �Ͽ� 
# 10���� ���ļ� �ֹ��� ���귮�� �����Ͽ����ϴ�. 
# �������� �Ʒ��� ���� �� ����Ǿ��� �� �µ��� ���ǿ� ���� 
# �ֹ��� ���귮�� ���̰� �ִ��� ���Ǽ��� �� = 10% �� �����Ͻÿ�.

# ����Ǯ��) (1) ���� ���������� ���ͷ� �Է�
# (2) boxplot() �Լ��� summary()�� �̿��Ͽ� Ž���� �м�.
# (3) aov() �Լ��� �̿��Ͽ� one-way ANOVA �м�.
# : aov(y ~ group, data = dataset)
# (4) �⺻ ���� �߿� ������ ��л꼺�� �����ϱ� ���� Bartlett ����.
# : bartlett.test(y ~ group, data = dataset)

##--- Are there any daily outcome differences among temperature conditions?
# group 1 : temperature condition 1 
# group 2 : temperature condition 2
# group 3 : temperature condition 3



# daily outcome by tmep condition (group 1/2/3)
y1 <- c(50.5, 52.1, 51.9, 52.4, 50.6, 51.4, 51.2, 52.2, 51.5, 50.8)
y2 <- c(47.5, 47.7, 46.6, 47.1, 47.2, 47.8, 45.2, 47.4, 45.0, 47.9)
y3 <- c(46.0, 47.1, 45.6, 47.1, 47.2, 46.4, 45.9, 47.1, 44.9, 46.2)

y <- c(y1, y2, y3)
y


n <- rep(10, 3)
n


group <- rep(1:3, n)
group


# combining into data.frame
group_df <- data.frame(y, group)
group_df


sapply(group_df, class)


# transform from 'integer' to 'factor'
group_df <- transform(group_df, group = factor(group))
sapply(group_df, class)

# boxplot
attach(group_df)


boxplot(y ~ group, 
        +         main = "Boxplot of Daily Outcome by Temperature condition 1/2/3", 
        +         xlab = "Factor Levels : Temperature condition 1/2/3", 
        +         ylab = "Daily Outcome")








# descriptive statistics by group
tapply(y, group, summary)


detach(group_df)

# one-wayANOVA
aov(y ~ group, data = group_df)
Call:
  aov(formula = y ~ group, data = group_df)

Terms:
#   group Residuals
# Sum of Squares  156.302    19.393
# Deg. of Freedom       2        27
# 
# Residual standard error: 0.8475018
# Estimated effects may be unbalanced

summary(aov(y ~ group, data = group_df))
# Df Sum Sq Mean Sq F value  Pr(F)    
# group        2 156.30   78.15   108.8 1.2e-13 ***
  # Residuals   27  19.39    0.72                    
---
  # Signif. codes:  0 ��***�� 0.001 ��**�� 0.01 ��*�� 0.05 ��.�� 0.1 �� �� 1

# Bartlett test to test the null hypothesis of equal group variances
bartlett.test(y ~ group, data = group_df)

# Bartlett test of homogeneity of variances
# Bartlett's K-squared = 1.6565, df = 2, p-value = 0.4368


#####--���--#####
# �Ͽ��л�м�(one-way ANOVA) ��� 
# 1)������跮 F-value�� 108.8���� ��������,
# 2)P-value ���� '1.2e-13'���μ� �ſ� �۰� ���� ���Ǽ��� 10% ���� 
# �͹������� �Ⱒ�ϰ� �븳������ ä���ϰ� �Ǿ�
# "�µ� ���� 1/2/3�� ���� �ֹ��� ���귮�� ���̰� �ִ�"���
# �Ǵ��� �� �ְڽ��ϴ�.
# 
# ������ ��л꼺 ������ ���� Bartlett ���� ���
# 3)P-value�� 0.4368�μ� 
# 4)���Ǽ��� 10%���� �͹������� ä���Ͽ�
# "������ ��л꼺 ������ �����Ѵ�"�� �� �� �ְڽ��ϴ�.

