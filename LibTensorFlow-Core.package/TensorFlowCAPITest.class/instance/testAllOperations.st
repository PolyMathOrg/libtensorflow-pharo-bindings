testing graph
testAllOperations
	| graph pisTensor operations names |
	graph := TF_Graph create.
	pisTensor := TF_Tensor fromFloats: #(3.14 3.1415 3.141516).
	graph variable: 'var1' initialValue: pisTensor.
	graph variable: 'var2' initialValue: pisTensor.
	graph variable: 'var3' initialValue: pisTensor.
	operations := graph allOperations.
	self assert: operations size equals: 9.
	names := #(
				'var1' 'var1_initialValue' 'var1_initializer'
				'var2' 'var2_initialValue' 'var2_initializer'
				'var3' 'var3_initialValue' 'var3_initializer').
	names
		with: operations
		do: [ :name :op | self assert: name equals: op name ]