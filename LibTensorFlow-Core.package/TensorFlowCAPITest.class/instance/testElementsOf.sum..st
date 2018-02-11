testing tensor
testElementsOf: tensorArray sum: aNumber
	| sum |
	sum := 0.
	TF_Tensor elementsOf: tensorArray do: [ :each | sum := sum + each ].
	self assert: sum equals: aNumber