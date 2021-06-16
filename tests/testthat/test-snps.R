context('Comparing SNPs major allele vs reference allele')


snpsFile  <- system.file(package="BSgenome.Hsapiens.UCSC.hg38.dbSNP151.major",
                         "code/snpsToBeTested.rda")
load(snpsFile)

if (requireNamespace("BSgenome.Hsapiens.UCSC.hg38")){
    chr <- paste0("chr",snpsToBeTested$chr)
    pos <- snpsToBeTested$pos
    genome_ref <- BSgenome.Hsapiens.UCSC.hg38::BSgenome.Hsapiens.UCSC.hg38
    genome_maj <- BSgenome.Hsapiens.UCSC.hg38.dbSNP151.major
    nuc_ref <- getSeq(genome_ref, chr, pos, pos, as.character=TRUE)
    nuc_maj <- getSeq(genome_maj, chr, pos, pos, as.character=TRUE)
    allele_reversed <- which(snpsToBeTested$maf_ref<=0.5)
    allele_not_reversed <- which(snpsToBeTested$maf_ref>0.5)
}

test_that('Testing identity of REF nucleotide', {
    expect_equal(nuc_ref,
                 snpsToBeTested$nuc_ref,
                 check.attributes=FALSE)
    skip_if_not_installed("BSgenome.Hsapiens.UCSC.hg38")
})

test_that('Loci with SNPs with MAF_REF<=0.5', {
    expect_equal(nuc_maj[allele_reversed],
                 snpsToBeTested$nuc_alt[allele_reversed],
                 check.attributes=FALSE)
    skip_if_not_installed("BSgenome.Hsapiens.UCSC.hg38")
})

test_that('Loci with SNPs with MAF_REF>0.5', {
    expect_true(all(nuc_maj[allele_not_reversed]!=snpsToBeTested$nuc_alt[allele_not_reversed]))
    skip_if_not_installed("BSgenome.Hsapiens.UCSC.hg38")
})



