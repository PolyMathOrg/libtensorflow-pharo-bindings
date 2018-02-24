testing operation
testAttrGetBoolTrue
	| graph in op |
	graph := TF_Graph create.
	in := graph placeholder: 'in' type: TF_Tensor typeDouble.
	op := graph newOperation: 'QuantizeAndDequantize' named: 'out' described: [ :description | description addInput: (in output: 0) ].
	self assert: (op boolAt: 'signed_input') equals: true