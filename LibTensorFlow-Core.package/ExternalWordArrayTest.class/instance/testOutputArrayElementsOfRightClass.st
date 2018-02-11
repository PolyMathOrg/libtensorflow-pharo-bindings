testing
testOutputArrayElementsOfRightClass
	| array size |
	size := 4.
	array := TF_OutputArray externalNew: size.
	self assert: (array first isKindOf: TF_Output).
	1 to: size do: [ :index | self assert: ((array at: index) isKindOf: TF_Output) ]