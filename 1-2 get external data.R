#############################################
### 수업내용 : 외부 데이터 읽어오기       ###
###                                       ###
### 작 성 자 : adonis han                 ###
### 작성일자 : 2017년 7월 18일 (화)       ###
#############################################

## 외부 데이터 : txt, csv, excel(xls, xlsx

## 1. 텍스트 데이터 :txt
## (1) 구분자(Separator) : 공백 하나 (black, white space)
## 데이터명 = read.table(file="파일위치/파일명.txt", 
##                         header=TRUE, <- head로 안하면 v1,v2-- 이런식으로 나오니깐!
##                         sep=" " ) sep에 공백넣기. 

hope = read.table(file = "d:/hope.txt",
                  header = TRUE,
                  sep = " ") 


## (2) 구분자(Separator) : comma (,)
## 데이터명 = read.table(file="파일위치/파일명.txt", 
##                         header=TRUE, <- head로 안하면 v1,v2-- 이런식으로 나오니깐!
##                         sep="," ) sep에 공백넣기. 

reading = read.table(file   = "d:/reading.txt",
                     header = TRUE,
                     sep    = ",") 

## (3) 구분자(Separator) : tab (\)
## 데이터명 = read.table(file="파일위치/파일명.txt", 
##                         header=TRUE, <- head로 안하면 v1,v2-- 이런식으로 나오니깐!
##                         sep="\n" ) sep에 공백넣기. 

body = read.table(file   = "d:/body.txt",
                  header = TRUE,
                  sep    = "\t")


## 2. CSV(Comma Separated Value)
## 엑셀의 특수한 형
## 데이터명 = read.csv(file  ="파일위치/파일명.csv"),
##                     header=TRUE)

wish = read.csv(file = "d:/wish.csv", header = TRUE)

seunga1 = read.table(file = "d:/seunga.csv",
                    header = TRUE,
                    sep = " ") 
## 3. 엑셀 : xls, xlsx
## R의 기본 기능에서는 못 읽어온다.
## 추가기능설치, 추가기능 : 패키(Package)

## 패키지명 : readxl
## install.packages("패키지명")

options(repos = "https://cran.rstudio.com" ) #어떤 사이트를 지정할거야

##----Download----- install.packages("readxl")

##패키지 로딩하기 = 패키지 구동하기.
## R과 패키지를 연결하는 기능 :library(패키지명)

library(readxl)

##패키지는 :: 로 약소
## 데이터명 = readxl::read_excel(path="파일위치/파일명.xlsx",
##                               sheet=index or "시트명",
##                               col_names=TRUE) <-파일이름 그대로쓸게요.

time2 = readxl::read_excel(path = "d:/time.xlsx",
                           sheet = 1,
                           col_names = TRUE)
pdf("03study.pdf")
