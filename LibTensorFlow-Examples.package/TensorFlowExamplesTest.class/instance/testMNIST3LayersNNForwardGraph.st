testing MNIST
testMNIST3LayersNNForwardGraph
	" Not sure how to test this better. weights are random, so output is random.
	I believe that choosing the right input value the output should comply with some statistics,
	however there are only 10 output valus, and I believe that's not enough to have statistical meaning"
	
	| mnist result first second |
	mnist := MNIST3LayersNNExamplePlan new.
	
	self 
		shouldnt: [
			result := mnist predict: {
				(ByteArray new: mnist inputSize) + 2.
				(ByteArray new: mnist inputSize) + 1.
			}]
		raise: Error.

	self assert: {2} equals: result shape.
	first := result asNumbers first.
	second := result asNumbers second.
	self assert: (0 <= first and: [ first < 10 ]).
	self assert: (0 <= second and: [ second < 10 ]).