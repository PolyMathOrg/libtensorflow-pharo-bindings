testing tensor
testAsBooleanTensor
	self testAsBooleanTensor: true shape: #().
	self testAsBooleanTensor: #(true false true false) shape: #(4).
	self testAsBooleanTensor: #((true false true false) (false true false true)) shape: #(2 4).
