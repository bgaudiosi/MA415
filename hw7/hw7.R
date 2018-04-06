library(dplyr)
library(stringr)
library(tidytext)

lbj <- data_frame(president="lbj", text = read_lines("./LBJ first state of the union.txt"))
ford <- data_frame(president="ford", text = read_lines("./Ford first state of the union.txt"))
presidents <- rbind(lbj, ford)
tidy_presidents <- presidents %>% unnest_tokens(word, text)

nrc_joy <- get_sentiments("nrc") %>% 
  filter(sentiment == "joy")

nrc_anger <- get_sentiments("nrc") %>% 
  filter(sentiment == "anger")

nrc_anticipation <- get_sentiments("nrc") %>% 
  filter(sentiment == "anticipation")

lbj_joy <- tidy_presidents %>%
  filter(president == "lbj") %>%
  inner_join(nrc_joy) %>%
  count(word, sort = TRUE)

lbj_anger <- tidy_presidents %>%
  filter(president == "lbj") %>%
  inner_join(nrc_anger) %>%
  count(word, sort = TRUE)

lbj_anticipation <- tidy_presidents %>%
  filter(president == "lbj") %>%
  inner_join(nrc_anticipation) %>%
  count(word, sort = TRUE)

ford_joy <- tidy_presidents %>%
  filter(president == "ford") %>%
  inner_join(nrc_joy) %>%
  count(word, sort = TRUE)

ford_anger <- tidy_presidents %>%
  filter(president == "ford") %>%
  inner_join(nrc_anger) %>%
  count(word, sort = TRUE)

ford_anticipation <- tidy_presidents %>%
  filter(president == "ford") %>%
  inner_join(nrc_anticipation) %>%
  count(word, sort = TRUE)

president_sentiment <- tidy_presidents %>%
  inner_join(get_sentiments("bing")) %>%
  count(president, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)

