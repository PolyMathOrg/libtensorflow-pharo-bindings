"
Represents one of the outputs of an Operation.

A Tensor is a symbolic handle to one of the outputs of an Operation. It does not hold the values of that operation's output, but instead provides a means of computing those values in a TensorFlow tf.Session.


"
Class {
	#name : #'TF_Tensor',
	#superclass : #FFIOpaqueObject,
	#category : 'LibTensorFlow-Core'
}

{ #category : #utils }
TF_Tensor class >> array: values type: type into: anExternalAddressOrByteArray [
	| size index setter |
	size := self sizeForType: type.
	setter := self setterBlockFor: type.
	index := 0.
	self
		elementsOf: values
		do: [ :value | 
			setter value: anExternalAddressOrByteArray value: index * size + 1 value: value.
			index := index + 1 ]
]

{ #category : #converting }
TF_Tensor class >> asExternalTypeOn: aFFICallout [ 
	^ FFIOpaqueObjectType objectClass: self
]

{ #category : #utils }
TF_Tensor class >> elementsOf: aMultidimensionalTensor [
	| answer |
	answer := (Array new: (self sizeOf: aMultidimensionalTensor)) writeStream.
	self elementsOf: aMultidimensionalTensor do: [ :each | answer nextPut: each ].
	^ answer contents
]

{ #category : #utils }
TF_Tensor class >> elementsOf: tensorArray do: oneArgBlock [
	^ (tensorArray isCollection and: [ tensorArray isString not ])
		ifTrue: [ tensorArray do: [ :each | self elementsOf: each do: oneArgBlock ] ]
		ifFalse: [ oneArgBlock value: tensorArray ]
]

{ #category : #'instance creation' }
TF_Tensor class >> fromBooleans: values [
	^ self fromNumbers: values type: self typeBoolean
]

{ #category : #'instance creation' }
TF_Tensor class >> fromBools: values shape: shape [
	^ self fromNumbers: values type: self typeBoolean shape: shape
]

{ #category : #'instance creation' }
TF_Tensor class >> fromDoubles: values [
	^ self fromNumbers: values type: self typeDouble
]

{ #category : #'instance creation' }
TF_Tensor class >> fromDoubles: values shape: shape [
	^ self fromNumbers: values type: self typeDouble shape: shape

]

{ #category : #'instance creation' }
TF_Tensor class >> fromFloats: values [
	^ self fromNumbers: values type: self typeFloat
]

{ #category : #'instance creation' }
TF_Tensor class >> fromFloats: values shape: shape [
	^ self fromNumbers: values type: self typeFloat shape: shape

]

{ #category : #'instance creation' }
TF_Tensor class >> fromInt32: value [
	| answer |
	answer := self type: self typeInt32 shape: #().
	answer data getHandle signedLongAt: 1 put: value.
	^ answer
]

{ #category : #'instance creation' }
TF_Tensor class >> fromInt32s: values [
	^ self fromNumbers: values type: self typeInt32
]

{ #category : #'instance creation' }
TF_Tensor class >> fromInt32s: values shape: shape [
	^ self fromNumbers: values type: self typeInt32 shape: shape

]

{ #category : #'instance creation' }
TF_Tensor class >> fromInt64: value [
	| answer |
	answer := self type: self typeInt64 shape: #().
	answer data getHandle signedLongLongAt: 1 put: value.
	^ answer
]

{ #category : #'instance creation' }
TF_Tensor class >> fromInt64s: values [
	^ self fromNumbers: values type: self typeInt64
]

{ #category : #'instance creation' }
TF_Tensor class >> fromInt64s: values shape: shape [
	^ self fromNumbers: values type: self typeInt64 shape: shape

]

{ #category : #'instance creation' }
TF_Tensor class >> fromNumbers: values type: type [
	| shape |
	shape := self shapeOf: values.
	^ self fromNumbers: values type: type shape: shape
]

{ #category : #'instance creation' }
TF_Tensor class >> fromNumbers: values type: type shape: shape [
	| answer size count |
	size := self sizeOf: values.
	count := shape inject: 1 into: [ :a :b | a * b ].
	count = size
		ifFalse: [ self error: 'Inferred size and real size don''t match.' ].
	answer := self type: type shape: shape.
	self array: values type: type into: answer data getHandle.
	^ answer
]

{ #category : #'instance creation' }
TF_Tensor class >> fromString: aString [
	| answer bytesize |
	bytesize := TensorFlowCAPI current stringEncodedSize: aString.
	bytesize := bytesize.
	answer := self type: self typeString shape: #() bytesize: bytesize.
	
	TensorFlowCAPI current
		stringEncode: aString
		to: answer data getHandle
		size: bytesize.
	^ answer
]

{ #category : #'instance creation' }
TF_Tensor class >> fromStringArray: aStringArray [
	^ self fromStrings: aStringArray shape: {aStringArray size}
]

{ #category : #'instance creation' }
TF_Tensor class >> fromStringArray: aStringArray shape: shape [
	| answer sizes offsets offsetSize bytesize |
	sizes := aStringArray collect: [:each | self sizeOfString: each].
	offsetSize := self sizeForType: self typeInt64.
	bytesize := offsetSize * aStringArray size + sizes sum.
	offsets := OrderedCollection new: sizes size.
	
	sizes inject: 0 into: [:prev :each |
		offsets add: prev.
		each + prev].
	
	answer := self
		type: self typeString
		shape: shape
		bytesize: bytesize.
		
	self int64Array: offsets into: answer data getHandle.	
	
	aStringArray withIndexDo: [:each :index |
		| offset |
		offset := offsetSize * aStringArray size + (offsets at: index).
		TensorFlowCAPI current
			stringEncode: each
			to: answer data getHandle + offset
			size: bytesize - offset].
	^ answer

]

{ #category : #'instance creation' }
TF_Tensor class >> fromStrings: aStringArray [
	^ self fromStrings: aStringArray shape: (TF_Tensor shapeOf: aStringArray) allButLast.

]

{ #category : #'instance creation' }
TF_Tensor class >> fromStrings: strings shape: shape [
	| flatten |
	flatten := self elementsOf: strings.
	^ self fromStringArray:  flatten shape: shape.

]

{ #category : #types }
TF_Tensor class >> getterBlockFor: type [
	TF_Tensor typeUInt8 = type ifTrue: [ ^ [ :data :offset | data unsignedByteAt: offset ] ].
	TF_Tensor typeInt32 = type ifTrue: [^ [:data :offset | data signedLongAt: offset]].
	TF_Tensor typeInt64 = type ifTrue: [^ [:data :offset | data signedLongLongAt: offset]].
	TF_Tensor typeFloat = type ifTrue: [^ [:data :offset | data floatAt: offset]].
	TF_Tensor typeDouble = type ifTrue: [^ [:data :offset | data doubleAt: offset]].
	TF_Tensor typeBoolean = type ifTrue: [^ [:data :offset | data booleanAt: offset]].
	^ self shouldBeImplemented 
]

{ #category : #utils }
TF_Tensor class >> int64Array: values into: anExternalAddressOrByteArray [
	self array: values type: self typeInt64 into: anExternalAddressOrByteArray.

]

{ #category : #'instance creation' }
TF_Tensor class >> pi [
	^ Float pi asTensor
]

{ #category : #utils }
TF_Tensor class >> rankOf: aMultidimensionalArray [
	"Return the rank of a multi-dimensional Array"

	^ aMultidimensionalArray isCollection
		ifTrue: [ 1 + (self rankOf: aMultidimensionalArray first) ]
		ifFalse: [ 0 ]
]

{ #category : #types }
TF_Tensor class >> setterBlockFor: type [
	TF_Tensor typeUInt8 = type
		ifTrue: [ ^ [ :data :offset :value | data unsignedByteAt: offset put: value ] ].
	TF_Tensor typeInt32 = type
		ifTrue: [ ^ [ :data :offset :value | data signedLongAt: offset put: value ] ].
	TF_Tensor typeInt64 = type
		ifTrue: [ ^ [ :data :offset :value | data signedLongLongAt: offset put: value ] ].
	TF_Tensor typeFloat = type
		ifTrue: [ ^ [ :data :offset :value | data floatAt: offset put: value ] ].
	TF_Tensor typeDouble = type
		ifTrue: [ ^ [ :data :offset :value | data doubleAt: offset put: value ] ].
	TF_Tensor typeBoolean = type
		ifTrue: [ ^ [ :data :offset :value | data booleanAt: offset put: value ] ].
	^ self shouldBeImplemented
]

{ #category : #utils }
TF_Tensor class >> shapeOf: aMultidimensionalArray [
	"Return the shape of a multi-dimensioanal Array"

	^ aMultidimensionalArray isCollection
		ifTrue: [ aMultidimensionalArray isEmpty
				ifTrue: [ #(0) ]
				ifFalse: [ {aMultidimensionalArray size} , (self shapeOf: aMultidimensionalArray first) ] ]
		ifFalse: [ #() ]
]

{ #category : #types }
TF_Tensor class >> sizeForType: anInteger [
	self typeFloat = anInteger ifTrue: [^4].
	self typeInt64 = anInteger ifTrue: [^8].
	self typeInt32 = anInteger ifTrue: [^4].
	self typeUInt8 = anInteger ifTrue: [^1].
	self typeDouble = anInteger ifTrue: [^8].
	self typeBoolean = anInteger ifTrue: [^1].

"
8
		UInt8 4
		Int8 6
		QInt8 11
		QUInt8 12

16
		Int16 5
		BFloat16 14
		QInt16 15
		QUInt16 16
		UInt16 17
		Half 19

32
		Float 1
		Int32 3
		QInt32 13

64
		Double 2
		Complex64 8
		Int64 9

128
		Complex128 18

		String 7
		Resource 20).

		Bool 10
"


	^ self shouldBeImplemented.
]

{ #category : #utils }
TF_Tensor class >> sizeOf: aMultidimensionalArray [
	"Return the size of a multi-dimensional Array"

	^ aMultidimensionalArray isCollection
		ifTrue: [ aMultidimensionalArray isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ aMultidimensionalArray sum: [ :each | self sizeOf: each ] ] ]
		ifFalse: [ 1 ]
]

{ #category : #utils }
TF_Tensor class >> sizeOfString: aString [
	^ TensorFlowCAPI current stringEncodedSize: aString
]

{ #category : #'instance creation' }
TF_Tensor class >> type: anInteger shape: anIntegerArray [
" I understand dimensions are:
	#()		-> Scalar
	#(7)		-> Unidimensional array of 7 elements
	#(7 4)		-> 7x4 elements matrix
	#(2 5 9)	-> 2x5x9 elements cube
	etc."
	
	| bytesize elementSize |
	elementSize := self sizeForType: anInteger.
	bytesize := anIntegerArray inject: elementSize into: [:prev :each | prev * each].
	^self type: anInteger shape: anIntegerArray bytesize: bytesize
]

{ #category : #'instance creation' }
TF_Tensor class >> type: anInteger shape: anIntegerArray bytesize: bytesizeInteger [
	" I understand dimensions are:
		#()		-> Scalar
		#(7)		-> Unidimensional array of 7 elements
		#(7 4)		-> 7x4 elements matrix
		#(2 5 9)	-> 2x5x9 elements cube
		etc.
	"
		
	| externalized answer |
	
	externalized := FFIExternalArray externalNewType: 'int64' fromArray: anIntegerArray.
	
	answer := TensorFlowCAPI current
		allocateTensorType: anInteger
		shape: externalized getHandle
		rank: anIntegerArray size
		length: bytesizeInteger.
	answer autoRelease.
	^ answer

]

{ #category : #types }
TF_Tensor class >> typeBFloat16 [
	^ 14
]

{ #category : #types }
TF_Tensor class >> typeBoolean [
	"TF_BOOL = 10"

	^ 10
]

{ #category : #types }
TF_Tensor class >> typeComplex128 [
	^ 18
]

{ #category : #types }
TF_Tensor class >> typeComplex64 [
	^ 8
]

{ #category : #types }
TF_Tensor class >> typeDouble [
	"TF_DOUBLE = 2"

	^ 2
]

{ #category : #types }
TF_Tensor class >> typeFloat [
	^ 1
]

{ #category : #types }
TF_Tensor class >> typeHalf [
	^ 19
]

{ #category : #types }
TF_Tensor class >> typeInt16 [
	^5
]

{ #category : #types }
TF_Tensor class >> typeInt32 [
	^ 3
]

{ #category : #types }
TF_Tensor class >> typeInt64 [
	^ 9
]

{ #category : #types }
TF_Tensor class >> typeInt8 [
	^6
]

{ #category : #types }
TF_Tensor class >> typeQInt16 [
	^15
]

{ #category : #types }
TF_Tensor class >> typeQInt32 [
	^13
]

{ #category : #types }
TF_Tensor class >> typeQInt8 [
	^11
]

{ #category : #types }
TF_Tensor class >> typeQUInt16 [
	^16
]

{ #category : #types }
TF_Tensor class >> typeQUInt8 [
	^12
]

{ #category : #types }
TF_Tensor class >> typeResource [
	^20
]

{ #category : #types }
TF_Tensor class >> typeString [
	^7
]

{ #category : #types }
TF_Tensor class >> typeUInt16 [
	^17
]

{ #category : #types }
TF_Tensor class >> typeUInt8 [
	^4
]

{ #category : #comparing }
TF_Tensor >> = aTF_Tensor [

"We have to tests both side in order to be correct under Pharo 6.1 and Pharo 7.0"
"Because TestAsserter>>assert: actual equals: expected is not really the same between these 2 versions"

	^ self class = aTF_Tensor class and: [( handle = aTF_Tensor getHandle ) or: [aTF_Tensor getHandle = handle getHandle]]
]

{ #category : #converting }
TF_Tensor >> allElements [
	^ self asStream contents
]

{ #category : #converting }
TF_Tensor >> allFloats [
	^ self allElements
]

{ #category : #converting }
TF_Tensor >> allInt32s [
	^ self allElements
]

{ #category : #converting }
TF_Tensor >> allInt64s [
	^ self allElements
]

{ #category : #converting }
TF_Tensor >> allStrings [
	| total answer bytes data |
	total := self size.
	answer := WriteStream on: (Array new: total).
	bytes := self dataBytes.
	data := self data getHandle + (8 * total).
	1 to: total do: [:i |
		| offset str |
		offset := bytes unsignedLongLongAt: i - 1 * 8 + 1.
		str := self library stringDecode: data + offset.
		answer nextPut: str].
	
	^ answer contents
]

{ #category : #converting }
TF_Tensor >> arrayFromStream: strm shape: shape [
	^ shape isEmpty
		ifTrue: [strm next]
		ifFalse: [
			| first tail |
			first := shape first.
			tail := shape allButFirst.
			Array
				streamContents: [:answer |
					first timesRepeat: [
						| next |
						next := self arrayFromStream: strm shape: tail.
						answer nextPut: next]]
				estimatedSize: first]
				

]

{ #category : #converting }
TF_Tensor >> asNumbers [
	^ self arrayFromStream: self asStream reset shape: self shape
]

{ #category : #converting }
TF_Tensor >> asOperationOn: aTF_Graph [
	^ aTF_Graph const: self
]

{ #category : #converting }
TF_Tensor >> asStream [
	| answer |
	answer := ReadWriteStream on: (Array new: self size).
	self elementsDo: [ :each | answer nextPut: each ].
	^ answer
]

{ #category : #accessing }
TF_Tensor >> byteSize [
	^ self library tensorByteSize: self
]

{ #category : #accessing }
TF_Tensor >> data [
	^ self library tensorData: self
]

{ #category : #iterating }
TF_Tensor >> dataAndOffsetsCollect: twoArgsBlock thenDo: oneArgBlock [
	| data elementSize |
	elementSize := self elementSize.
	data := self data getHandle.
	1 to: self size do: [:i |
		| value |
		value := twoArgsBlock value: data value: i-1*elementSize+1.
		oneArgBlock value: value].

]

{ #category : #accessing }
TF_Tensor >> dataBytes [
	^ self data getHandle structAt: 1 length: self byteSize
]

{ #category : #release }
TF_Tensor >> delete [
	self ignoreFinalization.
	self isNull
		ifFalse: [ self library deleteTensor: self ].
	handle := nil
]

{ #category : #accessing }
TF_Tensor >> elementSize [
	^ self class sizeForType: self type
]

{ #category : #iterating }
TF_Tensor >> elementsDo: oneArgBlock [
	self dataAndOffsetsCollect: self getterBlock thenDo: oneArgBlock
]

{ #category : #finalization }
TF_Tensor >> finalize [
	self delete
]

{ #category : #iterating }
TF_Tensor >> floatsDo: oneArgBlock [
	self dataAndOffsetsCollect: [ :data :offset | data floatAt: offset ] thenDo: oneArgBlock
]

{ #category : #accessing }
TF_Tensor >> getHandle [

"We need to refactor later"
^ super getHandle getHandle
]

{ #category : #iterating }
TF_Tensor >> getterBlock [
	^ self class getterBlockFor: self type
]

{ #category : #iterating }
TF_Tensor >> int32sDo: oneArgBlock [
	self dataAndOffsetsCollect: [ :data :offset | data signedLongAt: offset ] thenDo: oneArgBlock
]

{ #category : #iterating }
TF_Tensor >> int64sDo: oneArgBlock [
	self dataAndOffsetsCollect: [ :data :offset | data signedLongLongAt: offset ] thenDo: oneArgBlock
]

{ #category : #converting }
TF_Tensor >> library [
	^ TensorFlowCAPI current
]

{ #category : #printing }
TF_Tensor >> printOn: aStream [
	super printOn: aStream.
	handle ifNotNil: [ aStream nextPut: Character space; nextPutAll: self asNumbers asString ]
]

{ #category : #accessing }
TF_Tensor >> rank [
	^ self library tensorRank: self
]

{ #category : #accessing }
TF_Tensor >> shape [
	| answer count |
	count := self rank.
	answer := WriteStream on: (Array new: count).
	1 to: count do: [ :i | answer nextPut: (self sizeOn: i - 1) ].
	^ answer contents
]

{ #category : #accessing }
TF_Tensor >> size [
	^ self shape inject: 1 into: [ :prev :next | prev * next ]
]

{ #category : #accessing }
TF_Tensor >> sizeOn: dimension [
	^ self library tensor: self sizeOn: dimension
]

{ #category : #accessing }
TF_Tensor >> type [
	^ self library tensorType: self
]
