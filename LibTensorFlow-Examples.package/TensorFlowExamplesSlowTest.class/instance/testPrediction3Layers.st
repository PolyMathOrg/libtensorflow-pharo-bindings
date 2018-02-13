testing - MNIST - 3Layers
testPrediction3Layers
	|   loss plan result prediction |
	plan := MNIST3LayersNNExamplePlan new.
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) allFloats.
	self deny: (loss first closeTo: 0).
	100 timesRepeat: [ |interval index im lb|
		interval := 1 to: images size.
		index := interval collect:[:i| interval atRandom].
		im := index collect:[:i| images at: i].
		lb := index collect:[:i| labels at: i].
		plan predict: im andLearnFrom: lb].
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) allFloats.
	self assert: (loss first closeTo: 0).
	prediction := plan predict: images.
	self assert: prediction asNumbers first equals: labels first.
	self assert: prediction asNumbers second equals: labels second