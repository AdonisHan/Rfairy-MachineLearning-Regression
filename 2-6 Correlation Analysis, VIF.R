#########################################################
### 수업내용 : 회귀분석 (Correlation Analysis)       ####
#########################################################

## 언제 : 인과관계(원인과 결과)
##        예측(Prediction), 분류(Classification)

## 종속변수 = 반응변수 ****
## 독립변수 = 설명변수 

## 단순선형회귀분석 : 종속변수 1개(양적자료), 독립변수 1개
## 다중선형회귀분석 : 종속변수 1개(양적자료), 독립변수 2개 이상.


## 1. 단순선형회귀분석
## 예제 데이터 : cars
## 변수명      : speed, dist
## 종속변수 : dist
## 독립변수 : speed

## 회귀모형 : dist = beta0 + beta1*speed + error
# beta1이 클 수록 영향을 많이 준다.

## 통계는 다름을 보는것이다. 
## 다름이 뭘까?
## 다름은 왜 생겨났을까? 

## 회귀분석결과물 = lm(종속변수 ~ 독립변수, data = 데이터명)
## summary(회귀분석결과물)
cars.lm =lm(dist ~ speed, data=cars)
# 출력 : F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12
summary(cars.lm) #list

##회귀분석의 결과를 해석하는 방법 #
## 1단계 : 회귀모형은 통계적으로 타당한가?
## 귀무가설 : 회귀모형은 타당하지 않다.
## 대립가설 : 회귀모형은 타당하다.

## 1단계의 결론 : 대립가설(회귀모형은 통계적으로 타당하다.)

## 만약에 1단계의 결론이 귀무가설이면 회귀분석은 끝.

## 2단계 : (1단계의 결론이 대립가설일 때)
## 독립변수는 종속변수에게 영향을 주는가?
## 귀무가설 : 독립변수는 종속변수에게 영향을 주지 않는다. 
## 대립가설 : 독립변수는 종속변수에게 영향을 준다.
summary(cars.lm)
## Coefficients:
#               Estimate  Std. Error t value   Pr(>|t|)    
# (Intercept) -17.5791     6.7584    -2.601   0.0123 *  
#   speed       3.9324     0.4155     9.464   1.49e-12 ***
# Sol : Bhat = 3.932

## 2단계의 결론: 유의확률 0.000이므로 유의수준 0.05에서
## 독립변수는 종속변수에게 (통계적으로 유의한) 영향을 준다. 

## 3단계 : 독립변수는 종속변수에게 어떠한 영향을 주는가?

## 독립변수의 회귀계수 (Coefficient of Regression) : 3.932
## 독립변수의 기본단위가 1증가하면 
## Speed가 1mph(1mile per hour) 증가하면 
## dist는 약 3.932 feet 증가한다. 
## 종속변수는 약 3.93 정도 증가한다.

## 4단계 : 예측(Prediction)
##              Estimate   
# (Intercept) -17.5791 
## dist = -17.5791 + 3.9324*speed
## predict(회귀분석결과, newdata = data.frame(speed=),)
predict(cars.lm, newdata = data.frame(speed = 200), interval = "predict")
# 출력 : 768.9027 

## 5단계 : 회귀모형의 설명력 = 독립변수의 설명력
## R-square = 결정계수. Multiple R-squared:  0.6511,
## 0.651 => 0.651*100 65.1%
## speed가 dist의 다름을 약 65.1% 설명한다. 

##---------------------------------------------------------------------------------##

## 예제 데이터 : attitude
## 종속변수 : rating
## 독립변수 : 6개

## 회귀모형 : rating = beta0 + beta1*complaint + ... +beta6*advance + error

## 회귀분석결과물 = lm(rating ~ complaints + ... +advance, data= 데이터명)
## 회귀분석결과물 = lm(rating ~ ., data= 데이터명)
## summary(회귀분석결과물)

attitude.lm = lm(rating ~ .,data=attitude)
lm(attitude.lm)

##회귀분석의 결과를 해석하는 방법 #
## 1단계 : 회귀모형은 통계적으로 타당한가?
## 귀무가설 : 회귀모형은 타당하지 않다.
## 대립가설 : 회귀모형은 타당하다.

## 1단계의 결론 : 대립가설(회귀모형은 통계적으로 타당하다.)

## 만약에 1단계의 결론이 귀무가설이면 회귀분석은 끝.

## 2단계 : (1단계의 결론이 대립가설일 때)
## 독립변수(각각)는 종속변수에게 영향을 주는가?
## 귀무가설 : 독립변수는 각각은 종속변수에게 영향을 주지 않는다. 
## 대립가설 : 독립변수는 각각은 종속변수에게 영향을 준다.
summary(attitude.lm)
## Coefficients:
Coefficients:
#                Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 10.78708   11.58926   0.931 0.361634    
# complaints   0.61319    0.16098   3.809 0.000903 ***
#   privileges  -0.07305    0.13572  -0.538 0.595594    
# learning     0.32033    0.16852   1.901 0.069925 .  
# raises       0.08173    0.22148   0.369 0.715480    
# critical     0.03838    0.14700   0.261 0.796334    
# advance     -0.21706    0.17821  -1.218 0.235577  

## 2단계의 결론: 유의확률 0.000이므로 유의수준 0.05에서
## 독립변수는 종속변수에게 (통계적으로 유의한) 영향을 준다. 

## 변수선택 방법
## 1. 전진선택법 (Forward Selection)
## 2. 후진 제거법(Backward Elimination) 독립변수 넣고 독립변수 빼는것. 더 이상 기준 만족되는 것 없으면 모형.
## 3. 단계 선택법(Stepwise Selection) 

## step(회귀분석결과물, direction = c("forward", "backward", "both"))
model.forward = step(attitude.lm, direction = "forward")
model.backward = step(attitude.lm, direction = "backward") # AIC 가 작을수록 잘 나온것. backward가 좋은것
model.stepwise = step(attitude.lm, direction = "both")
summary(model.backward) #complaints 만 영향을 준다. P 값보면
model.final = lm(rating ~ complaints, data= attitude)


## 3단계 : 독립변수는 종속변수에게 어떠한 영향을 주는가?
summary(model.final)
#               Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 14.37632    6.61999   2.172   0.0385 *  
#   complaints   0.75461  

## 독립변수의 회귀계수 (Coefficient of Regression) : 0.755
## 독립변수의 기본단위가 1증가하면 
## complaints가 1점 증가하며
## rateing 은 약 0.755 점 증가한다.

## 4단계 : 예측(Prediction)
##              Estimate   
# (Intercept) -17.5791   ->고치기
##  complaints = -17.5791 + 3.9324*rating ->고치기
## predict(회귀분석결과, newdata = data.frame(speed=),) ->고치기
predict(attitude, newdata = data.frame(complaints = 5), interval = "predict")
# 출력 : 768.9027 

## 5단계 : 회귀모형의 설명력 = 독립변수의 설명력
## R-square = 결정계수. Multiple R-squared:  0.6511, ->고치기
## 0.651 => 0.651*100 65.1% ->고치기
## complaints가 rating의 다름을 약 68.1% 설명한다. ->고치기

## 최종 회귀모형에 독립변수가 2개 이상 포함이 되면
## 1. 회귀계수의 해석
## 독립변수1은 나머지 독립변수들이 고정되어 있을 때에
## 독립변수1의 기본단위가 1 증가하면 종속변수는 약 얼마 증가/감소한다. 

## 2. 다중공선성(Multicollinearity)
## 가정 : 독립변수들 간의 선형의 관계는 없어야 한다.
## VIF : 10이상이면 다중공선성이 존재한다고 판단
##       독립변수들 간에 선형의 관계가 존재함.
## 만약에 이런 결과가 나오면 독립변수들 중에 빼는 것을 검토. 

## 회귀분석의 결과. 
# car:vif
library(car)
library(lm.beta)
car::vif(attitude.lm) # VIF(varaince inflation factor)

## 3. 회귀모형의 설명력 : Adjusted R-Square

## 4. 독립변수들의 영향력 크기 비교. 

## 표준화된 회귀계수
# 영향력을 예측하고 위치를 바꿀 수 있는 방법. 평균- 표준편차 로 해서 표준화 하여 비교할 수 있다.
##lm.beta::lm.beta(회귀분석결과물)
lm.beta::lm.beta(attitude.lm)

# lm(formula = rating ~ ., data = attitude)
# 
# Standardized Coefficients::
#   (Intercept)  complaints  privileges    learning      raises    critical     advance 
# 0.00000000  0.67072520 -0.07342743  0.30887024  0.06981172  0.03119975 -0.18346445 

# 절대값 rating에서 complaint가 가장 큰 영향을 준다. 
