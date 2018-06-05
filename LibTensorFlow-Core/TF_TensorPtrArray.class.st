Class {
	#name : #'TF_TensorPtrArray',
	#superclass : #FFIExternalArray,
	#category : 'LibTensorFlow-Core'
}

{ #category : #accessing }
TF_TensorPtrArray class >> externalNew: aNumberOfTensor [

^ self externalNewType: self type size: aNumberOfTensor
]

{ #category : #accessing }
TF_TensorPtrArray class >> fromCollection: aCollection [
|answer|
answer := self externalNewType: self type size: aCollection size.
aCollection withIndexDo: [ :each :index | answer at: index put: each getHandle].
^answer
]

{ #category : #accessing }
TF_TensorPtrArray class >> type [

^'TF_Tensor*'
]

{ #category : #converting }
TF_TensorPtrArray >> asArray [
|answer|
answer := Array new: self size.
self withIndexDo: [ :each :index | answer at: index put: (TF_Tensor fromHandle: each) ].
^answer
]
