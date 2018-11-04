#####################################
### AUC comparison between scores ###
#####################################



## You will have to run VSRFM.R and VSRFMs.R scripts before.

## AUC comparison of VSRFMs and its correlated (or paired) contituent scores clinvar_splice data set. 

Clinvar_Splicing.revel.VSRFM_s=roc.test(roc(clinvar_splice$True.Label, clinvar_splice$REVEL_score), roc(clinvar_splice$True.Label, predict(model.rf.splicing,clinvar_splice)), paired=T, method="bootstrap")

Clinvar_Splicing.metalr.VSRFM_s=roc.test(roc(clinvar_splice$True.Label, clinvar_splice$MetaLR_score), roc(clinvar_splice$True.Label, predict(model.rf.splicing,clinvar_splice)), paired=T, method="bootstrap")

Clinvar_Splicing.metasvm.VSRFM_s=roc.test(roc(clinvar_splice$True.Label, clinvar_splice$MetaSVM_score), roc(clinvar_splice$True.Label, predict(model.rf.splicing,clinvar_splice)), paired=T, method="bootstrap")

Clinvar_Splicing.condel.VSRFM_s=roc.test(roc(clinvar_splice$True.Label, clinvar_splice$Condel), roc(clinvar_splice$True.Label, predict(model.rf.splicing,clinvar_splice)), paired=T, method="bootstrap")

Clinvar_Splicing.dann.VSRFM_s=roc.test(roc(clinvar_splice$True.Label, clinvar_splice$DANN_score), roc(clinvar_splice$True.Label, predict(model.rf.splicing,clinvar_splice)), paired=T, method="bootstrap")

Clinvar_Splicing.cadd.VSRFM_s=roc.test(roc(clinvar_splice$True.Label, clinvar_splice$CADD_PHRED), roc(clinvar_splice$True.Label, predict(model.rf.splicing,clinvar_splice)), paired=T, method="bootstrap")

Clinvar_Splicing.ada.VSRFM_s=roc.test(roc(clinvar_splice$True.Label, clinvar_splice$ada_score), roc(clinvar_splice$True.Label, predict(model.rf.splicing,clinvar_splice)), paired=T, method="bootstrap")

Clinvar_Splicing.rf.VSRFM_s=roc.test(roc(clinvar_splice$True.Label, clinvar_splice$rf_score), roc(clinvar_splice$True.Label, predict(model.rf.splicing,clinvar_splice)), paired=T, method="bootstrap")


## AUC comparison of VSRFMs and its correlated (or paired) contituent scores training splice variants data set. 


Splicing.revel.VSRFM=roc.test(roc(table.model.splicing$True.Label, table.model.splicing$REVEL_score), roc(table.model.splicing$True.Label, predict(model.rf.splicing,table.model.splicing)), paired=T, method="bootstrap")

Splicing.metalr.VSRFM=roc.test(roc(table.model.splicing$True.Label, table.model.splicing$MetaLR_score), roc(table.model.splicing$True.Label, predict(model.rf.splicing,table.model.splicing)), paired=T, method="bootstrap")

Splicing.metasvm.VSRFM=roc.test(roc(table.model.splicing$True.Label, table.model.splicing$MetaSVM_score), roc(table.model.splicing$True.Label, predict(model.rf.splicing,table.model.splicing)), paired=T, method="bootstrap")

Splicing.condel.VSRFM=roc.test(roc(table.model.splicing$True.Label, table.model.splicing$Condel), roc(table.model.splicing$True.Label, predict(model.rf.splicing,table.model.splicing)), paired=T, method="bootstrap")

Splicing.dann.VSRFM=roc.test(roc(table.model.splicing$True.Label, table.model.splicing$DANN_score), roc(table.model.splicing$True.Label, predict(model.rf.splicing,table.model.splicing)), paired=T, method="bootstrap")

Splicing.cadd.VSRFM=roc.test(roc(table.model.splicing$True.Label, table.model.splicing$CADD_PHRED), roc(table.model.splicing$True.Label, predict(model.rf.splicing,table.model.splicing)), paired=T, method="bootstrap")

Splicing.ada.VSRFM=roc.test(roc(table.model.splicing$True.Label, table.model.splicing$ada_score), roc(table.model.splicing$True.Label, predict(model.rf.splicing,table.model.splicing)), paired=T, method="bootstrap")

Splicing.rf.VSRFM=roc.test(roc(table.model.splicing$True.Label, table.model.splicing$rf_score), roc(table.model.splicing$True.Label, predict(model.rf.splicing,table.model.splicing)), paired=T, method="bootstrap")

## AUC comparison of VSRFM and its correlated (or paired) contituent scores clinvar_NS data set. 


Clinvar_NS.revel.VSRFM_s=roc.test(roc(clinvar_NS$True.Label, clinvar_NS$REVEL_score), roc(clinvar_NS$True.Label, predict(modelo.rf,clinvar_NS)), paired=T, method="bootstrap")

Clinvar_NS.metalr.VSRFM_s=roc.test(roc(clinvar_NS$True.Label, clinvar_NS$MetaLR_score), roc(clinvar_NS$True.Label, predict(modelo.rf,clinvar_NS)), paired=T, method="bootstrap")

Clinvar_NS.metasvm.VSRFM_s=roc.test(roc(clinvar_NS$True.Label, clinvar_NS$MetaSVM_score), roc(clinvar_NS$True.Label, predict(modelo.rf,clinvar_NS)), paired=T, method="bootstrap")

Clinvar_NS.condel.VSRFM_s=roc.test(roc(clinvar_NS$True.Label, clinvar_NS$Condel), roc(clinvar_NS$True.Label, predict(modelo.rf,clinvar_NS)), paired=T, method="bootstrap")

Clinvar_NS.dann.VSRFM_s=roc.test(roc(clinvar_NS$True.Label, clinvar_NS$DANN_score), roc(clinvar_NS$True.Label, predict(modelo.rf,clinvar_NS)), paired=T, method="bootstrap")

Clinvar_NS.cadd.VSRFM_s=roc.test(roc(clinvar_NS$True.Label, clinvar_NS$CADD_PHRED), roc(clinvar_NS$True.Label, predict(modelo.rf,clinvar_NS)), paired=T, method="bootstrap")


## AUC comparison of VSRFM and its correlated (or paired) contituent scores training not splice variants data set. 


NS.revel.VSRFM=roc.test(roc(table.model.NS$True.Label, table.model.NS$REVEL_score), roc(table.model.NS$True.Label, predict(modelo.rf,table.model.NS)), paired=T, method="bootstrap")

NS.metalr.VSRFM=roc.test(roc(table.model.NS$True.Label, table.model.NS$MetaLR_score), roc(table.model.NS$True.Label, predict(modelo.lr,table.model.NS)), paired=T, method="bootstrap")

NS.metasvm.VSRFM=roc.test(roc(table.model.NS$True.Label, table.model.NS$MetaSVM_score), roc(table.model.NS$True.Label, predict(modelo.rf,table.model.NS)), paired=T, method="bootstrap")

NS.condel.VSRFM=roc.test(roc(table.model.NS$True.Label, table.model.NS$Condel), roc(table.model.NS$True.Label, predict(modelo.rf,table.model.NS)), paired=T, method="bootstrap")

NS.dann.VSRFM=roc.test(roc(table.model.NS$True.Label, table.model.NS$DANN_score), roc(table.model.NS$True.Label, predict(modelo.rf,table.model.NS)), paired=T, method="bootstrap")

NS.cadd.VSRFM=roc.test(roc(table.model.NS$True.Label, table.model.NS$CADD_PHRED), roc(table.model.NS$True.Label, predict(modelo.rf,table.model.NS)), paired=T, method="bootstrap")




