testing
testOutputArrayElementsAreAliases
	| array size one other |
	size := 4.
	array := TF_OutputArrayOld externalNew: size.
	one := array first.
	other := array at: 1.
	one index: 12345678.
	self assert: one index equals: 12345678.
	self assert: other index equals: 12345678.
	other index: 77665544.
	self assert: one index equals: 77665544.
	self assert: other index equals: 77665544.
	1 to: size do: [ :index | 
		one := array at: index.
		other := array at: index.
		one index: 12348765.
		self assert: one index equals: 12348765.
		self assert: other index equals: 12348765.
		other index: 77222244.
		self assert: one index equals: 77222244.
		self assert: other index equals: 77222244 ]