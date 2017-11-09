#############################################
### �������� : �������ڵ鸵 - ��������ó��###
###                                       ###
### �� �� �� : adonis han                 ###
### �ۼ����� : 2017�� 7�� 19�� (��)       ###
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

## �۾����� (Working Directory)
## ���� : setwd("������ġ")
## ��ġ Ȯ�� - getwd()
setwd("d:/")


## ������ �о����
student = readxl::read_excel(path      = "student.xlsx",
                             sheet     = "data",
                             col_names = TRUE)


##DATA.FRAME �����̴�.
########################
## 1. ������ ��ü ����##
########################
## (1)View(������)
View(student)
## (2) ������ : �ܼ�(Console)�� ���
student

####################################
## 2. �������� ����(Structure) ����#
####################################

## str(������)
str(student)
# str�� �̿��ؼ� ���÷� Ȯ��.
# Classes ��tbl_df��s�� ��������̺�, ��tbl�� ���̺� and 'data.frame':	8 obs. ���� 8��  of  8 variables ���� 8�� :
#   $ (student$id ������ �ҷ��ü� ��) id     : num (�ѹ�)  1 2 3 4 5 6 7 8
#   $ gender : chr (�ɸ���)  "��" "��" "��" "��" ...

########################
## 3. ������ �Ϻ� ����##
########################
## (1) head(������) ���� ���� �ִ� �� ������.
#���� �����͸� �� �о������?? ����Ʈ������ 6���� �����ؾ�.
head(student)
head(student, n=3) 
## 3���� ������.
## (2) tail(������)
tail(student)
tail(student, n=3)
# ������ 6���� ������.

#############################
## 4. ������ �������� �Ӽ� ##
#############################
## (1) ���� ���� : nrow(������)
nrow(student)

## (2) ���� ���� : ncol(������)
ncol(student)

## (3) ���� �̸� : rownames(������)
rownames(student)

## (4) ���� �̸� = ������ �̸� : colnames(������)
colnames(student)

## (5) ����(dimension) : �� , ��
## dim(������)
dim(student)
# [1] 8 8 8�� 8��
dim(student)[1] 
# �� 

## (6) ������ �̸� : ���� �̸�, ���� �̸�
## dimnames(������)
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
# "3" vector 3��° element ��������.

########################################
## 5. ������(������ ������)�� �����̽�##
########################################

## ������[��index ,��index ]

## (1) �� (Column)
## ������[ , index]
student[ , 1]

## ����1 : 2, 3, 6��° ���� ����������.
student[ , c(2,3,6)]

# # A tibble: 8 x 3
# gender   age address
# <chr> <dbl>   <chr>
#   1     ��    24       A
# 2     ��    25       B


## ���� 2 : answp2: 4~8���� ����������.
student[ , 4:8]

## ���� 3 : ¦����° ���� ����������.
student[ , seq(from=2, to=ncol(student), by=2)]

## ��Ÿ
student[ , "weight"]
student[ , c("weight", "height")]

student
# # A tibble: 8 x 8
# id gender   age height weight address  major company
# <dbl>  <chr> <dbl>  <dbl>  <dbl>   <chr>  <chr>   <chr>
#   1     1     ��    24     60     60       A   �濵  Google
# 2     2     ��    25     70     68       B   ���   Apple
# 3     3     ��    27     63     62       A   �濵      SK
# 4     4     ��    24     86     68       A   ���� Samsung
# 5     5     ��    29     68     51       B ������    Line
# 6     6     ��    31     57     68       A ��ǻ��   iTune
# 7     7     ��    28     58     70       B ȸ����   Apple
# 8     8     ��    21     51     71       A   ����  Amazon

## �������� Ư���� ������ �ִ� ���� ����.
## grep("����", ���ڿ�)

## ������ �߿��� 'ei'��� ���ڸ� �����ϰ� �ִ� �������� ��ġ
grep("ei", colnames(student))
# [1] 4 5
##��ġ�� �˷���. 

## ������ �߿��� 'ei'��� ���ڸ� �����ϰ� �ִ� ������
grep("ei", colnames(student), value=TRUE)


## ������ �߿��� 'e'��� ���ڸ� �����ϰ� �ִ� �����͸� ����.
student[ , grep("e", colnames(student))]

## ������ �߿��� 'a' ��� ���ڷ� �����ϴ� �����͸� ����.
student[ , grep("^a", colnames(student))]

## ������ �߿��� 't' ��� ���ڷ� ������ �����͸� ����.
student[ , grep("t$", colnames(student))]

## (2) ��
student[1, ]
student[c(1, 3, 4) , ]
student[3:5 , ]
#1 ,4, 7 ��
student[seq(from=1, to=nrow(student), by=3)]


## ������ ������ ������ ��������
student[student$gender == "��" , ]

## == ����?

##����
student.female = student[student$gender == "��" , ]
student.female

## ���� 4. �������� A�� �ƴ� ����� ������
student[student$address != "A", ]

## ���� 4-1. �����԰� 60������ ������� �����͸� ��������
student[student$weight <= 60 , ]

## ���� 5. ���̰� 20�� �̻��̰�, Ű�� 175 �̻��� ���.
student[c(student$age >= 20, student$height >= 175), ] 
student[(student$age >= 20 ) & (student$height >= 175) , ]

#or
student[(student$age >= 20 ) | (student$height >= 175) , ]

## &&�� �ѹ� & �� ��� / || �� �ѹ� |�� ���
x = 1:3; y = 4:6
(x > 3) & (y >4)
# [1] FALSE FALSE FALSE
(x > 3) && (y >4)
# [1] FALSE

## (3) ��� ��
student[4:10 , c("weight", "height")]

## ����7
## Ű�� 170 �̻��̰�, �����Դ� 60kg �̻��� �������
## �������� 'e'��� ���ڰ� ���� �����͸� �����Ͻÿ�.

student[(student$height >= 170) & (student$weight >= 60) , 
        grep("e" , colnames(student))]

########################################
## 6. ���ο� ���� ����� ###############
########################################


student$bmi = student$weight / ((student$height/100)**2)
student$bmi

## if else(���ǹ�, ���϶� ǥ����, �����϶� ǥ����)
student$age.group = ifelse(student$age >= 30, "30�� �̻�", "20�� �̻�")
## ���̰� ��� �̻��̴�.

## ����8
## age.group2 : 20�� �ʹ�, 20�� �߹�, 30�� �̻�
## 25�� �̸��̸�, 25~29 �߹�, 30~ ��
student$age.group2 = ifelse(student$age >= 30, "30�� �̻�" , 
                            ifelse(student$age >= 25, "20�� �߹�", "20�� �ʹ�")
                            )

## cut(�����͸�$������, breaks = ��������)
## �� �����ϰ� ���� �ִ� ��
student$bmi.group = cut(student$bmi,
                        breaks = c(0, 18.5, 23, 25, 30),
                        right = FALSE) ## FALSE[ ), TRUE(DEFAULT) (]
#   �ءءءء�TIPS[] �����̽� ()�켱���� {}�������
#() ���� ����X , [] ��������
#debug - ���α׷� ������ ã�Ƴ��� �����ϴ°�

score = readxl::read_excel(path = "score.xlsx",
                           sheet = 1,
                           col_names = TRUE)
View(score)

score$avg = rowMeans(score[ , 2:6])
#����� id ���� �����;��ϴϱ�.

home = readxl::read_excel(path = "home.xlsx",
                            sheet = 1,
                          col_names = TRUE)

home[home$price == 30000, "price"] = 35000
## 30000���� 35000�� �ٲٱ�.

#####################################
## 8. ������ �����ϱ� ###############
#####################################

## (1) ���͸� �����ϱ� : sort (����, descreasing= T/F ) ��������

money = c(45, 50, 40, 50, 50, 30, 500)
money
# [1]  45  50  40  50  50  30 500
sort(money) #������������
sort(money, decreasing = TRUE) #��������

## (2) order(�����͸�$������, decreasing= T/F )
order(money) 
#��° 
# order(money)
# [1] 6 3 1 2 4 5 7

money[order(money)]
# [1]  30  40  45  50  50  50 500

student[order(student$height) , ]
#order�� �࿡�ٰ� ���°� ��������� �Ǵ�!!
# Ű ����������

student[order(student$height, decreasing = TRUE) , ]
# Ű ���δ� �������� 

## ���� , Ű - ��������
student[order(student$gender, student$height), ]


## ���� 9. ���� , Ű : ��������
student[order(student$gender, student$height, decreasing = TRUE), ]

## ���� 10.  ���� - ���� // Ű - ���� decreasing
student[order(student$gender, -student$height),
        ]

## ���� 11. ����  - �������� / Ű - ��������
student[order(student$gender, -student$height, decreasing = TRUE) ,
         ] 
#? gender �� char �Ӽ��̶� - �� ������. �׷��� �Ųٷθ� ����.

## ���� 12. ���� - ���� / ������ - ����
## �⺻��ɿ����� ���ؿ�.

##data.table ��Ű���� �̿���. char �� ������� �������� �����.
student[order(student$gender, student$height , decreasing = TRUE) , ]

##data.frame �� data.table �� �ٲ� 
##---��data.table ��ġ --> ������ �ڵ鸵, ������ �м��� �ſ� ����, �ð��� ���� �� �ִ�!
studentDT = as.data.table(student)
str(studentDT)

studentDT[order(gender, -address) , ]
# ���� - ���� / ������ - ����

##�ð��� �󸶳� �ҿ�Ǵ��� �˷��ִ� �Լ�
## system.time(�۾�)
# letters �� ���ĺ� a-z
# sample(letters, size = 1000000 ,replace = TRUE)

##-------------!!Call!!-------------���ֺ��� 
DF = data.frame(id=1:10000000,
                type=sample(letters, size = 10000000 ,replace = TRUE))
DT = as.data.table(DF)

##�׳� DF, DT ġ������ �����Ÿ��ϱ�..
## a �Ÿ��� �󸶳� �ɸ��� �˾ƺ���??

##-------------!!Call!!-------------���ֺ��� 
system.time(x <- DF[DF$type == "a" , ])
# �����  �ý��� elapsed 
# 0.46    0.10    0.55 
data.table::setkey(DT, type)
## type�̶� ������ Ž���Ҷ� ������ �ؽ����̺��� ���� �ϴ°�.
system.time(x <- DT[J("a")]) # �������� J(c(" ", " "))
# ����� �ý��� elapsed 
# 0.02    0.00    0.02 


##data.table::setkey(),J(), fread(), datatable()
student[student$gender == "��", ]
DT::datatable(student[student$gender == "��", ])



#####################################
##9. ������ ��ġ��###################
#####################################


## (1) rbind(������1, ������2)
df1 = data.frame(id=1:3 , age=10:12 , gender=c("F","M","F"))
df2 = data.frame(id=4:5 , age=c(20,30), gender=c("M", "F"))

df1;df2
df3 = rbind(df1, df2)
df3

## (2) merge(������1, ������2, by=) #by ���ٰ� Primary Key

df4 = data.frame(id  = c(1,2,4,7),
                 age = c(10,20,40,70))
df5 = data.frame(id     = c(1,2,3,6,10), 
                 gender = c("M","M", "F","M","F"))
#Primary Key �� �־���Ѵ�.

## i. inner join
## A��B 
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
## A��B  
## all=~
#merge(������1, ������2, all=TRUE)
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
## PMKEY �� ���ʿ� ����
#merge(������1, ������2, all.x=TRUE)
merge(df4,df5,all.x = TRUE)

## 0ii-3 right join
## PMKEY �� ������ ����
#merge(������1, ������2, all.y=TRUE)
merge(df4,df5,all.y = TRUE)


## 10. R������ �����ϱ�
## (1) �ܺ� �����ͷ� �����ϱ�
## write.csv(R������, file="������ġ/���ϸ�.csv")
write.csv(student , 
          file = "student.csv",
          row.names = FALSE)

## (2) R �����ͷ� �����ϱ�
## save(R������, file="������ġ/���ϸ�.RData") ���� : .R ��ũ��Ʈ( R ���� § ���α׷���), RData

save(student, file="student.RData")


# �����ϱ� -- rm(student)


## (3) R������ �ҷ�����
## load(file="������ġ/���ϸ�.RData")
load(file="student.RData")