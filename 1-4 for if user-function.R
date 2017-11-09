#############################################
### �������� : for, if, ������Լ�        ###
###                                       ###
### �� �� �� : adonis han                 ###
### �ۼ����� : 2017�� 7�� 20�� (��)       ###
#############################################

## 1. �ݺ��� : for
# ������ ���� ������ �ϰų� ����� ���� ������ �� ��. 
# ����� ���� ������ �� ��.

## 2. ���ǹ� : if
## 3. ����� �Լ� 

print("Hello, world!")

##10�� �ݺ��ؼ� ����ض�.
for(i in 1:10){
    print("Hello, world!")
}

## cat("�޼���1", "�޼���2", ... , "�޼���k")
##�������� �ض�
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

#1�� �����ܸ���
for(i in 1:9){
  cat("1 * ", i, " = ",1*i, "\n")
}

for(i in 1:9){
  for(j in 1:9){
  cat(i, " x ", j," = ", i*j, "\n" )
  }
}

#������ 2�ܺ��� 2�� ����. 
for(i in seq(2,9,2)){
  for(j in 1:9){
    cat(i, "x", j, "=",i*j, "\n")
  }
}



#### 2. ���ǹ�
## if, if ~ else, if ~ else if ~ else ����

## ifelse

## if -> �����ε� �ϳ��ۿ� ���� ����. �����ϳ��� ���͸� ����ȴ�.
##if(���ǹ�){
#  ���๮.
# }
x = 100
if(x>50){
  print("Very large number!!")
}

x = c(100,60, 30)
for(i in 1:3){
  if(x[i] > 50){
    print("Good!")
  } #x������ �����̽� [] i��° �߶� �ҷ���.
}

## if(���ǹ�){������ ���� �� ���๮1}else{������ ������ �� ���๮2}
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

## if(���ǹ�1){���๮1}else if(���ǹ�2){���๮2} else(���ǹ�3){���๮3}
z = 20
if(z > 10){
  print("large")
  }else if(z > 5){
    print("Medium!!")
  }else{
    print("small")
  }

## 3. ����� �Լ�
## �Լ��� = function(){���๮}

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

##������ : ���ڸ� �־��ָ� �ش� �������� ����� ���ִ� �Ԥ�

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

#{�׳� �Է��ϸ� ���ϱ�...
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