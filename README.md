# Cyclistic Bike-Share Analysis
This project emphasizes on analyzing behavioral differences between riders of a bike-share company from its ride data.

## Business Task
Understand how annual members and casual riders use Cyclistics bike differently based on ride history.

## Dataset
The dataset used contain 12 months of ride data with over 5.8 million records.

## Tools Used
- R
- R Markdown
- tidyverse
- ggplot2
- dplyr
- lubridate

## Key Insights
- 63% of rides were made by annual members, while 37% were made by casual riders.
- Annual members ride mostly on weekdays, suggesting commuting behavior.
- Casual riders ride more on weekend, indicating leisure-oriented usage.
- Casual riders tend to have longer ride durations compared to annual members.

## Recommendations
- Point out the ease and benefits of commuting to work with Cyclistic membership.
- Offer leisure-orientated members benefits, such as an additional discounted rate for weekend rides or reward points for longer rides.
- Offer a limited-time membership trial for casual riders who have completed a certain number of rides or ride distance, encouraging them to experience the benefits of membership.

## Files
This repository is organized to reflect data analysis workflow, which consists of prepare, process, analysis, and share.

- scripts/01_preparation.R
<br>
Merges raw datasets and performs initial data structuring.

- scripts/02_processing.R
<br>
Cleans the dataset by handling missing values, removing duplicates and invalid data, and adding new variables, such as ride length and day of week.

- scripts/03_analyzing.R
<br>
Performs exploratory analysis and computes key statistics for insights.

- report/cyclistic-report.docx
<br>
Full case study documentation, including business context, analysis, and recommendations.

- report/sharing.Rmd
<br>
Generates visuals and communicates findings.

- report/sharing.html
<br>
Renders report, containing charts and explanation.

## Dataset
Due to Github file size limitations, raw datasets are not included in this repository.

The dataset can be accessed from
https://divvy-tripdata.s3.amazonaws.com/index.html

Instructions:

1. Download the 2024 trip data files
2. Place them in `data/raw` directory
3. Run scripts in order