testing tensor
testTensorAsNumbers
	| tensor template array |
	template := #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16).
	tensor := TF_Tensor fromFloats: template shape: #(16).
	array := tensor asNumbers.
	self assert: template equals: array.
	tensor := TF_Tensor fromFloats: template shape: #(2 8).
	array := tensor asNumbers.
	self assert: #(#(1 2 3 4 5 6 7 8) #(9 10 11 12 13 14 15 16)) equals: array.
	tensor := TF_Tensor fromFloats: template shape: #(2 4 2).
	array := tensor asNumbers.
	self
		assert: #(#(#(1 2) #(3 4) #(5 6) #(7 8)) #(#(9 10) #(11 12) #(13 14) #(15 16)))
		equals: array