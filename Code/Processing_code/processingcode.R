###############################
# processing script
#
#this script loads the raw data, processes and cleans it 
#and saves it as Rds file in the Processed_data folder
#
# Note the ## ---- name ---- notation
# This is called "code chunk labels" and is done so one can 
# pull in the chunks of code into the Quarto document
# see here: https://bookdown.org/yihui/rmarkdown-cookbook/read-chunk.html
#
# We are also using some tidyverse packages to do the 
# same base R operations weʻve been learning (dplyr, tidyr, skimr)

## ---- packages --------
#load needed packages. make sure they are installed.
require(dplyr) #for data processing/cleaning
require(tidyr) #for data processing/cleaning
require(skimr) #for nice visualization of data 


## ---- loaddata1.1 --------
data_location <- "../../Data/Raw_data/penguins_raw_dirty.csv"
data_path <- "../../Data/Raw_data/"

## ---- loaddata1.2 --------
rawdata <- read.csv(data_location, check.names=FALSE)

## ---- loaddata1.3 --------
dictionary <- read.csv(paste(data_path, "datadictionary.csv", sep=""))
print(dictionary)


## ---- exploredata --------

#take a look at the data
dplyr::glimpse(rawdata)

#another way to summarize the data
summary(rawdata)

#yet another way to get an idea of the data
head(rawdata)

#this is a nice way to look at data
skimr::skim(rawdata)
 
## ---- exploredata2 --------

longnames <- names(rawdata)
names(rawdata) <- c("study name", "sn", "species", "region", "island", "stage", "id", "clutch completion", "egg", "culmen length", "culmen depth", "flipper length", "body mass", "sex", "delta 15 n", "delta 13 c", "comment")

## ---- cleandata1.1 --------

#check skimr or 
unique(rawdata$species)

# Letʻs save rawdata as d1, and modify d1 so we can compare versions. 

d1 <- rawdata

## ---- cleandata1.2 -------- 

ii <- grep("PengTin", d1$species)
d1$species[ii] <- "Adelie Penguin (Pygoscelis adeliae)"

#Another way:

d1$species <- sub("gTin", "guin", d1$species)

#fix rest of the typos
d1$species <- sub("gufn", "guin", d1$species)
d1$species <- sub("PeO", "Pen", d1$species)
d1$species <- sub("eMPen", "e Pen", d1$species)
d1$species <- sub("Ven", "Gen", d1$species)
d1$species <- sub("Kie", "lie", d1$species)

# look at partially fixed data again
unique(d1$species)

# check that there's only three species instead of 9.
skimr::skim(d1)

## ---- cleandata1.3 -------- 

ii <- grep("(Pygoscelis adeliae)", d1$species)
d1$species[ii] <- "Adelie"

ii <- grep("(Pygoscelis papua)", d1$species)
d1$species[ii] <- "Gentoo"

ii <- grep("(Pygoscelis antarctica)", d1$species)
d1$species[ii] <- "Chinstrap"

unique(d1$species)

## ---- cleandata2 --------

# temporarily change the culmen length variable to 'cl'
cl <- d1$'culmen length' 

#find "missing" and replace it with NA
cl[ cl == "missing" ] <- NA
#coerce to numeric
cl <- as.numeric(cl)  
d1$`culmen length` <- cl

# look at partially fixed data again
skimr::skim(d1)

# check the histogram to make sure the data seems reasonable.
hist(d1$`culmen length`)

# check with a bivariate plot with mass.
plot(d1$`body mass`, d1$`culmen length`)


## ---- cleandata3.1 --------

d2 <- d1 
cl[ cl > 300 ] 


## ---- cleandata3.2 --------
cl[ !is.na(cl) & cl>300 ]
cl[ !is.na(cl) & cl>300 ] <- cl[ !is.na(cl) & cl>300 ]/10  
d2$`culmen length` <- cl

skimr::skim(d2)
hist(d2$`culmen length`)

plot(d2$`body mass`, d2$`culmen length`)


## ---- cleandata4.1 --------
hist(d2$`body mass`)


## ---- cleandata4.2 --------
d3 <- d2
mm <- d3$`body mass`

# replace tiny masses with NA
mm[ mm < 100 ] <- NA       

# find which rows have NA for mass
nas <- which( is.na(mm) )

# drop the penguins (rows) with missing masses
d3 <- d3[ -nas, ]

skimr::skim(d3)
hist(d3$`body mass`)
plot(d3$`body mass`, d3$`culmen length`)


## ---- cleandata5 --------

d3$species <- as.factor(d3$species)
d3$sex <- as.factor(d3$sex)
d3$island <- as.factor(d3$island)  
skimr::skim(d3)


## ---- bivariateplots --------
plot(d3$`body mass`, d3$`culmen depth`)
plot(d3$`body mass`, d3$`flipper length`)
plot(d3$`body mass`, d3$`delta 15 n`)
plot(d3$`body mass`, d3$`delta 13 c`)

## ---- finalizedata --------

d3 <- d3 %>% select(-c('study name', 'id', 'sn')) 
skimr::skim(d3)

## ---- savedata --------
processeddata <- d3      # change if you did more steps


## ---- savedata2 --------

save_data_location <- "../../Data/Processed_data/processeddata.rds"
saveRDS(processeddata, file = save_data_location)

save_data_location_csv <- "../../Data/Processed_data/processeddata.csv"
write.csv(processeddata, file = save_data_location_csv, row.names=FALSE)


