#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=12:30:00 
#SBATCH --output=/home/ak308/Bio310/output/ak308_fstscan.out 
#SBATCH --error=/home/ak308/Bio310/output/ak308_fstscan.err

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/scratch/ak308/Bio310_Dog/Results/KRT71_filtered.recode.vcf
dogpop_curly=/home/ak308/Bio310_Dog/Files/KRT71_curlydogs.txt
dogpop_noncurly=/home/ak308/Bio310_Dog/Files/KRT71_noncurlydogs.txt

vcftools --vcf ${VCF} \
--weir-fst-pop ${dogpop_curly} \
--weir-fst-pop ${dogpop_noncurly} \
--out /scratch/ak308/Bio310_Dog/Results/KRT71_filtered_fst_results

## Make the dog population files 
touch /scratch/ak308/Bio310_Dog/Files/KRT71_curlydogs.txt
# copy and paste the names of the dogs in the VCF file that have curly hair 
touch /scratch/ak308/Bio310_Dog/Files/KRT71_noncurlydogs.txt
# copy and paste the names of the dogs in the VCF file that do not have curly hair 

# for these population files, you would copy and paste the dog individuals that have a specific phenotype, such as 
0_AfghanHound01
0_AiredaleTerrier01
0_Akbash01_15287
0_Akita01_12758
0_AlapahaBlueBloodBulldog01
0_AlaskanHusky01
0_AlaskanMalamute01_30099
0_AlpineDachsbrake02
0_AmericanEskimoDog01_10800
0_AmericanFoxhound01_34454
0_AmericanHairlessTerrier01_1121
0_AmericanStaffordshireTerrier01
0_AmericanWaterSpaniel01_987
0_AnatolianShepherdDog01_7584
0_AustralianCattleDog01
0_AustralianShepherd01_27104
0_AustralianTerrier01
0_Basenji02
0_BassetHound01_10376
0_BavarianHound01
