testing operation
testAttrSetString: aString
	| graph in op copy |
	graph := TF_Graph create.
	copy := aString asByteArray.
	
	in := graph placeholder: 'in' type: TF_Tensor typeDouble.
	op := graph newOperation: 'AsString' named: 'out' described: [:description |
		description at: 'fill' putString: copy.
		description addInput: (in output: 0)].
	
	copy at: 1 put: 65.	"Change Smalltalk String to see if TensorFlow makes a copy"	
	
	self assert: (op stringAt: 'fill') equals: aString.
