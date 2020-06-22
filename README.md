# Nakagami_Confidence_Maps

Source code for the paper [RF Ultrasound Distribution-Based Confidence Maps](https://robobees.seas.harvard.edu/files/nac/files/klein-miccai2015.pdf).
The code is based on [Ultrasound confidence maps using random walks](http://campar.in.tum.de/Main/AthanasiosKaramalisCode).


# Abstract

Ultrasound is becoming an ever increasingly important
modality in medical care. However, underlying physical acquisition principles are prone to image artifacts and result in overall quality variation.
Therefore processing medical ultrasound data remains a challenging task.
We propose a novel distribution-based measure of assessing the confidence
in the signal, which emphasizes uncertainty in attenuated as well as shadow
regions. In contrast to the similar recently proposed method that relies on
image intensities, the new approach makes use of the enveloped-detected
radio-frequency data, facilitating the use of Nakagami speckle statistics.
Employing J-divergence as distance measure for the random-walk based
algorithm, provides a natural measure of similarity, yielding a more reliable estimate of confidence. For evaluation of the model’s performance,
tests are conducted on the application of shadow detection. Additionally,
computed maps are presented for different organs such as neck, liver and
prostate, showcasing the properties of the model. The probabilistic approach is shown to have beneficial features for image processing tasks.

## Background

Conventional ultrasound images, commonly referred to as B-Mode, are the result of many processing
steps optimizing data for visual assessment by physicians. However, at the core of ultrasound imaging pipeline lies the radio frequency (RF) data. Just lately, RF data has become more readily available to the research community such that its potential has not fully unveiled yet. From a data processing standpoint using RF data over B-Mode suggests many advantages. First of all, it is generally much richer in information due to the comparably higher resolution. Furthermore, it is not affected by non-linear post-processing steps such as log-compression and proprietary filter algorithms that change the noise statistics for reasons of improved visual appeal. In addition, it has nice probabilistic properties facilitating various ways of distributional modeling of ultrasound specific texture patterns, referred to as speckle noise. It is exactly this property this paper makes use of for the generation of distribution-based confidence maps.

## Example

The following examples show the impact of different methods for confidence map computation. The first image shows a B-Mode image of the neck. The second image shows the confidence maps generated leveraging the intensity values of [B-Mode image](https://www.sciencedirect.com/science/article/abs/pii/S1361841512000977). The last image shows the confidence map using the distribution-based approach, making using of the radio-frequency ultrasound data. As can be seen, the latter allows differentation between sections of the organ as it models the tissue speckle characteristics.

| ![B-Mode ultrasounds image of the neck](https://github.com/TJKlein/Nakagami_Confidence_Maps/blob/master/imgs/img.jpg)
|:--:| 
| B-Mode Image |

|  ![B-Mode Confidence Map](https://github.com/TJKlein/Nakagami_Confidence_Maps/blob/master/imgs/map.jpg)
|:--:| 
| Ultrasound confidence map using the intensity information from B-Mode |

|  ![RF Distribution Confidence Map](https://github.com/TJKlein/Nakagami_Confidence_Maps/blob/master/imgs/MapD.jpg)
|:--:| 
| Ultrasound confidence map using the distribution information from RF-Mode |


## Citation
If you use this code or find it somehow useful for your research, I would appreciate citation:

```
@InProceedings{10.1007/978-3-319-24571-3_71,
author="Klein, Tassilo
and Wells, William M.",
editor="Navab, Nassir
and Hornegger, Joachim
and Wells, William M.
and Frangi, Alejandro",
title="RF Ultrasound Distribution-Based Confidence Maps",
booktitle="Medical Image Computing and Computer-Assisted Intervention -- MICCAI 2015",
year="2015",
publisher="Springer International Publishing",
address="Cham",
pages="595--602"
}
```

