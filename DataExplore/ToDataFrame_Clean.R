library("rjson")
library("dplyr")
established_coins <- fromJSON(file = "../private/established_coin_data.json")
names(established_coins)

btc <- established_coins$BTC[unlist(lapply(established_coins$BTC, function(i) length(i)==10))]
eth <- established_coins$ETH[unlist(lapply(established_coins$ETH, function(i) length(i)==10))]
bnb <- established_coins$BNB[unlist(lapply(established_coins$BNB, function(i) length(i)==10))]
ada <- established_coins$ADA[unlist(lapply(established_coins$ADA, function(i) length(i)==10))]
dot <- established_coins$DOT[unlist(lapply(established_coins$DOT, function(i) length(i)==10))]
uni <- established_coins$UNI[unlist(lapply(established_coins$UNI, function(i) length(i)==10))]
ltc <- established_coins$LTC[unlist(lapply(established_coins$LTC, function(i) length(i)==10))]
link <- established_coins$LINK[unlist(lapply(established_coins$LINK, function(i) length(i)==10))]
vet <- established_coins$VET[unlist(lapply(established_coins$VET, function(i) length(i)==10))]
xlm <- established_coins$XLM[unlist(lapply(established_coins$XLM, function(i) length(i)==10))]


btc_frame <- as.data.frame(do.call(rbind, btc))
eth_frame <- as.data.frame(do.call(rbind, eth))
bnb_frame <- as.data.frame(do.call(rbind, bnb)) 
ada_frame <- as.data.frame(do.call(rbind, ada))
dot_frame <- as.data.frame(do.call(rbind, dot))
uni_frame <- as.data.frame(do.call(rbind, uni))
ltc_frame <- as.data.frame(do.call(rbind, ltc))
link_frame <- as.data.frame(do.call(rbind, link))
vet_frame <- as.data.frame(do.call(rbind, vet))
xlm_frame <- as.data.frame(do.call(rbind, xlm))

