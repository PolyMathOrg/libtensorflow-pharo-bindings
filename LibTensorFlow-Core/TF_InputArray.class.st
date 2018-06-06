Class {
	#name : #'TF_InputArray',
	#superclass : #FFIExternalArray,
	#category : #'LibTensorFlow-Core'
}

{ #category : #accessing }
TF_InputArray class >> externalNew: aNumberOfInput [
	^ self externalNewType: self type size: aNumberOfInput
]

{ #category : #accessing }
TF_InputArray class >> fromCollection: aCollection [
	| answer |
	answer := self externalNewType: self type size: aCollection size.
	aCollection withIndexDo: [ :each :index | answer at: index put: each ].
	^ answer
]

{ #category : #accessing }
TF_InputArray class >> type [
	^ 'TF_Input'
]
