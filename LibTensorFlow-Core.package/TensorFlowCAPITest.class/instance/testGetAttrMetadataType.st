testing operation
testGetAttrMetadataType
	| graph op template metadata |
	template := #(1 2 3 4 5).
	graph := TF_Graph create.
	op := graph
		newOperation: 'Placeholder'
		named: 'const'
		described: [ :description | 
			description at: 'shape' putShape: template.
			description at: 'dtype' putType: TF_Tensor typeInt64 ].
	metadata := op attrMetadata: 'dtype'.
	self assert: metadata isType.
	self assert: metadata isList equals: false