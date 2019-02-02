# libtensorflow-pharo-bindings

This is a fork of https://github.com/Cuis-Smalltalk/Machine-Learning for Pharo.

You will need a 64 bits Pharo VM in order to run the code. The code has only be tested on Pharo 7.0 on macOS and Windows with TensorFlow 1.12.0: https://github.com/tensorflow/tensorflow/releases/tag/v1.12.0

## Installation

- Install last Pharo 7.0 64 bit VM and image from the command line : https://pharo.org/download
- Install the project in Pharo
  
To install the project on your Pharo image you can execute the following script:

```Smalltalk
    Metacello new
    	githubUser: 'PolyMathOrg' project: 'libtensorflow-pharo-bindings' commitish: 'master' path: '';
    	baseline: 'LibTensorFlowPharoBinding';
    	load
```

Alternatively you can use Iceberg to load the code of this repository (See the video here: https://www.youtube.com/watch?v=U6Ttcc1KJUg&feature=youtu.be)

To add the project to your baseline just add this:

```Smalltalk
    spec
    	baseline: 'LibTensorFlowPharoBinding'
    	with: [ spec repository: 'github://PolyMathOrg/libtensorflow-pharo-bindings' ]
```

## Installation of TensorFlow C API on MacOS
- Install TensorFlow C API on your computer. On macOS, the simpliest way to do that is to use Brew:
```brew install tensorflow```
  If you don't use brew, check the [installation guide](https://www.tensorflow.org/install/lang_c)
- check method ```TensorFlowCAPI>>macModulename```to put the path to where Tensorflow libraries are located on your computer:
```Smalltalk
TensorFlowCAPI>>macModulename
  ^ '/usr/local/Cellar/libtensorflow/1.12.0/lib/libtensorflow.so'
  ```
## Installation of TensorFlow C API on Windows
- Check the Tensorflow for C [installation guide](https://www.tensorflow.org/install/lang_c)

## Installation of TensorFlow C API on Linux
- Check the Tensorflow for C [installation guide](https://www.tensorflow.org/install/lang_c)
- check method ```TensorFlowCAPI>>unixModulename```to put the path to where Tensorflow libraries are located on your computer:
```Smalltalk
TensorFlowCAPI>>unixModulename
  ^ '/usr/local/lib/libtensorflow.so'
  ```
