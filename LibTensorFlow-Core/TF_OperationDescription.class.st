"
Operation being built. The underlying graph must outlive this.
"
Class {
	#name : #'TF_OperationDescription',
	#superclass : #FFIOpaqueObject,
	#category : 'LibTensorFlow-Core'
}

{ #category : #finalization }
TF_OperationDescription class >> basicNew [

^super basicNew autoRelease
]

{ #category : #finalization }
TF_OperationDescription class >> finalizeResourceData: handle [


]

{ #category : #finalization }
TF_OperationDescription class >> new [

self halt.
^super new autoRelease
]

{ #category : #accessing }
TF_OperationDescription >> add: input [
	"To be removed maybe ?"

	self halt.
	self library description: self addInput: input
]

{ #category : #inputs }
TF_OperationDescription >> addControlInput: aTF_OutputOrInput [
	^ self library description: self addControlInput: aTF_OutputOrInput
]

{ #category : #inputs }
TF_OperationDescription >> addInput: aTF_OutputOrInput [
	^ self library description: self addInput: aTF_OutputOrInput
]

{ #category : #inputs }
TF_OperationDescription >> addInputFromOutput: indexInteger of: aTF_Operation [
	| input |
	input := aTF_Operation input: indexInteger.
	[ self library description: self addInput: input ]
		ensure: [ input free ]
]

{ #category : #inputs }
TF_OperationDescription >> addInputs: anArrayOfTF_Output [
	| inputs |
	inputs := TF_OutputArrayOld externalFromArray: anArrayOfTF_Output.
	self library description: self addInputs: inputs size: anArrayOfTF_Output size
]

{ #category : #attributes }
TF_OperationDescription >> at: attribute putBoolean: value [
	self library description: self set: attribute asAsciiZ toBool: value
]

{ #category : #attributes }
TF_OperationDescription >> at: attribute putFloat: value [
	self library description: self set: attribute asAsciiZ toFloat: value asFloat
]

{ #category : #attributes }
TF_OperationDescription >> at: attribute putInt: value [
	self library description: self set: attribute asAsciiZ toInt64: value
]

{ #category : #attributes }
TF_OperationDescription >> at: attribute putShape: anIntegerArray [
	| status value |
	value := FFIExternalArray externalNewType: 'int64' fromArray: anIntegerArray.
	status := TF_Status create.
	self library
		description: self
		set: attribute asAsciiZ
		toShape: value getHandle
		size: anIntegerArray size.
	status check
]

{ #category : #attributes }
TF_OperationDescription >> at: attribute putString: aString [
	| status |
	status := TF_Status create.
	self library
		description: self
		set: attribute asAsciiZ
		toString: aString
		size: aString size.
	status check
]

{ #category : #attributes }
TF_OperationDescription >> at: attribute putStrings: anArrayOfStrings [
	| status sizes strings pointers |
	sizes := anArrayOfStrings collect: [:str | str size].
	sizes := FFIExternalArray externalNewType: 'int64' fromArray: sizes.
	sizes autoRelease.
	strings := anArrayOfStrings collect: [:each | (self library externalizeString: each) autoRelease].
	pointers := ByteArray new: Smalltalk wordSize * strings size.
	strings withIndexDo: [:each :index |
		pointers pointerAt: index-1*Smalltalk wordSize+1 put: each].
	 
	status := TF_Status create.
	self library
		description: self
		set: attribute asAsciiZ
		toStrings: pointers
		sizes: sizes getHandle
		count: anArrayOfStrings size.
	status check
	
]

{ #category : #attributes }
TF_OperationDescription >> at: attribute putTensor: aTF_Tensor [
	| status |
	status := TF_Status create.
	self library
		description: self
		set: attribute asAsciiZ
		toTensor: aTF_Tensor
		status: status.
	status check
]

{ #category : #attributes }
TF_OperationDescription >> at: attribute putType: value [
	self library description: self set: attribute asAsciiZ toType: value
]

{ #category : #attributes }
TF_OperationDescription >> device: aString [
	^ self library description: self setDevice: aString
]

{ #category : #accessing }
TF_OperationDescription >> finish [
	| answer status |
	status := TF_Status create.
	answer := self library finishOperation: self status: status.
	"handle := nil."
	status check.
	^ answer
]

{ #category : #attributes }
TF_OperationDescription >> library [
	^ TensorFlowCAPI current
]
