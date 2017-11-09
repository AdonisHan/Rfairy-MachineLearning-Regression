# R���� �����ϴ� �������� �Լ���
# d(pdf�̿�), p(cdf �̿�), q(quantile �̿�), r(�ش������ ��������)�� �����ϴ� �װ���


#d(pdf), p(cdf), q(quantile), r(�ش������ ��������)
#���Ժ����� ���� dnorm, pnorm, qnorm, rnorm
# pdf(Ȯ���е��Լ�, Probability Density Function)
# cdf(����Ȯ���е��Լ�, Cumulative distribution function, �����Լ�)
# 
# x, q : ������ ����
# p: Ȯ������
# n: ��������
# df : ������
# ncp : ���߽ɸ��(noncentral parameter)
# Log, log.p : ���� TRUE�̸� Ȯ��p�� log(p)�� �־���
# Lower.tail : ���� TRUE(default)�̸� Ȯ���� P[X<x]��, �׷��� ������ P[X>x]

# t������ ���
# dt(x, df, ncp=0, log=FALSE)
# pt(q, df, ncp=0, lower.tail=TRUE, log.p=FALSE)
# qt(p, df)
# rt(n,df)


####(1)######################
z0<-qnorm(p=c(0.975, 0.950, 0.90), mean=0, sd=1)
z0
#���� �� ��ġ�� 1�� �ȴ�.

p0<-pnorm(q=c(-1.28, -1.64, -1.95), mean=0, sd=1, lower.tail=FALSE)
p0

####(2)######################
# ǥ�����Ժ��� �׸� �׷�����
op<-par(yaxs="i")
plot(function(x) dnorm(x, mean=0, sd=1), -3, 3, 
     ylim=c(0, 0.5), 
     main="Normal Distribution N(0,1)")
par(op)

op = par(yaxs="i")
plot(function(x) dnorm(x, mean = 0, sd = 1), -3, 3, 
     ylim = c(0, 0.5),
     main = "normal Distribution N(0,1)")

# �̻������� : binom(���׺���), multimom(���׺���), pois(���Ƽۺ���), geom(���Ϻ���), multinom(�ʱ��Ϻ���)
# ���������� : norm(���Ժ���), t(t����), f(F����), chisq(ī����������), exp(��������) ��

####(3)######################
# �������� ���� ī������������ ��ȭ
#���� �ѹ� 100�� , y�� 0.2���� ,hist �׸���, ������ 5
x<-rchisq(100, 5)
hist(x, prob=TRUE, ylim=c(0,0.20), main="Chi-Square Distribution (df=5)")

#Ŀ��� �Ѹ���
curve(dchisq(x, df=5), col='red', add=TRUE)


####(4)######################
# ���Ϻ������� ���� �߻� �� barchart
set.seed(2010) # �����߻��� �ʱⰪ ����
rtable<-round(runif(100, min=0, max=100))
rtable
breaks<-seq(1, 100, 20)
breaks
output<- table(cut(rtable, breaks)) # cut()
output
barplot(output, ylim=c(0,25), col="skyblue")

####(5)######################
###### ---- ���׺��� ��� --- ###### 
# B(n, p)
# dbinom(x ���� , n ����� , p Ȯ��) : ����Ȯ���е��Լ� pbinom(x, n, p) : ����Ȯ���Լ�
x<-seq(0, 10)
x
win.graph()
plot(x, dbinom(x, 10, 0.2), type="h", ylab="P(X=x)", lwd=5)  # lwd ���� type=h histogram-like vertical lines
win.graph()
plot(x, dbinom(x, 10, 0.5), type="h", ylab="P(X=x)", lwd=5)
win.graph()
plot(x, dbinom(x, 10, 0.8), type="h", ylab="P(X=x)", lwd=5)


###################(6)######################
# ���׺����� ���Ժ����ٻ�
#type b �� ���׶�� ���� 
n1=5; n2=10; n3=20; n4=30
x<-seq(0,10)
plot(x, dbinom(x, n1, 0.2), type="b", ylim=c(0, 0.5), xlab="", ylab="")
par(new=T) #   ������ ������ �׷����� ���ļ� 
plot(x, dbinom(x, n2, 0.2), type="b", ylim=c(0, 0.5), xlab="", ylab="")
par(new=T)
plot(x, dbinom(x, n3, 0.2), type="b", ylim=c(0, 0.5), xlab="", ylab="")
par(new=T)
plot(x, dbinom(x, n4, 0.2), type="b", ylim=c(0, 0.5), xlab="", ylab="")

###################(7)######################
# x~B(50, 0.4), p(X>=25)
# x~B(50 n����, 0.4 pȮ�� ), p(X>=25)
x<-seq(0, 50)
plot(x, dbinom(x, 50, 0.4), type="h", xlab="", ylab="")
par(new=T)
lines(x, dnorm(x, 20, sqrt(12)), col="red") # np=50*0.4=20, npq=50*0.4*0.6=12


###################()######################


###################()######################


###################()######################


###################()######################


###################()######################