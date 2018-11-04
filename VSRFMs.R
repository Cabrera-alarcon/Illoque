###########################################################
### Classification model and scores for splice variants ###
###########################################################


## Load needed libraries

library(randomForest)
library(cvAUC)
library(ROCR)
library(pROC)

##############
### VSRFMs ###
##############

## Create a random forest model pulling appart the "group" variable

model.rf.splicing=randomForest(formula = True.Label~., data=table.model.splicing[,-15], na.action=na.omit)

# Plot Gini impurity decrease (variable importance).

varImpPlot(model.rf.splicing)


## 10-fold CV ##

AUC.rf.cv.s=c()
predictions.rf.s=list()
labels.rf.s=list()
for (i in 1:10){
  test=table.model.splicing[which(table.model.splicing$group==i),]
  train=table.model.splicing[which(!table.model.splicing$group==i),]
  model.rf.cv.s=randomForest(formula = True.Label~., data=train[,-15], na.action=na.omit)
  prediction.rf.cv.s=predict(model.rf.cv.s, test)
  print(i)
  ROC.rf=roc(test$True.Label, prediction.rf.cv.s)
  AUC.rf.cv.s=c(AUC.rf.cv.s,round(ROC.rf$auc,3))
  labels.rf.s[[i]]=test$True.Label
  predictions.rf.s[[i]]=prediction.rf.cv.s
}

## Error estimation by AUC for ROC curves over 10 fold cross validation

AUC.rf.S=mean(AUC.rf.cv.s)
ROC.cv.s.rf=cvAUC(predictions.rf.s, labels.rf.s,folds = 10)

## plot ROC curves from 10 fold CV 

plot(ROC.cv.s.rf$perf , col="blue", main = "ROC Curve for RF model for splicing variants",lty=1)
text(0.9,0.2, paste0('AUC = ',round(AUC.rf.S,3)))

