library(data.table)
library(ggplot2)

diamondsDT = as.data.table(diamonds)


diamondsDT[ , .N, by = cut] #V1
diamondsDT[ , list(mean(price)), by = cut] #V2
diamondsDT[ , list(n = .N, Mean = mean(price), SD = sd(price)), by = cut] #cut =  ǰ������. �����Ϳ� ���� ����, ǥ������ 
diamondsDT[ , list(n = .N, Mean = mean(price), SD = sd(price)), by=list(cut,color)]


# �����͸�[�����͸�$������ >= upper]
# �����͸�[�����͸�$������ >= %in%��, ]$������= 6  #6,7,8�� ���°��� ������ 6���� �ٲ۴� 

lapply(�����͸�, mean)
apply(�����͸�[ , index], 2, mean)
#�������ʹ� ������ �ȵȴ�.

[ R���� : ���� ���� ������ ��� factor�� �����ϱ� ]
�����Ϳ� �ִ� Ư�� ������ ��� �������� ����(factor)���� �����ϴ� ����� ������ ����.
## 1. ������ ��ġ�� �ƴ� ���
index = c(1, 2, 7)
DF[ , index] = lapply(DF[ , index], factor)
## 2. �������� �ƴ� ���
variableNames = c("gender", "bloodType", "religion")
DF[ , variableNames] = lapply(DF[ , variableNames], factor)
## 3. ��� ������ ����(factor)���� �����ϱ�
DF[ , colnames(DF)] = lapply(DF[ , colnames(DF)], factor)