# libtensorflow-pharo-bindings

This is a fork of https://github.com/Cuis-Smalltalk/Machine-Learning for Pharo.

You will need a 64 bits Pharo VM in order to run the code. The code has only be tested on Pharo 7.0 on macOS and Windows with TensorFlow 1.9.0: https://github.com/tensorflow/tensorflow/releases/tag/v1.9.0

## Installation

- Install Pharo 7.0 64 bit VM and image from the command line : https://pharo.org/download
- Fix the following method (or you will have crashes):
```Smalltalk
FFIExternalStructureType>>basicHandle: aHandle at: index put: value
	^ LibC memCopy: value getHandle to: aHandle + (index - 1) size: self externalTypeSize
  ```
- Use Iceberg to load the code of this repository (See the video here: https://www.youtube.com/watch?v=U6Ttcc1KJUg&feature=youtu.be)

Until we have a BaselineOf for this project, you have to loaded dependencies [Roassal2](https://github.com/ObjectProfile/Roassal2) and [idx-reader](https://github.com/guillep/idx-reader) by hand:

```Smalltalk
Metacello new 
  onWarningLog;
  smalltalkhubUser: 'ObjectProfile' project: 'Roassal2';
  configuration: 'Roassal2';
  version: #development;
  load.
```

```Smalltalk
Metacello new
  baseline: 'IdxReader';
  repository: 'github://guillep/idx-reader';
  load.
```

## Installation of TensorFlow on MacOS
- Install TensorFlow on your computer. On macOS, the simpliest way to do that is to use Brew:
```brew install tensorflow```
- check method ```TensorFlowCAPI>>macModulename```to put the path to where Tensorflow libraries are located on your computer:
```Smalltalk
TensorFlowCAPI>>macModulename
  ^ '/usr/local/Cellar/libtensorflow/1.9.0/lib/libtensorflow.so'
  ```
## Installation of TensorFlow on Windows
- Install Tensorflow on your computer. On Windows the easiest way is to use pip:
```pip install tensorflow```
- If you want the GPU version:
```pip3 install --upgrade tensorflow-gpu```

## Installation of TensorFlow on Linux
- Install Tensorflow on your computer.
- check method ```TensorFlowCAPI>>unixModulename```to put the path to where Tensorflow libraries are located on your computer:
```Smalltalk
TensorFlowCAPI>>unixModulename
  ^ '/usr/local/lib/libtensorflow.so'
  ```
