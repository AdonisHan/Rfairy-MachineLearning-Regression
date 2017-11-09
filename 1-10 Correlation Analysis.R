#########################################################
### 수업내용 : 상관분석(Correlation Analysis)        ####
#########################################################

#-- install.packages("psych")
#-- install.packages("prettyR")
#-- install.packages("Hmisc")
#-- install.packages("corrplot")
library(DT)
library(psych)
library(prettyR)
library(Hmisc)
library(corrplot)
## 언제 : 두 개의 양적 자료 간의 관련성이 있는지를
## 통계적으로 검정하는 방법.

## 관련성 : 직선의 관계 = 선형 

## 예제 데이터 : cars
## 변수명      : speed(속도-양 ). dist(제동거리- 양), : distance

# 소수점은 어디까지 하는게 센스 있는가???
# 표준편규 소수점째 2째 
# 유의확률 4째 
# 가설검정 솟점 3째 
# 상관 회귀개수 소수 3째 


## 1. 산점도(Scatter plot)
## plot(데이터명$변수명, 데이터명$변수명)
plot(cars$speed, cars$dist)

# 스피드가 증가할수록 제동거리도 많이
# 완전히 직선이 아니니 합의 1은 아니다. 

## 2 . 상관계수 (Coeeficient of Correlation)
## cor(데이터명$변수명, 데이터명$변수명)
cor(cars$speed, cars$dist) #기본: Pearson
## [1] 0.8068949 상관계수 +양의상관관계, 관련성이 높다. x증가할때 y증가. 
## 0.8 이상 ~ 1.0 이하 : 매우 높은 양의 관련성이 있다. 
## Sol : 스피드가 높을 수록 제동거리가 길어지는 경향을 보이고 있다.
## 명목형에는 순위를 매겨서 해야한다. 
cor(cars$speed, cars$dist, method = "kendall") # Kendall : 켄달의 tau - 켄달의 상관계수. 순위를 바꾸어서.
# [1] 0.6689901 - 상관계수
cor(cars$speed, cars$dist, method = "spearman") # Spearman : 스피어만.
# [1] 0.8303568
## 상관계수 해석의 가이드. 
## 0.0 이상 ~ 0.2 미만 : 관련성 없음. 
## 0.2 이상 ~ 0.4 미만 : 약한 관련성이 있음. 
## 0.4 이상 ~ 0.6 미만 : 보통의 관련성이 있음.
## 0.6 이상 ~ 0.8 미만 : 높은 관련성이 있다.
## 0.8 이상 ~ 1.0 이하 : 매우 높은 관련성이 있다.
# + 양의 상관계수 / - 음의 상관계수.


## 3. 상관분석 
## 귀무가설 : 두 양적 자료 간의 선형의 관계(관련성: 직선 = 선형의 관계 )가 없다. 
## 대립가설 : 두 양적 자료 간의 선형의 관계가 있다.
## cor.test(데이터명$변수명, 데이터명$변수명)
## 피어슨 표본 상관분석. 
cor.test(cars$speed, cars$dist)
cor.test(cars$speed, cars$dist, method = "kendall")  # 켄달 
cor.test(cars$speed, cars$dist, method = "spearman") # 스피어만 
## 자나깨나 분포. 
# data:  cars$speed and cars$dist
# t = 9.464, df = 48, p-value = 1.49e-12
# 95 percent confidence interval: 0.6816422 0.8862036
#통계적으로 스피드와 제동커리는 통계에 유의한 상관관계가 있는것으로 나타났고 그 관계는 매우 높은 관련성이 있다. 

# 몇번은 t값을 스스로 계산해 보아야 한다!!



#-------------------------------------------------------------------------------------# 

# 예제 데이터 : attitude
View(attitude)

## 1단계 : 산점행렬도, 행렬산점도
## Scatter plot matrix, matrix scatter plot
## Plot(데이터명[, index])
plot(attitude)

## 2단계 : 상관계수 행렬, 행렬 상관계수
## cor(데이터명, [ ,index])
cor(attitude)
round(cor(attitude) , digits = 3)
DT::datatable(round(cor(attitude), digits = 3))

## 3단계 : 상관분석
cor.test(attitude$rating, attitude$complaints) # 이렇게 일일히 하기 힘듬. #기본 : 피어슨.
library(psych) 
# psych::corr.test(데이터명[ , index]) #slicing 잘해서.
psych::corr.test(attitude) #양적자료

library(Hmisc)
## Hmisc::rcorr(as.matrix(데이터명[, index])) #matrix로 해야한다. (matrix 원소중에 하나가 char 이면 다 char이 되는 행과 열로 된 것.)
Hmisc::rcorr(as.matrix(attitude)) ## attitude 는 원래 dataframe 이다. 

## 켄달
cor.test(attitude$rating, attitude$complaints, method = "kendall")

## 스피어만
cor.test(attitude$rating, attitude$complaints, method = "spearman")


##-------------------가시화-------------------##
corrplot(attitude, method="number") # 수와 색깔로 표현
col<-colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(attitude, 
         method="color",   # 색깔로 표현
         col=col(200),     # 색상 200개 선정
         type="lower",     # 왼쪽 아래 행렬만 표기
         order="hclust",   # 유사한 상관계수끼리 군집화
         addCoef.col="black", # 상관계수 색깔
         tl.col="black",   # 변수명 색깔  
         tl.srt=45,        # 변수명 45도 기울임
         diag=F)           # 대각행렬 제외