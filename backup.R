mapa <- function(){

    MAX_X <- 16000
    MAX_Y <- 16000
    RAIO <- 1000
    x=0
    y=1
    setx <- seq(0, MAX_X, 2*RAIO-(2*RAIO/3))
    sety <- seq(0, MAX_Y, 2*RAIO-(2*RAIO/3))
    sc <- matrix(nrow=length(setx)*length(sety), ncol=2)
    for(coordX in setx){
        for(coordY in sety){
            sc[x+y,1] <- coordX
            sc[x+y,2] <- coordY
            y <- y+1
        }
        y<-1
        x <- x+length(sety)
    }

    plot(sc, xlim=c(0, 16000), ylim=c(0, 16000), col="red", xlab=c("X"), ylab=c("Y"))
    #plot(sc, xlim=c(4000, 12000), ylim=c(2000, 8000), col="red")

    x=0
    y=1
    ap <- matrix(nrow=length(setx)*length(sety), ncol=2)
    for(coordX in setx){
        for(coordY in sety){
            ap[x+y,1] <- coordX
            ap[x+y,2] <- coordY
            y <- y+1
        }
        y<-1
        x <- x+length(sety)
    }

    points(ap, col="blue")
    
    symbols(x=ap[c(42:47, 55:60),1], y=ap[c(42:47, 55:60),2], circles=rep(2500,12), add=T, inches=F, lty=2)

legend('bottom', legend=c('Cloudlet', 'AP', 'Path', 'Handoff', 'Migration'), lwd=c(2, 2, 2, 8, 0.1), pch=c(1, 1, 20, 20, 20), title='Lengenda', bg='white', col=c('red', 'blue', 'blue', 'green', 'red'), ncol=3)
#, inset=c(0,-0.4))

route <- read.csv("0route.txt", sep=c("\t"), header=F)
points(route[,2], route[,3], pch=20, lwd=0.1, col="blue")
handoff <- read.csv("0handoff.txt", sep=c("\t"), header=F)
points(handoff[,2], handoff[,3], pch=20, lwd=8, col="green")
mig <- read.csv("0migration.txt", sep=c("\t"), header=F)
points(mig[,2], mig[,3], pch=20, lwd=0.1, col="red")

legend('bottom', legend=c('Cloudlet', 'AP', 'Path', 'Handoff', 'Migration'), lwd=c(2, 2, 4, 8, 0.1), pch=c(1, 1, 20, 20, 20), title='Lengenda', bg='white', col=c('red', 'blue', 'blue', 'green', 'red'), ncol=3, lty=c(0, 0, 1, 0, 0))

}

mapa()

