install.packages("rvest")
library(rvest)
theurl <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"
file <- read_html(theurl)
tables <- html_nodes(file, "table")  
table1 <- html_table(tables[1], fill = TRUE)
table <- na.omit(as.data.frame(table1)) 

x <- gsub("MXN","",table$Sueldo)
x <- gsub("/mes","",x)
x <- gsub("[:$:]","",x)
x <- gsub(",","",x)
x <- as.numeric(x)
str(x)

table2 <- mutate(table, Sueldo = x)

table2 %>% filter(Sueldo==max(Sueldo))
table2 %>% filter(Sueldo==min(Sueldo))
