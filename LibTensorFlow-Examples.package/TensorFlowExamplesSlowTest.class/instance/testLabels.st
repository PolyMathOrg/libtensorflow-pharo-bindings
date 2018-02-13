testing - MNIST files
testLabels
	| test training |
	test := MNISTLabelFile testSet.
	training := MNISTLabelFile trainingSet.
	
	self assert: test count equals: 10000.
	self assert: training count equals: 60000.