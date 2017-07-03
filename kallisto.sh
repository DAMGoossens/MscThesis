#Msc Thesis Dymphy
#Script for running kallisto

progs/kallisto/kallisto quant -i Ref_Kal.idx -o o_kallisto/1657_A -b 100 --single -l 180 -s 20 input/1657_A_run263.fastq.gz
progs/kallisto/kallisto quant -i Ref_Kal.idx -o o_kallisto/1657_B -b 100 --single -l 180 -s 20 input/1657_B_run263.fastq.gz
progs/kallisto/kallisto quant -i Ref_Kal.idx -o o_kallisto/1657_N -b 100 --single -l 180 -s 20 input/1657_N_run265.fastq.gz
progs/kallisto/kallisto quant -i Ref_Kal.idx -o o_kallisto/1657_O -b 100 --single -l 180 -s 20 input/1657_O_run265.fastq.gz

#van merged files
progs/kallisto/kallisto quant -i Ref_Kal.idx -o o_kallisto/1657_C -b 100 --single -l 180 -s 20 input/1657_C_merged.fastq.gz
progs/kallisto/kallisto quant -i Ref_Kal.idx -o o_kallisto/1657_M -b 100 --single -l 180 -s 20 input/1657_M_merged.fastq.gz
