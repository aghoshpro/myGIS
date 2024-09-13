library(ggplot2)
library(gplots)
library(GGally)
library(corrplot)
library(RColorBrewer)

# setwd("C://Users//ARKA GHOSH//Desktop//Papers//2//Output") # same folder as the ZIP-File
# 
# ggpairs(iris[,-5])+ theme_bw()
# p <- ggpairs(iris, aes(color = Species))+ theme_bw()
# # Change color manually.
# # Loop through each plot changing relevant scales
# for(i in 1:p$nrow) {
#   for(j in 1:p$ncol){
#     p[i,j] <- p[i,j] + 
#       scale_fill_manual(values=c("#00AFBB", "#E7B800", "#FC4E07")) +
#       scale_color_manual(values=c("#00AFBB", "#E7B800", "#FC4E07"))  
#   }
# }
# p

M<-cor(mtcars)
head(round(M,2))


corrplot(M, type="upper", order="hclust", 
         col=brewer.pal(n=8, name="RdBu"))