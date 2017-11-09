library(data.table)
library(ggplot2)

diamondsDT = as.data.table(diamonds)


diamondsDT[ , .N, by = cut] #V1
diamondsDT[ , list(mean(price)), by = cut] #V2
diamondsDT[ , list(n = .N, Mean = mean(price), SD = sd(price)), by = cut] #cut =  품질별로. 데이터에 대한 개수, 표준편차 
diamondsDT[ , list(n = .N, Mean = mean(price), SD = sd(price)), by=list(cut,color)]


# 데이터명[데이터명$변수명 >= upper]
# 데이터명[데이터명$변수명 >= %in%냐, ]$변수명= 6  #6,7,8을 갖는것을 가지고 6으로 바꾼다 

lapply(데이터명, mean)
apply(데이터명[ , index], 2, mean)
#원데이터는 버리면 안된다.

[ R공부 : 여러 개의 변수를 모두 factor로 변경하기 ]
데이터에 있는 특정 변수나 모든 변수들을 요인(factor)으로 변경하는 방법은 다음과 같다.
## 1. 변수의 위치를 아는 경우
index = c(1, 2, 7)
DF[ , index] = lapply(DF[ , index], factor)
## 2. 변수명을 아는 경우
variableNames = c("gender", "bloodType", "religion")
DF[ , variableNames] = lapply(DF[ , variableNames], factor)
## 3. 모든 변수를 요인(factor)으로 변경하기
DF[ , colnames(DF)] = lapply(DF[ , colnames(DF)], factor)