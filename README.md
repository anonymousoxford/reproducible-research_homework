# Reproducible research: version control and R

\# 
1. Find on my logistic_growth repo https://github.com/anonymousoxford/logistic_growth

   
2. Find on my logistic_growth repo https://github.com/anonymousoxford/logistic_growth

   
3. Find on my logistic_growth repo https://github.com/anonymousoxford/logistic_growth

4. a) When running the code for 2 random walks, 

5. Code for all parts of question 5 can be found in the file "Question 5 code.R".

   a) There are 15 columns and 33 rows in the table. 
   
   b) I used a log transformation to fit a linear model to the data. When both sides are logged, V = βL^α becomes log(V) = log(β) + αlog(L), where α is the gradient (exponent), and log(β) is the intercept (scaling factor) of the linear model.

   c) From running the linear model, we obtain a value for the exponent (α) of 1.5152, and the intercept gives us log(β), which is 7.0748. I then back transformed log(β) by doing exp(7.0748), which gave a value of β as 1181.807.

   The p-value for the exponent (α) is 6.44e-10, which is smaller than 0.001, and so is extremely statistically significant. The p-value given for the scaling factor (β) is 2.28e-10, which is also smaller than 0.001, and so is also extremely statistically significant. 

   When comparing my answers for the exponent and the scaling factors to those found in the article, they are the same, besides rounding. Their value for the allometric exponent was 1.52, which is the same as my answer of 1.5152 to 3 significant figures, and their value for the scaling factor was 1,182, which is also the same as my answer of 1181.807, but to 4 significant figures.

   d) #This finds the data from the right place in positcloud
   
      data <- read.csv("/cloud/project/question-5-data/Cui_etal2014.csv")

      #This installs and loads the necessary package
   
      install.packages(ggplot2)
   
      library(ggplot2)

      #This logs the data on both the virion volume and the genome length
   
      data$log_virion_volume <- log(data$Virion.volume..nm.nm.nm.)
   
      data$log_genome_length <- log(data$Genome.length..kb.)

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

      #This displays the scatter plot
   
      scatter_plot

   e) Inputting the values of α and β into the allometric equation V = βL^α gives the equation V = 1181.807 * L^1.5152. When the value of L is given as 300kb, the volume of the dsDNA virus would be 6697007 nm3.
   

## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points (plus an optional bonus question worth 10 extra points). First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers. All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   - A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)
   - Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)
   - Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)
   - Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \beta L^{\alpha}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   - Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)
   - What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)
   - Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)
   - Write the code to reproduce the figure shown below. (10 points)

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  - What is the estimated volume of a 300 kb dsDNA virus? (4 points)

**Bonus** (**10 points**) Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).
