#############################################
### �������� : �ܺ� ������ �о����       ###
###                                       ###
### �� �� �� : adonis han                 ###
### �ۼ����� : 2017�� 7�� 18�� (ȭ)       ###
#############################################

## �ܺ� ������ : txt, csv, excel(xls, xlsx

## 1. �ؽ�Ʈ ������ :txt
## (1) ������(Separator) : ���� �ϳ� (black, white space)
## �����͸� = read.table(file="������ġ/���ϸ�.txt", 
##                         header=TRUE, <- head�� ���ϸ� v1,v2-- �̷������� �����ϱ�!
##                         sep=" " ) sep�� ����ֱ�. 

hope = read.table(file = "d:/hope.txt",
                  header = TRUE,
                  sep = " ") 


## (2) ������(Separator) : comma (,)
## �����͸� = read.table(file="������ġ/���ϸ�.txt", 
##                         header=TRUE, <- head�� ���ϸ� v1,v2-- �̷������� �����ϱ�!
##                         sep="," ) sep�� ����ֱ�. 

reading = read.table(file   = "d:/reading.txt",
                     header = TRUE,
                     sep    = ",") 

## (3) ������(Separator) : tab (\)
## �����͸� = read.table(file="������ġ/���ϸ�.txt", 
##                         header=TRUE, <- head�� ���ϸ� v1,v2-- �̷������� �����ϱ�!
##                         sep="\n" ) sep�� ����ֱ�. 

body = read.table(file   = "d:/body.txt",
                  header = TRUE,
                  sep    = "\t")


## 2. CSV(Comma Separated Value)
## ������ Ư���� ��
## �����͸� = read.csv(file  ="������ġ/���ϸ�.csv"),
##                     header=TRUE)

wish = read.csv(file = "d:/wish.csv", header = TRUE)

seunga1 = read.table(file = "d:/seunga.csv",
                    header = TRUE,
                    sep = " ") 
## 3. ���� : xls, xlsx
## R�� �⺻ ��ɿ����� �� �о�´�.
## �߰���ɼ�ġ, �߰���� : ��Ű(Package)

## ��Ű���� : readxl
## install.packages("��Ű����")

options(repos = "https://cran.rstudio.com" ) #� ����Ʈ�� �����Ұž�

##----Download----- install.packages("readxl")

##��Ű�� �ε��ϱ� = ��Ű�� �����ϱ�.
## R�� ��Ű���� �����ϴ� ��� :library(��Ű����)

library(readxl)

##��Ű���� :: �� ���
## �����͸� = readxl::read_excel(path="������ġ/���ϸ�.xlsx",
##                               sheet=index or "��Ʈ��",
##                               col_names=TRUE) <-�����̸� �״�ξ��Կ�.

time2 = readxl::read_excel(path = "d:/time.xlsx",
                           sheet = 1,
                           col_names = TRUE)
pdf("03study.pdf")