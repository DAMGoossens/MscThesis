#!/bin/bash
##Script for pre-processing data for stringtie
##Dymphy Msc thesis
echo "Starting"

#merging data
cat input/Fastqfiles/1657_I_run263_TTCTCCGA_L004_R1_001_f.fastq.gz input/Fastqfiles/1657_I_run269_TTCTCCGA_L006_R1_001_f.fastq.gz > input/1657_I_merged.fastq.gz
cat input/Fastqfiles/1657_T_run265_CTCAATGA_L005_R1_001_f.fastq.gz input/Fastqfiles/1657_T_run265_CTCAATGA_L005_R1_002_f.fastq.gz > input/1657_T_merged.fastq.gz
printf "Merging fastqfiles done"

#trimming of data
#java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 input/1657_A_run263.fastq.gz input/1657_A_run263.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
#java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 input/1657_B_run263.fastq.gz input/1657_B_run263.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
#java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 input/1657_C_merged.fastq.gz input/1657_C_merged.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 input/Fastqfiles/1657_G_run263_ATATCTCG_L003_R1_001_f.fastq.gz input/1657_G_run263.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 input/Fastqfiles/1657_H_run263_AGATGCTA_L003_R1_001_f.fastq.gz input/1657_H_run263.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 input/1657_I_merged.fastq.gz input/1657_I_merged.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
#java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 input/1657_M_run271.fastq.gz input/1657_M_merged.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
#java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 input/1657_N_run271.fastq.gz input/1657_N_run271.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
#java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 input/1657_O_run265.fastq.gz input/1657_O_run265.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 input/Fastqfiles/1657_S_run265_GCATGAAC_L005_R1_001_f.fastq.gz input/1657_S_run265.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 input/1657_T_merged.fastq.gz input/1657_T_merged.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 input/Fastqfiles/1657_U_run265_CGATCACA_L005_R1_001_f.fastq.gz input/1657_U_run265.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
printf "Trimming done"

#assembly with hisat2
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U input/1657_A_run263.fastq.gz -S input/1657_A.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U input/1657_B_run263.fastq.gz -S input/1657_B.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U input/1657_C_merged.fastq.gz -S input/1657_C.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U input/1657_G_run263.fastq.gz -S input/1657_G.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U input/1657_H_run263.fastq.gz -S input/1657_H.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U input/1657_I_merged.fastq.gz -S input/1657_I.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U input/1657_M_merged.fastq.gz -S input/1657_M.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U input/1657_N_run265.fastq.gz -S input/1657_N.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U input/1657_O_run265.fastq.gz -S input/1657_O.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U input/1657_S_run265.fastq.gz -S input/1657_S.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U input/1657_T_merged.fastq.gz -S input/1657_T.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U input/1657_U_run265.fastq.gz -S input/1657_U.sam
printf "Assembly done"

#sam to bam
progs/samtools/samtools view -b -@ 8 -o input/1657_A.bam input/1657_A.sam
progs/samtools/samtools view -b -@ 8 -o input/1657_B.bam input/1657_B.sam
progs/samtools/samtools view -b -@ 8 -o input/1657_C.bam input/1657_C.sam
progs/samtools/samtools view -b -@ 8 -o input/1657_G.bam input/1657_G.sam
progs/samtools/samtools view -b -@ 8 -o input/1657_H.bam input/1657_H.sam
progs/samtools/samtools view -b -@ 8 -o input/1657_I.bam input/1657_I.sam
progs/samtools/samtools view -b -@ 8 -o input/1657_M.bam input/1657_M.sam
progs/samtools/samtools view -b -@ 8 -o input/1657_N.bam input/1657_N.sam
progs/samtools/samtools view -b -@ 8 -o input/1657_O.bam input/1657_O.sam
progs/samtools/samtools view -b -@ 8 -o input/1657_S.bam input/1657_S.sam
progs/samtools/samtools view -b -@ 8 -o input/1657_T.bam input/1657_T.sam
progs/samtools/samtools view -b -@ 8 -o input/1657_U.bam input/1657_U.sam
printf "Conversion to bam done"

#sorting bam files
progs/samtools/samtools sort -@ 8 input/1657_A.bam -o input/1657_A_sorted.bam
progs/samtools/samtools sort -@ 8 input/1657_B.bam -o input/1657_B_sorted.bam
progs/samtools/samtools sort -@ 8 input/1657_C.bam -o input/1657_C_sorted.bam
progs/samtools/samtools sort -@ 8 input/1657_G.bam -o input/1657_G_sorted.bam
progs/samtools/samtools sort -@ 8 input/1657_H.bam -o input/1657_H_sorted.bam
progs/samtools/samtools sort -@ 8 input/1657_I.bam -o input/1657_I_sorted.bam
progs/samtools/samtools sort -@ 8 input/1657_M.bam -o input/1657_M_sorted.bam
progs/samtools/samtools sort -@ 8 input/1657_N.bam -o input/1657_N_sorted.bam
progs/samtools/samtools sort -@ 8 input/1657_O.bam -o input/1657_O_sorted.bam
progs/samtools/samtools sort -@ 8 input/1657_S.bam -o input/1657_S_sorted.bam
progs/samtools/samtools sort -@ 8 input/1657_T.bam -o input/1657_T_sorted.bam
progs/samtools/samtools sort -@ 8 input/1657_U.bam -o input/1657_U_sorted.bam
printf "Sorting bam files done"

#indexing bam files
progs/samtools/samtools index -b input/1657_A_sorted.bam
progs/samtools/samtools index -b input/1657_B_sorted.bam
progs/samtools/samtools index -b input/1657_C_sorted.bam
progs/samtools/samtools index -b input/1657_G_sorted.bam
progs/samtools/samtools index -b input/1657_H_sorted.bam
progs/samtools/samtools index -b input/1657_I_sorted.bam
progs/samtools/samtools index -b input/1657_M_sorted.bam
progs/samtools/samtools index -b input/1657_N_sorted.bam
progs/samtools/samtools index -b input/1657_O_sorted.bam
progs/samtools/samtools index -b input/1657_S_sorted.bam
progs/samtools/samtools index -b input/1657_T_sorted.bam
progs/samtools/samtools index -b input/1657_U_sorted.bam
printf "Indexing bam files done"

printf "End of script"
