running
predict: inputs andCompareTo: label
	| results |
	results := session
		runInputs: {input input: 0. expectedLabel input: 0}
		values: {inputs asFloatTensor. label asFloatTensor}
		outputs: {prediction output: 0. loss output: 0}.
	^ results