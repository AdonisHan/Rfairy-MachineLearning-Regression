#############################################
### 수업내용 : 기초 데이터 분석           ###
###                                       ###
### 작 성 자 : adonis han                 ###
### 작성일자 : 2017년 7월 20일 (목)       ###
#############################################

## 예제 데이터 : hflights::hflights
# --> https://cran.r-project.org/web/packages/hflights/index.html

options(repos = "http://cran.rstudio.com") #default

##---download---install.packages("hflights")

##---download---install.packages("ggplot2")
##---download---install.packages("lattice")
##---download---install.packages("plotly")
##---download---install.packages("prettyR")
##---download---install.packages("ggmap")
##---download---install.packages("ggmap")
##---download---install.packages("psych")
# package 추천 : 그래픽 : ggplot2, lattice, plotly , googleVis, ggmap ,prettyR
library(hflights)
library(prettyR)
library(ggplot2)
library(lattice)
library(plotly)
library(googleVis)
library(ggmap)
library(hflights)
library(psych)
##---library(readxl)
##---library(data.table)
library(DT)
##---library(openxlsx)

## 데이터 일부 보기
DT::datatable(head(hflights))


## 자료의 종류 :  통계적인 관점
## 질적 자료 VS 양적 자

## 질적 자료 : 글자(문자)
## 기준 : 숫자가 의미가 있는가? (+ , -)
## 양적 자료 : 숫자 ()

## 정의(Definition)


##작업공간 설정
getwd()
setwd("C:\\Users\\ADO\\Dropbox\\RFairy [Dropbox]\\data")
#############################################
### I 일변량(Uni-variate)####################
#############################################

## 1. 표 = 빈도표 : 빈도(frequency), 백분율(present)
# (1) 빈도 : table(데이터명$변수명)
table(hflights$Month) ##월별 현호
sort(table(hflights$Month), decreasing = TRUE) #
# 7     8     6     3     5    12     1    10     4     9    11     2 
# 20548 20176 19600 19470 19172 19117 18910 18696 18593 18065 18021 17128


# (2) 백분율 = (빈도/합계)*100
## prop.table(빈도결과)*100 <-빈
## 결과가 백터이기 때문에 바꿔준다.
## 백분율
prop.table(table(hflights$Month))*100  

hflightsMonth <- sort(prop.table(table(hflights$Month))*100 , decreasing = TRUE) #---(A)

# 7        8        6        3        5       12        1       10        4        9       11        2 
# 9.032247 8.868727 8.615536 8.558392 8.427401 8.403225 8.312234 8.218166 8.172891 7.940799 7.921458 7.528924

## 반올림하기!!
#round( , digits = 1)
hflightsMonth <- round(sort(prop.table(table(hflights$Month))*100 , decreasing = TRUE) , digits = 1) #--(B)

# 7   8   6   3   5  12   1  10   4   9  11   2 
# 9.0 8.9 8.6 8.6 8.4 8.4 8.3 8.2 8.2 7.9 7.9 7.5 

# month.table이라고 만들어서 (A), (B) freq(빈도) / percent(백분율) 으로 이름 바꿈
month.table = cbind(freq = sort(table(hflights$Month) , decreasing = TRUE) , 
                    percent = round(sort(prop.table(table(hflights$Month))*100 , decreasing = TRUE) , digits = 1))

# freq = sort(table(hflights$Month), decreasing = TRUE)
# percent <-  hflightsMonth
# month.table <- cbind(freq, percent)

DT::datatable(month.table)


## month.table 데이터를 csv로 저장하기 - 디렉토리 setwd(d:/)
write.csv(month.table, file = "month.csv") #R로 저장된 데이터임. 


##목적지의 현황을 내림차순으로 백분율 한다음에 csv로 저장.
dest.table = cbind(freq = sort(table(hflights$Dest) , decreasing = TRUE) , 
                    percent = round(sort(prop.table(table(hflights$Dest))*100 , decreasing = TRUE) , digits = 1))
DT::datatable(dest.table)
write.csv(dest.table, file = "dest.csv")
## 2. 그래프 : 막대그래프(세로, 가로), 원그래프
## (1) 막대그래프 : barplot(빈도결과)
barplot(sort(table(hflights$Month) , decreasing = TRUE))

# 막대 색깔 : col="막대색" col="black" rainbow도 있음.
barplot(sort(table(hflights$Month) , decreasing = TRUE), col= rainbow(12))

# 제목 : main = "제목" sub = "부제목"
barplot(sort(table(hflights$Month) , decreasing = TRUE), col= "lightblue", main="monthly status")

# y축제목 : ylab = "축 제목" xlab = "축 제목 " label
barplot(sort(table(hflights$Month) , decreasing = TRUE), 
        col= "lightblue", 
        main="monthly status",
        ylab = "flight times", xlab = "month")

# y축의 눈금  : ylim= c(최소값, 최대값) ylimit
barplot(sort(table(hflights$Month) , decreasing = TRUE), 
        col= "lightblue", 
        main="monthly status",
        ylab = "flight times", xlab = "month", 
        ylim = c(0,25000))

# 가로막대 : horiz = TRUE
## horiz : horizontal의 약자  / x와 y를 바꾸고 오름차순으로 바꿔야한다.
barplot(sort(table(hflights$Month) , decreasing = FALSE), 
        col   = "lightblue", 
        main  ="monthly status",
        xlab  = "flight times", ylab = "month",
        xlim  = c(0,25000),
        horiz = TRUE)

## (2)원그래프 : pie(빈도결과 )
pie(sort(table(hflights$Month) , decreasing = TRUE))

## 반지름 : radius=0.8 <-default
pie(sort(table(hflights$Month) , decreasing = TRUE), 
    radius = 1)

## 첫째 조각의 각도 : init.angel=
pie(sort(table(hflights$Month) , decreasing = TRUE), 
    radius = 1,
    init.angle = 90)


# package 추천 : 그래픽 : ggplot2, lattice, plotly , googleVis, ggmap

# 복습
# 1. 일변량 질적 자료의 분석
# (1) 표 :  빈도, 백분율
# table(데이터명$변수명 )->sort()
# prop.table(빈도)*100 -> sort(), round()
# (2) 그래프: 막대그래프, 원그래프
# barplot(빈도),pie(빈도) 
# radius, angel

##prettyR::freq() 빈도()
prettyR::freq(hflights$Month,
              display.na =FALSE
              )
#월별 빈도와 백분율만 나옴
#display.na 유효백분율 출력 안할것 
#decr.order = FALSE 를 주면 내림차순 아님 
##############################################
#2. 일변량 양적 자료의 분석 (분포표와 비슷 )##
##############################################
# (1) 표 빈도표(구간의 빈도, 백분율)
# (2) 그래프 : 히스토그램, 상자그램 =
# (3) 기술통계량 = 요약통계

## (1) 표 : 구간의 빈도, 백분율 
DT::datatable(head(hflights))

##missing value 지워라 na.rm
##(최소, 최대값) range 
ArrDelay.range = range(hflights$ArrDelay, na.rm = TRUE)
# 출력 -70 70분 일찍  978분 딜레이 

##구간의 개수 정하기. sturge's fomula
length(hflights$ArrDelay)
interval.count = 1 + 3.3*log10(length(hflights$ArrDelay))
# 출력 [1] 18.67801

## 루트 sqrt() square root 방식으로도 구간 정해볼수 있다. (사용안함) 
sqrt(length(hflights$ArrDelay))
# 출력 [1] 476.9654

##구간의 폭 = 계급의 폭
## range/ 구간의 개수  
# diff = 최대값(range) - 최소값(range)
diff(ArrDelay.range) / interval.count
# diff(range(hflights$ArrDelay, na.rm = TRUE)) / (1 + 3.3*log10(length(hflights$ArrDelay)))
# [1] 56.10875  -> 60분 간격정도씩 자르면 좋겠다.


##뷰 보기.
##질
hflights$ArrDelay.group = cut(hflights$ArrDelay,
                              breaks = seq(from= -120, to=1020, by=60), ##-120분부터 1020분까지 60분간격으로 보여줘  
                              right = FALSE) ##구간의 정도 right = False 이상, 미만 ( ] 

table(hflights$ArrDelay.group)
sort(table(ArrDelay.group), decreasing = TRUE)
#보면 60분 전 후 구간의 딜레이가 제일 많다.

## 2, 그래프
## (1) 히스토그램
## i. hist(데이터명$변수명 ) : #sturge fomula 알고리즘이 들어간것 1+3.3*log10() 구간개수 정하기 
hist(hflights$ArrDelay) 

## ii. hist(데이터명$변수명, breaks = 구간의 개수)
hist(hflights$ArrDelay, 
     breaks = 50) 

## iii. hist(데이터명$변수명, breaks = 구간의 정보)
##-120분부터 1020분까지 60분간격으로 보여줘
hist(hflights$ArrDelay, 
     breaks = seq(from= -120, to=1020, by=60),
     xlim = c(-120, 1020)) 

## (2) 상자그림(Boxplot) : 이상치 유무
## i. boxplot( 데이터명$변수명 )
boxplot(hflights$ArrDelay)


## ii. 집단별 상자그림
## boxplot(데이터명$변수명 ~ 데이터명$변수명)
## boxplot(양적자료~ 질적자료)
## factor 형태로 와야한다. 간

##공항별 도착지연시간 
boxplot(hflights$ArrDelay ~ hflights$Origin)

## 월별 도착지연시간
boxplot(hflights$ArrDelay ~ hflights$Month)


## 3. 기술통계량 - 요약통계량
## Descriptive Satistics = Summery Statistics.

## 모수 (Parameter ) VS 통계량 (Statistics)
## 모집단 (Population ) VS 표본 (Sample)

## (1) 중심 = 대표값.
## 평균, 절사평균, 중위수(중앙값), 최빈수(최빈값)
## 중심을 무엇으로 볼까?? 
## i. 평균 : mean(데이터명$변수명, na.rm=TRUE)
 mean(hflights$ArrDelay)
# [1] NA
# 도착지연에 관해 없는 데이터도 있기때문에.

mean(hflights$ArrDelay, na.rm = TRUE)
# 7.094334 대부분의 비행기는 약 7분정도 늦었구나

##ii. 5% 절사평균(Trimmed Mean) 절단된 평균
## mean(데이터명$변수명, trim=0.05, na.rm = TRUE) 5%
ArrDelay.mean <-mean(hflights$ArrDelay, trim=0.05, na.rm = TRUE)
## 약간제거 3.121585

## iii. 중위수 : median(데이터명$변수명, na.rm=TRUE)
ArrDelay.median <-median(hflights$ArrDelay, na.rm = TRUE)
## 반반으로 해서 0  
## 반반 했을때 0분이고 평균은 7분이니 ~~ 하지 않을까??

## iv. 최빈수(Mode)
## which.max(table(데이터명$변수명)) #table - 빈도 
which.max(c(10,5,3,200))
## 출력 4 : 4번


which.max(table(hflights$ArrDelay))
## 출력: -4 / 4분 일찍 도착한게 가장 많았다.
#  빈도 / 백분율 한 것중 가장많은게 -4 때 인것이다. 
#table(hflights$ArrDelay) 중 -4가 7777개로 가장 많음. 최빈수 

##prettyR::Mode() #최빈수
prettyR::Mode(hflights$ArrDelay)
# 출력: -4 / 4분 일찍 도착한게 가장 많네요.



## (2) 퍼짐 = 산포 = 다름
## 범위, 사분위범위(IQR), 분산, 표준편차(평균이랑 얼마나 다를까, 이상치 영향을 많이 받는다.)
## 중위수 절대 편차 (중위수랑 얼마나 다를까?)

## i. 범위(Range) 원래는 (최대값 - 최소값) 이지만, R에서는 최소값, 최대값으로 나온다.
range(hflights$ArrDelay, na.rm = TRUE)
# -70 978 최소 최대
diff(range(hflights$ArrDelay, na.rm = TRUE))
# 출력시, 978 - (-70 ) =1048

## ii. 사분위범위 (IQR= Inter Quartile Range) // Q3-Q1 
## IQR(데이터명$변수명)
IQR(hflights$ArrDelay, na.rm = TRUE)
## 출력 19 // 약 19분정도 다르네요. 20분정도안에서 비슷비슷하게 오네요.

## iii. (표본)분산(Variace)
## var(데이터명$변수명, na.rm = TRUE)
var(hflights$ArrDelay, na.rm = TRUE)
## 출력 943분 // 분의 제곱

## iv. (표본) 표준편차(SD : Standard Deviation)
## sd(데이터명$변수명, na.rm =TRUE)
sd(hflights$ArrDelay, na.rm = TRUE)
## 출력 31분 / 평균이 한 7분정도 늦는데 평균에서 31분정도 차이가 나요.
# 7 - 31 = ~ 약 -23분 ~ 37 분 에서 다들 도착하더라.

## v. 중위수 절대 편차(MAD : Median Absolute Deviation)
# 이상치가 있을 때는 중위수는 대피해준다. 그러나 표준편차, 평균은 영향을 많이 받기 때문에 중위수를 사용한다.
## mad(데이터명$변수명, na.rm = TRUE)
mad(hflights$ArrDelay, na.rm = TRUE)
## 출력 13분. 안전한데, 이상치 영향받는 표준편차는 31
## 비행기가 오는시간은 13분 일찍오거나 늦게오는구나~. 


## (3) 분포의 모양
## i. 왜도(skewness) : 대칭여부
## ii. 첨도(Kurtosis): 중심이 얼마나 뾰족한가?
## R의 기본기능에서는 못 구한다. 
## psych::describe(), describeBy()


psych::describe(hflights$ArrDelay)
#   vars      n mean    sd median trimmed   mad min max range skew kurtosis   se
# X1    1 223874 7.09 30.71      0    1.85 13.34 -70 978  1048 5.04    55.57 0.06
View(psych::describe(hflights$ArrDelay))


##psych::describe(데이터명$변수명, 데이터명$변수명)
##psych::describe(양적자료, 질적자료)
psych::describe(hflights$ArrDelay, hflights$Month)

# vars      n mean    sd median trimmed   mad min max range skew kurtosis   se
# X1    1 223874 7.09 30.71      0    1.85 13.34 -70 978  1048 5.04    55.57 0.06
# There were 11 warnings (use warnings() to see them)
##psych::describe(hflights$ArrDelay)

## se는 Standard Error. 표준오차!
# 지금 표본에서 평균이 7분 나왔는데, 다른 표본을 뽑으면 평균이 지금 표본의 평균과 달라지겠죠?
# 그럼 얼마나 달라질까를 알려주는 값!.



##summary(데이터명$변수명)

# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 1.000   4.000   7.000   6.514   9.000  12.000 
##양적 자료
summary(hflights$Month)
hflights$Month = as.factor(hflights$Month)
summary(hflights$Month)
##숫자에서 요인으로 바꾸면 집단별로 인식 
## 데이터 특징을 알아서 살려준다.
summary(hflights)


## by(양적자료, 질적자료, 함수명)
by(hflights$AirTime, hflights$Origin, mean, na.rm=TRUE)
#평균 

by(hflights$AirTime, hflights$Origin, sd, na.rm=TRUE)
#표준편차

by(hflights$AirTime, hflights$Origin, summary, na.rm=TRUE)
##summery

by(hflights$AirTime, hflights$Origin, describe, na.rm=TRUE)
##describe

# ()
# 실행도 되고, 결과도 출력해!
x=3
x
(x=3)
