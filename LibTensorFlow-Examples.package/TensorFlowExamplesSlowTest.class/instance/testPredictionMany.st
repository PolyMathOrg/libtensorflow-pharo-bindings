testing - MNIST - SoftMax
testPredictionMany
	| imageSet images labelSet labels loss plan result prediction n |
	n := 200.
	
	plan := MNISTSoftMaxExamplePlan new.
	imageSet := MNISTImageFile testSet.
	labelSet := MNISTLabelFile testSet.
	
	images := (1 to: n) collect: [:i | imageSet bytesAt: i].
	labels := (1 to: n) collect: [:i | labelSet at: i].
	
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) asNumbers.
	self deny: (loss closeTo: 0).
	100 timesRepeat: [
		plan predict: images andLearnFrom: labels].
	
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) asNumbers.
	self assert: (loss closeTo: 0).
	
	prediction := plan predict: images.
	self assert: prediction asNumbers equals: labels.
