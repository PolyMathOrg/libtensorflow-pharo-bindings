initialization
initializeInferenceGraph
	hidden1 := graph
		fromBlock: [:image |
			input := image.
			(image * weights1 + biases1) rectified]
		named: 'layer1'.
	hidden2 := graph fromBlock: [(hidden1 * weights2 + biases2) rectified] named: 'layer2'.
	prediction := graph
		fromBlock: [
			netInput := hidden2 * weights3 + biases3.
			netInput softmax findMaxOn: 1 asInt32Tensor]
		named: 'layer3'.
