running
predictOnTraining
	| images labels |
	images := imageSet bytesAt: 1 take: 10 * batchSize.
	labels := labelSet at: 1 take: 10 * batchSize.
	^ self predict: images andCompareTo: labels