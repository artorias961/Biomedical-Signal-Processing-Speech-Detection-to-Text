
# Biomedical Signal Processing – Speech Detection to Text

This repository contains coursework and a capstone project for biomedical signal processing, implemented in MATLAB. The material progresses from foundational signal concepts to a final project that performs speech detection and phoneme-level transcription using classical digital signal processing techniques.



## Repository Structure

```
Biomedical-Signal-Processing-Speech-Detection-to-Text/
├── Module 1_ Biomedical Signal Overview
├── Module 2_ Ensemble Averaging and Biosignals
├── Module 3_ Correlation Analysis
├── Module 4_ Spectral Analysis
├── Module 5_ Power Spectral Density
├── Module 6_ STFT and Spectrogram
├── Module 7_ Filtering and Z-Transform
├── Module 8_ Digital Filters (FIR & IIR)
├── Module 9_ Exam Review
└── Module 10_ Project (Speech Detection to Text)
```



## Module Summary

### Module 1 – Biomedical Signals and MATLAB Primer
Introduction to biomedical signal types, sampling, discrete-time signals, and MATLAB tools used throughout the repository.

### Module 2 – Ensemble Averaging
Analysis of noise reduction using ensemble averaging applied to biomedical signals.

### Module 3 – Correlation Analysis
Use of autocorrelation and cross-correlation for signal similarity, alignment, and detection.

### Module 4 – Spectral Analysis
Frequency-domain analysis using Fourier Transform and FFT methods.

### Module 5 – Power Spectral Density
Estimation of signal power distribution across frequency bands and windowing effects.

### Module 6 – STFT and Spectrogram
Time–frequency analysis using the Short-Time Fourier Transform, with application to speech and biosignals.

### Module 7 – Filtering and Z-Transform
Digital filter concepts and discrete-time system representation.

### Module 8 – Digital Filters (FIR and IIR)
Design and implementation of FIR and IIR filters for signal conditioning.

### Module 9 – Exam Review
Review materials covering core digital signal processing topics.



## Module 10 – Speech Detection to Text (Project)

Module 10 contains a MATLAB-based speech detection and phoneme recognition system. The system processes audio recordings and outputs a sequence of phoneme labels using deterministic DSP methods.

### Directory Structure

```
Module 10_ Project/
├── SpeechToText_v3.m        # Main speech processing script
├── Project_textconfigV3.m  # Phoneme template generation
├── Phonemes_bankV4.mat     # Stored phoneme templates
├── TrainingData/           # Labeled phoneme recordings
├── test audio/             # Test speech samples
├── noise.mat               # Noise reference data
├── EE4820_Project.pdf      # Project documentation
└── EE4820_SpeechToText_Spring2022.pptx
```

### Processing Pipeline

1. Signal conditioning using digital filtering  
2. Feature extraction using STFT and spectrogram analysis  
3. Phoneme template generation and storage  
4. Sliding-window correlation-based classification  
5. Sequential phoneme output generation  



## Tools and Methods

- MATLAB
- Digital Signal Processing
- Spectral Analysis (FFT, STFT)
- Correlation Analysis
- FIR and IIR Filtering


