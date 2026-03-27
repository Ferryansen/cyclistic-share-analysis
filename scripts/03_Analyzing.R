# ANALYZATION OF CYCLISTIC DATASET
# ================================


# Initial Setup
all_trips <- read_csv(here("data", "all_test_trips_processed_2024.csv"))

# Add day of week when the trip record is appearing
correct_level <- c(
  "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
)

all_trips <- all_trips %>% 
  mutate(
    day_of_week = factor(day_of_week, levels = correct_level)
  )


# Proportion
count_casual_member <- table(all_trips$member_casual)


#Statistics

#ride_length
#Histogram (Skew Checking)
median(all_trips$ride_length)
mean(all_trips$ride_length)
hist(all_trips$ride_length, breaks = 50, 
     xlab = "Ride Length", main = "Ride Length Distribution")

all_trips %>% 
  group_by(member_casual) %>% 
  summarise(
    Min = min(ride_length, na.rm = TRUE),
    Q1 = quantile(ride_length, 0.25, na.rm = TRUE),
    Med = median(ride_length, na.rm = TRUE),
    Q3 = quantile(ride_length, 0.75, na.rm = TRUE),
    Max = max(ride_length, na.rm = TRUE)
  ) %>% 
  pivot_longer(
    cols = -member_casual,
    names_to = "Stats",
    values_to = "value"
  ) %>% 
  pivot_wider(
    names_from = member_casual,
    values_from = value
  )
all_trips %>% 
  group_by(member_casual) %>% 
  summarise(
    Median = median(ride_length, na.rm = TRUE)
  ) %>% 
  pivot_longer(
    cols = Median,
    names_to = "Stats",
    values_to = "values"
  ) %>% 
  pivot_wider(
    names_from = member_casual,
    values_from = values
  )
# By Day of Week
all_trips %>% 
  group_by(member_casual, day_of_week) %>% 
  summarise(
    Median = median(ride_length)
  ) %>% 
  pivot_wider(
    names_from = day_of_week,
    values_from = Median
  )


# Day of Week

all_trips %>% 
  group_by(member_casual, day_of_week) %>% 
  summarise(
    Rides = n()
  ) %>% 
  pivot_wider(
    names_from = day_of_week,
    values_from = Rides
  )
