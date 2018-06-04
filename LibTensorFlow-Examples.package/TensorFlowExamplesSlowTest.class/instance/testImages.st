testing - MNIST files
testImages
	| testing training |
	testing := MNISTImageFile testSet.
	training := MNISTImageFile trainingSet.
	
	self assert: testing count equals: 10000.
	self assert: training count equals: 60000.
	self assert: testing rows equals: 28.
	self assert: testing columns equals: 28.
	self assert: training rows equals: 28.
	self assert: training columns equals: 28.
	self assert: testing asTensor shape equals: {10000. 28*28}.
	self assert: training asTensor shape equals: {60000. 28*28}.