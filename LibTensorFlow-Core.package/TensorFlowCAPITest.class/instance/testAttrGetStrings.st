testing operation
testAttrGetStrings
	| graph template in op strings |
	graph := TF_Graph create.
	template := #('hola' 'como' 'estas?').
	in := graph const: 'in' value: (TF_Tensor fromFloats: 1).
	op := graph
		newOperation: 'DebugIdentity'
		named: 'out'
		described: [ :description | 
			description at: 'debug_urls' putStrings: template.
			description addInput: (in output: 0) ].
	strings := op stringsAt: 'debug_urls'.
	self assert: template equals: strings