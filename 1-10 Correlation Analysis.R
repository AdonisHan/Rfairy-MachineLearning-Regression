#########################################################
### �������� : ����м�(Correlation Analysis)        ####
#########################################################

#-- install.packages("psych")
#-- install.packages("prettyR")
#-- install.packages("Hmisc")
#-- install.packages("corrplot")
library(DT)
library(psych)
library(prettyR)
library(Hmisc)
library(corrplot)
## ���� : �� ���� ���� �ڷ� ���� ���ü��� �ִ�����
## ��������� �����ϴ� ���.

## ���ü� : ������ ���� = ���� 

## ���� ������ : cars
## ������      : speed(�ӵ�-�� ). dist(�����Ÿ�- ��), : distance

# �Ҽ����� ������ �ϴ°� ���� �ִ°�???
# ǥ������ �Ҽ���° 2° 
# ����Ȯ�� 4° 
# �������� ���� 3° 
# ��� ȸ�Ͱ��� �Ҽ� 3° 


## 1. ������(Scatter plot)
## plot(�����͸�$������, �����͸�$������)
plot(cars$speed, cars$dist)

# ���ǵ尡 �����Ҽ��� �����Ÿ��� ����
# ������ ������ �ƴϴ� ���� 1�� �ƴϴ�. 

## 2 . ������ (Coeeficient of Correlation)
## cor(�����͸�$������, �����͸�$������)
cor(cars$speed, cars$dist) #�⺻: Pearson
## [1] 0.8068949 ������ +���ǻ������, ���ü��� ����. x�����Ҷ� y����. 
## 0.8 �̻� ~ 1.0 ���� : �ſ� ���� ���� ���ü��� �ִ�. 
## Sol : ���ǵ尡 ���� ���� �����Ÿ��� ������� ������ ���̰� �ִ�.
## ���������� ������ �Űܼ� �ؾ��Ѵ�. 
cor(cars$speed, cars$dist, method = "kendall") # Kendall : �˴��� tau - �˴��� ������. ������ �ٲپ.
# [1] 0.6689901 - ������
cor(cars$speed, cars$dist, method = "spearman") # Spearman : ���Ǿ.
# [1] 0.8303568
## ������ �ؼ��� ���̵�. 
## 0.0 �̻� ~ 0.2 �̸� : ���ü� ����. 
## 0.2 �̻� ~ 0.4 �̸� : ���� ���ü��� ����. 
## 0.4 �̻� ~ 0.6 �̸� : ������ ���ü��� ����.
## 0.6 �̻� ~ 0.8 �̸� : ���� ���ü��� �ִ�.
## 0.8 �̻� ~ 1.0 ���� : �ſ� ���� ���ü��� �ִ�.
# + ���� ������ / - ���� ������.


## 3. ����м� 
## �͹����� : �� ���� �ڷ� ���� ������ ����(���ü�: ���� = ������ ���� )�� ����. 
## �븳���� : �� ���� �ڷ� ���� ������ ���谡 �ִ�.
## cor.test(�����͸�$������, �����͸�$������)
## �Ǿ ǥ�� ����м�. 
cor.test(cars$speed, cars$dist)
cor.test(cars$speed, cars$dist, method = "kendall")  # �˴� 
cor.test(cars$speed, cars$dist, method = "spearman") # ���Ǿ 
## �ڳ����� ����. 
# data:  cars$speed and cars$dist
# t = 9.464, df = 48, p-value = 1.49e-12
# 95 percent confidence interval: 0.6816422 0.8862036
#��������� ���ǵ�� ����Ŀ���� ��迡 ������ ������谡 �ִ°����� ��Ÿ���� �� ����� �ſ� ���� ���ü��� �ִ�. 

# ����� t���� ������ ����� ���ƾ� �Ѵ�!!



#-------------------------------------------------------------------------------------# 

# ���� ������ : attitude
View(attitude)

## 1�ܰ� : ������ĵ�, ��Ļ�����
## Scatter plot matrix, matrix scatter plot
## Plot(�����͸�[, index])
plot(attitude)

## 2�ܰ� : ������ ���, ��� ������
## cor(�����͸�, [ ,index])
cor(attitude)
round(cor(attitude) , digits = 3)
DT::datatable(round(cor(attitude), digits = 3))

## 3�ܰ� : ����м�
cor.test(attitude$rating, attitude$complaints) # �̷��� ������ �ϱ� ����. #�⺻ : �Ǿ.
library(psych) 
# psych::corr.test(�����͸�[ , index]) #slicing ���ؼ�.
psych::corr.test(attitude) #�����ڷ�

library(Hmisc)
## Hmisc::rcorr(as.matrix(�����͸�[, index])) #matrix�� �ؾ��Ѵ�. (matrix �����߿� �ϳ��� char �̸� �� char�� �Ǵ� ��� ���� �� ��.)
Hmisc::rcorr(as.matrix(attitude)) ## attitude �� ���� dataframe �̴�. 

## �˴�
cor.test(attitude$rating, attitude$complaints, method = "kendall")

## ���Ǿ
cor.test(attitude$rating, attitude$complaints, method = "spearman")


##-------------------����ȭ-------------------##
corrplot(attitude, method="number") # ���� ����� ǥ��
col<-colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(attitude, 
         method="color",   # ����� ǥ��
         col=col(200),     # ���� 200�� ����
         type="lower",     # ���� �Ʒ� ��ĸ� ǥ��
         order="hclust",   # ������ ���������� ����ȭ
         addCoef.col="black", # ������ ����
         tl.col="black",   # ������ ����  
         tl.srt=45,        # ������ 45�� �����
         diag=F)           # �밢��� ����