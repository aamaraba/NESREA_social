# shinyNESREA/helpers.R
# Helper functions for the NESREA_Twitter Shiny App

# To download data
library(twitteR)
library(httr)
source("~/7-NESREA/SA/WMG/socialmedia/NESREA_Twitter/nesrea-twitterAuth.R")
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tweets <- searchTwitter("NESREA", n = 200, since = "2016-06-14")
tweetsDF <- twListToDF(tweets)
tweetsDF$text <- stringr::str_replace_all(tweetsDF$text, "[^[:graph:]]", " ")
saveRDS(tweetsDF,
        "~/7-NESREA/SA/WMG/socialmedia/NESREA_Twitter/shinyNESREA/data/nesrea-tweet-df.rds")
rm(list = ls())