# _CesA_ Genes in Mosses
## Composition of scripts to analyze _CesA_ gene presence


This is a current project I am working on with Dr. Schwartz and Dr. Roberts at URI, along with other lab members. I am very interested in how these genes suggest early diversification within mosses and hope to explain how we were able to gather our results. This is still a work in progress, so please keep that in mind. :)

Within this repository there are two steps each with their own set of instructions and scripts. 
Prior to step one, one must gather their sequence data from wherever they source, but my sequence data consists of moss genomes and transcriptomes from the **European Nucleotide Archive**. For this, reads can either be paired or singled, but if paired they must **ALWAYS** be kept together, and if one is deleted so must the other. 
- Additionally, for this analysis a reference genome will also be necessary, and for mine the reference genome was downloaded as a GFF file from **CoGe** and was further filtered for the 7 _CesA_ gene ID's found on **Phytozome**. 

Once all data has been gathered and downloaded you can proceed to step one which includes three scripts: _trim, align_, and _intersect_. 
- This can be found by locating the *data* folder, and then locating the _rupestris_ folder. Within here there will be "read me - step 1" and the scripts. These three scripts will filter through the downloaded fastq.gz files and adapt trim the reads, align to a reference genome, and then extract any reads aligning to the _CesA_ gene location, as identified in the GFF. These scripts are to be run in a specific order: trim, align then intersect. By the end of step one, one should produce bam files with all gene locations, showing chromosome number, score of pairing alignment, and position number. These can be used to further analyze the presence of genes within the desired species. 

Step two consists of two scripts that will take these findings and filter the results for better analysis. 
- There is a _CesA_ and _processCesA_ script, which can be located directly under the data folder with a labeled "read me - step 2". The _CesA_ script will filter all _CESA.bam_ files for the _CesA_ genes based on chromosome location, position number and pairing score and compose them in one tsv file. This has been set up to list each species and the genus and family they belong in for better organization. After this, the _processCesA_ script can be run. This reorganizes the data produced so that we can visualize what gene ID's paired and how much they aligned for each species, by also going through all _CesA.bam_ files. These two steps just produce different visuals for the presence of these genes. From here the results can be analyzed for the desired situation.

Currently, we are working on producing our own phylogeny utilizing **SISRS** - _a program that identifies phylogenetic signals within datasets to build a phylogeny._ More details can be shared within the near future. 

This method can be applied for various species and desired genes, one will just need to swap datasets. Required are downloaded fastq.gz files - _either paired or single_ - and a reference genome as a filtered GFF file for the genes in question. Hope this helps!

Thank you for looking into this and feel free to message me with any comments or questions @ alyssa_hartmann@uri.edu! 
