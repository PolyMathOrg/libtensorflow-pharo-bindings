"
TF_DataType holds the type for a scalar value.  E.g., one slot in a tensor.
The enum values here are identical to corresponding values in types.proto.
"
Class {
	#name : #'TF_DataTypeEnum',
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'TF_BFLOAT16',
		'TF_BOOL',
		'TF_COMPLEX',
		'TF_COMPLEX128',
		'TF_COMPLEX64',
		'TF_DOUBLE',
		'TF_FLOAT',
		'TF_HALF',
		'TF_INT16',
		'TF_INT32',
		'TF_INT64',
		'TF_INT8',
		'TF_QINT16',
		'TF_QINT32',
		'TF_QINT8',
		'TF_QUINT16',
		'TF_QUINT8',
		'TF_RESOURCE',
		'TF_STRING',
		'TF_UINT16',
		'TF_UINT32',
		'TF_UINT64',
		'TF_UINT8',
		'TF_VARIANT'
	],
	#category : 'LibTensorFlow-Core'
}

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_BFLOAT16 [
	"This method was automatically generated"
	^ TF_BFLOAT16
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_BOOL [
	"This method was automatically generated"
	^ TF_BOOL
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_COMPLEX [
	"This method was automatically generated"
	^ TF_COMPLEX
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_COMPLEX128 [
	"This method was automatically generated"
	^ TF_COMPLEX128
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_COMPLEX64 [
	"This method was automatically generated"
	^ TF_COMPLEX64
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_DOUBLE [
	"This method was automatically generated"
	^ TF_DOUBLE
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_FLOAT [
	"This method was automatically generated"
	^ TF_FLOAT 
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_HALF [
	"This method was automatically generated"
	^ TF_HALF
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_INT16 [
	"This method was automatically generated"
	^ TF_INT16
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_INT32 [
	"This method was automatically generated"
	^ TF_INT32
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_INT64 [
	"This method was automatically generated"
	^ TF_INT64
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_INT8 [
	"This method was automatically generated"
	^ TF_INT8
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_QINT16 [
	"This method was automatically generated"
	^ TF_QINT16
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_QINT32 [
	"This method was automatically generated"
	^ TF_QINT32
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_QINT8 [
	"This method was automatically generated"
	^ TF_QINT8
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_QUINT16 [
	"This method was automatically generated"
	^ TF_QUINT16
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_QUINT8 [
	"This method was automatically generated"
	^ TF_QUINT8
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_RESOURCE [
	"This method was automatically generated"
	^ TF_RESOURCE
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_STRING [
	"This method was automatically generated"
	^ TF_STRING
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_UINT16 [
	"This method was automatically generated"
	^ TF_UINT16
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_UINT32 [
	"This method was automatically generated"
	^ TF_UINT32
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_UINT64 [
	"This method was automatically generated"
	^ TF_UINT64
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_UINT8 [
	"This method was automatically generated"
	^ TF_UINT8
]

{ #category : #'accessing enum' }
TF_DataTypeEnum class >> TF_VARIANT [
	"This method was automatically generated"
	^ TF_VARIANT
]

{ #category : #'enum declaration' }
TF_DataTypeEnum class >> enumDecl [
"self rebuildEnumAccessors"
	^#(
	TF_FLOAT 1
 	TF_DOUBLE 2
  	TF_INT32 3
  	TF_UINT8 4
  	TF_INT16 5
  	TF_INT8 6
  	TF_STRING 7
  	TF_COMPLEX64 8
  	TF_COMPLEX 8
  	TF_INT64 9
	TF_BOOL 10
   TF_QINT8 11
   TF_QUINT8 12
  	TF_QINT32 13
  	TF_BFLOAT16 14
  	TF_QINT16 15
  	TF_QUINT16 16
  	TF_UINT16 17
  	TF_COMPLEX128 18
  	TF_HALF 19
  	TF_RESOURCE 20
  	TF_VARIANT 21
  	TF_UINT32 22
	TF_UINT64 23
)
]
