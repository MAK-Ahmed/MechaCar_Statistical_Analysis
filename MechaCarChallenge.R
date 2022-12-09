#Deliverable Part 1

#load the dplyr package
library(tidyverse)

#import and read the file as a dataframe
MechaCar_Table <-read.csv(file="MechaCar_mpg.csv", check.names=FALSE, stringsAsFactors = F)

#Perform linear regression and pass all six variables
lm(mpg~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,  data=MechaCar_Table) 

#Create a summary function to determine p-value and the r-squared value
summary(lm(mpg~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,  data=MechaCar_Table))


#Deliverable Part 2
#import and read the file as a dataframe
Suspension_coils <-read.csv(file="Suspension_coil.csv", check.names=FALSE, stringsAsFactors = F)

#create a dataframe to get the mean, median, variance and standard deviation of the suspensions coil's PSI column
total_summary <- Suspension_coils %>% summarize(mean=mean(PSI),Median=median(PSI), variance=var(PSI), SD=sd(PSI))

#create a summary grouping by the Manufacturing lot
lot_summary <- Suspension_coils %>% group_by(Manufacturing_Lot) %>% summarize(mean=mean(PSI),Median=median(PSI), variance=var(PSI), SD=sd(PSI), .groups = 'keep')


#Deliverable Part 3
#determine if the PSI across all lots are statistically different from the population mean
t.test(Suspension_coils$PSI, mu=1500)

#write 3 additional scripts for each of the manufactoring Lots
t.test((subset(Suspension_coils, Manufacturing_Lot == 'Lot1'))$PSI, mu=1500)
t.test((subset(Suspension_coils, Manufacturing_Lot == 'Lot2'))$PSI, mu=1500)
t.test((subset(Suspension_coils, Manufacturing_Lot == 'Lot3'))$PSI, mu=1500)
