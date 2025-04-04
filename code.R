install.packages("readxl")
library(readxl)
install.packages("e1071")
library(e1071)
install.packages("lmtest")
library(lmtest)
install.packages("Hmisc")
library(Hmisc)

projet2 <- read_excel("/Users/sehamelhmi/Documents/PIT/projet2.xlsx")
 
# analyse de plusieurs modèles afin de trouver le bon (reg, homoscédasticité, corrélation)
reg1<- lm(data = projet2,salaire~age + annees_pro + anciennete + `palmares ` )
summary(reg1)
bptest(reg1)

reg2<- lm(data = projet2,ln_salaire~age + annees_pro + anciennete + `palmares ` )
summary(reg2)
rcorr(as.matrix(projet2[,c("ln_salaire","age","anciennete","annees_pro","palmares ")]))
bptest(reg2)

reg3 <- lm(data = projet2,ln_salaire~age + anciennete + `palmares ` + `insta ` )
summary(reg3)
rcorr(as.matrix(projet2[,c("ln_salaire","age","anciennete","palmares ", "insta ")]))
bptest(reg3)

reg4 <- lm(data = projet2,ln_salaire~ anciennete + `palmares ` + `insta ` )
summary(reg4)
rcorr(as.matrix(projet2[,c("ln_salaire","anciennete","palmares ", "insta ")]))
bptest(reg4)


# création d'une fonction qui calcule les stat descriptives que je veux analyser
stat <- function(x){
  c(mean(x),median(x),sd(x),min(x),max(x),quantile(x,probs=0.25),IQR(x),
    skewness(x),kurtosis(x))} 

# création d'un tableau avec toutes les stat des
tab <- data.frame (stat = c("moy", "med", "std", "min", "max", "Q1", "Q3-Q1", "skewness", "kurtosis"),
                   s.ln_salaire = stat(projet2$ln_salaire), s.anciennete= stat(projet2$anciennete),
                   s.palmares = stat(projet2$`palmares `), s.insta = stat(projet2$`insta `) )

setwd("/Users/sehamelhmi/Documents/PIT")
write.csv2(tab,file="stat_des.csv")

#histogramme de chaque variable dans un png 
png(filename="ln_salaire.graphe.png")
plot(density(projet2$ln_salaire),main="distribution de ln_salaire", xlab="ln_salaire")
abline(v = mean(projet2$ln_salaire), col = "red")
dev.off()

png(filename="age.hist.png")
hist(projet2$age,main="histogramme de age", xlab="age", breaks=seq(18,38,2)) 
abline(v = mean(projet2$age), col = "red")
dev.off()

png(filename="annees_pro.hist.png")
hist(projet2$annees_pro,main="histogramme de annees_pro", xlab="annees_pro", breaks = seq(2,20,2)) 
abline(v = mean(projet2$annees_pro), col = "red")
dev.off()

png(filename="anciennete.hist.png")
hist(projet2$anciennete,main="histogramme de anciennete", xlab="anciennete",breaks = seq(1,21,2)) 
abline(v = mean(projet2$anciennete), col = "red")
dev.off()

png(filename="palmares.hist.png")
hist(projet2$`palmares `,main="histogramme de palmares", xlab="palmares", breaks = seq(0,34,2))
abline(v = mean(projet2$`palmares `), col = "red")
dev.off()

png(filename="insta.hist.png")
hist(projet2$`insta `,main="histogramme de insta", xlab="insta",breaks = seq(0,113000,11300))
abline(v = mean(projet2$`insta `), col = "red")
dev.off()

# graphique de variable expliquee en fonction de variable explicative 

setwd("/Users/sehamelhmi/Documents/PIT")
png(filename="anciennete-ln_salaire.png")
plot(data = projet2, ln_salaire~anciennete,pch = 3 ,main = "graphique de ln_salaire en fonction de anciennete")
dev.off()

setwd("/Users/sehamelhmi/Documents/PIT")
png(filename="palmares-ln_salaire.png")
plot(data = projet2, ln_salaire~`palmares `,pch =3 , main = "graphique de ln_salaire en fonction de anciennete")
dev.off()

setwd("/Users/sehamelhmi/Documents/PIT")
png(filename="insta-ln_salaire.png")
plot(data = projet2, ln_salaire~`insta `,pch = 3, main = "graphique de ln_salaire en fonction de insta")
dev.off()

# corrélation entre les variables 
setwd("/Users/sehamelhmi/Documents/PIT")
png(filename="correlation_graphe.png")
pairs(projet2[,c("anciennete","palmares ", "insta ")])
dev.off()

cor <- rcorr(as.matrix(projet2[,c("ln_salaire","anciennete","palmares ", "insta ")]))

setwd("/Users/sehamelhmi/Documents/PIT")
write.csv2(cor[["r"]],file="cor.csv")

setwd("/Users/sehamelhmi/Documents/PIT")
write.csv2(cor[["P"]],file="cor.p.csv")

cor2 <- rcorr(as.matrix(projet2[,c("ln_salaire","age" ,"annees_pro" , "anciennete","palmares ")]))

setwd("/Users/sehamelhmi/Documents/PIT")
write.csv2(cor2[["r"]],file="cor2.csv")

setwd("/Users/sehamelhmi/Documents/PIT")
write.csv2(cor2[["P"]],file="cor2.p.csv")

cor3 <- rcorr(as.matrix(projet2[,c("ln_salaire","age" , "anciennete","palmares ", "insta ")]))

setwd("/Users/sehamelhmi/Documents/PIT")
write.csv2(cor3[["r"]],file="cor3.csv")

setwd("/Users/sehamelhmi/Documents/PIT")
write.csv2(cor3[["P"]],file="cor3.p.csv")

# intervalle de confiance
con <- confint(reg4)

setwd("/Users/sehamelhmi/Documents/PIT")
write.csv2(con,file="confiance.csv")

# régression entière dans un txt 
setwd ("/Users/sehamelhmi/Documents/PIT")
sink(file="reg1.txt")
summary(reg1)
sink()

setwd ("/Users/sehamelhmi/Documents/PIT")
sink(file="reg2.txt")
summary(reg2)
sink()


setwd ("/Users/sehamelhmi/Documents/PIT")
sink(file="reg3.txt")
summary(reg3)
sink()


setwd ("/Users/sehamelhmi/Documents/PIT")
sink(file="reg4.txt")
summary(reg4)
sink()



# tableau d'estimation dans un csv 
reg.coef <-summary(reg4)[["coefficients"]]
write.csv2(reg.coef,file="reg.coef.csv")

reg1.coef <-summary(reg1)[["coefficients"]]
write.csv2(reg1.coef,file="reg1.coef.csv")

reg2.coef <-summary(reg2)[["coefficients"]]
write.csv2(reg2.coef,file="reg2.coef.csv")

reg3.coef <-summary(reg3)[["coefficients"]]
write.csv2(reg3.coef,file="reg3.coef.csv")


# analyse des résidus (densité, breush pagan)

u <- residuals(reg4)

setwd("/Users/sehamelhmi/Documents/PIT")
png(filename="residu_graphe.png")
plot(density(u), main = "densité des résidus")
abline(v=0,col="red")
grid()
dev.off()

shapiro.test(u)

bptest(reg4)


