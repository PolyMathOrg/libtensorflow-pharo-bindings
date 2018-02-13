testing - MNIST files
testMagic
	| images labels |
	images := MNISTImageFile testSet.
	labels := MNISTLabelFile testSet.
	
	self assert: images magic = MNISTImageFile magic.
	self assert: labels magic = MNISTLabelFile magic.