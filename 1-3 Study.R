#############################################
### 수업내용 : 데이터핸들링 - 데이터전처리###
###                                       ###
### 작 성 자 : adonis han                 ###
### 작성일자 : 2017년 7월 19일 (수)       ###
#############################################

##Data Handling = Data Pre-processing
options(repos = "http://cran.rstudio.com")
##---download---install.packages("readxl")
library(readxl)

## 작업공간 (Working Directory)
## 설정 : setwd("파일위치")
## 위치 확인 - getwd()
setwd("d:/")


## 데이터 읽어오기
student = readxl::read_excel(path      = "student.xlsx",
                             sheet     = "data",
                             col_names = TRUE)


##DATA.FRAME 구조이다.
## 1. 데이터 전체 보기
## (1)View(데이터)
View(student)
## (2) 데이터 : 콘솔(Console)에 출력
student


## 2. 데이터의 구조(Structure) 보기
## str(데이터)
str(student)
# str을 이용해서 수시로 확인.
# Classes ‘tbl_df’s의 언어형테이블, ‘tbl’ 테이블 and 'data.frame':	8 obs. 행이 8개  of  8 variables 열이 8개 :
#   $ (student$id 식으로 불러올수 있) id     : num (넘버)  1 2 3 4 5 6 7 8
#   $ gender : chr (케릭터)  "남" "남" "남" "여" ...

## 3. 데이터 일부 보기
## (1) head(데이터) 제일 위에 있는 것 보여줌.
#과연 데이터를 잘 읽어왔을까?? 디폴트값으로 6개만 보여준아.
head(student)
head(student, n=3) 
## 3개만 보여줌.
## (2) tail(데이터)
tail(student)
tail(student, n=3)
# 끝에서 6개만 보여줌.
