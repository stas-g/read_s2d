read_s2d <- function(file_){
	tmp <- readLines(file_)
	tmp <- split(tmp, cumsum(grepl('>', tmp)))
	tmp <- lapply(tmp, FUN = function(x) do.call(rbind, strsplit(x, "\\t")))
	names(tmp) <- sub("> ", "", sapply(tmp, "[[", 1, 1))
	tmp <- lapply(tmp, FUN = function(x){
			colnames(x) <- x[2, ]
			data.frame(x[-c(1, 2), -1], stringsAsFactors = FALSE)
		})
	tmp
}
