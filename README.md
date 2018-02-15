# libtensorflow-pharo-bindings

This is a fork of https://github.com/Cuis-Smalltalk/Machine-Learning for Pharo.

You will need a 64 bits Pharo VM in order to run the code. The code has only be tested on Pharo 6.1 on macOS.

## Install Tensor Flow library 1.5.0 on macOS

```
brew install tensorflow
```
Put the path to the tf lib in the following method:
```Smalltalk
TensorFlowCAPI class>>moduleName
  ^ 'libtensorflow.dylib'
```
