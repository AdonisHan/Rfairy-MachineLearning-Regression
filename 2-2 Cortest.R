# �����м�

# table( )�� ����� �־��� ���Ϳ��� a, b, c�� ���� Ƚ��
table(c("a", "b", "b", "b", "c", "c", "d"))

#xtabs( )�� ���ķ��� ����� �����͸� ����
d <- data.frame(x=c("1", "1", "2", "2"),
                y=c("A", "B", "A", "B"),
                num=c(190, 230, 60, 20)) 
# x�� 1 Y �� A �ΰ��� 190��
mytable<-xtabs(num ~ x + y, data=d) # ���Ӻ��� ~ ��������.
mytable

(d2 <- data.frame(x=c("A", "A", "A", "B", "B")))
(xtabs(~ x, d2))


# �ֺ� �հ� �ֺ� ������ margin.table( ), prop.table( )�� ����Ѵ�.

margin.table(mytable, 1) # A frequencies (summed over B) 
margin.table(mytable, 2) # B frequencies (summed over A)

prop.table(mytable) # cell percentages
prop.table(mytable, 1) # row percentages 
prop.table(mytable, 2) # column percentages

chisq.test(mytable)

#������ ���ؿ��� ����. 

# data:  mytable
# X-squared = 22.634, df = 1, p-value = 1.96e-06 0.05���� ����.

#
d <- data.frame(x=c("car", "car", "truck", "truck", "doll", "doll"),
                y=c("Child1", "Child2", "Child1", "Child2", "Child1", "Child2"),
                num=c(5, 4, 11, 7, 1,3 ))
mytable<-xtabs(num ~ x + y, data=d)
mytable
# �����󵵰� 50%�� ������ �ȵȴ�. 
# 5 �̻� ���ڰ� ��ü�� 50% ������ �ȵȴ�. 
margin.table(mytable, 1) # A frequencies (summed over B) 
margin.table(mytable, 2) # B frequencies (summed over A)

prop.table(mytable) # cell percentages
prop.table(mytable, 1) # row percentages 
prop.table(mytable, 2) # column percentages

chisq.test(mytable)  # Warning message:In chisq.test(mytable) : Chi-squared approximation may be incorrect
fisher.test(mytable)


# x<-matrix(c(24, 3,5,12), nc=2) �϶� �����غ���

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