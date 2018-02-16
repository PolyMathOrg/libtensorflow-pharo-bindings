testing operation
testGetAttrMetadataFloat
	| graph in op metadata |
	graph := TF_Graph create.
	in := graph placeholder: 'in' type: TF_Tensor typeFloat.
	op := graph newOperation: 'FakeQuantWithMinMaxArgs' named: 'out' described: [ :description | description addInput: (in output: 0) ].
	metadata := op attrMetadata: 'min'.
	self assert: metadata isFloat.
	self assert: metadata isList equals: false