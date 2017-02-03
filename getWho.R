
ll = readLines("pg5050.txt")
grep("^  .*[0-9]{4}$", ll, value = TRUE)
