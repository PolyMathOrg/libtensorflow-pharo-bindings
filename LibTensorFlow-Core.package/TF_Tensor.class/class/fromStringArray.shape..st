instance creation
fromStringArray: aStringArray shape: shape
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
