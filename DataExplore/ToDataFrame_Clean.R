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

DENT <- baby_coins$DENT[unlist(lapply(baby_coins$DENT, function(i) length(i)==10))]
REN <- baby_coins$REN[unlist(lapply(baby_coins$REN, function(i) length(i)==10))]
VGX <- baby_coins$VGX[unlist(lapply(baby_coins$VGX, function(i) length(i)==10))]
AR <- baby_coins$AR[unlist(lapply(baby_coins$AR, function(i) length(i)==10))]
ONEINCH <- baby_coins$`1INCH`[unlist(lapply(baby_coins$`1INCH`, function(i) length(i)==10))]
XVG <- baby_coins$XVG[unlist(lapply(baby_coins$XVG, function(i) length(i)==10))]
CRV <- baby_coins$CRV[unlist(lapply(baby_coins$CRV, function(i) length(i)==10))]
PROM <- baby_coins$PROM[unlist(lapply(baby_coins$PROM, function(i) length(i)==10))]
CFX <- baby_coins$CFX[unlist(lapply(baby_coins$CFX, function(i) length(i)==10))]
LSK <- baby_coins$LSK[unlist(lapply(baby_coins$LSK, function(i) length(i)==10))]

dent_frame <- as.data.frame(do.call(rbind, DENT))
dent_frame <- unnest(dent_frame, names(dent_frame))

ren_frame <- as.data.frame(do.call(rbind, REN))
ren_frame <- unnest(ren_frame, names(ren_frame))

vgx_frame <- as.data.frame(do.call(rbind, VGX)) 
vgx_frame <- unnest(vgx_frame, names(vgx_frame))

ar_frame <- as.data.frame(do.call(rbind, AR))
ar_frame <- unnest(ar_frame, names(ar_frame))

inch_frame <- as.data.frame(do.call(rbind, ONEINCH))
inch_frame <- unnest(inch_frame, names(inch_frame))

xvg_frame <- as.data.frame(do.call(rbind, XVG))
xvg_frame <- unnest(xvg_frame, names(xvg_frame))

crv_frame <- as.data.frame(do.call(rbind, CRV))
crv_frame <- unnest(crv_frame, names(crv_frame))

prom_frame <- as.data.frame(do.call(rbind, PROM))
prom_frame <- unnest(prom_frame, names(prom_frame))

cfx_frame <- as.data.frame(do.call(rbind, CFX))
cfx_frame <- unnest(cfx_frame, names(cfx_frame))

lsk_frame <- as.data.frame(do.call(rbind, LSK))
lsk_frame <- unnest(lsk_frame, names(lsk_frame))

dir.create("../private/coins", showWarnings = FALSE)

write.csv(dent_frame, file = "../private/coins/dent.csv", row.names = FALSE)
write.csv(ren_frame, file = "../private/coins/ren.csv", row.names = FALSE)
write.csv(vgx_frame, file = "../private/coins/vgx.csv", row.names = FALSE)
write.csv(ar_frame, file = "../private/coins/ar.csv", row.names = FALSE)
write.csv(inch_frame, file = "../private/coins/1inch.csv", row.names = FALSE)
write.csv(xvg_frame, file = "../private/coins/xvg.csv", row.names = FALSE)
write.csv(crv_frame, file = "../private/coins/crv.csv", row.names = FALSE)
write.csv(prom_frame, file = "../private/coins/prom.csv", row.names = FALSE)
write.csv(cfx_frame, file = "../private/coins/cfx.csv", row.names = FALSE)
write.csv(lsk_frame, file = "../private/coins/lsx.csv", row.names = FALSE)

