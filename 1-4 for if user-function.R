#############################################
### 수업내용 : for, if, 사용자함수        ###
###                                       ###
### 작 성 자 : adonis han                 ###
### 작성일자 : 2017년 7월 20일 (목)       ###
#############################################

## 1. 반복문 : for
# 동일한 일을 여러번 하거나 비슷한 일을 여러번 할 때. 
# 비슷한 일을 여러번 할 때.

## 2. 조건문 : if
## 3. 사용자 함수 

print("Hello, world!")

##10번 반복해서 출력해라.
for(i in 1:10){
    print("Hello, world!")
}

## cat("메세지1", "메세지2", ... , "메세지k")
##구구단을 해라
for(i in 1:10){
  cat("Hello", i , "\n")
}

for(i in 1:10){
  cat("Hello, ", i , j, sep = "", fill=TRUE)
}


for(i in 1:9){
  for(j in 1:9){
    cat(i, "x", j, "=", i*j, sep=" ", fill=TRUE)
  }
}

#1의 구구단만해
for(i in 1:9){
  cat("1 * ", i, " = ",1*i, "\n")
}

for(i in 1:9){
  for(j in 1:9){
  cat(i, " x ", j," = ", i*j, "\n" )
  }
}

#구구단 2단부터 2씩 증가. 
for(i in seq(2,9,2)){
  for(j in 1:9){
    cat(i, "x", j, "=",i*j, "\n")
  }
}



#### 2. 조건문
## if, if ~ else, if ~ else if ~ else 구조

## ifelse

## if -> 벡터인데 하나밖에 일을 못함. 원소하나인 백터만 실행된다.
##if(조건문){
#  실행문.
# }
x = 100
if(x>50){
  print("Very large number!!")
}

x = c(100,60, 30)
for(i in 1:3){
  if(x[i] > 50){
    print("Good!")
  } #x백터의 슬라이싱 [] i번째 잘라서 불러옴.
}

## if(조건문){조건이 참일 때 실행문1}else{조건이 거짓일 때 실행문2}
y = 10

if(y > 5){
  print("large")
}else{
  print("small")
}

y = c(10,4,6)
for(i in 1:length(y)){
  if(y[i] > 5 ){
    print("ok")
  }else{
    print("bad!")
  }
}

## if(조건문1){실행문1}else if(조건문2){실행문2} else(조건문3){실행문3}
z = 20
if(z > 10){
  print("large")
  }else if(z > 5){
    print("Medium!!")
  }else{
    print("small")
  }

## 3. 사용자 함수
## 함수명 = function(){실행문}

hello = function(){
  print("Hello, world!!")
}
hello()
x = hello()

hello = function(){
  print("Hello, world!!")
  return("Hello, han")
}
y = hello()

triple = function(x){
  tmp = 3*x
  return(tmp)
}
triple(100)

x = hello()
triple = function(x){
  if(is.numeric(x)){
    tmp = 3*x
    return(tmp)
  }else if(is.character(x)){
    print("IT is character, plz input number")
  }
}

triple(100)
triple("what")

##구구단 : 숫자를 넣어주면 해당 구구단을 출력을 해주는 함ㅅ

gugudan = function(x){
  if(is.numeric(x)){
    for(i in 1:9){
      cat(x, " x ", i, " = ", x*i, "\n")
    }
  }else{
    print("IT is character, plz input numbe")
  }
}

gugudan(9)

gugudan1 = function(x){
  if(is.numeric(x)){
    for(i in 1:9){
      cat(x, "x", i, " = ", x*i, "\n")
    }
  }else{
    print("Your should enter the number")
  }
}

gugudan2 = function(x){
  if(is.numeric(x)){
      for(i in 1:9){
        cat(x*i, "\n")
      }
  }else{
    print("enter num")
    
  }
}

gugudan1(5)

#{그냥 입력하면 곱하기...
gugu = function(x,y){
  if(is.numeric(x)){
    tmp = cat(x, " x ", y, " = ",x*y, fill=TRUE)
    return(tmp)
  }else if(is.character(x,y)){
    print("IT is character, plz input number")
  }
}


gugudan5 = function(x,y){
  if(is.numeric(x)){
    tmp = cat(x*y, fill = TRUE)
    return(tmp)
  }else if(is.character(x,y)){
    print("wrong")
  }
}
