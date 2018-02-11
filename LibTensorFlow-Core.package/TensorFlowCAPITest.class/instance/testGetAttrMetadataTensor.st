testing operation
testGetAttrMetadataTensor
	| graph op template metadata |
	template := #(1 2 3 4 5).
	graph := TF_Graph create.
	op := graph const: 'const' value: (TF_Tensor fromInt64s: template).
		
	metadata := op attrMetadata: 'value'.
	self assert: metadata isTensor.
	self assert: metadata isList equals: false.
