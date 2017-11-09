##�������- ȸ�ͺм� 
## ����

# �������м�
x <- c(170, 172, 162, 164, 171, 176, 160,165,174,172)
y <- c(70,74, 65, 68, 72, 74, 61, 66, 76, 75)
plot(x, y,  xlab="Ű", ylab="������", pch=19,
     col="black", bg="yellow", cex=1.5 )
cor.test(x,y,method="pearson")  

data(mtcars)
mtcars
car_Cor<-cor(mtcars) # �ڱⰣ�� �������� ��� 
round(car_Cor, 2)
pairs(car_Cor, pch=19, bg=c("red", "green", "blue"))  # ��� ������

## install.packages("corrplot")
library(corrplot)
corrplot(car_Cor)  

# ���������� Ŭ���� ũ�Ⱑ ũ�� ������ ���ϴ�
# ����� �Ķ���, ������ ������
corrplot(car_Cor, method="number") # ���� ����� ǥ��
col<-colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(car_Cor, 
         method="color",   # ����� ǥ��
         col=col(200),     # ���� 200�� ����
         type="lower",     # ���� �Ʒ� ��ĸ� ǥ��
         order="hclust",   # ������ ���������� ����ȭ
         addCoef.col="black", # ������ ����
         tl.col="black",   # ������ ����  
         tl.srt=45,        # ������ 45�� �����
         diag=F)           # �밢��� ����

# Regression
setwd("D:/") # �ǽ� ���丮 ����
R1=read.csv("Regression_Data.csv")
names(R1)
RgFit<-lm(Y ~ X, data=R1) # �ܼ�ȸ�ͽ� Y����~ X���� 
summary(RgFit) #ȸ�Ͱ���� R-square, F�� ǥ��
coefficients(RgFit) # model coefficients
confint(RgFit, level=0.95) # �𵨿��� ���յ� ȸ�Ͱ����95% �ŷڱ���(CI) ǥ�� 
fitted(RgFit) # ������ �� ǥ�� Yhat �� ���� �� . 
residuals(RgFit) # ����
deviance(RgFit) #����
anova(RgFit) # anova table 
#aov(��󺯼�~�׷캯��, data=�����͸�)
#�̶� �����ؾ� �� ���� �׷� ������ factor ���̾�� �Ѵٴ� ��. 
# P-value ���� �ſ� �۰� ���� �͹����� �Ⱒ�Ǿ���.
# p-value ���� 0.05���� ũ�Ƿ� �͹������� �Ⱒ�� ���� ����. 
# ������ ��л꼺 ������ �����Ѵٶ�� �Ǵܰ���. 
# �Ͽ���ġ �л�м�(ANOVA)

vcov(RgFit) # covariance matrix for model parameters 
influence(RgFit) # regression diagnostics, �����.

# diagnostic plots 
# Error in plot.new() : figure margins too large error 
graphics.off()
par("mar") ##����
par(mar=c(1,1,1,1)) ## ���� 1 �� �� �ش�. �׷��� ���� �����  
#
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(RgFit)
plot(RgFit, which=c(4,6)) 
# residuals vs Fitted : ����ȸ�ʹ� ������� 0, �л����������ϹǷ� ���� 0�� ������ �̻��� 
# Sclae -location : ���Ⱑ 0�� ������ �̻���
# nornal Q-Q : ������ ���Ժ����� �������� ���� # ���°� ��������. 
# Residuals vs Leverage : 
# leverage (������-���������� �󸶳� �ش������� ġ��ġ���� ������)
# ���� �� : Cook Distance ������ �� �ǹ���

#ȸ�������� �ð�ȭ
plot(Y~X, data=R1) # X�� Y�� ǥ
abline(coef(RgFit)) # ����ȸ�ͼ� ǥ��


#����ȸ�ͺм�

RgFit2<-lm(Y ~ X1+X2, data=R1) 
summary(RgFit2) #ȸ�Ͱ���� R-square, F�� ǥ��
coefficients(RgFit2) # model coefficients
confint(RgFit2, level=0.95) # �𵨿��� ���յ� ȸ�Ͱ����95% �ŷڱ���(CI) ǥ�� 
fitted(RgFit2) # ������ �� ǥ��
residuals(RgFit2) # ����
deviance(RgFit2)
anova(RgFit2) # anova table 
vcov(RgFit2) # covariance matrix for model parameters 
influence(RgFit2) # regression diagnostics


# betaǥ��
##----download install.packages("lm.beta")

library(lm.beta)
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt")) #�׷캯��
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group) #���õȰ��� 

# standardize
lm.D9.beta <- lm.beta(lm.D9)
print(lm.D9.beta) ## ǥ��ȭ��Ű�� ���� ����. 
summary(lm.D9.beta)
coef(lm.D9.beta)

RgFit2<-lm(Y ~ X1+X2, data=R1) 
RgFit2.beta <- lm.beta(RgFit2)
print(RgFit2.beta)
summary(RgFit2.beta) #ȸ�Ͱ���� R-square, F�� ǥ��
##pvalue �� 0.05 ���� Ŀ�� �ǹ̾���. �׷��� �׷캯���� �����ϰ� ������ �ʱ⵵ �ϴ�. ���ǹ� �ϴ�. 

# �ڷắȯ I()���

x<-1:1000
x
y<-x^2+3*x+5+rnorm(1000)
y
lm(y~I(x^2)+x)

x<-101:200
y<-exp(3*x+rnorm(100))
lm(log(y)~x)


x<-101:200
y<-log(x)+rnorm(100)
lm(y~log(x))


x1<-1:10000
x2<-3*x1
y<-3*(x1+x2)+rnorm(1000)
lm(y~x1+x2)

# �������ù�

##download---install.packages("mlbench")
library(mlbench)
data(BostonHousing)
m<-lm(medv~., data=BostonHousing) ##���� medv ���� . ������������ �� �ְڴ�. ȸ�ͽ� �����, 
m2<-step(m, directory="both") #�������ù�. �ܰ��� ���ù� both. ������ ���� ����� �Ȱ���. 
formula(m2)  # �������� ����
m3<-step(m, directory="forward") #��ü �� �ְ�, ����¾��°� �ϳ��� ���°�. 
formula(m3) # �������� ����
m4<-step(m, directory="backward")
formula(m4) # �������� ����


# ���߰�����

R2=read.csv("Regression_Data.csv")
names(R2)
RgFit2<-lm(Y ~ X1+X2, data=R2) # ����ȸ�ͽ�
##download -   install.packages("car")
library(car)
vif(RgFit2)  # 10�̻��̸� ���߰������� �ִٰ� �Ǵ�
sqrt(vif(RgFit2)) > 2 # problem? 10�̻��̳� �ƴϳ� �ص� �ȴ�. Ȯ���� �غ��°�. 


# Assume that we are fitting a multiple linear regression
# on the MTCARS data
#--download  install.packages("car")
data(mtcars)
library(car)
fit <- lm(mpg~disp+hp+wt+drat, data=mtcars)

# Assessing Outliers
rstudent(fit) # �ܸ� ��Ʃ���� ���� ǥ�� 
outlierTest(fit) # Bonferonni p-value for most extreme obs
#p �� 0.05 ���� ũ���� ���� ū �����̰� �ؼ� ǥ�õ�. 
qqPlot(fit, main="QQ Plot") #qq plot for studentized resid 
leveragePlots(fit) # leverage plots
#���Ӻ����� ���� �ϳ��� ���°��̴�. 

# Cook's D plot
# identify D values > 4/(n-k-1) 
cutoff <- 4/((nrow(mtcars)-length(fit$coefficients)-2)) 
plot(fit, which=4, cook.levels=cutoff)

# Influence Plot 
influencePlot(fit,	id.method="identify", main="Influence Plot", 
              sub="Circle size is proportial to Cook's Distance" )
