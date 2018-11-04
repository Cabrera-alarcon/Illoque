###############################################################
### Classification model and scores for NOT splice variants ###
###############################################################

## Load needed libraries

library(randomForest)
library(cvAUC)
library(ROCR)
library(pROC)

#############
### VSRFM ###
#############

## Create a random forest model pulling appart the "group" variable

model.rf=randomForest(formula = True.Label~., data=table.model.NS[,-13], na.action=na.omit)

# Plot Gini impurity decrease (variable importance).

varImpPlot(model.rf)

## 10-fold cross validation loop

AUC.rf.cv.ns=c()
predictions.rf.ns=list()
labels.rf.ns=list()
for (i in 1:10){
  test=table.model.NS[which(table.model.NS$group==i),]
  train=table.model.NS[which(!table.model.NS$group==i),]
  model.rf.cv.ns=randomForest(formula = True.Label~., data=train[,-13], na.action=na.omit)
  prediction.rf.cv.ns=predict(model.rf.cv.ns, test)
  ROC.rf.ns=roc(test$True.Label, prediction.rf.cv.ns)
  AUC.rf.cv.ns=c(AUC.rf.cv.ns,round(ROC.rf.ns$auc,3))
  labels.rf.ns[[i]]=test$True.Label
  predictions.rf.ns[[i]]=prediction.rf.cv.ns
}

## Error estimation by AUC for ROC curves over 10 fold cross validation

AUC.rf.NS=mean(AUC.rf.cv.ns)
ROC.cv.rf.NS=cvAUC(predictions.rf.ns, labels.rf.ns)

## plot ROC curves from 10 fold CV rounds

plot(ROC.cv.rf.NS$perf , col="blue",lty=1, main = "ROC Curve for RF model")
text(0.9,0.2, paste0('AUC = ',round(AUC.rf.NS,3)))

