testing tensor
testTensorFromInt32s
	| tensor template values |
	template := #(0 -1 1 -2 2 32768 65536 -1123123123).
	tensor := TF_Tensor fromInt32s: template.
	values := tensor allInt32s.
	self assert: tensor shape equals: {template size}.
	self assert: tensor size equals: template size.
	self assert: tensor byteSize equals: template size * 4.
	self assert: values equals: template