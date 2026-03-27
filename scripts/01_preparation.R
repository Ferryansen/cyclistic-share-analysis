# PREPARATION OF THE CYCLISTIC DATASETS
# =====================================


# set packages
library("tidyverse")
library("here")

# Set working directory for these files
setwd(here("data", "raw"))

# Specify the files and store it to a variable
files <- list.files(pattern = "*.csv")

#Check if all columns have the same name
for(file in files) {
  data <- read_csv(file, n_max = 1)
  cat("\nFile:", file, "\n")
  print(names(data))
}

# Stack all the data value by the same column
all_trips <- files %>% 
  map(read_csv) %>% 
  bind_rows()

# Remove non-usable variables
all_trips <- all_trips %>% 
  select(-start_lat, -end_lat, -start_lng, -end_lng)

# Save as a file
write_csv(all_trips, here("data", "raw", "merged", "all_trips_2024.csv"))