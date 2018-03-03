testing
testArrayAtPutFor: anExternalWordArraySubclass elementSample: anObject
	| array size one |
	size := 4.
	array := anExternalWordArraySubclass new: 4.
	one := array first.
	array first: anObject.
	self assert: array first equals: anObject.
	self assert: (array first isKindOf: anObject class).
	array first: one.
	self assert: array first equals: one.
	1 to: size do: [ :index | 
		array at: index put: anObject.
		self assert: (array at: index) equals: anObject.
		self assert: ((array at: index) isKindOf: anObject class).
		array at: index put: one.
		self assert: (array at: index) equals: one ]