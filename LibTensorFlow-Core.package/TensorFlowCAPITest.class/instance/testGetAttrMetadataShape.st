testing operation
testGetAttrMetadataShape
	| graph op template metadata |
	template := #(1 2 3 4 5).
	graph := TF_Graph create.
	op := graph 
		newOperation: 'Placeholder'
		named: 'const'
		described: [:description |
			description at: 'shape' putShape: template.
			description at: 'dtype' putType: TF_Tensor typeInt64].
		
	metadata := op attrMetadata: 'shape'.
	self assert: metadata isShape.
	self assert: metadata isList equals: false.
	self assert: metadata totalSize equals: template size.
