Class {
	#name : #'TF_SessionOptions',
	#superclass : #FFIOpaqueObject,
	#category : 'LibTensorFlow-Core'
}

{ #category : #'instance creation' }
TF_SessionOptions class >> create [
	^ TensorFlowCAPI current newSessionOptions autoRelease
]

{ #category : #'instance creation' }
TF_SessionOptions class >> finalizeResourceData: handle [

	handle isNull ifTrue: [ ^ self ].
	(TensorFlowCAPI current) deleteSessionOptions: handle
]

{ #category : #'instance creation' }
TF_SessionOptions class >> fromProtoBuf: aString [
	| answer |
	answer := self create.
	answer config: aString.
	^ answer
]

{ #category : #'instance creation' }
TF_SessionOptions class >> onTarget: aString [
	^ self create target: aString
]

{ #category : #'initialize-release' }
TF_SessionOptions >> config: aString [
	| status |
	status := TF_Status create.
	self library sessionOptions: self setConfig: aString configSize: aString size status: status.
	status check
]

{ #category : #'initialize-release' }
TF_SessionOptions >> delete [
"deprecated"
self halt.

	self ignoreFinalization.
	self isNull ifFalse: [
		self library deleteSessionOptions: self].
	handle := nil
]

{ #category : #'initialize-release' }
TF_SessionOptions >> finalize [
"deprecated"
self halt.
	self delete
]

{ #category : #'initialize-release' }
TF_SessionOptions >> library [
	^ TensorFlowCAPI current
]

{ #category : #'initialize-release' }
TF_SessionOptions >> target: aString [
	" 'local' 'google.com:1234' '192.168.1.1:1234' 'local,example.com:1234' etc.
	are all valid target strings"
	self library sessionOptions: self setTarget: (self library externalizeString: aString).

]
