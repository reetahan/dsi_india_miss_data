#!/bin/bash
### reet_cells
#PBS -N all_gridcells
### Project code
#PBS -A fiore
#PBS -l walltime=12:00:00
#PBS -q regular
### Merge output and error files
#PBS -j oe
### Select 1 nodes with 36 CPUs 
#PBS -l select=1:ncpus=26
### Send email on abort, begin and end
#PBS -m abe
### Specify mail recipient
#PBS -M rm3873@columbia.edu

echo "ALL, NO GAS"
python co_train_all_gridcell.py "daily" "["aod","emission","met"]"


# End of script

