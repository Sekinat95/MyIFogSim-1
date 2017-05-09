mapa <- function(){

    MAX_X = 40000
    MAX_Y = 40000
    x=0
    y=1
    sc <- matrix(nrow=390, ncol=2)
    for(coordX in seq(1001, MAX_X-990, 2001)){
        for(coordY in seq(1001, MAX_Y-990, 2001)){
            sc[x+y,1] <- coordX
            sc[x+y,2] <- coordY
            y <- y+1
        }
        y<-1
        x <- x+20
    }

    plot(sc, xlim=c(0, 15000), ylim=c(0, 15000), col="red", xlab=c("X"), ylab=c("Y"))
    #plot(sc, xlim=c(4000, 12000), ylim=c(2000, 8000), col="red")

    x=0
    y=1
    ap <- matrix(nrow=390, ncol=2)
    for(coordX in seq(1050, MAX_X-990, 2001)){
        for(coordY in seq(1050, MAX_Y-990, 2001)){
            ap[x+y,1] <- coordX
            ap[x+y,2] <- coordY
            y <- y+1
        }
        y<-1
        x <- x+20
    }

    points(ap, col="blue")
    
    symbols(x=ap[,1], y=ap[,2], circles=rep(500,nrow(ap)), add=T, inches=F, lty=2)
}

mapa()

legend('bottom', legend=c('Cloudlet', 'AP', 'Path', 'Handoff', 'Migration'), lwd=c(2, 2, 2, 8, 0.1), pch=c(1, 1, 20, 20, 20), title='Lengenda', bg='white', col=c('red', 'blue', 'blue', 'green', 'red'), ncol=3)
#, inset=c(0,-0.4))

route <- read.csv("0route.txt", sep=c("\t"), header=F)
points(route[,2], route[,3], pch=20, lwd=0.1, col="blue")
handoff <- read.csv("0handoff.txt", sep=c("\t"), header=F)
points(handoff[,2], handoff[,3], pch=20, lwd=8, col="green")
mig <- read.csv("0migration.txt", sep=c("\t"), header=F)
points(mig[,2], mig[,3], pch=20, lwd=0.1, col="red")

legend('bottom', legend=c('Cloudlet', 'AP', 'Path', 'Handoff', 'Migration'), lwd=c(2, 2, 4, 8, 0.1), pch=c(1, 1, 20, 20, 20), title='Lengenda', bg='white', col=c('red', 'blue', 'blue', 'green', 'red'), ncol=3, lty=c(0, 0, 1, 0, 0))


