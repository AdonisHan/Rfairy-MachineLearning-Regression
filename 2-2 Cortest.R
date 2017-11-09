# 교차분석

# table( )을 사용해 주어진 벡터에서 a, b, c의 출현 횟수
table(c("a", "b", "b", "b", "c", "c", "d"))

#xtabs( )는 포뮬러를 사용해 데이터를 지정
d <- data.frame(x=c("1", "1", "2", "2"),
                y=c("A", "B", "A", "B"),
                num=c(190, 230, 60, 20)) 
# x가 1 Y 가 A 인것이 190개
mytable<-xtabs(num ~ x + y, data=d) # 종속변수 ~ 독립변수.
mytable

(d2 <- data.frame(x=c("A", "A", "A", "B", "B")))
(xtabs(~ x, d2))


# 주변 합과 주변 비율은 margin.table( ), prop.table( )로 계산한다.

margin.table(mytable, 1) # A frequencies (summed over B) 
margin.table(mytable, 2) # B frequencies (summed over A)

prop.table(mytable) # cell percentages
prop.table(mytable, 1) # row percentages 
prop.table(mytable, 2) # column percentages

chisq.test(mytable)

#비율의 기준에서 설명. 

# data:  mytable
# X-squared = 22.634, df = 1, p-value = 1.96e-06 0.05보다 작은.

#
d <- data.frame(x=c("car", "car", "truck", "truck", "doll", "doll"),
                y=c("Child1", "Child2", "Child1", "Child2", "Child1", "Child2"),
                num=c(5, 4, 11, 7, 1,3 ))
mytable<-xtabs(num ~ x + y, data=d)
mytable
# 관측빈도가 50%를 넘으면 안된다. 
# 5 이상 숫자가 전체의 50% 넘으면 안된다. 
margin.table(mytable, 1) # A frequencies (summed over B) 
margin.table(mytable, 2) # B frequencies (summed over A)

prop.table(mytable) # cell percentages
prop.table(mytable, 1) # row percentages 
prop.table(mytable, 2) # column percentages

chisq.test(mytable)  # Warning message:In chisq.test(mytable) : Chi-squared approximation may be incorrect
fisher.test(mytable)


# x<-matrix(c(24, 3,5,12), nc=2) 일때 검정해보자

x<-matrix(c(24, 3,5,12), nc=2)
x
colnames(x)<- c("A", "B")
rownames(x)<-c("X", "y")
margin.table(x, 1) # A frequencies (summed over B) 
margin.table(x, 2) # B frequencies (summed over A)
W
prop.table(x) # cell percentages
prop.table(x, 1) # row percentages 
prop.table(x, 2) # column percentages

chisq.test(x)
# data:  x
# X-squared = 13.883, df = 1, p-value = 0.0001945
