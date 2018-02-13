running
predict: inputs andLearnFrom: label
	| results |
	results := session
		runInputs: {input input: 0. expectedLabel input: 0}
		values: {inputs asFloatTensor. label asFloatTensor}
		outputs: {loss output:0. learn output}.
	^ results