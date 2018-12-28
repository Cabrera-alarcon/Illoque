###############################################
### Plot cutoff for VSRFM and VSRFMs scores ###
###############################################



### You will have to run VSRFM.R and VSRFMs.R before

### Plot VSRFM scores in neutral and pathologic Clinvar not splice variants

par(mfrow=c(1,2))

## Separate benign and deleterious variants in twoo different data sets

clinvar_NS.neutra=clinvar_NS[which(clinvar_NS$True.Label==0),]
clinvar_NS.deleterious=clinvar_NS[which(clinvar_NS$True.Label==1),]

## Density plot for VSRFM scores in neutral and pathological 

plot(density(predict(model.rf,clinvar_NS.neutra)), col='blue', ylim=c(0,30),
     xlim=c(0,1),main='score VSRFM cutoff',lty=3, xlab='')

par(new=T)

plot(density(predict(model.rf,clinvar_NS.deleterious)), col='red', ylim=c(0,30),
     xlim=c(0,1),main='score VSRFM cutoff', lty=2, xlab='')

segments(x0 = 0.4433667, y0 = 0, x1 = 0.4433667, y1 = 8)
text(x = 0.4433667, y = 9, labels = 'cutoff = 0.443')
text(x = (-0.3), y = 40, labels = "A", xpd = NA, cex = 1.5, font = 2)

### Plot VSRFM scores in neutral and pathologic training splice variants

## Separate benign and deleterious variants in twoo different data sets

clinvar_splice.neutra=clinvar_splice[which(clinvar_splice$True.Label==0),]
clinvar_splice.deleterious=clinvar_splice[which(clinvar_splice$True.Label==1),]

## Density plot for VSRFMs scores in neutral and pathological training splice variants

plot(density(predict(model.rf.splicing,clinvar_splice.neutra)), col='blue', ylim=c(0,30),
     xlim=c(0,1),main='score VSRFM-s cutoff',lty=3, xlab='')

par(new=T)

plot(density(predict(model.rf.splicing,clinvar_splice.deleterious)), col='red', ylim=c(0,30),
     xlim=c(0,1),main='score VSRFM-s cutoff', lty=2, xlab='')

segments(x0 = 0.35543333, y0 = 0, x1 = 0.35543333, y1 = 8)
text(x = 0.35543333, y = 9, labels = 'cutoff = 0.355')
text(x = (-0.3), y = 40, labels = "B", xpd = NA, cex = 1.5, font = 2)

