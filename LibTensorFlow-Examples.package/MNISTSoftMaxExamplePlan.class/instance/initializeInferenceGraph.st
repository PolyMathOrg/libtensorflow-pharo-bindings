initialization
initializeInferenceGraph
	prediction := graph
		fromBlock: [:image |
			input := image.
			netInput := image * weights + biases.
			netInput softmax findMaxOn: 1 asInt32Tensor]
		named: 'inference'