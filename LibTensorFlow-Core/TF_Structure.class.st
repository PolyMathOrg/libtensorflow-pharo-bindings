"
Root class of all TF_XXX structures
"
Class {
	#name : #'TF_Structure',
	#superclass : #FFIExternalStructure,
	#category : 'LibTensorFlow-Core'
}

{ #category : #'class initialization' }
TF_Structure class >> initialize [
	super initialize.
	self == TF_Structure
		ifTrue: [ self allSubclassesDo: [ :cls | cls initialize ].
			self allSubclassesDo: [ :cls | cls initialize ] ]
]

{ #category : #'field definition' }
TF_Structure class >> pointerSize [
	" Fixed for 64 bit platforms. TensorFlow is only available in 64 bit platforms "

	self assert: 8 == Smalltalk wordSize.
	^ Smalltalk wordSize
]

{ #category : #comparing }
TF_Structure >> = aTF_Structure [
	^ self class = aTF_Structure class and: [ handle = aTF_Structure getHandle ]
]

{ #category : #private }
TF_Structure >> library [
	^ TensorFlowCAPI current
]

{ #category : #printing }
TF_Structure >> printOn: aStream [
	super printOn: aStream.
	aStream
		space;
		print: handle
]
