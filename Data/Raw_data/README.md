# README.md

This folder contains the raw data for this project. We begin with the data provided with the Palmerpenguins R package, which you can install in R using `install.packages("palmerpenguins")`

This dataset contains 17 columns, 16 data columns and one comment field, as explained in `datadictionary.csv` or the table below. 

`penguins_raw_dirty.csv` contains simulated raw data with random data entry errors that need to be cleaned.

Note: errors were introduced by `Project_template/Code/Processing_code/typos.R

The cleaned dataset is saved in `../Processed_data/` in both `.rda` and `.csv` versions, with a data dictionary in the `README.md`.  

The code for processing the raw data is in **Project_template > Code > Processing_code**, and runs from that working directory. 

# Files

`penguins_raw_dirty.csv` raw data with errors that need to be cleaned 
`penguins_raw.csv` original raw data from Palmerpenguins R package
`datadictionary.csv` data dictionary for raw data (also below)
`sites.csv` list of study sites and years 

# Data Dictionary `penquins_raw_dirty.csv`

|variable| description|
|----------|--------------|
| studyName | Sampling expedition from which data were collected, generated, etc.| 
| Sample Number | an integer denoting the continuous numbering sequence for each sample| 
| Species | a character string denoting the penguin species| 
| Region | a character string denoting the region of Palmer LTER sampling grid| 
| Island | a character string denoting the island near Palmer Station where samples were collected| 
| Stage | a character string denoting reproductive stage at sampling| 
| Individual ID | a character string denoting the unique ID for each individual in dataset| 
| Clutch Completion | a character string denoting if the study nest observed with a full clutch, i.e., 2 eggs| 
| Date Egg | a date denoting the date study nest observed with 1 egg (sampled)| 
| Culmen Length | a number denoting the length of the dorsal ridge of a bird's bill (millimeters)| 
| Culmen Depth | a number denoting the depth of the dorsal ridge of a bird's bill (millimeters)| 
| Flipper Length | an integer denoting the length penguin flipper (millimeters)| 
| Body Mass | an integer denoting the penguin body mass (grams)| 
| Sex | a character string denoting the sex of an animal| 
| Delta 15 N | a number denoting the measure of the ratio of stable isotopes 15N:14N| 
| Delta 13 C | a number denoting the measure of the ratio of stable isotopes 13C:12C| 
| Comments | a character string with text providing additional relevant information for data| 


