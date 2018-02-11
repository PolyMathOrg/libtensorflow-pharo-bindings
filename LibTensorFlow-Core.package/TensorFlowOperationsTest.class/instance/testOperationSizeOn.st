other operations
testOperationSizeOn
	| t3x1x4 |
	t3x1x4 := #(	"shape: (3 1 3)"
		((1 2 3 0))
		((4 5 6 0))
		((7 8 9 0))
	).
	self assert: #(1 2 3 4 5 6 7) sizeOn: 0 is: #(7).
	self assert: t3x1x4 sizeOn: 0 is: #(3).
	self assert: t3x1x4 sizeOn: 1 is: #(1).
	self assert: t3x1x4 sizeOn: 2 is: #(4).
 
