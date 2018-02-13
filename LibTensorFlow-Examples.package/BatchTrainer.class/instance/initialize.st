initialization
initialize
	super initialize.
	batchSize := 100.
	imageSet := MNISTImageFile trainingSet.
	labelSet := MNISTLabelFile trainingSet.
	imageTesting := MNISTImageFile testSet.
	labelTesting := MNISTLabelFile testSet.
	self use3Layers