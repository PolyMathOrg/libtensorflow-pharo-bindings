testing tensor
testTensorFromInt32Shape
	| tensor template values |
	template := #(123456 0 -1234567 11).
	tensor := TF_Tensor fromInt32s: template shape: #(2 2).
	values := tensor allFloats.
	self assert: tensor type equals: TF_Tensor typeInt32.
	self assert: tensor shape equals: #(2 2).
	self assert: tensor size equals: 4.
	self assert: tensor byteSize equals: tensor size * 4.
	template with: values do: [ :templ :actual | self assert: (templ closeTo: actual) ]