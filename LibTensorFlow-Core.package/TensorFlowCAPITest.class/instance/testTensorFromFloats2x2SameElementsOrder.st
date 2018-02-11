testing tensor
testTensorFromFloats2x2SameElementsOrder
	| tensor template values constTensor consts |
	template := #(
		(-1.1 -2.1)
		(-1.2 -2.2)).
		
	tensor := TF_Tensor fromFloats: template.
	values := tensor allFloats.
	
	constTensor := self get2x2FloatFromGraphDef.
	consts := constTensor allFloats.
	
	consts with: values do: [:const :value |
		self assert: (const closeTo: value)].