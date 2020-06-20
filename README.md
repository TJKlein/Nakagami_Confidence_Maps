# Nakagami_Confidence_Maps
Distribution-based confidence maps for medical ultrasound 

Source code for the paper [Ultrasound confidence maps using random walks](https://robobees.seas.harvard.edu/files/nac/files/klein-miccai2015.pdf).
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


