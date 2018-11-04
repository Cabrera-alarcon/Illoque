######################################################################
### Plot ROC curves for VSRFM, VSRFMs and their constituent scores ###
######################################################################



## You will have to run VSRFM.R and VSRFMs.R scripts before.


### Plot ROC curves for constituent scores and VSRFM in not splice training variants

## VSRFM

par(mfrow=c(2,2))
plot(ROC.cv.rf.NS$perf , avg = "vertical",col='black', lty=1, main = "Training not splice variants")
text(x = (-0.2), y = 1.5, labels = "A", xpd = NA, cex = 1.5, font = 2)

### REVEL

pred.revel <- prediction( table.model.NS$REVEL_score, table.model.NS$True.Label)
perf.revel <- performance( pred.revel, "tpr", "fpr" )
plot( perf.revel, col= 'red',  lty=2, add = TRUE)

### MetaLR

pred.metalr=prediction( table.model.NS$MetaLR_score, table.model.NS$True.Label)
perf.metaLR=performance( pred.metalr, "tpr", "fpr" )
plot(perf.metaLR, add = TRUE, col= 'blue', lty= 3)

### MetaSVM

pred.metasvm=prediction( table.model.NS$MetaSVM_score, table.model.NS$True.Label)
perf.metasvm=performance( pred.metasvm, "tpr", "fpr" )
plot(perf.metasvm, add = TRUE, col= 'green', lty=4)

### Condel

pred.condel=prediction( table.model.NS$Condel, table.model.NS$True.Label)
perf.condel=performance( pred.condel, "tpr", "fpr" )
plot(perf.condel, add = TRUE, col='yellow', lty=5)

### DANN

pred.dann=prediction( table.model.NS$DANN_score, table.model.NS$True.Label)
perf.dann=performance( pred.dann, "tpr", "fpr" )
plot(perf.dann, add = TRUE, col='orange', lty=6)

### CADD

pred.cadd=prediction( table.model.NS$CADD_PHRED, table.model.NS$True.Label)
perf.cadd=performance( pred.cadd, "tpr", "fpr" )
plot(perf.cadd, add = TRUE, col='purple', lty=7)

### AUC legend for all scores

legend(x = "bottomright", cex = 0.7, bty = 'n',
       legend = c(paste0('VSRFM, AUC=', round(AUC.rf.NS,2)),
                  paste0('REVEL, AUC=', round(roc(table.model.NS$True.Label, table.model.NS$REVEL_score)$auc,2)),
                  paste0('MetaLR, AUC=', round(roc(table.model.NS$True.Label, table.model.NS$MetaLR_score)$auc,2)),
                  paste0('MetaSVM, AUC=', round(roc(table.model.NS$True.Label, table.model.NS$MetaSVM_score)$auc,2)), 
                  paste0('Condel, AUC=', round(roc(table.model.NS$True.Label, table.model.NS$Condel)$auc,2)),
                  paste0('DANN, AUC=', round(roc(table.model.NS$True.Label, table.model.NS$DANN_score)$auc,2)), 
                  paste0('CADD, AUC=', round(roc(table.model.NS$True.Label, table.model.NS$CADD_PHRED)$auc,2))),
       fill = c('black','red','blue','green','yellow','orange','purple'))


#### Plot ROC curves for trining splice variants ###

### VSRFMs

plot(ROC.cv.s.rf$perf , avg = "vertical",col='black', lty=1, main = "Training splice variants")

text(x = (-0.2), y = 1.5, labels = "B", xpd = NA, cex = 1.5, font = 2)

### REVEL


pred.revel <- prediction( table.model.splicing$REVEL_score, table.model.splicing$True.Label)
perf.revel <- performance( pred.revel, "tpr", "fpr" )
plot( perf.revel, col='red', main = "ROC Curves", add = TRUE, lty=2)

### MetaLR

pred.metalr=prediction( table.model.splicing$MetaLR_score, table.model.splicing$True.Label)
perf.metaLR=performance( pred.metalr, "tpr", "fpr" )
plot(perf.metaLR, add = TRUE, col='blue', lty=3)

### MetaSVM

pred.metasvm=prediction( table.model.splicing$MetaSVM_score, table.model.splicing$True.Label)
perf.metasvm=performance( pred.metasvm, "tpr", "fpr" )
plot(perf.metasvm, add = TRUE, col='green', lty=4)

### Condel

pred.condel=prediction( table.model.splicing$Condel, table.model.splicing$True.Label)
perf.condel=performance( pred.condel, "tpr", "fpr" )
plot(perf.condel, add = TRUE, col='yellow', lty=5)

### DANN

pred.dann=prediction( table.model.splicing$DANN_score, table.model.splicing$True.Label)
perf.dann=performance( pred.dann, "tpr", "fpr" )
plot(perf.dann, add = TRUE, col='orange', lty=6)

### CADD

pred.cadd=prediction( table.model.splicing$CADD_PHRED, table.model.splicing$True.Label)
perf.cadd=performance( pred.cadd, "tpr", "fpr" )
plot(perf.cadd, add = TRUE, col='purple', lty=7)


### Ada score

pred.ada_score=prediction( table.model.splicing$ada_score, table.model.splicing$True.Label)
perf.ada_score=performance( pred.ada_score, "tpr", "fpr" )
plot(perf.ada_score, add = TRUE, col='pink', lty=8)

### Rf score

pred.rf_score=prediction( table.model.splicing$rf_score, table.model.splicing$True.Label)
perf.rf_score=performance( pred.rf_score, "tpr", "fpr" )
plot(perf.rf_score, add = TRUE, col='grey', lty=9)

### AUC legend for all scores

legend(x = "bottomright", cex = 0.7, bty = 'n',
       legend = c(paste0('VSRFM-s, AUC=', round(AUC.rf.S,2)),
                  paste0('REVEL, AUC=', round(roc(table.model.splicing$True.Label, table.model.splicing$REVEL_score)$auc,2)),
                  paste0('MetaLR, AUC=', round(roc(table.model.splicing$True.Label, table.model.splicing$MetaLR_score)$auc,2)),
                  paste0('MetaSVM, AUC=', round(roc(table.model.splicing$True.Label, table.model.splicing$MetaSVM_score)$auc,2)), 
                  paste0('Condel, AUC=', round(roc(table.model.splicing$True.Label, table.model.splicing$Condel)$auc,2)),
                  paste0('DANN, AUC=', round(roc(table.model.splicing$True.Label, table.model.splicing$DANN_score)$auc,2)), 
                  paste0('CADD, AUC=', round(roc(table.model.splicing$True.Label, table.model.splicing$CADD_PHRED)$auc,2)),
                  paste0('Ada score, AUC=', round(roc(table.model.splicing$True.Label, table.model.splicing$ada_score)$auc,2)),
                  paste0('Rf score, AUC=', round(roc(table.model.splicing$True.Label, table.model.splicing$rf_score)$auc,2))),
       fill = c('black','red','blue','green','yellow','orange','purple','pink', 'grey'))


#### Plot ROC curves for constituent scores and VSRFM in clinvar not splice variants

### VSRFM

pred.clinvar.VSRFM=prediction(predict(model.rf,clinvar_NS), clinvar_NS$True.Label)
perf.clinvar.VSRFM=performance(pred.clinvar.VSRFM, "tpr", "fpr" )
plot(perf.clinvar.VSRFM, col='black', lty=1, main="Clinvar not splice variants")
text(x = (-0.2), y = 1.5, labels = "C", xpd = NA, cex = 1.5, font = 2)

### REVEL


pred.revel <- prediction( clinvar_NS$REVEL_score, clinvar_NS$True.Label)
perf.revel <- performance( pred.revel, "tpr", "fpr" )
plot( perf.revel, col='red', add = TRUE, lty=2)

### MetaLR

pred.metalr=prediction( clinvar_NS$MetaLR_score, clinvar_NS$True.Label)
perf.metaLR=performance( pred.metalr, "tpr", "fpr" )
plot(perf.metaLR, add = TRUE, col='blue', lty=3)

### MetaSVM

pred.metasvm=prediction( clinvar_NS$MetaSVM_score, clinvar_NS$True.Label)
perf.metasvm=performance( pred.metasvm, "tpr", "fpr" )
plot(perf.metasvm, add = TRUE, col='green', lty=4)

### Condel

pred.condel=prediction( clinvar_NS$Condel, clinvar_NS$True.Label)
perf.condel=performance( pred.condel, "tpr", "fpr" )
plot(perf.condel, add = TRUE, col='yellow', lty=5)

### DANN

pred.dann=prediction( clinvar_NS$DANN_score, clinvar_NS$True.Label)
perf.dann=performance( pred.dann, "tpr", "fpr" )
plot(perf.dann, add = TRUE, col='orange', lty=6)

### CADD

pred.cadd=prediction( clinvar_NS$CADD_PHRED, clinvar_NS$True.Label)
perf.cadd=performance( pred.cadd, "tpr", "fpr" )
plot(perf.cadd, add = TRUE, col='purple', lty=7)

### AUC legend for all scores

legend(x = "bottomright", cex = 0.7, bty= 'n',
       legend = c(paste0('VSRFM, AUC=', round(roc(clinvar_NS$True.Label,predict(model.rf,clinvar_NS))$auc,2)),
                  paste0('REVEL, AUC=', round(roc(clinvar_NS$True.Label, clinvar_NS$REVEL_score)$auc,2)),
                  paste0('MetaLR, AUC=', round(roc(clinvar_NS$True.Label, clinvar_NS$MetaLR_score)$auc,2)),
                  paste0('MetaSVM, AUC=', round(roc(clinvar_NS$True.Label, clinvar_NS$MetaSVM_score)$auc,2)), 
                  paste0('Condel, AUC=', round(roc(clinvar_NS$True.Label, clinvar_NS$Condel)$auc,2)),
                  paste0('DANN, AUC=', round(roc(clinvar_NS$True.Label, clinvar_NS$DANN_score)$auc,2)), 
                  paste0('CADD, AUC=', round(roc(clinvar_NS$True.Label, clinvar_NS$CADD_PHRED)$auc,2))),
       fill = c('black','red','blue','green','yellow','orange','purple','pink', 'grey'))


#### Plot ROC curves for constituent scores and VSRFM in clinvar splice variants

### VSRFMs

pred.clinvar.VSRFM=prediction(predict(model.rf.splicing,clinvar_splice), clinvar_splice$True.Label)
perf.clinvar.VSRFM=performance(pred.clinvar.VSRFM, "tpr", "fpr" )
plot(perf.clinvar.VSRFM, col='black', lty=1, main="Clinvar splice variants")
text(x = (-0.2), y = 1.5, labels = "D", xpd = NA, cex = 1.5, font = 2)

### REVEL


pred.revel <- prediction( clinvar_splice$REVEL_score, clinvar_splice$True.Label)
perf.revel <- performance( pred.revel, "tpr", "fpr" )
plot( perf.revel, col='red', main = "ROC Curves", add = TRUE, lty=2)

### MetaLR

pred.metalr=prediction( clinvar_splice$MetaLR_score, clinvar_splice$True.Label)
perf.metaLR=performance( pred.metalr, "tpr", "fpr" )
plot(perf.metaLR, add = TRUE, col='blue', lty=3)

### MetaSVM

pred.metasvm=prediction( clinvar_splice$MetaSVM_score, clinvar_splice$True.Label)
perf.metasvm=performance( pred.metasvm, "tpr", "fpr" )
plot(perf.metasvm, add = TRUE, col='green', lty=4)

### Condel

pred.condel=prediction( clinvar_splice$Condel, clinvar_splice$True.Label)
perf.condel=performance( pred.condel, "tpr", "fpr" )
plot(perf.condel, add = TRUE, col='yellow', lty=5)

### DANN

pred.dann=prediction( clinvar_splice$DANN_score, clinvar_splice$True.Label)
perf.dann=performance( pred.dann, "tpr", "fpr" )
plot(perf.dann, add = TRUE, col='orange', lty=6)

### CADD

pred.cadd=prediction( clinvar_splice$CADD_PHRED, clinvar_splice$True.Label)
perf.cadd=performance( pred.cadd, "tpr", "fpr" )
plot(perf.cadd, add = TRUE, col='purple', lty=7)


### Ada score

pred.ada_score=prediction( clinvar_splice$ada_score, clinvar_splice$True.Label)
perf.ada_score=performance( pred.ada_score, "tpr", "fpr" )
plot(perf.ada_score, add = TRUE, col='pink', lty=8)

### Rf score

pred.rf_score=prediction( clinvar_splice$rf_score, clinvar_splice$True.Label)
perf.rf_score=performance( pred.rf_score, "tpr", "fpr" )
plot(perf.rf_score, add = TRUE, col='grey', lty=9)

### AUC legend for all scores

legend(x = "bottomright", cex = 0.7, bty = 'n',
       legend = c(paste0('VSRFM-s, AUC=', round(roc(clinvar_splice$True.Label,predict(model.rf.splicing,clinvar_splice))$auc,2)),
                  paste0('REVEL, AUC=', round(roc(clinvar_splice$True.Label, clinvar_splice$REVEL_score)$auc,2)),
                  paste0('MetaLR, AUC=', round(roc(clinvar_splice$True.Label, clinvar_splice$MetaLR_score)$auc,2)),
                  paste0('MetaSVM, AUC=', round(roc(clinvar_splice$True.Label, clinvar_splice$MetaSVM_score)$auc,2)), 
                  paste0('Condel, AUC=', round(roc(clinvar_splice$True.Label, clinvar_splice$Condel)$auc,2)),
                  paste0('DANN, AUC=', round(roc(clinvar_splice$True.Label, clinvar_splice$DANN_score)$auc,2)), 
                  paste0('CADD, AUC=', round(roc(clinvar_splice$True.Label, clinvar_splice$CADD_PHRED)$auc,2)),
                  paste0('Ada score, AUC=', round(roc(clinvar_splice$True.Label, clinvar_splice$ada_score)$auc,2)),
                  paste0('Rf score, AUC=', round(roc(clinvar_splice$True.Label, clinvar_splice$rf_score)$auc,2))),
       fill = c('black','red','blue','green','yellow','orange','purple','pink', 'grey'))





  
