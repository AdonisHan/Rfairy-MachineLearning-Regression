##############################################################
### 수업내용 : 독립k표본 검정(Independent k - samples test####
##############################################################

##download ---- install.packages("nparcomp") 비모수 패키지.
library(nparcomp)
## 세 이상의 모집단의 평균이 다른지를 통계적으로 검정하는 방법.

## 귀무가설 : 살충제의 종류(6가지)에 따라 살충 효과는 없다.
## 대립가설 : 살충제의 종류에 따라 살충 효과가있다.
# R은 for문을 쓰지않아도. vectorization 으로 
# 각집단의 순위, 순위간의 합 -> chi square.

## 예제 데이터 : InsectSprays
## 변수명 : count, spray


data("InsectSprays")
InsectSprays

## 1단계 : 정규성검정
by(InsectSprays$count, InsectSprays$spray, shapiro.test)
## c 깨졋네. -> krustkal wallis 로 가자. 

## 결론 : 정규성 가정이 깨짐.


## 2단계 : 비모수(Kruskal-Wallis test)

## kruskal.test(데이터명$변수명 ~ 데이터명$변수명)
## kruskal.test(양적자료  ~ 질적자료)
kruskal.test(InsectSprays$count ~ InsectSprays$spray)

## 결론 : 유의확률이 0.0000 이므로 유의수준 0.05에서 
#---출력 Kruskal-Wallis chi-squared = 54.691, df = 5, p-value = 1.511e-10
## 살충제의 종류에 따라 통계적으로 유의한
## 살충 효과가 있는 것으로 나타났다. 


kruskal.test(count ~ spray, data=InsectSprays)
p-value = 1.511e-10
# 귀무가설에서는 안 일어난다여야하는ㄷ --> 일어났다고 친다. (대립가설)
# 양적~질적.


## 3단계 : 다중비교 (Multiple Comparisons)
##       = 사후분석 (Post-Hoc) 
# 이중에서 무슨 차이가 누구와 차이가 있는지 궁금할때, 2개씩 계속 비교.

#---패키지사용 
## nparcomp::nparcomp(변수명 ~ 변수명, data = 데이터명 )
## nparcomp::nparcomp(양적자료 ~ 질적자료, type = "Tukey",data = 데이터명 )
##non-parametric 비모수-다중비교 패키지
nparcomp::nparcomp(count ~ spray, type = "Tukey", data = InsectSprays)



############################################################################################################



## 만약에 정규성 가정이 만족되었다면
## 2단계 : 분산분석 (ANOVA : Analysis of Variance)
## 분산분석결과 = aov(변수명 ~ 변수명, data=데이터명)
## summary(분산분석결과)

anova.result = aov(count ~ spray, data = InsectSprays)
summary(anova.result)
# SSE = 집단내 제곱합 
# SSB = 집단 제곱합. 
# MSB = Sq / df 
# F = MSB / MSE
#----출력----#----출력----#----출력----#----출력----#----출력----#----출력----#----출력----
#              Df   Sum         Sq       Mean Sq      F value  Pr(>F)    
# spray        5   2669 <SSB  2669/5 = 533.8(MSB)    34.7 <    2e-16 *** 2의 -16승이면 0,0000 
#                                                              즉 34.7이면 훨씬 크니까 대립. 
# Residuals    66   1015 <SSE  1015/66 =  15.4(MSB) #F = 533. 8 / 15.4 = 34.7

# 결론 대립가설이다. 지받ㄴ간에 통계적으로 유의한 차이가 있는것이다. 살충제마다 효과가 다르다.

# 만약에 정규성 가정이 만족이 되고
# 집단 간에 차이가 있다고 결론이 나면

## 3단계 : 다중비교 = 사후비교 
# 정규성이 만족되었을 때의 분산분석 또한 만족되었을 때의 다중비교
# TukeyHSD(분산분석결과) 
TukeyHSD(anova.result)
#-----------------------출력-----------------------
# Fit: aov(formula = count ~ spray, data = InsectSprays)
# 
# $spray
#           diff        lwr       upr     p adj
# B-A   0.8333333  -3.866075  5.532742 0.9951810 B가 더 죽였지만 매우 흔하다. 0,99 이니 차이가 없다.
# C-A -12.4166667 -17.116075 -7.717258 0.0000000 A가 더 효력이 있다. A-C 0.00이니 차이가 없다.
