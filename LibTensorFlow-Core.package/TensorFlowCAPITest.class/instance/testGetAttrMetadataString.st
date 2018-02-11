testing operation
testGetAttrMetadataString
	| graph in op template metadata |
	template := '1234567890abc'.
	graph := TF_Graph create.
	in := graph placeholder: 'in' type: TF_Tensor typeDouble.
	op := graph newOperation: 'AsString' named: 'out' described: [:description |
		description at: 'fill' putString: template.
		description addInput: (in output: 0)].
		
	self assert: (op stringAt: 'fill') equals: template.
	
	metadata := op attrMetadata: 'fill'.
	self assert: metadata isString.
	self assert: metadata isList equals: false.
	self assert: metadata totalSize equals: template size.
