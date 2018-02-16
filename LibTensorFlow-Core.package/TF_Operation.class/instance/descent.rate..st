ops other
descent: delta rate: learningRate
	^ self
		op: 'ApplyGradientDescent'
		withAll:
			{learningRate.
			delta}