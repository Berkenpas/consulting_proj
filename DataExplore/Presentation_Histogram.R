library("ggplot2")
library("reshape2")

Coin <- c("DENT", "REN", "VGX", "AR", "1INCH", "XVG", "CRV", "PROM", "CFX", "LSX")
`Pearson Correlation` <- c(7, 8, 0, 1, 7, 9, 9, 0, 0, 10)
`Kendall-Tau Correlation` <- c(9, 7, 0, 2, 7, 10, 9, 0, 0, 9)
`Spearman Correlation` <- c(10, 7, 0, 2, 7, 10, 9, 0, 0, 10)


labels <- list(
              "Pearson.Correlation"="Pearson Correlation", 
              "Kendall.Tau.Correlation"="Kendall-Tau Correlation", 
              "Spearman.Correlation"="Spearman Correlation"
               )

facet_labeller <- function(variable, value){
  return(labels[value])
}

df = data.frame(Coin, 
               `Pearson Correlation`, 
               `Kendall-Tau Correlation`, 
               `Spearman Correlation`)

df_long <- melt(df)

ggplot(df_long, aes(x=Coin, y=value, color=Coin, fill=Coin)) + 
  geom_bar(stat="identity") + 
  facet_wrap(~ variable, labeller = facet_labeller) +
  scale_y_continuous(breaks=seq(0,10,1)) + 
  scale_color_brewer(palette="Spectral")+
  scale_fill_brewer(palette="Spectral") + 
  ylab("# of significant similarities to top 10 coins") +
  ggtitle("Significant Correlations of Small Coins \nto Top 10 by Correlation Type")+
  theme_minimal() +
  theme(axis.text.x=element_text(angle=90), plot.title = element_text(hjust = 0.5)) 

#ggplotcode 
ggsave("Hisogram.png", dpi=300)

