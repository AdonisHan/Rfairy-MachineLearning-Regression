###############################################
### 수업내용 : 일표본 검정 (One sample test)
### 작성자 : Adonis Han
###############################################

## 언제 : 하나의 모집단의 평균이 통계적으로 유의하게 커졌는지, 
## 작아졌는지, 달라졌는지를 검정하는 방법.

## 유리한것 해보면 사기--그래서 대립가설을 세운다.

## 귀무가설 : 성인들이 용돈의 평균은 50만원이다. (mu1 = mu2)
## 대립가설 : 성인들의 용돈의 평균은 50만원보다 많다. (mul is not equal m2) 

id = 1:13
money = c(30,50,50,60,70,
          30,70,40,50,70,
          60,40,50
          )
st1 = data.frame(id, money)


## 1 단계 : 정규성 검정(Normality Test )
## 귀무가설 : 정규분포를 따른다. / 모집단은 정규분포이다.
## 대립가설 : 모집단은 정규분포가 아니다. 

## shapiro.test(데이터명$변수명)
shapiro.test(st1$money)

# 출력 - Shapiro-Wilk normality test
# 
# data:  st1$money
# W = 0.90913, p-value = 0.1784

## 정규성 검정의 결론 : 귀무가설이다.
## 정규성 가정의 성립.

##2단계 : 일표본 t 검정(One Sample t-test)
## t.test(데이터명$변수명, 
##        mu = 귀무가설이 참일 때의 모평균, 
##        alternative = 대립가설, )

t.test(st1$money, mu = 50 , alternative = "greater")

## 결론 : 귀무가설이다.
# 성인들의 용돈의 평균은 50만원이다.
# 유의확률이 0.350 이므로 P value
# 유의수준 0.05에서 성인들의 용돈의 평균은 50만원이다.
# 라는 귀무가설을 기각할 수 없다.
# 통계적으로 유의한 차이는 없는 것으로 나타났다.

## 만약에 정규성 가정이 깨졌다면
## 2단계 : 윌콕슨의 부호순위검정(Wilcoxon's signed rank test)
## wilcox.test(데이터명$변수명, 
##        mu = 귀무가설이 참일 때의 모평균, 
##        alternative = 대립가설 )

wilcox.test(st1$money, mu = 50, alternative = "greater")
# V = 26, p-value = 0.3575 
# V 라는 검정통계량을 알고 유의확률 p 보니 0.05 수준에  있지 않기에
# 귀무가설이다. 