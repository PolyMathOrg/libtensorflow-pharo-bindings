testing
testArray: anExternalWordArraySubclass sampleElement: anObject
	| array size |
	size := 4.
	array := anExternalWordArraySubclass new: 4.
	self assert: size * Smalltalk wordSize equals: array getHandle size.
	self assert: (array first isKindOf: anObject class).
	1 to: size do: [ :index | self assert: ((array at: index) isKindOf: anObject class) ]