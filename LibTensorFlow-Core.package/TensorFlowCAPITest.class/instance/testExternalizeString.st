testing options
testExternalizeString
	| original copy |
	original := 'hola manola'.
	copy := library externalizeString: original.
	original withIndexDo: [ :each :index | self assert: each asciiValue equals: (copy byteAt: index) ].
	self assert: (copy byteAt: original size + 1) equals: 0.
	copy free