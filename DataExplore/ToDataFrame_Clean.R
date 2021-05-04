library("rjson")
library("dplyr")
library("tidyr")
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
btc_frame <- unnest(btc_frame, names(btc_frame))

eth_frame <- as.data.frame(do.call(rbind, eth))
eth_frame <- unnest(eth_frame, names(eth_frame))

bnb_frame <- as.data.frame(do.call(rbind, bnb)) 
bnb_frame <- unnest(bnb_frame, names(bnb_frame))

ada_frame <- as.data.frame(do.call(rbind, ada))
ada_frame <- unnest(ada_frame, names(ada_frame))

dot_frame <- as.data.frame(do.call(rbind, dot))
dot_frame <- unnest(dot_frame, names(dot_frame))

uni_frame <- as.data.frame(do.call(rbind, uni))
uni_frame <- unnest(uni_frame, names(uni_frame))

ltc_frame <- as.data.frame(do.call(rbind, ltc))
ltc_frame <- unnest(ltc_frame, names(ltc_frame))

link_frame <- as.data.frame(do.call(rbind, link))
link_frame <- unnest(link_frame, names(link_frame))

vet_frame <- as.data.frame(do.call(rbind, vet))
vet_frame <- unnest(vet_frame, names(vet_frame))

xlm_frame <- as.data.frame(do.call(rbind, xlm))
xlm_frame <- unnest(xlm_frame, names(xlm_frame))


dir.create("../private/coins", showWarnings = FALSE)

write.csv(btc_frame, file = "../private/coins/btc.csv", row.names = FALSE)
write.csv(eth_frame, file = "../private/coins/eth.csv", row.names = FALSE)
write.csv(bnb_frame, file = "../private/coins/bnb.csv", row.names = FALSE)
write.csv(ada_frame, file = "../private/coins/ada.csv", row.names = FALSE)
write.csv(dot_frame, file = "../private/coins/dot.csv", row.names = FALSE)
write.csv(uni_frame, file = "../private/coins/uni.csv", row.names = FALSE)
write.csv(ltc_frame, file = "../private/coins/ltc.csv", row.names = FALSE)
write.csv(link_frame, file = "../private/coins/link.csv", row.names = FALSE)
write.csv(vet_frame, file = "../private/coins/vet.csv", row.names = FALSE)
write.csv(xlm_frame, file = "../private/coins/xlm.csv", row.names = FALSE)


#############Baby Coins #################


########################################

baby_coins <- fromJSON(file = "../private/baby_coin_data.json")
names(baby_coins)

akt <- baby_coins$AKT[unlist(lapply(baby_coins$AKT, function(i) length(i)==10))]
bao <- baby_coins$BAO[unlist(lapply(baby_coins$BAO, function(i) length(i)==10))]
aoa <- baby_coins$AOA[unlist(lapply(baby_coins$AOA, function(i) length(i)==10))]
rbc <- baby_coins$RBC[unlist(lapply(baby_coins$RBC, function(i) length(i)==10))]
dag <- baby_coins$DAG[unlist(lapply(baby_coins$DAG, function(i) length(i)==10))]
bfc <- baby_coins$BFC[unlist(lapply(baby_coins$BFC, function(i) length(i)==10))]
mush <- baby_coins$MUSH[unlist(lapply(baby_coins$MUSH, function(i) length(i)==10))]
forth <- baby_coins$FORTH[unlist(lapply(baby_coins$FORTH, function(i) length(i)==10))]
att <- baby_coins$ATT[unlist(lapply(baby_coins$ATT, function(i) length(i)==10))]
bnana <- baby_coins$BNANA[unlist(lapply(baby_coins$BNANA, function(i) length(i)==10))]

akt_frame <- as.data.frame(do.call(rbind, akt))
akt_frame <- unnest(akt_frame, names(akt_frame))

bao_frame <- as.data.frame(do.call(rbind, bao))
bao_frame <- unnest(bao_frame, names(bao_frame))

aoa_frame <- as.data.frame(do.call(rbind, aoa)) 
aoa_frame <- unnest(aoa_frame, names(aoa_frame))

rbc_frame <- as.data.frame(do.call(rbind, rbc))
rbc_frame <- unnest(rbc_frame, names(rbc_frame))

dag_frame <- as.data.frame(do.call(rbind, dag))
dag_frame <- unnest(dag_frame, names(dag_frame))

bfc_frame <- as.data.frame(do.call(rbind, bfc))
bfc_frame <- unnest(bfc_frame, names(bfc_frame))

mush_frame <- as.data.frame(do.call(rbind, mush))
mush_frame <- unnest(mush_frame, names(mush_frame))

forth_frame <- as.data.frame(do.call(rbind, forth))
forth_frame <- unnest(forth_frame, names(forth_frame))

att_frame <- as.data.frame(do.call(rbind, att))
att_frame <- unnest(att_frame, names(att_frame))

bnana_frame <- as.data.frame(do.call(rbind, bnana))
bnana_frame <- unnest(bnana_frame, names(bnana_frame))

dir.create("../private/coins", showWarnings = FALSE)

write.csv(akt_frame, file = "../private/coins/akt.csv", row.names = FALSE)
write.csv(bao_frame, file = "../private/coins/bao.csv", row.names = FALSE)
write.csv(aoa_frame, file = "../private/coins/aoa.csv", row.names = FALSE)
write.csv(rbc_frame, file = "../private/coins/rbc.csv", row.names = FALSE)
write.csv(dag_frame, file = "../private/coins/dag.csv", row.names = FALSE)
write.csv(bfc_frame, file = "../private/coins/bfc.csv", row.names = FALSE)
write.csv(mush_frame, file = "../private/coins/mush.csv", row.names = FALSE)
write.csv(forth_frame, file = "../private/coins/forth.csv", row.names = FALSE)
write.csv(att_frame, file = "../private/coins/att.csv", row.names = FALSE)
write.csv(bnana_frame, file = "../private/coins/bnana.csv", row.names = FALSE)

