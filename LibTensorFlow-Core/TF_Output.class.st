"
Represents a specific output of an operation.
"
Class {
	#name : #'TF_Output',
	#superclass : #'TF_Structure',
	#classVars : [
		'OFFSET_INDEX',
		'OFFSET_OPERATION'
	],
	#category : 'LibTensorFlow-Core'
}

{ #category : #'field definition' }
TF_Output class >> asExternalTypeOn: aFFICallout [ 
	^ FFIExternalStructureType objectClass: self
]

{ #category : #'field definition' }
TF_Output class >> fieldsDesc [
	"self rebuildFieldAccessors"

	"// Represents a specific output of an operation.
typedef struct TF_Output {
  TF_Operation* oper;
  int index;  // The index of the output within oper.
} TF_Output;"

	^ #(
		TF_Operation * operation ;
		int index)
]

{ #category : #'instance creation' }
TF_Output class >> onOperation: aTF_Operation index: anInteger [
	^ self externalNew
		operation: aTF_Operation getHandle;
		index: anInteger;
		yourself
]

{ #category : #'accessing structure variables' }
TF_Output >> index [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INDEX
]

{ #category : #'accessing structure variables' }
TF_Output >> index: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INDEX put: anObject
]

{ #category : #'accessing structure variables' }
TF_Output >> operation [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_OPERATION) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
TF_Output >> operation: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_OPERATION put: anObject getHandle.
]

{ #category : #accessing }
TF_Output >> operationOn: aTF_Graph [
	| answer |
	answer := TF_Operation fromHandle: (handle longPointerAt: 1).
	answer graph: aTF_Graph.
	^ answer
]

{ #category : #printing }
TF_Output >> printOn: aStream [
	super printOn: aStream.
"	aStream
		space;
		print: (TF_DataTypeEnum itemAt: self type)"
]

{ #category : #accessing }
TF_Output >> type [
	^ self library operationOutputType: self
]
