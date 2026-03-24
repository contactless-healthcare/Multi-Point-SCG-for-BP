# Camera-Based Dual-Wavelength Defocused Speckle Imaging for Multi-Point Seismocardiographic Motion Measurement.
This repository contains the code and data associated with the paper "Camera-Based Dual-Wavelength Defocused Speckle Imaging for Multi-Point Seismocardiographic Motion Measurement."

## Dataset
For dataset: To protect the privacy of our subjects, we only uploaded waveform data rather than images. Our data contains subjects' ECG signals, fingertip PPG signals, and SCG signals in both waveforms (R-band and G-band), as well as the corresponding blood pressure labels and the timestamps corresponding to the generated labels. Please ask liulin@sudst.edu.cn for the dataset.

## Code
For code: The SCG_Multiband.m and motion_synthesis.m files are used to implement the SCG signal extraction and motion synthesis steps.
The Get_Parameters.m file is used to implement the signal denoising, segmentation, and post-processing steps to extract blood pressure-related waveform features (e.g., PAT, phase information, etc.) as well as to compute the correlation between the features and blood pressure. 
The get_hr_hrv.m file is used to calculate the heart rate, heart rate variability, etc. MDI_v2.m file is used to evaluate the importance of features. DATA_SEGMEN.m file is used for dataset partitioning and RFR.m, ANN.m, SVR.m are used to construct three models to estimate the BP. 
Plot_blandaltman.m and Plot_regression.m files are used to plot the results of blood pressure estimation.

Please cite below paper if the code was used in your research or development.
@article{liu2025camera,
  title={Camera-Based Dual-Wavelength Defocused Speckle Imaging for Multi-Point Seismocardiographic Motion Measurement},
  author={Liu, Lin and Wei, Qiang and Li, Haozhe and Shan, Caifeng and Wang, Wenjin},
  journal={IEEE Journal of Biomedical and Health Informatics},
  year={2025},
  publisher={IEEE}
}
 
