testing tensor
testTensorFromFloatsShape
	| tensor template values |
	template := #(1.23456 0.0 -1.234567 1.1).
	tensor := TF_Tensor fromFloats: template shape: #(2 2).
	values := tensor allFloats.
		
	self assert: tensor shape equals: #(2 2).
	self assert: tensor size equals: 4.
	self assert: tensor byteSize equals: (tensor size*4).
	template with: values do: [:templ :actual |
		self assert: (templ closeTo: actual)]
