# ---- 1) Create column vectors ----
RegNo <- c("24BCE1001","24BCE1002","24BCE1003","24BCE1004","24BCE1005",
           "24BCE1006","24BCE1007","24BCE1008","24BCE1009","24BCE1010")

Name <- c("Aadesh Kumar","Bhavya Reddy","Charan Iyer","Divya Sharma",
          "Esha Nair","Farhan Khan","Gayathri Raj","Harish Kumar",
          "Ishita Menon","Jai Verma")

Programme <- c("B.Tech","B.Tech","B.Tech","B.Tech","B.Tech",
               "B.Tech","B.Tech","B.Tech","B.Tech","B.Tech")

Specialization <- c("CSE","AI","DS","IT","CSE",
                    "ECE","Cyber","AI","DS","IT")

Assess1 <- c(18,15,20,14,20,12,17,16,19,18)
Assess2 <- c(17,16,19,15,20,14,18,17,18,17)
Assess3 <- c(19,14,18,15,19,13,17,16,19,16)
Assess4 <- c(18,18,20,16,20,16,19,15,18,19)

# ---- 2) Build the data frame ----
students <- data.frame(
  RegNo,
  Name,
  Programme,
  Specialization,
  Assess1,
  Assess2,
  Assess3,
  Assess4,
  stringsAsFactors = FALSE
)

str(students)
head(students)

# ---- 3) Write input CSV ----
write.csv(students, "students_input.csv", row.names = FALSE, na = "")

# ---- 4) Read back from CSV ----
students_in <- read.csv("students_input.csv", stringsAsFactors = FALSE)

# Coerce assessment columns to numeric (safety step)
assess_cols <- c("Assess1","Assess2","Assess3","Assess4")
students_in[, assess_cols] <- lapply(students_in[, assess_cols], as.numeric)

# Validate columns exist
stopifnot(all(assess_cols %in% names(students_in)))

# ---- 5) Per-student analytics ----
students_in$Total   <- rowSums(students_in[, assess_cols])
students_in$Average <- round(students_in$Total / 4, 2)

# Highest total = Rank 1; ties broken by RegNo (stable sort)
students_in$Rank <- rank(-students_in$Total, ties.method = "min")

# Sort ascending by Rank, then RegNo to stabilize ties
students_by_rank <- students_in[order(students_in$Rank, students_in$RegNo), ]

print(students_by_rank)

# Save ranked output
write.csv(students_by_rank, "students_by_rank.csv", row.names = FALSE, na = "")

# ---- 6) Assessment-wise averages (overall) ----
assess_avg_vec <- colMeans(students_in[, assess_cols], na.rm = TRUE)

assessment_wise_averages <- data.frame(
  Assessment = assess_cols,
  Average    = round(assess_avg_vec, 2)
)

print(assessment_wise_averages)
write.csv(assessment_wise_averages, "assessment_wise_averages.csv", row.names = FALSE, na = "")

# ---- 7) Specialization-wise averages (per assessment + overall) ----
spec_avg <- aggregate(
  students_in[, assess_cols],
  by  = list(Specialization = students_in$Specialization),
  FUN = function(x) mean(x, na.rm = TRUE)
)

spec_avg$Overall_Average <- rowMeans(spec_avg[, assess_cols], na.rm = TRUE)

# Round all numeric columns
spec_avg[, assess_cols]       <- round(spec_avg[, assess_cols], 2)
spec_avg$Overall_Average      <- round(spec_avg$Overall_Average, 2)

# Sort by Overall_Average descending
spec_avg <- spec_avg[order(-spec_avg$Overall_Average), ]

print(spec_avg)
write.csv(spec_avg, "specialization_wise_averages.csv", row.names = FALSE, na = "")