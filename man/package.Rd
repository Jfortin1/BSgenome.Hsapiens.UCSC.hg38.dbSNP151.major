\name{BSgenome.Hsapiens.UCSC.hg38.dbSNP151.major}
\docType{package}

\alias{BSgenome.Hsapiens.UCSC.hg38.dbSNP151.major-package}
\alias{BSgenome.Hsapiens.UCSC.hg38.dbSNP151.major}
\alias{Hsapiens}

\title{Full genome sequences for Homo sapiens (UCSC version hg38, based on GRCh38.p12) with injected major alleles (dbSNP151)}

\description{
  Full genome sequences for Homo sapiens (Human) as provided by UCSC (hg38, based on GRCh38.p12) with major allele injected from dbSNP151, and stored in Biostrings objects. Only single nucleotide variants (SNVs) were considered. At each SNV, the most frequent allele was chosen at the major allele to be injected into the reference genome.
}


\author{Jean-Philippe Fortin}

\seealso{
  \itemize{
    \item \link[BSgenome]{BSgenome} objects and the
          \code{\link[BSgenome]{available.genomes}} function
          in the \pkg{BSgenome} software package.
    \item \link[Biostrings]{DNAString} objects in the \pkg{Biostrings}
          package.
    \item The BSgenomeForge vignette (\code{vignette("BSgenomeForge")})
          in the \pkg{BSgenome} software package for how to make a BSgenome
          data package.
  }
}

\examples{
BSgenome.Hsapiens.UCSC.hg38.dbSNP151.major
genome_maj <- BSgenome.Hsapiens.UCSC.hg38.dbSNP151.major
head(seqlengths(genome_maj))

# Getting nucleotide at SNP rs12813551 (C/T, MAF>0.5)
# Major allele genome has a T:
chr <- "chr12"
pos <- 25241845L
getSeq(genome_maj, chr, start=pos, end=pos)

# Reference genome has the minor allele, C:
if (require(BSgenome.Hsapiens.UCSC.hg38)){
    genome_ref <- BSgenome.Hsapiens.UCSC.hg38
    getSeq(genome_ref, chr, start=pos, end=pos)
}

# Minor allele genome agrees with reference genome (C):
if (require(BSgenome.Hsapiens.UCSC.hg38.dbSNP151.minor)){
    genome_min <- BSgenome.Hsapiens.UCSC.hg38.dbSNP151.minor
    getSeq(genome_min, chr, start=pos, end=pos)
}
}

