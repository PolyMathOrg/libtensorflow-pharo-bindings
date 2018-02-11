testing tensor
testTensorFromFloatsShapeUndefinedSize
	| template |
	template := #(1.23456 0.0 -1.234567 1.1).
	
	self
		should: [TF_Tensor fromFloats: template shape: #(2 2 -1)]
		raiseError: 'Inferred size and real size don''t match.'.