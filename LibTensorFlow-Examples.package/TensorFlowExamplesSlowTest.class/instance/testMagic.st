testing - MNIST files
testMagic
	| images labels |
	images := MNISTImageFile testSet.
	labels := MNISTLabelFile testSet.
	self assert: images magic equals: MNISTImageFile magic.
	self assert: labels magic equals: MNISTLabelFile magic