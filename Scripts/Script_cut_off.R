###############################################
### Plot cutoff for VSRFM and VSRFMs scores ###
###############################################



### You will have to run VSRFM.R and VSRFMs.R before

### Plot VSRFM scores in neutral and pathologic training not splice variants

par(mfrow=c(1,2))

## Separate benign and deleterious variants in twoo different data sets

table.model.NS.neutra=table.model.NS[which(table.model.NS$True.Label==0),]
table.model.NS.deleterious=table.model.NS[which(table.model.NS$True.Label==1),]

## Density plot for VSRFM scores in neutral and pathological 

plot(density(predict(model.rf,table.model.NS.neutra)), col='blue', ylim=c(0,30),
     xlim=c(0,1),main='score VSRFM cutoff',lty=3, xlab='')

par(new=T)

plot(density(predict(model.rf,table.model.NS.deleterious)), col='red', ylim=c(0,30),
     xlim=c(0,1),main='score VSRFM cutoff', lty=2, xlab='')

segments(x0 = 0.4599167, y0 = 0, x1 = 0.4599167, y1 = 8)
text(x = 0.4599167, y = 9, labels = 'cutoff = 0.459')
text(x = (-0.3), y = 40, labels = "A", xpd = NA, cex = 1.5, font = 2)

### Plot VSRFM scores in neutral and pathologic training splice variants

## Separate benign and deleterious variants in twoo different data sets

table.model.splicing.neutra=table.model.splicing[which(table.model.splicing$True.Label==0),]
table.model.splicing.deleterious=table.model.splicing[which(table.model.splicing$True.Label==1),]

## Density plot for VSRFMs scores in neutral and pathological training splice variants

plot(density(predict(model.rf.splicing,table.model.splicing.neutra)), col='blue', ylim=c(0,30),
     xlim=c(0,1),main='score VSRFM-s cutoff',lty=3, xlab='')

par(new=T)

plot(density(predict(model.rf.splicing,table.model.splicing.deleterious)), col='red', ylim=c(0,30),
     xlim=c(0,1),main='score VSRFM-s cutoff', lty=2, xlab='')

segments(x0 = 0.5079833, y0 = 0, x1 = 0.5079833, y1 = 8)
text(x = 0.5079833, y = 9, labels = 'cutoff = 0.508')
text(x = (-0.3), y = 40, labels = "B", xpd = NA, cex = 1.5, font = 2)

