"
TF_Buffer holds a pointer to a block of data and its associated length.
Typically, the data consists of a serialized protocol buffer, but other data may also be held in a buffer.
"
Class {
	#name : #'TF_Buffer',
	#superclass : #'TF_Structure',
	#classVars : [
		'OFFSET_DATA',
		'OFFSET_DEALLOCATOR',
		'OFFSET_LENGTH'
	],
	#category : 'LibTensorFlow-Core'
}

{ #category : #'field definition' }
TF_Buffer class >> fieldsDesc [
	"self rebuildFieldAccessors"
	
	"typedef struct TF_Buffer {
  		const void* data;
  		size_t length;
  		void (*data_deallocator)(void* data, size_t length);
		} TF_Buffer;"
	^#(
	void * data;
	size_t length;
	void * deallocator;
	)
]

{ #category : #'instance creation' }
TF_Buffer class >> fromFileNamed: aString [
	| fileContents |
	fileContents := aString asFileReference readStream contents.
	^ self fromString: fileContents
]

{ #category : #'instance creation' }
TF_Buffer class >> fromString: aString [
	^ TensorFlowCAPI current newBufferFromString: aString size: aString size
]

{ #category : #'accessing structure variables' }
TF_Buffer >> data [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DATA) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
TF_Buffer >> data: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DATA put: anObject getHandle.
]

{ #category : #accessing }
TF_Buffer >> dataBytes [
	^ self data getHandle structAt: 1 length: self length
]

{ #category : #'accessing structure variables' }
TF_Buffer >> deallocator [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DEALLOCATOR) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
TF_Buffer >> deallocator: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DEALLOCATOR put: anObject getHandle.
]

{ #category : #release }
TF_Buffer >> delete [
	self isNull
		ifFalse: [ self library deleteBuffer: self ].
	handle := nil
]

{ #category : #'accessing structure variables' }
TF_Buffer >> length [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_LENGTH
]

{ #category : #'accessing structure variables' }
TF_Buffer >> length: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_LENGTH put: anObject
]
