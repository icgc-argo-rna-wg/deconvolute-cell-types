#!/usr/bin/env Rscript
# Title     : runMCPCounter
# Objective : Run Microenvironment Cell Populations-counter (MCP-counter) method
# Created by: Raquel Manzano (rm889@cam.ac.uk)
# Created on: 01/10/2021

# Version changelog:
# v1 - simple MCPCounter run


suppressPackageStartupMessages(library("optparse"));
suppressPackageStartupMessages(library("MCPcounter"));

# Argument parser

optList <- list(
  make_option(c("-i", "--input"), default = NULL,
              help = "Path to matrix with features in rows and samples in columns"),
  make_option(c("-f", "--featuresType"), default = "HUGO_symbols",
              help = "Type of identifiers for expression features (affy133P2_probesets|HUGO_symbols|ENTREZ_ID|ENSEMBL_ID)"),
  make_option(c("-p", "--probesets"), default = "reference/probesets.txt",
              help = "Data frame of probesets transcriptomic markers and corresponding cell populations. Fetched from github by a call to read.table by default, but can also be a data.frame"),
  make_option(c("-g", "--genes"), default = "reference/genes.txt",
              help = "Data frame of genes transcriptomic markers and corresponding cell populations. Fetched from github by a call to read.table by default, but can also be a data.frame."),
  make_option(c("-s", "--sep"), default = "\t",
              help = "Separator for imput file [default: '\\t']"),
  make_option(c("-o", "--output"), default = "MCPCounter_scores.txt",
              help = "Output file name")
)

parser <- OptionParser(usage = "%prog [options] [input matrix]", option_list = optList)
arguments <- parse_args(parser, positional_arguments = TRUE)
opt <- arguments$options

print(opt$input)
if (is.null(opt$input)) {
  stop("Input parameter must be provided through --input flag. See script usage (--help)")
}


# MCPCounter analysis
message("- Calculating MCPCounter scores")
# read input
expr.matrix <- read.table(opt$input, sep = opt$sep, check.names=F)
# calculate scores
mcp.res <- MCPcounter.estimate(expression = expr.matrix,
                               featuresType = "HUGO_symbols",
                               probesets = read.table(opt$probesets, sep = "\t",
                                                      stringsAsFactors = FALSE,
                                                      colClasses = "character"),
                               genes = read.table(opt$genes, sep = "\t",
                                                  stringsAsFactors = FALSE,
                                                  header = TRUE,
                                                  colClasses = "character",
                                                  check.names = FALSE)
)
# write output
write.table(mcp.res, file=opt$output,sep='\t')
message("- Done! See ", opt$output)