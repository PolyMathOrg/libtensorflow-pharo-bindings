testing - MNIST - 3Layers
testPrediction3LayersSigmoid
	|   loss plan result prediction |
	plan := MNIST3LayersNNSigmoid new.
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
	loss := (result at:2) asNumbers.
	self assert: (loss < 1).
	prediction := plan predict: images.
	self assert: prediction asNumbers equals: labels.
