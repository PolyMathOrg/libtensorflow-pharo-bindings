testing operation
testAttrGetBoolTrue
	| graph in op input_min input_max |
	graph := TF_Graph create.
	in := graph placeholder: 'in' type: TF_Tensor typeDouble.
	input_min := graph placeholder: 'input_min' type: TF_Tensor typeDouble.
	input_max := graph placeholder: 'input_max' type: TF_Tensor typeDouble.
	op := graph newOperation: 'QuantizeAndDequantizeV2' named: 'out' described: [ :description | description addInput: (in output: 0).
		description addInput: (input_min output:0).
		description addInput: (input_max output:0)].
	self assert: (op boolAt: 'signed_input') equals: true