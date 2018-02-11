testing operation
testGetAttrMetadataBoolean
	| graph in op template metadata |
	template := '1234567890abc'.
	graph := TF_Graph create.
	in := graph placeholder: 'in' type: TF_Tensor typeDouble.
	op := graph newOperation: 'AsString' named: 'out' described: [:description |
		description at: 'fill' putString: template.
		description addInput: (in output: 0)].
		
	metadata := op attrMetadata: 'scientific'.
	self assert: metadata isBoolean.
	self assert: metadata isList equals: false.
