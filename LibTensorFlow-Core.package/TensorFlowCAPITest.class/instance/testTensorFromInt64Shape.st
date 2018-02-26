testing tensor
testTensorFromInt64Shape
	| tensor template values |
	template := #(123456 0 -1234567 11).
	tensor := TF_Tensor fromInt64s: template shape: #(2 2).
	values := tensor allFloats.
	self assert: tensor type equals: TF_Tensor typeInt64.
	self assert: tensor shape equals: #(2 2).
	self assert: tensor size equals: 4.
	self assert: tensor byteSize equals: tensor size * 8.
	template with: values do: [ :templ :actual | self assert: (templ closeTo: actual) ]