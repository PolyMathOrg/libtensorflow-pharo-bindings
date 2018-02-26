testing operation
testAttrGetTensor
	| op graph tensor |
	graph := self constantInt64Graph.
	op := graph operationNamed: 'a'.
	tensor := op tensorAt: 'value'.
	self assert: tensor type equals: TF_Tensor typeInt64.
	self assert: tensor shape equals: #().
	self assert: tensor allInt64s equals: #(16r4242424242424242).
	graph delete