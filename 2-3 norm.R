# R에서 제공하는 분포관련 함수는
# d(pdf이용), p(cdf 이용), q(quantile 이용), r(해당분포의 난수생성)로 시작하는 네가지


#d(pdf), p(cdf), q(quantile), r(해당분포의 난수생성)
#정규분포의 경우는 dnorm, pnorm, qnorm, rnorm
# pdf(확률밀도함수, Probability Density Function)
# cdf(누적확률밀도함수, Cumulative distribution function, 분포함수)
# 
# x, q : 분위수 벡터
# p: 확률벡터
# n: 관측갯수
# df : 자유도
# ncp : 비중심모수(noncentral parameter)
# Log, log.p : 만약 TRUE이면 확률p는 log(p)로 주어짐
# Lower.tail : 만약 TRUE(default)이면 확률은 P[X<x]임, 그렇지 않으면 P[X>x]

# t분포의 경우
# dt(x, df, ncp=0, log=FALSE)
# pt(q, df, ncp=0, lower.tail=TRUE, log.p=FALSE)
# qt(p, df)
# rt(n,df)


####(1)######################
z0<-qnorm(p=c(0.975, 0.950, 0.90), mean=0, sd=1)
z0
#나온 값 합치면 1이 된다.

p0<-pnorm(q=c(-1.28, -1.64, -1.95), mean=0, sd=1, lower.tail=FALSE)
p0

####(2)######################
# 표준정규분포 그림 그려보기
op<-par(yaxs="i")
plot(function(x) dnorm(x, mean=0, sd=1), -3, 3, 
     ylim=c(0, 0.5), 
     main="Normal Distribution N(0,1)")
par(op)

op = par(yaxs="i")
plot(function(x) dnorm(x, mean = 0, sd = 1), -3, 3, 
     ylim = c(0, 0.5),
     main = "normal Distribution N(0,1)")

# 이산형분포 : binom(이항분포), multimom(다항분포), pois(포아송분포), geom(기하분포), multinom(초기하분포)
# 연속형분포 : norm(정규분포), t(t분포), f(F분포), chisq(카이제곱분포), exp(지수분포) 등

####(3)######################
# 자유도에 따른 카이제곱분포의 변화
#랜덤 넘버 100개 , y축 0.2단위 ,hist 그리기, 자유도 5
x<-rchisq(100, 5)
hist(x, prob=TRUE, ylim=c(0,0.20), main="Chi-Square Distribution (df=5)")

#커브로 뿌리기
curve(dchisq(x, df=5), col='red', add=TRUE)


####(4)######################
# 균일분포에서 난수 발생 후 barchart
set.seed(2010) # 난수발생기 초기값 설정
rtable<-round(runif(100, min=0, max=100))
rtable
breaks<-seq(1, 100, 20)
breaks
output<- table(cut(rtable, breaks)) # cut()
output
barplot(output, ylim=c(0,25), col="skyblue")

####(5)######################
###### ---- 이항분포 계산 --- ###### 
# B(n, p)
# dbinom(x 백터 , n 시행수 , p 확률) : 이항확률밀도함수 pbinom(x, n, p) : 누적확률함수
x<-seq(0, 10)
x
win.graph()
plot(x, dbinom(x, 10, 0.2), type="h", ylab="P(X=x)", lwd=5)  # lwd 선두 type=h histogram-like vertical lines
win.graph()
plot(x, dbinom(x, 10, 0.5), type="h", ylab="P(X=x)", lwd=5)
win.graph()
plot(x, dbinom(x, 10, 0.8), type="h", ylab="P(X=x)", lwd=5)


###################(6)######################
# 이항분포의 정규분포근사
#type b 는 동그라미 형식 
n1=5; n2=10; n3=20; n4=30
x<-seq(0,10)
plot(x, dbinom(x, n1, 0.2), type="b", ylim=c(0, 0.5), xlab="", ylab="")
par(new=T) #   이전에 실행한 그래프에 겹쳐서 
plot(x, dbinom(x, n2, 0.2), type="b", ylim=c(0, 0.5), xlab="", ylab="")
par(new=T)
plot(x, dbinom(x, n3, 0.2), type="b", ylim=c(0, 0.5), xlab="", ylab="")
par(new=T)
plot(x, dbinom(x, n4, 0.2), type="b", ylim=c(0, 0.5), xlab="", ylab="")

###################(7)######################
# x~B(50, 0.4), p(X>=25)
# x~B(50 n시행, 0.4 p확률 ), p(X>=25)
x<-seq(0, 50)
plot(x, dbinom(x, 50, 0.4), type="h", xlab="", ylab="")
par(new=T)
lines(x, dnorm(x, 20, sqrt(12)), col="red") # np=50*0.4=20, npq=50*0.4*0.6=12


###################()######################


###################()######################


###################()######################


###################()######################


###################()######################
