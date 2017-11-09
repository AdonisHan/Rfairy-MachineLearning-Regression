#############################################
### 수업내용 : Data Set Vector,Factor,matrix#           
###            Data.frame, List           ###
### 작 성 자 : adonis han                 ###
### 작성일자 : 2017년 7월 17일 (월)       ###
#############################################


##1. 벡터
##하나 이상의 값(element 원소)으로 이루어짐
##하나의 열(col)으로 되어있음. 
##하나의 데이터 유형만 가짐.

##1. 벡터를 생성하는 방법.
# _ <-c() combine, concatenate

##원소들 간의 규칙이 없을 때.
age <- c(29,21,25,24,27)
age
mode(age) #numeric
is.numeric(age) #TRUE


#데이터유형의 우선순위. character > numeric > logical
v1 = c(7,1,25)
v2 = c(8, 18, 28, 38)
c(v1,v2)

##  (2) : (1:5)
## numeric vector 에만 적용됨.
## 1씩 증가되는 숫자나 1씩 감소되는 숫자로 이루어진 백터를 생성
## 규칙이 있는 숫자

##start:end
##start < end : 1씩 증가
##start > end : 1씩 감소지
##start = end : start or end
##start부터 시작해서 end를 넘지 않을 때까지
##1씩 증가 또는 1씩 감소.
#1:5, 5:1, 1:10000

-2.3:1
#-2.3 -1.3 -0.3  0.7 (1씩 더한것임 )

1:-2.3
# 1  0 -1 -2 (1씩 뺌) 


## (3) seq(from=, to=, by=)
## seq:sequence 수열 
## numeric vector 에서만 사용됨.
## : 의 확장. by에다가 준 지정값.

##from, to, by : arguments
## from : start / to : end / by : 증가 또는 감소의 
seq(1,5,by=0.5) #1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0

seq(from=5,to=1,by=-0.5) #5.0 4.5 4.0 3.5 3.0 2.5 2.0 1.5 1.0

seq(10) #1  2  3  4  5  6  7  8  9 10
seq(4.7) # 1 2 3 4

## (5) rep(vector, times, each=)
##numeric, character, logical vector에 적용
##rep : replicate의 복사

rep(1, times=10) #1을 10번 복사 
rep(1, each=10) 

rep(1:2, times=5) #1~2를 10번 복사
#1 2 1 2 1 2 1 2 1 2
rep(1:2, each=5)
# 1 1 1 1 1 2 2 2 2 2

##문제3 
## 남자 10개, 여자 10개를 가지는 벡터를 생성

rep(c("남자","여자"), each=5)
#"남자" "남자" "남자" "남자" "남자" "여자" "여자" "여자" "여자" "여자"


#each 우선 그다음 times
rep(1:3, times=5, each=8)

#문제4 1이 100개, 그다음 2가 50개, 그 다음 3이 13개를 갖는 백터를 생성하시오

c(rep(1, times=100), rep(2, times=50), rep(3, times=13))
rep(1:3, times=c(100,50,13))

#중요: 두개 이상의 행위, c,[], seq 격[c는 규칙이 없는 열, 콜론은 연달아 있는 열 , seq 일정한 간격]
###2.백터의 속성
#(1) length(백터)

age <- c(20,39,48)
age

length(age)
# length(age)
# [1] 3

#NA : Not Availabe 라고 말하지 말고 Missing Value=결측치, 결측값 이라고 한다.것 공간은 있는데 값은 없다.
#NULL 객체는 있는데 결과(값)가 아예 없는것. 객체, 개채(Object) ---> 데이터, 그래프, 분석된결과가 저장된것, 
names(age)
#NULL
names(age) <- c("HAN","PARK","LIM")
#최종적 결과는 Vector
is.vector(age)
# [1] TRUE
names(age)<-NULL

## 3. 벡터의 슬라이싱(slicing) = 인덱싱(indexing) 
#백터중에서 일부의 원소를 추출.
#백터[] 는 슬라이싱.n

income <- c(100,200,300,400,500)
income[1]
income[2]
income[3]
income[4]
income[5]

#중요: 두개 이상의 행위, c,[], seq 격[c는 규칙이 없는 열, 콜론은 연달아 있는 열 , seq 일정한 간격]

##################?? 문제 5############## 
## 1, 4, 5번째의 원소를 한 번에 가져오세요.
##c , seq
income[c(1,3,4)]
# [1] 100 300 400

##################?? 문제 6##############
## c 나 [] 언제쓰는지 아는게 중요하다. 
income[2:5]

##################?? 문제 7##############
##홀수번째의 문제

income[seq(from=1,to=5,by=2)]
# [1] 100 300 500
income[seq(from=1,to=length(income), by=2)]

## 4. 백터의 연산: +, -, *, /, **, ^, &&, &/&
v1 <- 1:3
v2 <- 4:6
v3 <- 1:6
v4 <- 1:8
vplus<-v1 + v2 
vplus
# [1] 100 300 500

####v1 + v4 는 왜 안될까??###
# Warning message:
#   In v1 + v4 :
#   longer object length is not a multiple of shorter object length 배열의 수가 안맞음.


## (6) paste(vector1, vector2, ... , sep=)

##백터의 각각의 원소들을 합쳐서 character 형태의 원소를 생성
paste(1, 1) #"1ㅁ(공백)1/"
paste(1, 1, sep="a") #char
# "1a1"
paste(1, 1, sep="")
# "11"
paste("x", 1, sep="")
# "x1"

#Vectorization 백터화. for문을 쓰지 않음.
# #for(i=1, 3, by=1){
# v3[i] = v1[i] +v2[i]
# }

paste(1:3, 1:3, sep="-")
# "1-1" "2-2" "3-3"
paste("x", 1:4, sep="") 
# "x1" "x2" "x3" "x4" #recycling rule 작동되어 X가 반복.



#####FACTOR##########
##########요인     ##
######          #####

##백터의 일종
# 집단(group)으로 인식함
# 1차원

## factor(백터, labels=, levels=, ordered=)
bt <- c("ab", "ab", "a", "b", "a")
##집단으로 인식 안되있을때 요인 쓰기.

#######? 이름결합 식 bt.f bt_f btFactor
bt.f = factor(bt)
bt.f2 = factor(bt, labels=c("A", "AB", "B"))
bt.f3 = factor(bt, levels=c("h","b","k")) ##집단을 정하는 것.
bt.f4 = factor(bt, levels=c("h","b","k"),  
               labels=c("A","AB","B"),
               ordered=TRUE
               )

## factordml thrtjd
## (1) leves(요인)
levels(bt.f)

# (2) 
bt.f = ordered(bt.f)




#####행렬(MATRIX)##########
##########행ㄹ     ##
######          #####

##행(row)와 열(column)로 구성되어있음.
##2차원
##백터의 확장
## 데이터유형을 하나만 갖는다.

## 1. 행렬을 만드는 방법.
## (1) rbind(백터1,백터2,...) cbind(백터1,백터2,...)
## (2) matrix(백터, nrow=,ncol=, byrow=)
##행렬은 대문자로...

v1 = 1:3
v2 = 4:6
v3 = 1:6
M1 = rbind(v1,v2)
M2 = cbind(v1,v2)
M3 = cbind(v1,v2,v3)

## 2. 행렬의 슬라이싱
## matrix[행row,열column]
M3[1:2, ]


##3. 행렬의 덧셈과 뺄셈 shape
A = matrix(1:4, nrow=2, ncol=2)
B = matrix(5:8, nrow=2, ncol=2)

##4. 행렬의 곱셈 : A %*% B
## 조건 : c1 = r2
## 결과 : r1*c2


##5. 역행렬(Reverse matrix)
##조건 : 정방행렬(Square Matrix) : 행=열
##       행렬식이 0이 아니어야 한다.
##solve(행렬)
solve(A)
A %*% solve(A) 
#단위행렬
A1 = matrix(c(2,1,-1,3), nrow=2, ncol=2)
B1 = matrix(c(3,10),nrow=2, ncol=1)


# 2x-y=3
# x+3y=10
#x 와 y의 값 
solve(A1) %*% B1

##전치해렬(Transpose Matrix)
## 행과 열을 바꿈
## t(행렬)
t(A)


############배열############
### array(백터, dim=)
array(1:10, dim=c(3,4,2)) ##행,열,높이



###################data.frame#################
###################데이터프레임 ##############
##############################################
##행과 열로 되어있음
##2차원 구조. 
##여러개의 데이터유형을 가질 수 있다. 단, 하나의 열은 하나의 데이터 유형만 갖는다.

id = 1:5
gender = c("m", "m", "m", "f","f")
address = c("구파발", "강동", "압구정", "수원", "용인")
survey = data.frame(id, gender, address)


###################list########################
###################리스트######################
###############################################

##분석한 결과를 저장할 때에 많이 사용하는 형태
##가장 유연한 데이터형태
##리스트의 원소로 벡터, 요인, 행렬, 배열, 데이터 프레임,리스트를 
##가질 수 있음
##회귀분석 등 리스트형태로 저장.

##list(백터,요인,행렬,배열,데이터프레임,리스트,)
v1 = 1:10
v2 = 1:3
m1 = cbind(v1,v2)
result = list(v1,v2,m1,survey)

#### [] & [[]] 차이 
#list
result[1]
#vector
result[[1]]
# is.vector(result[[1]])
# [1] TRUE

#list
result[4]
#vector
result[[4]]
# is.data.frame(result[[4]])
# [1] TRUE