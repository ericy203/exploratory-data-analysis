setwd("~/Documents/School/Springboard/Data Wrangling/Exercise 2")
titanic <- read.csv("titanic_original.csv", header = TRUE, stringsAsFactors = FALSE)

library(ggplot2)
# 1 - Check the structure of titanic
str(titanic)

titanic %>%
  select(sex, name, survived) %>%
  filter(sex == "")

titanic$sex[titanic$sex==""]<- NA

titanic2 <- titanic[!is.na(titanic$sex), ]

titanic2 %>%
  select(sex, name, survived) %>%
  filter(sex == "")

# 2 - Use ggplot() for the first instruction
ggplot(titanic2, aes(x = pclass, fill = sex)) +
  geom_bar(position = "dodge")

# 3 - Plot 2, add facet_grid() layer
ggplot(titanic2, aes(x = pclass, fill = sex)) +
  geom_bar(position = "dodge") +
  facet_grid(. ~ survived)

# 4 - Define an object for position jitterdodge, to use below
posn.jd <- position_jitterdodge(0.5, 0, 0.6)

# 5 - Plot 3, but use the position object from instruction 4
ggplot(titanic2, aes(x = pclass, y = age, color = sex)) +
  geom_point(position = posn.jd, size = 3, alpha = 0.5) +
  facet_grid(. ~ survived)

