#!/bin/bash
#SBATCH --time=0-00:30:00                                  
###SBATCH --nodes=1                                     
#SBATCH --ntasks=4                                      
#SBATCH --mem-per-cpu 8000                              
#SBATCH --account=def-pcampeau                  
#SBATCH -o GEAanalysisJune14H3.3_FreshHemic_E15vsIgG1_E15.out                  
#SBATCH -e GEAanalysisJune14H3.3_FreshHemic_E15vsIgG1.err                  
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mehdi.manjoura@umontreal.ca



module load gcc/9.3.0
module load python/3.7.7
module load r/4.2.2
module load bedtools/2.30.0

mkdir Module1Files Module1Graphs Module2Files Module2Graphs Module3Files Module3Graphs Module4Files Module4Graphs Module5Files Module5Graphs Module6Files Module6Graphs

bash SEACR_1.3.sh ./BedGrphs/CHD3_2_E15.BEDgraph ./BedGrphs/IgG2_E15.BEDgraph non stringent output

mv output.stringent.bed sampleX.csv


Rscript ChIP.R
python updatedCode.py




