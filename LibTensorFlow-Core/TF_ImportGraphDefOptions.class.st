"
TF_ImportGraphDefOptions holds options that can be passed to TF_GraphImportGraphDef.
"
Class {
	#name : #'TF_ImportGraphDefOptions',
	#superclass : #FFIExternalObject,
	#category : 'LibTensorFlow-Core'
}

{ #category : #converting }
TF_ImportGraphDefOptions class >> asExternalTypeOn: generator [
	^ FFIOpaqueObjectType objectClass: self
]

{ #category : #'instance creation' }
TF_ImportGraphDefOptions class >> create [
	^ TensorFlowCAPI current newImportGraphDefOptions
]

{ #category : #release }
TF_ImportGraphDefOptions >> delete [
	self isNull
		ifFalse: [ self library deleteImportGraphDefOptions: self ].
	handle := nil
]

{ #category : #release }
TF_ImportGraphDefOptions >> library [
	^ TensorFlowCAPI current
]
