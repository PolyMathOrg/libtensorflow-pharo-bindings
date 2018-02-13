initialization
initializeInferenceGraph
	hidden1 := graph
		fromBlock: [:image |
			input := image.
			(image * weights1 + biases1) rectified]
		named: 'layer1'.
	hidden2 := graph fromBlock: [(hidden1 * weights2 + biases2) sigmoid] named: 'layer2'.
	hidden3 := graph fromBlock: [(hidden2 * weights3 + biases3) sigmoid] named: 'layer3'.
	prediction := graph fromBlock: [hidden3 * weights4 + biases4] named: 'layer4'.
