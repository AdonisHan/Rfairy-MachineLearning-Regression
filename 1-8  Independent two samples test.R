##############################################################
### 수업내용 : 독립2표본 검정(Independent two samples test####
##############################################################

## 두 모집단의 평균이 어느 한 쪽이 큰 지, 작은 지, 같지 않은 지를
## 통계적으로 검정하는 방법. 
# 독립변수는 연구자가 의도적으로 변화시키는 변수를 말한다.
# 종속변수는 연구자가 독립변수의 변화에 따라 어떻게 변하는지 알고 싶어하는 변수이다.
# quantitative data
# 양적 자료, 정량적 데이터, 수량 데이터
# qualitative data, categorical data
# 질적 자료, 정성적 데이터, 카테고리 데이터, 카테고리컬 데이터, 범주형 자료

# 1.양적자료 
# 수량
# 서열이 있음
# 서열척도, 등간척도, 비율척도
# 수치로 측정 가능한 자료
# 예: 나이, 무게, 가격

# 2 질적 자료[편집]
# 수치로 측정하기 어려운 자료
# 서열이 없음
# 명목척도
# 예: 성별, 취미, 국가
# 질적 자료 

# 질적자료1개 : 표 ,그래프(막대, 원그래프 )
# 양적자료1개 : 표, 그래프(히스토,상자), 기술통계량
# 가설검정

# 양적 자료 1개: 일표본 검정
# -one sample t-test
# -Wilcoxon's signed rank test

# 양적 자료 1개, 질적 자료 1개(값이 2가지 인 경우 )
#  : 독립 2표본 검정 
# - 독립 2표본 T검정 
# - Wilconxon's rank sum test = Mann-Whitney U-Test

# 양적 자료 1개, 양적 자료 1개 : 사전, 사후의 양적 자료
# 동일한 대상자에게 x의 양적 자료, y의 양적 자료. 
# : 대응 2표본 검정
#  - 대응 2표본 T검정
#  - Wilcoxons's signed rank test

# 양적 자료 1개, 질적 자료 1개. (값이 3가지 이상 인 경우)
#  - 분산분석
#  - Kruskal-Wallis rank sum test

# 양적 자료 1개, 또다른 양적 자료 1개 : 관련성 (을 확인하고 싶을때 )
# - 상관분석

# 질적 자료 1개, 질적 자료 1개 : 관련성
# - 교차분석  = 카이제곱검정 = Chi-Square test 

# 양적 자료 1개(종속변수), 양적 자료 1개(독립변수) : 인과관계
# - (단순선형)회귀분석.

# 양적 자료 1개(종속변수), 
# 양적 자료 1개이상 , 질적 자료 1개이상(독립변수) : 인과관계
# - (다중선형)회귀분석.

# 질적 자료 1개(값이 2가지인 경우) (종속변수)
# 양적 자료 1개 이상, 질적 자료 1개 이상 (독립변수)
# - 이분형 로지스틱 회귀분석 - sigmoid function 

# 질적 자료 1개(값이 3가지인 경우) (종속변수)
# 양적 자료 1개 이상, 질적 자료 1개 이상 (독립변수)
# - 다분형 로지스틱 회귀분석

# softmax function 다분형 로지스틱 회귀분석

id = 1:13
gender = c("m","f","f","f","m",
           "m","m","m","f","m",
           "m","m","m"
           )
money = c(30,50,50,60,70,
          30,70,40,50,70,
          60,40,50)
st2 = data.frame(id, gender, money)
st2

## 1단계 : 갹 집단별 정규성 검정
## by(데이터명$변수명, 데이터명$변수명, shapiro.test)
## by(양적자료, 질적자료, shapiro.test)

by(st2$money, st2$gender, shapiro.test)

## 결론 : 정규성 가정이 만족됨


## 2단계 : 등분산성 검정(Equality of Variance Test)
## 귀무가설 : 등분산이다.
## 대립가설 : 이분산이다.

## var.test(데이터명$변수명 ~ 데이터명$변수명)
## var.test(양적자료 ~ 질적자료)

var.test(st2$money ~ st2$gender)

# 결론 : 등분산이다. 정규성검정에서 YES 이기때문에. 

# ## 3단계 : 등분산이 가정된 독립 2표본 T검정. 
# t.test(데이터명$변수명 ~ 데이터명$변수명,
#           alternative =,
#           var.equal=TRUE) 두집단의 분산은 같다.

t.test(st2$money ~ st2$gender,
       alternative = "two.sided",
       var.equal = TRUE)

# --------출력---------
# Two Sample t-test
# 
# data:  st2$money by st2$gender
# t = 0.15766, df = 11, p-value = 0.8776 #t=0.16 
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -18.00008  20.77786
# sample estimates:
#   mean in group f mean in group m 
# 52.50000        51.11111  X1 bar 52, x2bar 51

## 결론
## 유의수준이 0.87 이므로 유의수준 0.05에서
## "성별에 따라 용돈에 차이가 없다# 는 귀무가설을 기각할 수 없다.
## 성별에 따라 용돈에 통계적으로 유의한 차이는 없는 것으로 나타났다.

## 만약에 정규성 가정이 만족되고
## 이분산이라면 
## 3단계 : 이분산이 가정된 독립 2표본 T검정. 
# t.test(데이터명$변수명 ~ 데이터명$변수명,
#           alternative =,
#           var.equal=FALSE) 두집단의 분산은 같다.

t.test(st2$money ~ st2$gender,
       alternative = "two.sided",
       var.equal = FALSE)
#  Pvalue - 0.82 이면 많이 읽어난것. 귀무가설일때 흔하게 나타날수 있다. 귀무가설을 유지한다.
t.result = t.test(st2$money ~ st2$gender,
                  alternative = "two.sided",
                  var.equal = FALSE)

## 출력 
str(t.result) #structure

##윌콕스--
## 만약에 정규성검정이 깨졌다면
## 2단계 : 윌콕슨의 순위합 
# wilcox.test(데이터명$변수명 ~ 데이터명$변수명,
#           alternative = ) 

wilcox.result = wilcox.test(st2$money ~ st2$gender,
                  alternative = "two.sided" )
str(wilcox.result)

## Wilcoxon's rank sum test
## Mann-Whitney test
