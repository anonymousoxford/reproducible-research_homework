#The wd was set on positcloud
data <- read.csv("/cloud/project/question-5-data/Cui_etal2014.csv")

#Code for QUESTION a)

#There are 15 columns
print(ncol(data))

#There are 33 rows
print(nrow(data))

#Code for QUESTION b and c)

#This logs the data on both the virion volume and the genome length
#To be able to fit a linear model
data$log_virion_volume <- log(data$Virion.volume..nm.nm.nm.)
data$log_genome_length <- log(data$Genome.length..kb.)

#This applies the linear model with log-transformed variables
lm_model <- lm(log_virion_volume ~ log_genome_length, data = data)

#This shows the output of the linear model
summary(lm_model)

#Code for QUESTION d)

#This installs and loads the packages used
install.packages(ggplot2)
library(ggplot2)

#This creates the plot to match the one on the assignment sheet
scatter_plot <- ggplot(data, aes(x = log_genome_length, y = log_virion_volume)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE, color = "blue", linewidth = 0.7) +
  #This adds a black linear regression line and grey confidence interval to the plot
  labs(
    x = "log [Genome length (kb)]",
    y = "log [Virion volume (nm3)]")+
  theme_minimal() +
  theme(
    axis.title = element_text(face = "bold")
  )

scatter_plot

#Code for QUESTION e)

#Inputting the values from the model
a <- 1.5152
#This back-transforms the log_beta to obtain beta
b <- exp(7.0748)

#This sets the length as 300kb as per the question
L <- 300

#The equation for the volume of the dsDNA
V <- b*L^a

#This gives the answer for the volume with 300kb length
#=6697007
V