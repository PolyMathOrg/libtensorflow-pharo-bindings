initialization
initializeLossGraph
	loss := graph
		fromBlock: [:expected |
			expectedLabel := expected.
			activation := netInput sparseSoftmaxCrossEntropyWithLogits: expected.
			activation meanOn: #(0) asInt32Tensor]
		inputTypes: {TF_Tensor typeInt32}
		named: 'loss'.