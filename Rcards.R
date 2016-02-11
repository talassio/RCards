# Rcards
# Inspired by https://www.qwertycards.com/
# To see how to use card visit link.
#
# AM Sajo Castelli
# 10 Feb 2016
#
# Remember to change the RNG seed
#
# This program is for entretainmente purposes only.
# Use at you own risk.

# Configuration ####
# Add a reference for this card
# e.g. Personal Key or Work Key
Reference = 'lexy foxy ruby  '
# Change RNG seed and save it in a SAFE place...
seed = 3412567
# PDF file to output Card
# pdffile = NA 
pdffile = 'RCards.pdf'
# whant to use hard to view characters?
# Hard = TRUE # Not recommended...
Hard = FALSE

# Card layout 
# 4 Rows: 10 // 10 // 9 // 7
width = 1
hsep = 0.3
height = 2
vsep = 0.333
extray = 0.4 * height

# This is the pool of characters to pick from:
# LETTERS
# letters
printable.easy = c('@', '#', '$', '%', '*', '(', ')', '-', '=', '+', ',', '<', '.', '>', '/', '?', ';', ':')
printable.hard = c('~', '!', '\\', '|', ']', '}', '[', '_', '{')

getalignment <- function(width, hsep, qty) { cumsum(c(0,rep(c(width, hsep), each = 1, times = 10, length.out = qty+qty-1))) } 
plotkeyb <- function(x = 0, y = 0, labels = c('0', 'A'), lwd.out = 2, lwd.in = 1, width = 1, height = 2) {
        polygon(c(x+0, x+0, x+width, x+width), c(y+0.5*height, y+height, y+height, y+0.5*height), col = 'black')
        polygon(c(x+0, x+0, x+width, x+width), c(y+0, y+height, y+height, y+0), border = 'black', lwd = lwd.out)
        lines(c(x+0, x+width), y + 0.5 * c(height, height), lwd = lwd.in)
        text(x + 0.5 * c(width, width), y + c(0.25 * height, 0.75 * height), labels = labels, col=c('black', 'white'), family='mono', font = 2)
}

# Card generation ####
input = LETTERS
if (Hard) {
        output = c(LETTERS, letters, printable.easy, printable.hard)
} else {
        output = c(LETTERS, letters, printable.easy)
}


set.seed(seed)

SpaceBarLength = 8 # 2 LETTERS 2 letters, 2 numbers and 2 easy
SpaceBar = paste0(sample(c(sample(LETTERS, 2), sample(letters, 2), sample(0:9, 2), sample(printable.easy, 2)), 8), collapse = '')
QUERTY = strsplit('QWERTYUIOPASDFGHJKLZXCVBNM', NULL, fixed = TRUE)[[1]] 
QUERTY_ENC =  paste(sample(output, 36, replace = FALSE))
MAP = cbind(QUERTY_ENC, c(1:9, 0, QUERTY))
# MAP

vqty = 4; y = rev(getalignment(height, vsep, vqty)[-seq(2, 2 * vqty, 2)])
hqty = 10
x = getalignment(width, hsep, hqty)[-seq(2, 2 * hqty, 2)]      
if ( ! is.na(pdffile) ) pdf(pdffile, width = 3.37, height=2.125)
par(mai=rep(0, 4)) # , omi=rep(0,4))
plot(c(0-2*hsep, x[hqty]+width+2*hsep), c(y[vqty]-2*vsep+extray-height, y[1]+height+2*vsep), typ='n', axes = FALSE, ylab = NA, xlab = NA)
k = 0
p = cumsum(c(0, 10, 10, 9, 7))
center = c(0, 0, 0.5*width, 1.5*width+hsep)
for ( hqty in c(10, 10, 9, 7) ) {
        k = k + 1
        x = getalignment(width, hsep, hqty)[-seq(2, 2 * hqty, 2)]      
        for ( c in 1 : hqty ) plotkeyb(x = center[k]+x[c], y = y[k], labels = MAP[p[k] + c, ])
} 
hqty = 10
x = getalignment(width, hsep, hqty)[-seq(2, 2 * hqty, 2)]      
polygon(c(x[1]-2*hsep, x[hqty]+width+2*hsep, x[hqty]+width+2*hsep, x[1]-2*hsep), c(y[vqty]-2*vsep, y[vqty]-2*vsep, y[1]+height+2*vsep, y[1]+height+2*vsep), lwd=3)
# text(0.5*(x[hqty]+width), y[vqty]-4.5*vsep, labels = paste(SpaceBar), family='mono', font = 2)
text(0.5*(x[hqty]+width), y[vqty]-4.5*vsep, labels = paste(Reference, SpaceBar), family='mono', font = 2)
if ( ! is.na(pdffile) ) dev.off()
