Class {
	#name : #'TF_OutputArray',
	#superclass : #FFIExternalArray,
	#category : 'LibTensorFlow-Core'
}

{ #category : #accessing }
TF_OutputArray class >> externalNew: aNumberOfOutput [

^ self externalNewType: self type size: aNumberOfOutput
]

{ #category : #accessing }
TF_OutputArray class >> fromCollection: aCollection [
|answer|
answer := self externalNewType: self type size: aCollection size.
aCollection withIndexDo: [ :each :index | answer at: index put: each ].
^answer
]

{ #category : #accessing }
TF_OutputArray class >> type [

^'TF_Output'
]
