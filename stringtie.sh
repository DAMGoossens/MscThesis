#!/bin/sh
#Msc thesis Dymphy Goossens

#ST
progs/stringtie/stringtie input/1657_A_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_ST -o o_stringtie/1657_A.gtf -p 8 -e -b o_stringtie/ballgown/1657_A
progs/stringtie/stringtie input/1657_B_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_ST -o o_stringtie/1657_B.gtf -p 8 -e -b o_stringtie/ballgown/1657_B
progs/stringtie/stringtie input/1657_C_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_ST -o o_stringtie/1657_C.gtf -p 8 -e -b o_stringtie/ballgown/1657_C

#LP
progs/stringtie/stringtie input/1657_G_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_LP -o o_stringtie/1657_G.gtf -p 8 -e -b o_stringtie/ballgown/1657_G
progs/stringtie/stringtie input/1657_H_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_LP -o o_stringtie/1657_H.gtf -p 8 -e -b o_stringtie/ballgown/1657_H
progs/stringtie/stringtie input/1657_I_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_LP -o o_stringtie/1657_I.gtf -p 8 -e -b o_stringtie/ballgown/1657_I

#HT
progs/stringtie/stringtie input/1657_M_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_HT -o o_stringtie/1657_M.gtf -p 8 -e -b o_stringtie/ballgown/1657_M
progs/stringtie/stringtie input/1657_N_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_HT -o o_stringtie/1657_N.gtf -p 8 -e -b o_stringtie/ballgown/1657_N
progs/stringtie/stringtie input/1657_O_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_HT -o o_stringtie/1657_O.gtf -p 8 -e -b o_stringtie/ballgown/1657_O

#HL
progs/stringtie/stringtie input/1657_S_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_HL -o o_stringtie/1657_S.gtf -p 8 -e -b o_stringtie/ballgown/1657_S
progs/stringtie/stringtie input/1657_T_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_HL -o o_stringtie/1657_T.gtf -p 8 -e -b o_stringtie/ballgown/1657_T
progs/stringtie/stringtie input/1657_U_sorted.bam -G Araport11_GFF3_genes_transposons.201606.gtf -l BAY_HL -o o_stringtie/1657_U.gtf -p 8 -e -b o_stringtie/ballgown/1657_U
