graphs
constantInt64Graph
	| graph operation constant |
	graph := TF_Graph create.
	constant := TF_Tensor fromInt64: 16r4242424242424242.
	operation := graph const: 'a' value: constant.
	self deny: operation isNull.
	^ graph