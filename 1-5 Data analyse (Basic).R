#############################################
### �������� : ���� ������ �м�           ###
###                                       ###
### �� �� �� : adonis han                 ###
### �ۼ����� : 2017�� 7�� 20�� (��)       ###
#############################################

## ���� ������ : hflights::hflights
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
# package ��õ : �׷��� : ggplot2, lattice, plotly , googleVis, ggmap ,prettyR
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

## ������ �Ϻ� ����
DT::datatable(head(hflights))


## �ڷ��� ���� :  ������� ����
## ���� �ڷ� VS ���� ��

## ���� �ڷ� : ����(����)
## ���� : ���ڰ� �ǹ̰� �ִ°�? (+ , -)
## ���� �ڷ� : ���� ()

## ����(Definition)


##�۾����� ����
getwd()
setwd("C:\\Users\\ADO\\Dropbox\\RFairy [Dropbox]\\data")
#############################################
### I �Ϻ���(Uni-variate)####################
#############################################

## 1. ǥ = ��ǥ : ��(frequency), �����(present)
# (1) �� : table(�����͸�$������)
table(hflights$Month) ##���� ��ȣ
sort(table(hflights$Month), decreasing = TRUE) #
# 7     8     6     3     5    12     1    10     4     9    11     2 
# 20548 20176 19600 19470 19172 19117 18910 18696 18593 18065 18021 17128


# (2) ����� = (��/�հ�)*100
## prop.table(�󵵰��)*100 <-��
## ����� �����̱� ������ �ٲ��ش�.
## �����
prop.table(table(hflights$Month))*100  

hflightsMonth <- sort(prop.table(table(hflights$Month))*100 , decreasing = TRUE) #---(A)

# 7        8        6        3        5       12        1       10        4        9       11        2 
# 9.032247 8.868727 8.615536 8.558392 8.427401 8.403225 8.312234 8.218166 8.172891 7.940799 7.921458 7.528924

## �ݿø��ϱ�!!
#round( , digits = 1)
hflightsMonth <- round(sort(prop.table(table(hflights$Month))*100 , decreasing = TRUE) , digits = 1) #--(B)

# 7   8   6   3   5  12   1  10   4   9  11   2 
# 9.0 8.9 8.6 8.6 8.4 8.4 8.3 8.2 8.2 7.9 7.9 7.5 

# month.table�̶�� ���� (A), (B) freq(��) / percent(�����) ���� �̸� �ٲ�
month.table = cbind(freq = sort(table(hflights$Month) , decreasing = TRUE) , 
                    percent = round(sort(prop.table(table(hflights$Month))*100 , decreasing = TRUE) , digits = 1))

# freq = sort(table(hflights$Month), decreasing = TRUE)
# percent <-  hflightsMonth
# month.table <- cbind(freq, percent)

DT::datatable(month.table)


## month.table �����͸� csv�� �����ϱ� - ���丮 setwd(d:/)
write.csv(month.table, file = "month.csv") #R�� ����� ��������. 


##�������� ��Ȳ�� ������������ ����� �Ѵ����� csv�� ����.
dest.table = cbind(freq = sort(table(hflights$Dest) , decreasing = TRUE) , 
                    percent = round(sort(prop.table(table(hflights$Dest))*100 , decreasing = TRUE) , digits = 1))
DT::datatable(dest.table)
write.csv(dest.table, file = "dest.csv")
## 2. �׷��� : ����׷���(����, ����), ���׷���
## (1) ����׷��� : barplot(�󵵰��)
barplot(sort(table(hflights$Month) , decreasing = TRUE))

# ���� ���� : col="�����" col="black" rainbow�� ����.
barplot(sort(table(hflights$Month) , decreasing = TRUE), col= rainbow(12))

# ���� : main = "����" sub = "������"
barplot(sort(table(hflights$Month) , decreasing = TRUE), col= "lightblue", main="monthly status")

# y������ : ylab = "�� ����" xlab = "�� ���� " label
barplot(sort(table(hflights$Month) , decreasing = TRUE), 
        col= "lightblue", 
        main="monthly status",
        ylab = "flight times", xlab = "month")

# y���� ����  : ylim= c(�ּҰ�, �ִ밪) ylimit
barplot(sort(table(hflights$Month) , decreasing = TRUE), 
        col= "lightblue", 
        main="monthly status",
        ylab = "flight times", xlab = "month", 
        ylim = c(0,25000))

# ���θ��� : horiz = TRUE
## horiz : horizontal�� ����  / x�� y�� �ٲٰ� ������������ �ٲ���Ѵ�.
barplot(sort(table(hflights$Month) , decreasing = FALSE), 
        col   = "lightblue", 
        main  ="monthly status",
        xlab  = "flight times", ylab = "month",
        xlim  = c(0,25000),
        horiz = TRUE)

## (2)���׷��� : pie(�󵵰�� )
pie(sort(table(hflights$Month) , decreasing = TRUE))

## ������ : radius=0.8 <-default
pie(sort(table(hflights$Month) , decreasing = TRUE), 
    radius = 1)

## ù° ������ ���� : init.angel=
pie(sort(table(hflights$Month) , decreasing = TRUE), 
    radius = 1,
    init.angle = 90)


# package ��õ : �׷��� : ggplot2, lattice, plotly , googleVis, ggmap

# ����
# 1. �Ϻ��� ���� �ڷ��� �м�
# (1) ǥ :  ��, �����
# table(�����͸�$������ )->sort()
# prop.table(��)*100 -> sort(), round()
# (2) �׷���: ����׷���, ���׷���
# barplot(��),pie(��) 
# radius, angel

##prettyR::freq() ��()
prettyR::freq(hflights$Month,
              display.na =FALSE
              )
#���� �󵵿� ������� ����
#display.na ��ȿ����� ��� ���Ұ� 
#decr.order = FALSE �� �ָ� �������� �ƴ� 
##############################################
#2. �Ϻ��� ���� �ڷ��� �м� (����ǥ�� ��� )##
##############################################
# (1) ǥ ��ǥ(������ ��, �����)
# (2) �׷��� : ������׷�, ���ڱ׷� =
# (3) �����跮 = ������

## (1) ǥ : ������ ��, ����� 
DT::datatable(head(hflights))

##missing value ������ na.rm
##(�ּ�, �ִ밪) range 
ArrDelay.range = range(hflights$ArrDelay, na.rm = TRUE)
# ��� -70 70�� ����  978�� ������ 

##������ ���� ���ϱ�. sturge's fomula
length(hflights$ArrDelay)
interval.count = 1 + 3.3*log10(length(hflights$ArrDelay))
# ��� [1] 18.67801

## ��Ʈ sqrt() square root ������ε� ���� ���غ��� �ִ�. (������) 
sqrt(length(hflights$ArrDelay))
# ��� [1] 476.9654

##������ �� = ����� ��
## range/ ������ ����  
# diff = �ִ밪(range) - �ּҰ�(range)
diff(ArrDelay.range) / interval.count
# diff(range(hflights$ArrDelay, na.rm = TRUE)) / (1 + 3.3*log10(length(hflights$ArrDelay)))
# [1] 56.10875  -> 60�� ���������� �ڸ��� ���ڴ�.


##�� ����.
##��
hflights$ArrDelay.group = cut(hflights$ArrDelay,
                              breaks = seq(from= -120, to=1020, by=60), ##-120�к��� 1020�б��� 60�а������� ������  
                              right = FALSE) ##������ ���� right = False �̻�, �̸� ( ] 

table(hflights$ArrDelay.group)
sort(table(ArrDelay.group), decreasing = TRUE)
#���� 60�� �� �� ������ �����̰� ���� ����.

## 2, �׷���
## (1) ������׷�
## i. hist(�����͸�$������ ) : #sturge fomula �˰������� ���� 1+3.3*log10() �������� ���ϱ� 
hist(hflights$ArrDelay) 

## ii. hist(�����͸�$������, breaks = ������ ����)
hist(hflights$ArrDelay, 
     breaks = 50) 

## iii. hist(�����͸�$������, breaks = ������ ����)
##-120�к��� 1020�б��� 60�а������� ������
hist(hflights$ArrDelay, 
     breaks = seq(from= -120, to=1020, by=60),
     xlim = c(-120, 1020)) 

## (2) ���ڱ׸�(Boxplot) : �̻�ġ ����
## i. boxplot( �����͸�$������ )
boxplot(hflights$ArrDelay)


## ii. ���ܺ� ���ڱ׸�
## boxplot(�����͸�$������ ~ �����͸�$������)
## boxplot(�����ڷ�~ �����ڷ�)
## factor ���·� �;��Ѵ�. ��

##���׺� ���������ð� 
boxplot(hflights$ArrDelay ~ hflights$Origin)

## ���� ���������ð�
boxplot(hflights$ArrDelay ~ hflights$Month)


## 3. �����跮 - �����跮
## Descriptive Satistics = Summery Statistics.

## ��� (Parameter ) VS ��跮 (Statistics)
## ������ (Population ) VS ǥ�� (Sample)

## (1) �߽� = ��ǥ��.
## ���, �������, ������(�߾Ӱ�), �ֺ��(�ֺ�)
## �߽��� �������� ����?? 
## i. ��� : mean(�����͸�$������, na.rm=TRUE)
 mean(hflights$ArrDelay)
# [1] NA
# ���������� ���� ���� �����͵� �ֱ⶧����.

mean(hflights$ArrDelay, na.rm = TRUE)
# 7.094334 ��κ��� ������ �� 7������ �ʾ�����

##ii. 5% �������(Trimmed Mean) ���ܵ� ���
## mean(�����͸�$������, trim=0.05, na.rm = TRUE) 5%
ArrDelay.mean <-mean(hflights$ArrDelay, trim=0.05, na.rm = TRUE)
## �ణ���� 3.121585

## iii. ������ : median(�����͸�$������, na.rm=TRUE)
ArrDelay.median <-median(hflights$ArrDelay, na.rm = TRUE)
## �ݹ����� �ؼ� 0  
## �ݹ� ������ 0���̰� ����� 7���̴� ~~ ���� ������??

## iv. �ֺ��(Mode)
## which.max(table(�����͸�$������)) #table - �� 
which.max(c(10,5,3,200))
## ��� 4 : 4��


which.max(table(hflights$ArrDelay))
## ���: -4 / 4�� ���� �����Ѱ� ���� ���Ҵ�.
#  �� / ����� �� ���� ���帹���� -4 �� �ΰ��̴�. 
#table(hflights$ArrDelay) �� -4�� 7777���� ���� ����. �ֺ�� 

##prettyR::Mode() #�ֺ��
prettyR::Mode(hflights$ArrDelay)
# ���: -4 / 4�� ���� �����Ѱ� ���� ���׿�.



## (2) ���� = ���� = �ٸ�
## ����, ���������(IQR), �л�, ǥ������(����̶� �󸶳� �ٸ���, �̻�ġ ������ ���� �޴´�.)
## ������ ���� ���� (�������� �󸶳� �ٸ���?)

## i. ����(Range) ������ (�ִ밪 - �ּҰ�) ������, R������ �ּҰ�, �ִ밪���� ���´�.
range(hflights$ArrDelay, na.rm = TRUE)
# -70 978 �ּ� �ִ�
diff(range(hflights$ArrDelay, na.rm = TRUE))
# ��½�, 978 - (-70 ) =1048

## ii. ��������� (IQR= Inter Quartile Range) // Q3-Q1 
## IQR(�����͸�$������)
IQR(hflights$ArrDelay, na.rm = TRUE)
## ��� 19 // �� 19������ �ٸ��׿�. 20�������ȿ��� �������ϰ� ���׿�.

## iii. (ǥ��)�л�(Variace)
## var(�����͸�$������, na.rm = TRUE)
var(hflights$ArrDelay, na.rm = TRUE)
## ��� 943�� // ���� ����

## iv. (ǥ��) ǥ������(SD : Standard Deviation)
## sd(�����͸�$������, na.rm =TRUE)
sd(hflights$ArrDelay, na.rm = TRUE)
## ��� 31�� / ����� �� 7������ �ʴµ� ��տ��� 31������ ���̰� ����.
# 7 - 31 = ~ �� -23�� ~ 37 �� ���� �ٵ� �����ϴ���.

## v. ������ ���� ����(MAD : Median Absolute Deviation)
# �̻�ġ�� ���� ���� �������� �������ش�. �׷��� ǥ������, ����� ������ ���� �ޱ� ������ �������� ����Ѵ�.
## mad(�����͸�$������, na.rm = TRUE)
mad(hflights$ArrDelay, na.rm = TRUE)
## ��� 13��. �����ѵ�, �̻�ġ ����޴� ǥ�������� 31
## ����Ⱑ ���½ð��� 13�� ������ų� �ʰԿ��±���~. 


## (3) ������ ���
## i. �ֵ�(skewness) : ��Ī����
## ii. ÷��(Kurtosis): �߽��� �󸶳� �����Ѱ�?
## R�� �⺻��ɿ����� �� ���Ѵ�. 
## psych::describe(), describeBy()


psych::describe(hflights$ArrDelay)
#   vars      n mean    sd median trimmed   mad min max range skew kurtosis   se
# X1    1 223874 7.09 30.71      0    1.85 13.34 -70 978  1048 5.04    55.57 0.06
View(psych::describe(hflights$ArrDelay))


##psych::describe(�����͸�$������, �����͸�$������)
##psych::describe(�����ڷ�, �����ڷ�)
psych::describe(hflights$ArrDelay, hflights$Month)

# vars      n mean    sd median trimmed   mad min max range skew kurtosis   se
# X1    1 223874 7.09 30.71      0    1.85 13.34 -70 978  1048 5.04    55.57 0.06
# There were 11 warnings (use warnings() to see them)
##psych::describe(hflights$ArrDelay)

## se�� Standard Error. ǥ�ؿ���!
# ���� ǥ������ ����� 7�� ���Դµ�, �ٸ� ǥ���� ������ ����� ���� ǥ���� ��հ� �޶�������?
# �׷� �󸶳� �޶���� �˷��ִ� ��!.



##summary(�����͸�$������)

# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 1.000   4.000   7.000   6.514   9.000  12.000 
##���� �ڷ�
summary(hflights$Month)
hflights$Month = as.factor(hflights$Month)
summary(hflights$Month)
##���ڿ��� �������� �ٲٸ� ���ܺ��� �ν� 
## ������ Ư¡�� �˾Ƽ� ����ش�.
summary(hflights)


## by(�����ڷ�, �����ڷ�, �Լ���)
by(hflights$AirTime, hflights$Origin, mean, na.rm=TRUE)
#��� 

by(hflights$AirTime, hflights$Origin, sd, na.rm=TRUE)
#ǥ������

by(hflights$AirTime, hflights$Origin, summary, na.rm=TRUE)
##summery

by(hflights$AirTime, hflights$Origin, describe, na.rm=TRUE)
##describe

# ()
# ���൵ �ǰ�, ����� �����!
x=3
x
(x=3)