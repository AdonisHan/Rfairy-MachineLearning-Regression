#############################################
### �������� : �������ڵ鸵 - ��������ó��###
###                                       ###
### �� �� �� : adonis han                 ###
### �ۼ����� : 2017�� 7�� 19�� (��)       ###
#############################################

##Data Handling = Data Pre-processing
options(repos = "http://cran.rstudio.com")
##---download---install.packages("readxl")
library(readxl)

## �۾����� (Working Directory)
## ���� : setwd("������ġ")
## ��ġ Ȯ�� - getwd()
setwd("d:/")


## ������ �о����
student = readxl::read_excel(path      = "student.xlsx",
                             sheet     = "data",
                             col_names = TRUE)


##DATA.FRAME �����̴�.
## 1. ������ ��ü ����
## (1)View(������)
View(student)
## (2) ������ : �ܼ�(Console)�� ���
student


## 2. �������� ����(Structure) ����
## str(������)
str(student)
# str�� �̿��ؼ� ���÷� Ȯ��.
# Classes ��tbl_df��s�� ��������̺�, ��tbl�� ���̺� and 'data.frame':	8 obs. ���� 8��  of  8 variables ���� 8�� :
#   $ (student$id ������ �ҷ��ü� ��) id     : num (�ѹ�)  1 2 3 4 5 6 7 8
#   $ gender : chr (�ɸ���)  "��" "��" "��" "��" ...

## 3. ������ �Ϻ� ����
## (1) head(������) ���� ���� �ִ� �� ������.
#���� �����͸� �� �о������?? ����Ʈ������ 6���� �����ؾ�.
head(student)
head(student, n=3) 
## 3���� ������.
## (2) tail(������)
tail(student)
tail(student, n=3)
# ������ 6���� ������.