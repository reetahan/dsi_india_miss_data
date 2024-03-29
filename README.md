# dsi_india_miss_data

The code in the repository is used to prepare the figures and results in the "Missing Feature Data Report",
summarizing work and exploration done to investigate the robustness of machine learning models used for PM2.5 
prediction (on currently simulated data from GEOS-Chem) to missing data patterns found in real life. The paper itself is in the "paper" folder.

## Instructions

To make sure you have all the necessary updated Python packages on your machine, you can run `pip install -r requirements.txt` in the top level folder, prior to running any of the notebooks.

First you have acquired the necessary data and are familiar with directory it is placed in on your machine. All the scripts needed will be in the "scripts" folder. All of the scripts also will rely on you providing the correct path to the desired data you wish to feed them, so make sure they are correct, and there will usually be a clear space where you can provide your desired filepath. Running the "Regridding_AOD", "Regridding_CO" and "Regridding_NO2" notebooks should generate the custom regridding with missing data for each of those species, and apply it to all the other (simulated) features and save those files. "Regridding_NO2_CO_XESMF_Version" notebooks should generate the XESMF regriddings with missing data for CO and NO2. Parameters as described in the notebooks can be altered to generate the grids needed to get the various results presented in the document. Once all those missing-regrids are generated, applied and saved, we can inspect the missing value rate and visualize the prevelance of missing values on the map in "Simple_Visualization_and_Stats", which generates the final missing value numbers and figures presented in the document. 

Next, we can use "ML_Preprocessing" to run the processing that generates the final training and testing data for the machine learning process. The "automl_main.py" Python file contains the main AutoML code that runs through training and testing and can output the key model performance statistics when it is complete. You can run this file using the "run_automl.sh" batch script, that is meant to be run in a Slurm-workload system using the sbatch command. The "automl_main.py" file is where you can select which generated missing-regriddind you'd like to use, but to get the results that involve only keeping a subset of the features, you'd edit the "run_automl.sh" script.
