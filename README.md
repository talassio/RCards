# RCards
Password Cards done with R

![RCard Demo](https://github.com/talassio/RCards/raw/master/RCards.png "RCard Demo")

## What is it?
*RCards* is a small R script that generates *Password Cards*. It is inspired by [qwertycards.com](https://www.qwertycards.com).

## How do I use it?
Open the script, change the Random Number Generator Seed, define the PDF output filename and source the script.

## No, really, how do I use the card?
The card has three parts, a *map* table, that maps the alphanumeric keys of your keyboard to a scambled (random) table,
a *Pass phrase* (of variable lenth, the above example is a three words phrase) and 
an 8 character in length *Spacebar code*:

  1. With the *map* you translate the web site's name to the *scrambled version*
  2. With the *Pass phrase* you can enhance your password
  3. You will also need a third _secret_ part that is a *personal password* that only you know 
     and is not in the card. 

Finally, to use it you _combine_ the *Spacebar code*, the *personal password*, 
 *scrambled version* of the site's name and one or all words of the *Pass phrase*.

For example, say your *personal password* is "NethsyBlu3", then a possible password for a gmail account using the above **RCard**, could be

Password = *Spacebar code* + *personal password* + *scrambled version of gmail* + *Pass phrase*.

`el18<ZG+` + `NethsyBlu3` + `SxW=a` + `ruby`

