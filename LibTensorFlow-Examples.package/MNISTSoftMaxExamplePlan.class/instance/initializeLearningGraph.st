initialization
initializeLearningGraph
	| learningRate activationGradient biasGradient |
	graph
		fromBlock: [ | batchSize |
			learningRate := 0.9 asTensor.
			activationGradient := activation useOutput: 1.
			biasGradient := activationGradient meanOn: #(0) asInt32Tensor.
			batchSize := (input sizeOn: 0) castTo: TF_Tensor typeFloat.
			learnWeights := weights descent: input \* activationGradient @/ batchSize rate: learningRate.
			learnBiases := biases descent: biasGradient rate: learningRate]
		named: 'learning'