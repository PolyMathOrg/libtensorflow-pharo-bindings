Class {
	#name : #'TF_OperationPtrArray',
	#superclass : #FFIExternalArray,
	#category : 'LibTensorFlow-Core'
}

{ #category : #'instance creation' }
TF_OperationPtrArray class >> externalNew: aNumberOfOperation [

^ self externalNewType: self type size: aNumberOfOperation
]

{ #category : #'instance creation' }
TF_OperationPtrArray class >> fromCollection: aCollection [
|answer|
answer := self externalNewType: self type size: aCollection size.
aCollection withIndexDo: [ :each :index | answer at: index put: each ].
^answer
]

{ #category : #'instance creation' }
TF_OperationPtrArray class >> type [

^'TF_Operation*'
]

{ #category : #converting }
TF_OperationPtrArray >> asArray [
|answer|
answer := Array new: self size.
self withIndexDo: [ :each :index | answer at: index put: (TF_Operation fromHandle: each) ].
^answer
]
