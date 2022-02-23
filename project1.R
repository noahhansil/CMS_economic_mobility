library(tidyverse)
library(dplyr)
library(sf)
getwd()
data <- read.csv("CMS_student_data.csv")
geo_files <- list.files("shp", pattern = "*shp",full.names = TRUE)
shapefile_list <- lapply(geo_files, read_sf)
all_schools <- bind_rows(shapefile_list[[1]], shapefile_list[[2]])


colnames(data) <- c('school','year','student_pop','grad_rate','avg_SAT_score','ap_IB_enrollment',
                    'ccp_enrollment','total_teachers','avg_daily_attendance',
                    'college_enrollment', 'school_perf_score', 'students_per_teacher')

data$student_pop <- as.numeric(data$student_pop)
data$grad_rate <- as.numeric(data$grad_rate)
data$college_enrollment <- as.numeric(data$college_enrollment)
data$avg_SAT_score <- as.numeric(data$avg_SAT_score)
data$ap_IB_enrollment <- as.numeric(data$ap_IB_enrollment)
data$ccp_enrollment <- as.numeric(data$ccp_enrollment)
data$total_teachers <- as.numeric(data$total_teachers)
data$avg_daily_attendance <- as.numeric(data$avg_daily_attendance)
data$college_enrollment <- as.numeric(data$college_enrollment)
data$school_perf_score <- as.numeric(data$school_perf_score)
data$students_per_teacher <- as.numeric(data$students_per_teacher)

colnames(data) <- c('school','year','student_pop','grad_rate','avg_SAT_score','ap_IB_enrollment',
                    'ccp_enrollment', 'student_low_SES','total_teachers','avg_daily_attendance',
                    'college_enrollment', 'school_perf_score', 'students_per_teacher')
mean_grad_rate <- mean(data$grad_rate)


normalize <- function(x) {
  return ((x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE)))}

normalize(data$grad_rate)

mean_grad_rate <- mean(data$grad_rate, na.rm=TRUE)
mean_college_enrollment <- mean(data$college_enrollment, na.rm=TRUE)

data_2016 <- filter(data, year==2016)
data_2017 <- filter(data, year==2017)
data_2018 <- filter(data, year==2018)
data_2019 <- filter(data, year==2019)
data_2020 <- filter(data, year==2020)

mean_student_pop <- mean(data$student_pop, na.rm=TRUE)
min(data$student_pop, na.rm=TRUE)
max(data$student_pop, na.rm=TRUE)

mean_grad_rate <- mean(data$grad_rate, na.rm=TRUE)
min(data$grad_rate, na.rm=TRUE)

mean_avg_sat <- mean(data$avg_SAT_score, na.rm=TRUE)
min(data$avg_SAT_score, na.rm=TRUE)
max(data$avg_SAT_score, na.rm=TRUE)

mean_ap_ib <- mean(data$ap_IB_enrollment, na.rm=TRUE)
min(data$ap_IB_enrollment, na.rm=TRUE)
max(data$ap_IB_enrollment, na.rm=TRUE)

mean_ccp_enrollment <- mean(data$ccp_enrollment, na.rm=TRUE)
min(data$ccp_enrollment, na.rm=TRUE)
max(data$ccp_enrollment, na.rm=TRUE)

mean_teachers <- mean(data$total_teachers, na.rm=TRUE)
min(data$total_teachers, na.rm=TRUE)
max(data$total_teachers, na.rm=TRUE)

mean_avg_attendance <- mean(data$avg_daily_attendance, na.rm=TRUE)
min(data$avg_daily_attendance, na.rm=TRUE)
max(data$avg_daily_attendance, na.rm=TRUE)

mean_college_enrollment <- mean(data$college_enrollment, na.rm=TRUE)
min(data$college_enrollment, na.rm=TRUE)
max(data$college_enrollment, na.rm=TRUE)

mean_school_score <- mean(data$school_perf_score, na.rm=TRUE)
min(data$school_perf_score, na.rm=TRUE)
max(data$school_perf_score, na.rm=TRUE)

mean_students_per_teach <- mean(data$students_per_teacher, na.rm=TRUE)
min(data$students_per_teacher, na.rm=TRUE)
max(data$students_per_teacher, na.rm=TRUE)


# sum of student population
# data_2016$student_pop <- as.numeric(data_2016$student_pop)
# data_2017$student_pop <- as.numeric(data_2017$student_pop)
# data_2018$student_pop <- as.numeric(data_2018$student_pop)
# data_2019$student_pop <- as.numeric(data_2019$student_pop)
# data_2020$student_pop <- as.numeric(data_2020$student_pop)
# 
# stud_pop_2016 = sum(data_2016$student_pop, na.rm=TRUE)
# stud_pop_2017 = sum(data_2017$student_pop, na.rm=TRUE)
# stud_pop_2018 = sum(data_2018$student_pop, na.rm=TRUE)
# stud_pop_2019 = sum(data_2019$student_pop, na.rm=TRUE)
# stud_pop_2020 = sum(data_2020$student_pop, na.rm=TRUE)

#stud_pop <- list(stud_pop_2016,stud_pop_2017,stud_pop_2018,
#            stud_pop_2019,stud_pop_2020)

pop_year <- ggplot(data, aes(year, student_pop))
pop_year + geom_col(fill="green") + labs(x="Year", y="CMS Student Population",
                      title="Changes in Student Population in All High Schools in CMS")

grad_year <- ggplot(data, aes(year, average(grad_rate)))
grad_year + geom_col(fill="green") + labs(x="Year", y="4-Year Graduation Rates",
                                          title="Average Graduation Rates for CMS schools")
grad_heat <- ggplot(data, aes(year, school, fill=grad_rate)) + geom_tile()
grad_heat + labs(x="Year",y="High School", fill="Graduation Rate", title="Heat Map of Graduation Rates per High School")


sat_heat <- ggplot(data, aes(year, school, fill=avg_SAT_score)) + geom_tile()
sat_heat + labs(x="Year",y="High School", fill="Average SAT Score", title="Heat Map of Avg SAT Scores per High School")


data <- data %>% select(-contains("High School"))

data$school <- gsub("High School","",data$school)

