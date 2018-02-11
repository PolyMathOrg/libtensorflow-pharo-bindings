binary operations
testOperationCastTo
	| graph template cast input result |
	
	template := #((1.1 1.2) (2.1 2.2)).	
	graph := TF_Graph create.
	
	input := graph const: template asFloatTensor.
	cast := input castTo: TF_Tensor typeInt32.

	result := graph runOutput: cast output.

	self assert: template truncated equals: result asNumbers.