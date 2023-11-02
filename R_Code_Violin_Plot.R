# Install the following packages if you have not already:
install.packages('ggplot2')
install.packages('ggcorrplot')

# Once or if the packages are installed, then load them into R:
library(ggplot2)
library(ggcorrplot)

# Set your working directory:
setwd('C:/Directory')

# Read in a CSV file containing your RS data. The file should have headings. 1 heading is for the Class, and then 8 are for the RS variables. The rows are the classes or measurements/samples:
Data <- read.csv(file = 'C:/Directory/RS_Samples.csv', header = TRUE)

# View your data. In this example, there are 8 RS variables:
print(Data)

# Create a customized violin plot for the 'L8 NDWI med' variable.
p <- ggplot(Data, aes(x=Class, y=L8.NDWI.med, fill=Class)) + 
  geom_violin() + 
  geom_boxplot(width=0.2, fill="white") + 
  theme_bw() + 
  scale_fill_manual(values=c("tan4", "gold")) +
  theme(legend.position="none") + 
  theme(axis.text.x = element_text(color = "black", size = 14)) +
  theme(axis.text.y = element_text(color = "black", size = 14)) +
  theme(axis.title.y = element_text(color = "black", size = 14)) +
  theme(axis.title.x = element_blank()) + 
  labs(y = "L8 NDWI med") 

# Save your violin plot as a jpg file:
ggsave("Violin_Plot.jpg", p, width=7, height=7, units="cm", dpi=600)
