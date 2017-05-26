#!/bin/sh
#Msc thesis Dymphy Goossens

#Assembly by stringtie
progs/stringtie/stringtie stringtie/input/1657_A_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_ST -o stringtie/output/1657_A.gtf -p 8 -e -b stringtie/output/ballgown/1657_A
progs/stringtie/stringtie stringtie/input/1657_B_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_ST -o stringtie/output/1657_B.gtf -p 8 -e -b stringtie/output/ballgown/1657_B
progs/stringtie/stringtie stringtie/input/1657_C_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_ST -o stringtie/output/1657_C.gtf -p 8 -e -b stringtie/output/ballgown/1657_C
progs/stringtie/stringtie stringtie/input/1657_M_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_HT -o stringtie/output/1657_M.gtf -p 8 -e -b stringtie/output/ballgown/1657_M
progs/stringtie/stringtie stringtie/input/1657_N_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_HT -o stringtie/output/1657_N.gtf -p 8 -e -b stringtie/output/ballgown/1657_N
progs/stringtie/stringtie stringtie/input/1657_O_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_HT -o stringtie/output/1657_O.gtf -p 8 -e -b stringtie/output/ballgown/1657_O
printf "Stringtie has been run"

#Mergen van samples
#progs/stringtie/stringtie --merge -G Araport11_GFF3_genes_transposons.201606.gtf -o stringtie/output/merged.gtf -l BAY stringtie/output/1657_A.gtf stringtie/output/1657_B.gtf stringtie/output/1657_C.gtf stringtie/output/1657_M.gtf stringtie/output/1657_N.gtf stringtie/output/1657_O.gtf
#printf "Samples have been merged"
