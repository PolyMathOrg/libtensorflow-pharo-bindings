running
predictOnTesting
	| images labels |
	images := imageTesting bytesAt: 1 take: imageTesting count.
	labels := labelTesting at: 1 take: labelTesting count.
	^ self predict: images andCompareTo: labels