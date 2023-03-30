# Code Folder

## Code Location:

This directory contains `.R` or `.qmd` scripts in the folders as appropriate:

- Processing_code cleans raw data and converts to processed data
- Analysis_code performs analyses on cleaned data. 


## Code Design:

You can either have fewer large scripts, or multiple scripts that do only specific actions. Those can be R scripts or qmd files. In either case, document the scripts and what goes on in them so well that someone else (including future you) can easily figure out what is happening.

The scripts should load the appropriate data (e.g. raw or processed), perform actions, and save results (e.g. processed data, figures, computed values) in the appropriate folders. 

Be sure to use **relative paths** so that each script works from the working directory set to the folder that the script is in. 

## Code Documentation:

## **`processingcode.R` - cleans raw data, outputs clean data**

**Inputs**

```{r}
reads in the following files from `../../Data/Raw_data/`
	`penguins_raw_dirty.csv` - The raw data
	`datadictionary.csv` - The data dictionary for the raw data
```

**Outputs**
```{r}
outputs to `../../Data/Processed_data/`
	`processeddata.rds` - clean data in rds (R) format
	`processeddata.csv` - clean data in .csv format
	`orig_names.rds` - short variable names associated with long original variable names in rds format
```