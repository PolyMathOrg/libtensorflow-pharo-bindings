testing MNIST
testMNISTSoftMaxForwardGraph
	" Not sure how to test this better. weights are random, so output is random.
	I believe that choosing the right input value the output should comply with some statistics,
	however there are only 10 output valus, and I believe that's not enough to have statistical meaning"

	| mnist result |
	mnist := MNISTSoftMaxExamplePlan new.
	result := mnist
		predict:
			{(ByteArray new: mnist inputSize).
			((ByteArray new: mnist inputSize) + 1)}.
	self assert: {2} equals: result shape.
	self assert: (result allInt32s first closeTo: 0).
	self assert: (result allInt32s second closeTo: 0)