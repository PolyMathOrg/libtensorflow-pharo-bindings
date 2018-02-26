testing tensor
testTensorFromInt64s
	| tensor template values |
	template := #(16r1234567812345678 0 -12345678910111213).
	tensor := TF_Tensor fromInt64s: template.
	values := tensor allInt64s.
	self assert: tensor shape equals: #(3).
	self assert: tensor size equals: 3.
	self assert: tensor byteSize equals: 3 * 8.
	self assert: template equals: values