# Phytopthora-sojae-Pathotype-analysis

These R scripts were produced to replicate the HaGiS worksheet and provide all necessary results for pathotype data analysis in R. Austin McCoy and Zachary Noel (GitHub = noelzach) produced these scripts at Michigan State University.

Phytophthora sojae has been managed primarily via deployment of resistance genes (Rps genes, resistance to Phytophthora sojae) in commercial soybean cultivars and by the application of fungicide seed treatments. However, repeated use of resistance genes can cause populations to adapt over time rendering these resistance genes ineffective. To determine current effectiveness of resistance genes for managing Phytophthora sojae, state-wide surveys must be conducted to determine the pathotype (previously referred to as "race") structure within sampled population of P. sojae.

The goal of these scripts was to provide all the necessary analyses needed when conducting a Phytophthora sojae pathotype survey, including: Distribution of susceptibilities (effective and non-effective Rps genes), Distribution of pathotype complexities with statistics, Pathotype frequency distribution, as well as diversity indices for pathotypes. 

These scripts should allow for all users to simply change the file pathway to that of their own data and run the scripts. Little to no editing should be necessary for data outputs to be generated. Annotations for all code are provided, as well as a sample data sheet that will allow you to test the code on something other than your data.

IMPORTANT: User .csv files will need to have the same column headings ("perc.susc", "Rps "and "Isolate" are main columns required) as the practice data sheet provided for there to be minimal edits on the users part (you can download the data sheet and then replace the practice data with your own!).  
