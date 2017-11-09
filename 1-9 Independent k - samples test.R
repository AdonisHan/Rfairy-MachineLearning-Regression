##############################################################
### �������� : ����kǥ�� ����(Independent k - samples test####
##############################################################

##download ---- install.packages("nparcomp") ���� ��Ű��.
library(nparcomp)
## �� �̻��� �������� ����� �ٸ����� ��������� �����ϴ� ���.

## �͹����� : �������� ����(6����)�� ���� ���� ȿ���� ����.
## �븳���� : �������� ������ ���� ���� ȿ�����ִ�.
# R�� for���� �����ʾƵ�. vectorization ���� 
# �������� ����, �������� �� -> chi square.

## ���� ������ : InsectSprays
## ������ : count, spray


data("InsectSprays")
InsectSprays

## 1�ܰ� : ���Լ�����
by(InsectSprays$count, InsectSprays$spray, shapiro.test)
## c ������. -> krustkal wallis �� ����. 

## ��� : ���Լ� ������ ����.


## 2�ܰ� : ����(Kruskal-Wallis test)

## kruskal.test(�����͸�$������ ~ �����͸�$������)
## kruskal.test(�����ڷ�  ~ �����ڷ�)
kruskal.test(InsectSprays$count ~ InsectSprays$spray)

## ��� : ����Ȯ���� 0.0000 �̹Ƿ� ���Ǽ��� 0.05���� 
#---��� Kruskal-Wallis chi-squared = 54.691, df = 5, p-value = 1.511e-10
## �������� ������ ���� ��������� ������
## ���� ȿ���� �ִ� ������ ��Ÿ����. 


kruskal.test(count ~ spray, data=InsectSprays)
p-value = 1.511e-10
# �͹����������� �� �Ͼ�ٿ����ϴ¤� --> �Ͼ�ٰ� ģ��. (�븳����)
# ����~����.


## 3�ܰ� : ���ߺ� (Multiple Comparisons)
##       = ���ĺм� (Post-Hoc) 
# ���߿��� ���� ���̰� ������ ���̰� �ִ��� �ñ��Ҷ�, 2���� ��� ��.

#---��Ű����� 
## nparcomp::nparcomp(������ ~ ������, data = �����͸� )
## nparcomp::nparcomp(�����ڷ� ~ �����ڷ�, type = "Tukey",data = �����͸� )
##non-parametric ����-���ߺ� ��Ű��
nparcomp::nparcomp(count ~ spray, type = "Tukey", data = InsectSprays)



############################################################################################################



## ���࿡ ���Լ� ������ �����Ǿ��ٸ�
## 2�ܰ� : �л�м� (ANOVA : Analysis of Variance)
## �л�м���� = aov(������ ~ ������, data=�����͸�)
## summary(�л�м����)

anova.result = aov(count ~ spray, data = InsectSprays)
summary(anova.result)
# SSE = ���ܳ� ������ 
# SSB = ���� ������. 
# MSB = Sq / df 
# F = MSB / MSE
#----���----#----���----#----���----#----���----#----���----#----���----#----���----
#              Df   Sum         Sq       Mean Sq      F value  Pr(>F)    
# spray        5   2669 <SSB  2669/5 = 533.8(MSB)    34.7 <    2e-16 *** 2�� -16���̸� 0,0000 
#                                                              �� 34.7�̸� �ξ� ũ�ϱ� �븳. 
# Residuals    66   1015 <SSE  1015/66 =  15.4(MSB) #F = 533. 8 / 15.4 = 34.7

# ��� �븳�����̴�. ���ޤ����� ��������� ������ ���̰� �ִ°��̴�. ���������� ȿ���� �ٸ���.

# ���࿡ ���Լ� ������ ������ �ǰ�
# ���� ���� ���̰� �ִٰ� ����� ����

## 3�ܰ� : ���ߺ� = ���ĺ� 
# ���Լ��� �����Ǿ��� ���� �л�м� ���� �����Ǿ��� ���� ���ߺ�
# TukeyHSD(�л�м����) 
TukeyHSD(anova.result)
#-----------------------���-----------------------
# Fit: aov(formula = count ~ spray, data = InsectSprays)
# 
# $spray
#           diff        lwr       upr     p adj
# B-A   0.8333333  -3.866075  5.532742 0.9951810 B�� �� �׿����� �ſ� ���ϴ�. 0,99 �̴� ���̰� ����.
# C-A -12.4166667 -17.116075 -7.717258 0.0000000 A�� �� ȿ���� �ִ�. A-C 0.00�̴� ���̰� ����.