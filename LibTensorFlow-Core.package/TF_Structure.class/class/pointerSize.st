field definition
pointerSize
	" Fixed for 64 bit platforms. TensorFlow is only available in 64 bit platforms "

	self assert: 8 == Smalltalk wordSize.
	^ Smalltalk wordSize