running
predict: inputs andCompareTo: label
	| results |
	results := session
		runInputs: {input input: 0. expectedLabel input: 0}
		values: {inputs asFloatTensor. label asInt32Tensor}
		outputs: {prediction output. loss output}.
	^ results