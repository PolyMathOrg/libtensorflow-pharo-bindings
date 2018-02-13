initialization
initializeInferenceGraph
	hidden1 := graph
		fromBlock: [:image |
			input := image.
			(image * weights1 + biases1) sigmoid]
		named: 'layer1'.
	hidden2 := graph fromBlock: [(hidden1 * weights2 + biases2) sigmoid] named: 'layer2'.
	prediction := graph
		fromBlock: [
			netInput := hidden2 * weights3 + biases3.
			netInput findMaxOn: 1 asInt32Tensor]
		named: 'layer3'.
