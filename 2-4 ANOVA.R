##----------------------------------------------------------
## One-way ANOVA : aov(), oneway.test
##----------------------------------------------------------

# 문제 ) 정유사에서 온도(Factor, one-way)에 따라서 휘발유 생산량에 
# 변화가 있는지 (즉, 영향이 있는지) 알아보기 위하여 
# 온도를 3가지 조건(3 Factor Levels)으로 실험설계를 하여 
# 10번에 걸쳐서 휘발유 생산량을 측정하였습니다. 
# 관찰값이 아래와 같을 때 조사되었을 때 온도의 조건에 따라서 
# 휘발유 생산량에 차이가 있는지 유의수준 α = 10% 로 검정하시오.

# 문제풀이) (1) 위의 관측값들을 벡터로 입력
# (2) boxplot() 함수와 summary()를 이용하여 탐색적 분석.
# (3) aov() 함수를 이용하여 one-way ANOVA 분석.
# : aov(y ~ group, data = dataset)
# (4) 기본 가정 중에 오차의 등분산성을 검정하기 위해 Bartlett 검정.
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
  # Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Bartlett test to test the null hypothesis of equal group variances
bartlett.test(y ~ group, data = group_df)

# Bartlett test of homogeneity of variances
# Bartlett's K-squared = 1.6565, df = 2, p-value = 0.4368


#####--결과--#####
# 일원분산분석(one-way ANOVA) 결과 
# 1)검정통계량 F-value가 108.8으로 나왔으며,
# 2)P-value 값은 '1.2e-13'으로서 매우 작게 나와 유의수준 10% 에서 
# 귀무가설을 기각하고 대립가설을 채택하게 되어
# "온도 조건 1/2/3에 따라서 휘발유 생산량에 차이가 있다"라고
# 판단할 수 있겠습니다.
# 
# 오차의 등분산성 가정에 대해 Bartlett 검정 결과
# 3)P-value가 0.4368로서 
# 4)유의수준 10%에서 귀무가설을 채택하여
# "오차의 등분산성 가정을 만족한다"고 할 수 있겠습니다.


