testing - MNIST - SoftMax
testPrediction
	| loss plan prediction result |
	plan := MNISTSoftMaxExamplePlan new.
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) asNumbers .
	self deny: (loss closeTo: 0).
	100 timesRepeat: [
		plan predict: images andLearnFrom: labels].
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) asNumbers.
	self assert: 0 closeTo: loss.
	prediction := plan predict: images.
	self assert: prediction asNumbers first equals: labels first.
	self assert: prediction asNumbers second equals: labels second