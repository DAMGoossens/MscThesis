#source("http://bioconductor.org/biocLite.R")
#biocLite("devtools")    # only if devtools not yet installed
#biocLite("pachterlab/sleuth")
#biocLite("biomaRt")

library(devtools)
library(sleuth)
library(biomaRt)

base_dir <- "/mnt/scratch/gooss032"
sample_id <- dir(file.path(base_dir,"o_kallisto"))
sample_id                             #geeft alle samples weer die geimporteerd zijn, en als het goed is ook de index

kal_dirs <- sapply(sample_id, function(id) file.path(base_dir, "o_kallisto", id))
kal_dirs

s2c <- read.table("run_info.txt", header=TRUE, stringsAsFactors=FALSE)
s2c <- dplyr::select(s2c, sample = sample, condition)
s2c

#checking if samples correspond correctly to the runs
s2c <- dplyr::mutate(s2c, path = kal_dirs)  #path kan niet veranderd worden
s2c       #en controleer of alles klopt!

#constructing the sleuth object
so <- sleuth_prep(s2c, ~ condition)       #prepping data Waarschuwing: duurt lang
so <- sleuth_fit(so)                    #fitting the model
so <- sleuth_fit(so, ~1, 'reduced')     #fitting the reduced model
so <- sleuth_lrt(so, 'reduced', 'full')     #test the model   (likelihood ratio test)
models(so)

so <- sleuth_wt(so, 'conditionBAY_HT')
so <- sleuth_wt(so, 'conditionBAY_LP')
so <- sleuth_wt(so, 'conditionBAY_ST')
so <- sleuth_wt(so, 'conditionBS_HL')
so <- sleuth_wt(so, 'conditionBS_HT')

#so <- sleuth_wt(so, 'conditionTOMATO')  #wald test

sleuth_live(so)       
