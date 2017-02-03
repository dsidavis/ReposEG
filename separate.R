
ll = readLines("pg5050.txt")
w = grep("^State of the Union Address", ll)
length(w)

# Check all are preceded by a blank line.
all( ll[ w - 1 ] == "")

w = grepl("^State of the Union Address$", ll)
speeches = split(ll, cumsum(w))

# First one is the preface material, not a speech
speeches = speeches[-1]

who = sapply(speeches, function(x) x[[2]])

words = lapply(speeches, function(speech) unlist(strsplit(speech, "[[:space:]]")))

nwords = sapply(words, length)
summary(nwords)

hist(nwords)
rug(nwords)

year = as.integer(gsub(".*,", "", sapply(speeches, function(x) x[[3]])))

plot(year, nwords)

boxplot(nwords ~ who)
# The order is alphabetical, not chronological

