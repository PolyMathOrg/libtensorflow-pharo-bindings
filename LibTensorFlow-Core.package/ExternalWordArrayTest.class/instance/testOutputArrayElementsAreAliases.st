testing
testOutputArrayElementsAreAliases
	| array size one other |
	size := 4.
	array := TF_OutputArray externalNew: size.

	one := array first.
	other := array at: 1.
	
	one index: 12345678.
	self assert: one index = 12345678.
	self assert: other index = 12345678.

	other index: 77665544.
	self assert: one index = 77665544.
	self assert: other index = 77665544.

	1 to: size do: [:index |
		one := array at: index.
		other := array at: index.

		one index: 12348765.
		self assert: one index = 12348765.
		self assert: other index = 12348765.

		other index: 77222244.
		self assert: one index = 77222244.
		self assert: other index = 77222244].
