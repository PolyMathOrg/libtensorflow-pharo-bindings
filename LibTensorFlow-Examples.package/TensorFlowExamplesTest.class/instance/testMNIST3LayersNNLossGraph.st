testing MNIST
testMNIST3LayersNNLossGraph
	" Not sure how to test this better. weights are random, so output is random.
	I believe that choosing the right input value the output should comply with some statistics,
	however there are only 10 output valus, and I believe that's not enough to have statistical meaning"

	| mnist results first second |
	mnist := MNIST3LayersNNExamplePlan new.
	results := mnist
		predict:
			{(ByteArray new: mnist inputSize).
			((ByteArray new: mnist inputSize) + 1)}
		andCompareTo: #(1 2).
	self assert: {2} equals: results first shape.
	first := results first asNumbers first.
	second := results first asNumbers second.
	self assert: (0 <= first and: [ first < 10 ]).
	self assert: (0 <= second and: [ second < 10 ]).
	self assert: #() equals: results second shape.
	self assert: results second asNumbers > 0