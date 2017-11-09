# t���� 
##---------download---------install.packages("agricolae")
library(agricolae)
# ��ǥ�� t����
# 3-1���� �л����� ���� ��ռ����� 55���̾���. 
# 0���� ������ �����ϰ� ���� �л����� ���� ������ ������ ����.
# 58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39
# ���� ������ ������ ��, �л����� ������ �ö��ٰ� �� �� �ִ°�?

a <- c(58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39)

shapiro.test(a)  #�����Ͱ� ���Ժ����� �ϴ����� �˻��Ѵ�
# - ���� ������ ������ ���Լ� ���� [���Լ� ���� ����]


# data:  a
# W = 0.91143, p-value = 0.1058


# - ���� �������� ����տ� ���� �ŷڱ��� ������ ����

t.test(a, mu=55, alternative="greater")  # �ö��ٰ� ���� �� ����
## 55�� ���ؼ� t������ �Ѵ�.
# mean of x 
# 56.17647 
# (p-value  = 0.05 �̻��̳�. ���̰� ����. ) 
# 95 percent confidence interval: �ŷڱ����� ���� ~ ���Ѵ����
#   47.80855   Inf
## 55�ص� �����ϴ�. 

# ����ǥ�� t����

pre<-c(13.2, 8.2, 10.9, 14.3, 10.7, 6.6, 9.5, 10.8, 8.8, 13.3)
post<-c(14.0, 8.8, 11.2, 14.2, 11.8, 6.4, 9.8, 11.3, 9.3, 13.6)
G<-c(1,2,2,1,1,2,2,2,1,1) #�׷캯�� 
t.test(pre~G) # pre�� ���ؼ� �׷쿡 ���� ���̸� ���ڴ�.

# t = 2.2055, df = 7.6649, p-value = 0.05993 (0.05 �̻��̳�. ���̰� ����. ) 
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -0.1532547  5.8732547
# sample estimates:
#   mean in group 1 mean in group 2 ��
# 12.06    ù��°�׷�        9.20  �ι�° °�׷�

t.test(post~G) #post�� ���ؼ� �׷쿡 ���� ���̸� ���ڴ�.


# ����ǥ�� t ����
t.test(pre, post,paired=T, alternative="two.sided")  # ���̰� �ִٰ� ���� �� �ִ�. 13.2 -14.0 = ���� ���� 
# data:  pre and post
# t = -3.3489, df = 9, p-value = 0.008539
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -0.6869539 -0.1330461
# sample estimates:
#   mean of the differences 
# -0.41 

Diff<-post-pre #���ӳ����� �� �� ������.�ٽ� ������. post���� �� ũ�ϱ�. 
#post���� pre�� ���� ����� �����ϱ�. 
Diff
# [1]  0.8  0.6  0.3 -0.1  1.1 -0.2  0.3  0.5  0.5  0.3

t.test(Diff~G)



# ��ǥ�� ��
xx <- c(40, 30,50, 60)
yy <- c(60, 40, 55, 65, 60, 50)
zz <- c(70, 65, 70, 50, 60)
mydata <-c(xx,yy,zz)  #���������� �ڷḦ ������
mydata
group <-c(rep(1,4), rep(2,6), rep(3,5))  
group
cbind(mydata, group)
boxplot(mydata~group)
library(psych)
describe.by(mydata, group)  # �׷캰 �����跮 ���
ANO_R<-aov(mydata~group)
anova(ANO_R)
# ���İ���
# install.packages("agricolae")
library(agricolae)
scheffe.test(ANO_R, "group", alpha=0.05, console=TRUE) # "group" ���� 
LSD.test(ANO_R, "group", alpha=0.05, console=TRUE)
duncan.test(ANO_R, "group", alpha=0.05, console=TRUE)

#�����������(Mean Squared Error)


# ���� ����
# t.test(t����)=> Wilcox.test(���۽�����)
# ǥ���� ũ�Ⱑ �۰� ���Լ� ������ ������ ���� ��� 
# ������ ��Ī���̶�� �����ϰ� ���� ������ �Ѵ�


x<-c(1.83, 0.50, 1.62, 2.48, 2.68, 1.88, 1.55, 3.06, 1.30)
y<-c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)  
shapiro.test(x)  #�����Ͱ� ���Ժ����� �ϴ����� �˻��Ѵ�
shapiro.test(y)
wilcox.test(x,y, paired=TRUE, alternative="greater")
wilcox.test(x,y, paired=TRUE, alternative="two.sided")
wilcox.test(y-x, alternative="less")
wilcox.test(y-x, alternative="less", exact=FALSE, correct=FALSE)
# ��ȣȭ �������� ���Աٻ縦 �̿��ϴ� ���, exact=FALSE, correct=FALSE�� ���
# ���Ӽ� �����ϴ� ���� correct=TRUE


# anova => kruskal.test(ũ�罺Į �и�������)
# F0 ��跮�� �̿��ؼ� ��ü ���ص鰣�� ����� ������ �ƴϸ� �ٸ����� �����մϴ�.
x<-c(2.9, 3.0, 2.5, 2.6, 9.2)
y<-c(3.8, 5.7, 4.0, 7.4)
z<-c(2.8, 3.4, 2.2, 2.0)

# [ �Ⱒ�� Ȥ�� P-value�� ���� ���� ]
# ǥ�����κ��� ���� ������跮�� �� f0�� ���Ǽ���(significance level) �� ����
# f0 >= F��(r - 1, nT - r) �Ǵ� P-value = P(F >= f0) < �� �̸�, H0 �Ⱒ (H0 reject)
# f0 < F��(r - 1, nT - r) �Ǵ� P-value = P(F >= f0) >= �� �̸�, H0 ä�� (H0 accept)
shapiro.test(x)
shapiro.test(y)
shapiro.test(z)
kruskal.test(list(x,y,z))  # list ����


# 
performance <-matrix(c(794, 86, 150, 570), nrow=2, dimnames=list("1st Survey"=c("Approve", "Disapprove"), "2nd Survey"=c("Approve", "Disapprove")))
performance
mcnemar.test(performance)






# 
# [ǥ���� ũ�� ���Լ� ���� ��]
# 
# - ���� �������� ����տ� ���� �ŷڱ��� ������ ����
# : t.test()
# - ���� �������� ��л꿡 ���� �ŷڱ��� ������ ����
# : chi-square test
# - ���� �������� ������� ���� �ŷڱ��� ������ ����
# : prop.test()

# [���Լ� ������ ��]
# - ���� ������ �߽ɿ� ���� ���� ����
# (Nonparametric test on one sample with median)
# : wilcox.test()
# 
# [���Լ� ���� ����]
# - ���� ������ ������ ���Լ� ����
# : shapiro.test(), qqnorm(), qqline()
# 
# ��ó: http://rfriend.tistory.com/118 [R, Python �м��� ���α׷��� (by R Friend)]