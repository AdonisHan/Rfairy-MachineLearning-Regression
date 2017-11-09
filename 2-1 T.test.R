# t검정 
##---------download---------install.packages("agricolae")
library(agricolae)
# 일표본 t검정
# 3-1반의 학생들의 수학 평균성적은 55점이었다. 
# 0교시 수업을 시행하고 나서 학생들의 시험 성적은 다음과 같다.
# 58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39
# 교시 수업을 시행한 후, 학생들의 성적은 올랐다고 할 수 있는가?

a <- c(58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39)

shapiro.test(a)  #데이터가 정규분포를 하는지를 검사한다
# - 단일 모집단 분포의 정규성 검정 [정규성 여부 검정]


# data:  a
# W = 0.91143, p-value = 0.1058


# - 단일 모집단의 모평균에 대한 신뢰구간 추정과 검정

t.test(a, mu=55, alternative="greater")  # 올랐다고 말할 수 없다
## 55와 비교해서 t검정을 한다.
# mean of x 
# 56.17647 
# (p-value  = 0.05 이상이네. 차이가 없네. ) 
# 95 percent confidence interval: 신뢰구간이 에서 ~ 무한대까지
#   47.80855   Inf
## 55해도 무방하다. 

# 독립표본 t검정

pre<-c(13.2, 8.2, 10.9, 14.3, 10.7, 6.6, 9.5, 10.8, 8.8, 13.3)
post<-c(14.0, 8.8, 11.2, 14.2, 11.8, 6.4, 9.8, 11.3, 9.3, 13.6)
G<-c(1,2,2,1,1,2,2,2,1,1) #그룹변수 
t.test(pre~G) # pre에 대해서 그룹에 따라서 차이를 보겠다.

# t = 2.2055, df = 7.6649, p-value = 0.05993 (0.05 이상이네. 차이가 없네. ) 
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -0.1532547  5.8732547
# sample estimates:
#   mean in group 1 mean in group 2 룹
# 12.06    첫번째그룹        9.20  두번째 째그룹

t.test(post~G) #post에 대해서 그룹에 따라서 차이를 보겠다.


# 종속표본 t 검정
t.test(pre, post,paired=T, alternative="two.sided")  # 차이가 있다고 말할 수 있다. 13.2 -14.0 = 등의 차이 
# data:  pre and post
# t = -3.3489, df = 9, p-value = 0.008539
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -0.6869539 -0.1330461
# sample estimates:
#   mean of the differences 
# -0.41 

Diff<-post-pre #종속끼리도 볼 수 있으니.다시 봐야함. post값이 더 크니까. 
#post에서 pre를 빼야 양수가 나오니까. 
Diff
# [1]  0.8  0.6  0.3 -0.1  1.1 -0.2  0.3  0.5  0.5  0.3

t.test(Diff~G)



# 세표본 비교
xx <- c(40, 30,50, 60)
yy <- c(60, 40, 55, 65, 60, 50)
zz <- c(70, 65, 70, 50, 60)
mydata <-c(xx,yy,zz)  #벡터형으로 자료를 생성함
mydata
group <-c(rep(1,4), rep(2,6), rep(3,5))  
group
cbind(mydata, group)
boxplot(mydata~group)
library(psych)
describe.by(mydata, group)  # 그룹별 기술통계량 계산
ANO_R<-aov(mydata~group)
anova(ANO_R)
# 사후검정
# install.packages("agricolae")
library(agricolae)
scheffe.test(ANO_R, "group", alpha=0.05, console=TRUE) # "group" 주의 
LSD.test(ANO_R, "group", alpha=0.05, console=TRUE)
duncan.test(ANO_R, "group", alpha=0.05, console=TRUE)

#평균제곱오차(Mean Squared Error)


# 비모수 검정
# t.test(t검정)=> Wilcox.test(윌콕슨검정)
# 표본의 크기가 작고 정규성 검정을 따르지 않은 경우 
# 분포가 대칭적이라고 가정하고 비모수 검정을 한다


x<-c(1.83, 0.50, 1.62, 2.48, 2.68, 1.88, 1.55, 3.06, 1.30)
y<-c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)  
shapiro.test(x)  #데이터가 정규분포를 하는지를 검사한다
shapiro.test(y)
wilcox.test(x,y, paired=TRUE, alternative="greater")
wilcox.test(x,y, paired=TRUE, alternative="two.sided")
wilcox.test(y-x, alternative="less")
wilcox.test(y-x, alternative="less", exact=FALSE, correct=FALSE)
# 부호화 순위검정 정규근사를 이용하는 경우, exact=FALSE, correct=FALSE를 사용
# 연속성 보장하는 경우는 correct=TRUE


# anova => kruskal.test(크루스칼 왈리스검정)
# F0 통계량을 이용해서 전체 수준들간의 평균이 같은지 아니면 다른지를 검정합니다.
x<-c(2.9, 3.0, 2.5, 2.6, 9.2)
y<-c(3.8, 5.7, 4.0, 7.4)
z<-c(2.8, 3.4, 2.2, 2.0)

# [ 기각역 혹은 P-value에 의한 검정 ]
# 표본으로부터 계산된 검정통계량의 값 f0가 유의수준(significance level) α 에서
# f0 >= Fα(r - 1, nT - r) 또는 P-value = P(F >= f0) < α 이면, H0 기각 (H0 reject)
# f0 < Fα(r - 1, nT - r) 또는 P-value = P(F >= f0) >= α 이면, H0 채택 (H0 accept)
shapiro.test(x)
shapiro.test(y)
shapiro.test(z)
kruskal.test(list(x,y,z))  # list 주의


# 
performance <-matrix(c(794, 86, 150, 570), nrow=2, dimnames=list("1st Survey"=c("Approve", "Disapprove"), "2nd Survey"=c("Approve", "Disapprove")))
performance
mcnemar.test(performance)






# 
# [표본이 크고 정규성 충족 시]
# 
# - 단일 모집단의 모평균에 대한 신뢰구간 추정과 검정
# : t.test()
# - 단일 모집단의 모분산에 대한 신뢰구간 추정과 검정
# : chi-square test
# - 단일 모집단의 모비율에 대한 신뢰구간 추정과 검정
# : prop.test()

# [정규성 미충족 시]
# - 단일 모집단 중심에 대한 비모수 검정
# (Nonparametric test on one sample with median)
# : wilcox.test()
# 
# [정규성 여부 검정]
# - 단일 모집단 분포의 정규성 검정
# : shapiro.test(), qqnorm(), qqline()
# 
# 출처: http://rfriend.tistory.com/118 [R, Python 분석과 프로그래밍 (by R Friend)]