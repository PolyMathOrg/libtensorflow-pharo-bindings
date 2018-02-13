testing MNIST
testMNISTSoftMaxLossGraph
	" Not sure how to test this better. weights are random, so output is random.
	I believe that choosing the right input value the output should comply with some statistics,
	however there are only 10 output valus, and I believe that's not enough to have statistical meaning"
	
	| mnist results |
	mnist := MNISTSoftMaxExamplePlan new.
	
	self 
		shouldnt: [
			results := mnist
				predict: {
					ByteArray new: mnist inputSize.
					(ByteArray new: mnist inputSize) + 1}
				andCompareTo: #(1 2).
				]
		raise: Error.

	self assert: {2} equals: results first shape.
	self assert: results first asNumbers first equals: 0.
	self assert: results first asNumbers second equals: 0.

	
	self assert: #() equals: results second shape.
	self assert: (results second allFloats sum abs > 0).