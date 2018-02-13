running
predict: inputs andLearnFrom: label
	| results |
	results := session
		runInputs: {input input: 0. expectedLabel input: 0}
		values: {inputs asFloatTensor. label asInt32Tensor}
		outputs: {loss output. learnWeights output. learnBiases output}.
	^ results