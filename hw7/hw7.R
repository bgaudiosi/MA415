library(janeaustenr)
library(dplyr)
library(stringr)
library(tidytext)
library(ggplot2)
library(wordcloud)

lbj <- as.data.frame(read_lines("./LBJ first state of the union.txt"))

colnames(lbj) = "text"
lbj %>% filter(nchar)
lbj

tidy_books <- austen_books() %>%
  mutate(linenumber = row_number(),
         chapter = cumsum(str_detect(text, regex("^chapter [\\divxlc]", 
                                                 ignore_case = TRUE)))) %>%
  ungroup() %>%
  unnest_tokens(word, text)

tidy_books

nrc_joy <- get_sentiments("nrc") %>% 
  filter(sentiment == "joy")

nrc_anger <- get_sentiments("nrc") %>% 
  filter(sentiment == "anger")

nrc_anticipation <- get_sentiments("nrc") %>% 
  filter(sentiment == "anticipation")

tidy_books %>%
  filter(book == "Emma") %>%
  inner_join(nrc_joy) %>%
  count(word, sort = TRUE)

tidy_books %>%
  filter(book == "Emma") %>%
  inner_join(nrc_anger) %>%
  count(word, sort = TRUE)

tidy_books %>%
  filter(book == "Emma") %>%
  inner_join(nrc_anticipation) %>%
  count(word, sort = TRUE)

jane_austen_sentiment <- tidy_books %>%
  inner_join(get_sentiments("bing")) %>%
  count(book, index = linenumber %/% 80, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)

jane_austen_sentiment
ggplot(jane_austen_sentiment, aes(index, sentiment, fill = book)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~book, ncol = 2, scales = "free_x")



tidy_books %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))
