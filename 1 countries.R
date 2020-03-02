install.packages("devtools")

devtools::install_github("davidsjoberg/ggbump")


if(!require(pacman)) install.packages("pacman")
library(ggbump)
pacman::p_load(tidyverse, cowplot, wesanderson)

library(tibble)
df <- tibble(country = c("UK", "UK", "UK", "India", "India", "India", "USA", "USA", "USA", "China", "China", "China","Pakistan", "Pakistan", "Pakistan"),
             year = c(2017, 2018, 2019, 2017, 2018, 2019, 2017, 2018, 2019, 2017, 2018,2019, 2017,2018,2019),
             rank = c(1, 2, 1, 4, 3, 4, 2, 1, 3, 3, 2, 2,5,4,5))

knitr::kable(df)

library(ggplot2)

ggplot(df, aes(year, rank, color = country)) +
  geom_bump()

ggplot(df, aes(year, rank, color = country)) +
  geom_point(size = 7) +
  geom_text(data = df %>% filter(year == min(year)),
            aes(x = year - .1, label = country), size = 5, hjust = 1) +
  geom_text(data = df %>% filter(year == max(year)),
            aes(x = year + .1, label = country), size = 5, hjust = 0) +
  geom_bump(aes(smooth = 8), size = 2) +
  scale_x_continuous(limits = c(2016.6, 2019.2),
                     breaks = seq(2017, 2019, 1)) +
  theme_minimal_grid(font_size = 10, line_size = 0) +
  theme(legend.position = "none",
        panel.grid.major = element_blank()) +
  labs(y = "RANK INTERNET USAGE",
       x = NULL) +
  scale_y_reverse() +
  scale_color_manual(values = wes_palette(n = 5, name = "Darjeeling1" ))

