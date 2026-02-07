CREDIT FOR BIOINFORMATIONS WORKFLOW and walking me through adjustments/modifications for my project: Dr. Lauren Hennelly

# Evolution-of-dog-coats

Logging onto the cluster:
ssh -Y ak308@nots.rice.edu

# General helpful navigation for cluster

* pwd (where am I) "print working directory"
* ls (what’s here) "print directory info"
* cd <dir> (move) "change directory"
* mkdir <dir> (make folder)
* touch <file> (create file)
* vim <file> → press i to edit → Esc → :wq to save/quit
* rm <file> (delete a mistaken script / file)

Structure: 
* home directory = /home/ak308
* *** you can also get there by just cd
* Scratch: /scratch/ak308
* *** I think this is within home/main directory...

# File types...

A fastq.gz file contains the raw reads that are not aligned to the reference genome. Let's see what a fastq.gz file looks like:

less /scratch/lh106/rawfiles/V300066577_L2_DKWGS201203039-531_1.fq.gz

A bam file is called a Binary Alignment Map and it is a file where the reads of an individual are aligned to a reference genome. So we know where each read goes on the genome.

module load SAMtools/1.19.2
samtools view /storage/hpc/work/lh106/SharedData/AncientimputedVCF/Projects_CPH_Chapter2_bams_S21_1038_Chitral_sorted_proper_nodups_readgroup.bam | less -S

A variant call format (VCF) file contains the variants along the genome for a single individual, or multiple individuals.

less -S /scratch/lh106/results/Data_Katia_merged_phased_annotated.chr11_MAF_0.01_recalibrated_INFO_0.8.vcf

# Selecting a specfic gene from the whole genome

the following code gets pasted into a new BED file. do creation of that first.
also note that this was using the 1-chromosome dataset, and will need to get scratch location from Dr. Hennelly to do analysis on the candidate genes we picked out!

#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=00:30:00 
#SBATCH --output=/home/ak308/Bio310/output/vcfselect.out 
#SBATCH --error=/home/ak308/Bio310/output/vcfselect.err

## Grab the specific gene from the large VCF

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/storage/hpc/work/lh106/SharedData/1697canidVCF/g_WildSled.SNP.INDEL.chrAll.newID.vcf.gz
BEDIN=/scratch/ak308/Files/KRT71.bed
OUT=/scratch/ak308/Results/KRT71_vcf

vcftools --gzvcf ${VCF} --bed  ${BEDIN} --recode --recode-INFO-all --out ${OUT}

#########################
#How to make a bed file #
#########################

/scratch/ak308/ 
mkdir bedfiles
touch KRT71.bed
vim KRT71.bed

chrom   chromStart      chromEnd
chr27    2536324       2545670

#Copy and paste the gene location with **tabs** between 

# Adjusting VCF file for plotting

#!/bin/bash
#SBATCH --job-name=combine
#SBATCH --account=commons
#SBATCH --partition=commons
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1000m
#SBATCH --time=00:30:00
#SBATCH --output=/home/ak308/Bio310/output/plink.out
#SBATCH --error=/home/ak308/Bio310/output/plink.err

VCF=/scratch/ak308/Bio310_Dog/Results/TKTL1.recode.vcf
OUTBED=/scratch/ak308/Bio310_Dog/Results/TKTL1_bed
OUTPLINK=/scratch/ak308/Bio310_Dog/Results/TKTL1_plink
OUTVCF_final=/scratch/ak308/Bio310_Dog/Results/TKTL1_plink_finalcoded

/home/ak308/Software/plink --vcf ${VCF} --make-bed --const-fid --dog --out ${OUTBED} #to sort the chromosomes
/home/ak308/Software/plink --bfile ${OUTBED} --recode --out ${OUTPLINK} --const-fid --dog
/home/ak308/Software/plink --file  ${OUTPLINK} --recode vcf --out ${OUTVCF_final} --const-fid --dog

##might also have to download plink  [downloaded today, 2/6/2026, so may not need to re-download -- though process was easy]
cd /home/yourID
mkdir software
cd software
wget https://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20250819.zip
unzip plink_linux_x86_64_20250819.zip
#test
./plink

##### Convert vcf to coding ###### --- note that this assigns values of 0, 1, 2, or 3 for homozygous default, 1 for heterozygous, 2 for homozygous alternate, and 3 for missing data! -- very useful to know for understanding the figure in R
sed -i 's:0/0:0:g' KRT71_plink_finalcoded.vcf
sed -i 's:0/1:1:g' KRT71_plink_finalcoded.vcf
sed -i 's:1/0:1:g' KRT71_plink_finalcoded.vcf
sed -i 's:1/1:2:g' KRT71_plink_finalcoded.vcf
sed -i 's:./.:3:g' KRT71_plink_finalcoded.vcf


###Move to local computer 
scp -r ak308@nots.rice.edu:/scratch/ak308/Bio310_Dog/Results/TKTL1_plink_finalcoded.vcf ~/Desktop

# Plotting in R!

library (ggplot2)
library(dplyr)
library (tidyverse)

###Open the vcf file on your computer and save it as a csv file: 

dat_hap <- read.csv("Oct26_Figure1_TSHR_Haplotype_phased.csv", header=TRUE)

#organize the dataset 
data_long <- gather(dat_hap, Sample, Allele, Affenpinscher01_33500_A:Wolf95_B, factor_key=TRUE)

#Make my variables in factor format
data_long$POS <- as.factor(data_long$POS)
data_long$Allele <- as.factor(data_long$Allele)

#Plot with geom_tile entire TSHR gene
p1 <- ggplot(data_long,aes(x=POS,y=Sample,fill=Allele))+
      geom_tile() 
 p2 <- p1 + scale_fill_manual(values = c("lightblue", "red", "black", "gray", "black")) 
p2

ggsave("Oct31_TSHR_final.tiff", width=10,height=3) 
