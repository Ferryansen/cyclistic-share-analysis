# THE PROCESSING OF CYCLISTIC DATASET
# =====================================


# Set packages
library("tidyverse")
library("here")


# Read the file
all_trips <- read_csv(here("data", "raw", "merged", "all_trips_2024.csv"))


# Check if there're still empty valued attributes in each of the records
colSums(is.na(all_trips))

# Clearing or filling out the nulls
all_trips <- all_trips %>% 
  mutate(
    start_station_name = ifelse(is.na(start_station_name), "Unknown Station", start_station_name),
    end_station_name = ifelse(is.na(end_station_name), "Unknown Station", end_station_name)
  )

# Check if there're still empty valued attributes in each of the records
colSums(is.na(all_trips))


# checking if there's any duplicate ride history
sum(duplicated(all_trips$ride_id))

# Remove the duplicated ride_ids
cleaned_duplicates <- all_trips %>% 
  distinct(ride_id, .keep_all = TRUE)

# This is the total removed rows, check if it's aligned with total of duplicates
nrow(all_trips) - nrow(cleaned_duplicates)

# Copy it to the main
all_trips <- cleaned_duplicates


# Timestamp type checking
str(all_trips[, c("started_at", "ended_at")]) # If it's POSIXct, then it's good to go

# Checking range of timestamps
range(all_trips$started_at)
range(all_trips$ended_at)


# Check rides that have invalid timeline
# Note: invalids here mean error timeline and instant cancelled trips
sum(all_trips$ended_at <= all_trips$started_at, na.rm = TRUE)

invalid_trips <- all_trips %>% 
  filter(ended_at <= started_at) 
View(invalid_trips) #It seems like there're some errors in data storing

# Remove records with invalid timeline (and create ride length at the same time, two birds with one stone)
all_trips <- all_trips %>% 
  mutate(
    ride_length = as.numeric(difftime(ended_at, started_at, units = "secs"))
  )

# Filtering the invalid times
all_trips <- all_trips %>% 
  filter(ride_length > 0)

# Add day of week attribute
all_trips <- all_trips %>% 
  mutate(
    day_of_week = factor(
      wday(started_at, label = TRUE, abbr = FALSE)
    )
  ) 


# Now save the changes by creating a new csv file that has been cleaned
setwd(here("data"))

write_csv(all_trips, "all_trips_processed_2024.csv")
