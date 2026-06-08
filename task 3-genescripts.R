if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c("clusterProfiler",
                       "org.Hs.eg.db",
                       "enrichplot"))

library(clusterProfiler)
library(org.Hs.eg.db)
library(enrichplot)

module1_genes <- c(
  "NUSAP1","CCNB1","TOP2A","RRM2","PRC1",
  "DLGAP5","KIF20A","UBE2C","ASPM","ZWINT",
  "CDC20","FOXM1","KIF4A","NEK2","CEP55",
  "CDKN3","CDK1","MELK","CENPF"
)

module2_genes <- c(
  "CDC7","GINS1","GMNN",
  "MCM6","MCM2","RFC4","MCM5"
)
module1_entrez <- bitr(
  module1_genes,
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

module2_entrez <- bitr(
  module2_genes,
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)
go_module1 <- enrichGO(
  gene = module1_entrez$ENTREZID,
  OrgDb = org.Hs.eg.db,
  ont = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff = 0.05,
  qvalueCutoff = 0.05,
  readable = TRUE
)
go_module2 <- enrichGO(
  gene = module2_entrez$ENTREZID,
  OrgDb = org.Hs.eg.db,
  keyType = "ENTREZID",
  ont = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff = 0.05,
  qvalueCutoff = 0.05,
  readable = TRUE
)
head(as.data.frame(go_module1))
head(as.data.frame(go_module2))

go_module1_df <- as.data.frame(go_module1)

write.csv(
  go_module1_df,
  "GO_BP_Module1.csv",
  row.names = FALSE
)

go_module2_df <- as.data.frame(go_module2)

write.csv(
  go_module2_df,
  "GO_BP_Module2.csv",
  row.names = FALSE
)



