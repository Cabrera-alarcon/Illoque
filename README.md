# VSRFM
## Variant Stacked Random Forest Model and Variant Stacked Random Forest Model for splicing.

We present a new model trained over ensemble scores with two particularities, first we consider minor frequency allele from gnomAD and second, we split variants based on their splicing for training each specific model. Variants Stacked Random Forest Model (VSRFM) was constructed for variants not involved in splicing and Variants Stacked Random Forest Model for splicing (VSRFM-s) was trained for variants affected by splicing. Comparing these scores with their constituent scores used as features, our models showed the best outcomes:

<p align="center">
  <img src="https://github.com/Cabrera-alarcon/VSRFM/blob/VSRFM/ROC_curves.png" width="1000" title="hover text">
</p>


Variant pathogenic prediction models VSRFM and VSRFM-s, the importance of splicing and allele frequency. Cabrera-Alarcon JL, Garcia-Martinez J. Available in bioRxiv: https://www.biorxiv.org/content/early/2018/10/03/430975?rss=1

## Contact: 
joseluiscabreraalarcon@gmail.com or xurde.garcia.martinez@gmail.com 

