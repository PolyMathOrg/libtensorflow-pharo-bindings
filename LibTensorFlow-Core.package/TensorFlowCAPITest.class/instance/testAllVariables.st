testing operation
testAllVariables
	| graph pisTensor var1 vars var2 var3 |
	graph := TF_Graph create.
	pisTensor := TF_Tensor fromFloats: #(3.14 3.1415 3.141516).
	var1 := graph variable: 'var1' initialValue: pisTensor.
	var2 := graph variable: 'var2' initialValue: pisTensor.
	var3 := graph variable: 'var3' initialValue: pisTensor.

	vars := graph allVariables.
	
	self assert: vars size = 3.
	self assert: vars first = var1.
	self assert: vars second = var2.
	self assert: vars third = var3.
	