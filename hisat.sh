#!/bin/bash
##Script for pre-processing data for stringtie
##Dymphy Msc thesis
echo "Starting"

#trimming of data
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 stringtie/input/1657_A_run263_f.fastq.gz stringtie/input/1657_A_run263_f.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 stringtie/input/1657_B_run263_f.fastq.gz stringtie/input/1657_B_run263_f.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 stringtie/input/1657_C_run263_f.fastq.gz stringtie/input/1657_C_run263_f.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 stringtie/input/1657_C_run269_f.fastq.gz stringtie/input/1657_C_run269_f.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 stringtie/input/1657_M_run263_f.fastq.gz stringtie/input/1657_M_run263_f.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 stringtie/input/1657_M_run271_f.fastq.gz stringtie/input/1657_M_run271_f.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 stringtie/input/1657_N_run271_f.fastq.gz stringtie/input/1657_N_run271_f.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar progs/trimmomatic/trimmomatic-0.33.jar SE -threads 8 stringtie/input/1657_O_run265_f.fastq.gz stringtie/input/1657_O_run265_f.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
printf "Trimming done"

#assembly with hisat2
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U stringtie/input/1657_A_run263_f.fastq.gz -S stringtie/input/1657_A.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U stringtie/input/1657_B_run263_f.fastq.gz -S stringtie/input/1657_B.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U stringtie/input/1657_C_run263_f.fastq.gz -S stringtie/input/1657_C_run263.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U stringtie/input/1657_C_run269_f.fastq.gz -S stringtie/input/1657_C_run269.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U stringtie/input/1657_M_run263_f.fastq.gz -S stringtie/input/1657_M_run263.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U stringtie/input/1657_M_run271_f.fastq.gz -S stringtie/input/1657_M_run271.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U stringtie/input/1657_N_run271_f.fastq.gz -S stringtie/input/1657_N.sam
progs/hisat2/hisat2 -p 8 -q -x TAIR10 -U stringtie/input/1657_O_run265_f.fastq.gz -S stringtie/input/1657_O.sam
printf "Assembly done"

#sam to bam
progs/samtools/samtools view -b -@ 8 -o stringtie/input/1657_A.bam stringtie/input/1657_A.sam
progs/samtools/samtools view -b -@ 8 -o stringtie/input/1657_B.bam stringtie/input/1657_B.sam
progs/samtools/samtools view -b -@ 8 -o stringtie/input/1657_C_run263.bam stringtie/input/1657_C_run263.sam
progs/samtools/samtools view -b -@ 8 -o stringtie/input/1657_C_run269.bam stringtie/input/1657_C_run269.sam
progs/samtools/samtools view -b -@ 8 -o stringtie/input/1657_M_run263.bam stringtie/input/1657_M_run263.sam
progs/samtools/samtools view -b -@ 8 -o stringtie/input/1657_M_run271.bam stringtie/input/1657_M_run271.sam
progs/samtools/samtools view -b -@ 8 -o stringtie/input/1657_N.bam stringtie/input/1657_N.sam
progs/samtools/samtools view -b -@ 8 -o stringtie/input/1657_O.bam stringtie/input/1657_O.sam
printf "Conversion to bam done"

#merging of samples C_263/269 and M_263/271
progs/samtools/samtools merge -f -@ 8 stringtie/input/1657_C.bam stringtie/input/1657_C_run263.bam stringtie/input/1657_C_run269.bam
progs/samtools/samtools merge -f -@ 8 stringtie/input/1657_C.bam stringtie/input/1657_M_run263.bam stringtie/input/1657_M_run271.bam
printf "Merging done"

#sorting bam files
progs/samtools/samtools sort -@ 8 stringtie/input/1657_A.bam -o stringtie/input/1657_A_sorted.bam
progs/samtools/samtools sort -@ 8 stringtie/input/1657_B.bam -o stringtie/input/1657_B_sorted.bam
progs/samtools/samtools sort -@ 8 stringtie/input/1657_C.bam -o stringtie/input/1657_C_sorted.bam
progs/samtools/samtools sort -@ 8 stringtie/input/1657_M.bam -o stringtie/input/1657_M_sorted.bam
progs/samtools/samtools sort -@ 8 stringtie/input/1657_N.bam -o stringtie/input/1657_N_sorted.bam
progs/samtools/samtools sort -@ 8 stringtie/input/1657_O.bam -o stringtie/input/1657_O_sorted.bam
printf "Sorting bam files done"

#indexing bam files
progs/samtools/samtools index -b stringtie/input/1657_A_sorted.bam
progs/samtools/samtools index -b stringtie/input/1657_B_sorted.bam
progs/samtools/samtools index -b stringtie/input/1657_C_sorted.bam
progs/samtools/samtools index -b stringtie/input/1657_M_sorted.bam
progs/samtools/samtools index -b stringtie/input/1657_N_sorted.bam
progs/samtools/samtools index -b stringtie/input/1657_O_sorted.bam
printf "Indexing bam files done"

printf "End of script"
