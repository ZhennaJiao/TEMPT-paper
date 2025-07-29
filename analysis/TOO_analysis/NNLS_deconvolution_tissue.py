import pandas as pd
import numpy as np
import seaborn as sns
import os
import re
from scipy import optimize
import fastcluster
import matplotlib.pyplot as plt
from matplotlib.patches import Ellipse
import pickle as pkl
from matplotlib.lines import Line2D
import collections
from collections import defaultdict
from adjustText import adjust_text
from sklearn.manifold import TSNE
from scipy import optimize
os.getcwd()
os.chdir('~/methylation/project/EM_seq/analysis/deconv_analysis/TAPS_data/data/')
sample_df=pd.read_csv('./sample_mixture_cpg_df_keepna.csv',sep=',',index_col=None)
alter_df=pd.read_csv('~/methylation/project/EM_seq/analysis/deconv_analysis/TAPS_data/ref_altar/cfTAPS_Enhancer_Tissue_Atlas_Final.csv',sep='\t',index_col=None)

sample_df=sample_df.set_index('chr_region')
alter_df=alter_df.set_index('chr_start_end')
## index is the same
common_index = sample_df.index.intersection(alter_df.index)
sample_df = sample_df.loc[common_index]
alter_df = alter_df.loc[common_index]

# sort index
sample_df = sample_df.sort_index()
alter_df = alter_df.sort_index()

print(sample_df)
print(alter_df)


#-------------------NNLS Deconvolution-------------------
sample_mixtures=pd.DataFrame([])
residuals=[]
for sample_name in sample_df:
    missing_idx=sample_df[sample_name].isnull()
    cleaned_sample_df=sample_df.loc[~missing_idx,sample_name]
    cleaned_altar_df=alter_df.loc[~missing_idx,:]

    mixture, residual = optimize.nnls(cleaned_altar_df, cleaned_sample_df)
    mixture /= np.sum(mixture)
    residuals.append(residual)
    sample_mixtures[sample_name] = mixture 
    
    sample_mixtures['atlas_tissues'] = alter_df.columns
    sample_mixtures = sample_mixtures.set_index('atlas_tissues')
    mean_residual = np.array(residuals).mean()
    # normalised_residual = np.array(residuals).mean()/merged_tissues_ratio.shape[0]
# -----write the results--------
# sample_mixtures.to_csv('./sample_mixtures.csv',sep='\t',index=True)
# ----------------------Generate a pie plot for the sample mixtures----------------------

os.getcwd()
os.chdir('~/methylation/project/EM_seq/analysis/deconv_analysis/TAPS_data/data/')
select_GP=pd.read_csv('./pie_dat_GP.csv',sep='\t',index_col=0)
select_GC=pd.read_csv('./pie_dat_GC.csv',sep='\t',index_col=0)


