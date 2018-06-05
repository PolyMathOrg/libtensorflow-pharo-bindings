Class {
	#name : #'TF_AttrMetadata',
	#superclass : #'TF_Structure',
	#classVars : [
		'OFFSET_IS_LIST',
		'OFFSET_LIST_SIZE',
		'OFFSET_TOTAL_SIZE',
		'OFFSET_TYPE'
	],
	#category : 'LibTensorFlow-Core'
}

{ #category : #'field definition' }
TF_AttrMetadata class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(byte is_list;
	 int64 list_size;
	 int type;
	 int64 total_size;
	)
]

{ #category : #types }
TF_AttrMetadata >> isBoolean [
	^ self type = 3
]

{ #category : #types }
TF_AttrMetadata >> isFloat [
	^ self type = 2
]

{ #category : #types }
TF_AttrMetadata >> isFunc [
	^ self type = 8
]

{ #category : #types }
TF_AttrMetadata >> isInt [
	^ self type = 1
]

{ #category : #'accessing structure variables' }
TF_AttrMetadata >> isList [

^ self isList = 1
]

{ #category : #types }
TF_AttrMetadata >> isPlaceholder [
	^ self type = 7
]

{ #category : #types }
TF_AttrMetadata >> isShape [
	^ self type = 5
]

{ #category : #types }
TF_AttrMetadata >> isString [
	^ self type = 0
]

{ #category : #types }
TF_AttrMetadata >> isTensor [
	^ self type = 6
]

{ #category : #types }
TF_AttrMetadata >> isType [
	^ self type = 4
]

{ #category : #'accessing structure variables' }
TF_AttrMetadata >> is_list [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_IS_LIST
]

{ #category : #'accessing structure variables' }
TF_AttrMetadata >> is_list: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_IS_LIST put: anObject
]

{ #category : #'accessing structure variables' }
TF_AttrMetadata >> list_size [
	"This method was automatically generated"
	^handle signedLongLongAt: OFFSET_LIST_SIZE
]

{ #category : #'accessing structure variables' }
TF_AttrMetadata >> list_size: anObject [
	"This method was automatically generated"
	handle signedLongLongAt: OFFSET_LIST_SIZE put: anObject
]

{ #category : #'accessing structure variables' }
TF_AttrMetadata >> total_size [
	"This method was automatically generated"
	^handle signedLongLongAt: OFFSET_TOTAL_SIZE
]

{ #category : #'accessing structure variables' }
TF_AttrMetadata >> total_size: anObject [
	"This method was automatically generated"
	handle signedLongLongAt: OFFSET_TOTAL_SIZE put: anObject
]

{ #category : #'accessing structure variables' }
TF_AttrMetadata >> type [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TYPE
]

{ #category : #'accessing structure variables' }
TF_AttrMetadata >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject
]
