#############################################
### 수업내용 : 데이터핸들링 - 데이터전처리###
###                                       ###
### 작 성 자 : adonis han                 ###
### 작성일자 : 2017년 7월 19일 (수)       ###
#############################################

##Data Handling = Data Pre-processing
options(repos = "http://cran.rstudio.com")

##------------------------------------------>>>>

##---download---install.packages("readxl") 
##---download---install.packages("openxlsx") 
##---download---install.packages("data.table")
##---download---install.packages("DT")

##<<<<------------------------------------------

library(readxl)
library(data.table)
library(DT)
library(openxlsx)

## 작업공간 (Working Directory)
## 설정 : setwd("파일위치")
## 위치 확인 - getwd()
setwd("d:/")


## 데이터 읽어오기
student = readxl::read_excel(path      = "student.xlsx",
                             sheet     = "data",
                             col_names = TRUE)


##DATA.FRAME 구조이다.
########################
## 1. 데이터 전체 보기##
########################
## (1)View(데이터)
View(student)
## (2) 데이터 : 콘솔(Console)에 출력
student

####################################
## 2. 데이터의 구조(Structure) 보기#
####################################

## str(데이터)
str(student)
# str을 이용해서 수시로 확인.
# Classes ‘tbl_df’s의 언어형테이블, ‘tbl’ 테이블 and 'data.frame':	8 obs. 행이 8개  of  8 variables 열이 8개 :
#   $ (student$id 식으로 불러올수 있) id     : num (넘버)  1 2 3 4 5 6 7 8
#   $ gender : chr (케릭터)  "남" "남" "남" "여" ...

########################
## 3. 데이터 일부 보기##
########################
## (1) head(데이터) 제일 위에 있는 것 보여줌.
#과연 데이터를 잘 읽어왔을까?? 디폴트값으로 6개만 보여준아.
head(student)
head(student, n=3) 
## 3개만 보여줌.
## (2) tail(데이터)
tail(student)
tail(student, n=3)
# 끝에서 6개만 보여줌.

#############################
## 4. 데이터 프레임의 속성 ##
#############################
## (1) 행의 개수 : nrow(데이터)
nrow(student)

## (2) 열의 개수 : ncol(데이터)
ncol(student)

## (3) 행의 이름 : rownames(데이터)
rownames(student)

## (4) 열의 이름 = 변수의 이름 : colnames(데이터)
colnames(student)

## (5) 차원(dimension) : 행 , 열
## dim(데이터)
dim(student)
# [1] 8 8 8행 8열
dim(student)[1] 
# 행 

## (6) 차원의 이름 : 행의 이름, 열의 이름
## dimnames(데이터)
dimnames(student)
# [[1]]
# [1] "1" "2" "3" "4" "5" "6" "7" "8"
# 
# [[2]]
# [1] "id"      "gender"  "age"     "height"  "weight"  "address" "major"   "company"

dimnames(student)[1]
# [[1]] [list]
# [1] "1" "2" "3" "4" "5" "6" "7" "8"
dimnames(student)[[1]]
# vector
# [1] "1" "2" "3" "4" "5" "6" "7" "8"
dimnames(student)[[1]][3]
# "3" vector 3번째 element 가져오기.

########################################
## 5. 데이터(데이터 프레임)의 슬라이싱##
########################################

## 데이터[행index ,열index ]

## (1) 열 (Column)
## 데이터[ , index]
student[ , 1]

## 문제1 : 2, 3, 6번째 열을 가져오세요.
student[ , c(2,3,6)]

# # A tibble: 8 x 3
# gender   age address
# <chr> <dbl>   <chr>
#   1     남    24       A
# 2     남    25       B


## 문제 2 : answp2: 4~8열을 가져오세요.
student[ , 4:8]

## 문제 3 : 짝수번째 열을 가져오세요.
student[ , seq(from=2, to=ncol(student), by=2)]

## 기타
student[ , "weight"]
student[ , c("weight", "height")]

student
# # A tibble: 8 x 8
# id gender   age height weight address  major company
# <dbl>  <chr> <dbl>  <dbl>  <dbl>   <chr>  <chr>   <chr>
#   1     1     남    24     60     60       A   경영  Google
# 2     2     남    25     70     68       B   산업   Apple
# 3     3     남    27     63     62       A   경영      SK
# 4     4     여    24     86     68       A   수학 Samsung
# 5     5     남    29     68     51       B 스포츠    Line
# 6     6     여    31     57     68       A 컴퓨터   iTune
# 7     7     남    28     58     70       B 회계학   Apple
# 8     8     여    21     51     71       A   영어  Amazon

## 변수명에 특정한 패턴이 있는 것을 추출.
## grep("패턴", 문자열)

## 변수명 중에서 'ei'라는 글자를 포함하고 있는 변수명의 위치
grep("ei", colnames(student))
# [1] 4 5
##위치를 알려줌. 

## 변수명 중에서 'ei'라는 글자를 포함하고 있는 변수명
grep("ei", colnames(student), value=TRUE)


## 변수명 중에서 'e'라는 글자를 포함하고 있는 데이터를 추출.
student[ , grep("e", colnames(student))]

## 변수명 중에서 'a' 라는 글자로 시작하는 데이터를 추출.
student[ , grep("^a", colnames(student))]

## 변수명 중에서 't' 라는 글자로 끝나는 데이터를 추출.
student[ , grep("t$", colnames(student))]

## (2) 행
student[1, ]
student[c(1, 3, 4) , ]
student[3:5 , ]
#1 ,4, 7 행
student[seq(from=1, to=nrow(student), by=3)]


## 성별이 여자인 데이터 가져오기
student[student$gender == "여" , ]

## == 같냐?

##으로
student.female = student[student$gender == "여" , ]
student.female

## 문제 4. 거주지가 A이 아닌 사람의 데이터
student[student$address != "A", ]

## 문제 4-1. 몸무게가 60이하인 사람들의 데이터를 가져오기
student[student$weight <= 60 , ]

## 문제 5. 나이가 20대 이상이고, 키는 175 이상인 사람.
student[c(student$age >= 20, student$height >= 175), ] 
student[(student$age >= 20 ) & (student$height >= 175) , ]

#or
student[(student$age >= 20 ) | (student$height >= 175) , ]

## &&은 한번 & 은 모두 / || 은 한번 |은 모두
x = 1:3; y = 4:6
(x > 3) & (y >4)
# [1] FALSE FALSE FALSE
(x > 3) && (y >4)
# [1] FALSE

## (3) 행과 열
student[4:10 , c("weight", "height")]

## 문제7
## 키가 170 이상이고, 몸무게는 60kg 이상인 사람들의
## 변수명에 'e'라는 글자가 들어가는 데이터를 추출하시오.

student[(student$height >= 170) & (student$weight >= 60) , 
        grep("e" , colnames(student))]

########################################
## 6. 새로운 변수 만들기 ###############
########################################


student$bmi = student$weight / ((student$height/100)**2)
student$bmi

## if else(조건문, 참일때 표현식, 거짓일때 표현식)
student$age.group = ifelse(student$age >= 30, "30대 이상", "20대 이상")
## 나이가 삼십 이상이다.

## 문제8
## age.group2 : 20대 초반, 20대 중반, 30대 이상
## 25세 미만이면, 25~29 중반, 30~ 쭉
student$age.group2 = ifelse(student$age >= 30, "30대 이상" , 
                            ifelse(student$age >= 25, "20대 중반", "20대 초반")
                            )

## cut(데이터명$변수명, breaks = 구간정보)
## 더 간편하게 쓸수 있는 것
student$bmi.group = cut(student$bmi,
                        breaks = c(0, 18.5, 23, 25, 30),
                        right = FALSE) ## FALSE[ ), TRUE(DEFAULT) (]
#   ※※※※※TIPS[] 슬라이싱 ()우선순위 {}사용자함
#() 숫자 포함X , [] 숫자포함
#debug - 프로그램 오류를 찾아내서 수정하는것

score = readxl::read_excel(path = "score.xlsx",
                           sheet = 1,
                           col_names = TRUE)
View(score)

score$avg = rowMeans(score[ , 2:6])
#평균을 id 빼고 가져와야하니까.

home = readxl::read_excel(path = "home.xlsx",
                            sheet = 1,
                          col_names = TRUE)

home[home$price == 30000, "price"] = 35000
## 30000원을 35000로 바꾸기.

#####################################
## 8. 데이터 정렬하기 ###############
#####################################

## (1) 벡터를 정렬하기 : sort (벡터, descreasing= T/F ) 내림차순

money = c(45, 50, 40, 50, 50, 30, 500)
money
# [1]  45  50  40  50  50  30 500
sort(money) #오름차순으로
sort(money, decreasing = TRUE) #내림차순

## (2) order(데이터명$변수명, decreasing= T/F )
order(money) 
#번째 
# order(money)
# [1] 6 3 1 2 4 5 7

money[order(money)]
# [1]  30  40  45  50  50  50 500

student[order(student$height) , ]
#order는 행에다가 쓰는게 상식적으로 옳다!!
# 키 낮은순으로

student[order(student$height, decreasing = TRUE) , ]
# 키 위부다 내림차순 

## 성별 , 키 - 오름차순
student[order(student$gender, student$height), ]


## 문제 9. 성별 , 키 : 내림차순
student[order(student$gender, student$height, decreasing = TRUE), ]

## 문제 10.  성별 - 오름 // 키 - 내림 decreasing
student[order(student$gender, -student$height),
        ]

## 문제 11. 성별  - 내림차순 / 키 - 오름차순
student[order(student$gender, -student$height, decreasing = TRUE) ,
         ] 
#? gender 는 char 속성이라 - 를 못붙힘. 그래서 거꾸로를 생각.

## 문제 12. 성별 - 오름 / 거주지 - 내림
## 기본기능에서는 못해요.

##data.table 패키지를 이용함. char 도 상관없이 내림오름 적용됨.
student[order(student$gender, student$height , decreasing = TRUE) , ]

##data.frame 을 data.table 로 바꿈 
##---※data.table 설치 --> 데이터 핸들링, 데이터 분석에 매우 유용, 시간을 줄일 수 있다!
studentDT = as.data.table(student)
str(studentDT)

studentDT[order(gender, -address) , ]
# 성별 - 오름 / 거주지 - 내림

##시간이 얼마나 소요되는지 알려주는 함수
## system.time(작업)
# letters 은 알파벳 a-z
# sample(letters, size = 1000000 ,replace = TRUE)

##-------------!!Call!!-------------자주복습 
DF = data.frame(id=1:10000000,
                type=sample(letters, size = 10000000 ,replace = TRUE))
DT = as.data.table(DF)

##그냥 DF, DT 치지말기 오래거리니까..
## a 거르면 얼마나 걸리나 알아볼까??

##-------------!!Call!!-------------자주복습 
system.time(x <- DF[DF$type == "a" , ])
# 사용자  시스템 elapsed 
# 0.46    0.10    0.55 
data.table::setkey(DT, type)
## type이란 변수를 탐색할때 빠르게 해시테이블로 만들어서 하는것.
system.time(x <- DT[J("a")]) # 여러가지 J(c(" ", " "))
# 사용자 시스템 elapsed 
# 0.02    0.00    0.02 


##data.table::setkey(),J(), fread(), datatable()
student[student$gender == "남", ]
DT::datatable(student[student$gender == "남", ])



#####################################
##9. 데이터 합치기###################
#####################################


## (1) rbind(데이터1, 데이터2)
df1 = data.frame(id=1:3 , age=10:12 , gender=c("F","M","F"))
df2 = data.frame(id=4:5 , age=c(20,30), gender=c("M", "F"))

df1;df2
df3 = rbind(df1, df2)
df3

## (2) merge(데이터1, 데이터2, by=) #by 에다가 Primary Key

df4 = data.frame(id  = c(1,2,4,7),
                 age = c(10,20,40,70))
df5 = data.frame(id     = c(1,2,3,6,10), 
                 gender = c("M","M", "F","M","F"))
#Primary Key 가 있어야한다.

## i. inner join
## A∩B 
## by~

merge(df4, df5, by="id")


# > df4;df5
# id age
# 1  1  10
# 2  2  20
# 3  4  40
# 4  7  70
# id gender
# 1  1      M
# 2  2      M
# 3  3      F
# 4  6      M
# 5 10      F

# merge(df4, df5, by="id")
# id age gender
# 1  1  10      M
# 2  2  20      M

## ii. outer join
## ii-1 full join
## A∪B  
## all=~
#merge(데이터1, 데이터2, all=TRUE)
merge(df4,df5,all=TRUE)

# id age gender
# 1  1  10      M
# 2  2  20      M
# 3  3  NA      F
# 4  4  40   <NA>
# 5  6  NA      M
# 6  7  70   <NA>
# 7 10  NA      F


## ii-2 left join
## PMKEY 는 왼쪽에 들어간것
#merge(데이터1, 데이터2, all.x=TRUE)
merge(df4,df5,all.x = TRUE)

## 0ii-3 right join
## PMKEY 는 오른쪼 들어간것
#merge(데이터1, 데이터2, all.y=TRUE)
merge(df4,df5,all.y = TRUE)


## 10. R데이터 저장하기
## (1) 외부 데이터로 저장하기
## write.csv(R데이터, file="파일위치/파일명.csv")
write.csv(student , 
          file = "student.csv",
          row.names = FALSE)

## (2) R 데이터로 저장하기
## save(R데이터, file="파일위치/파일명.RData") 유형 : .R 스크립트( R 으로 짠 프로그래밍), RData

save(student, file="student.RData")


# 삭제하기 -- rm(student)


## (3) R데이터 불러오기
## load(file="파일위치/파일명.RData")
load(file="student.RData")
