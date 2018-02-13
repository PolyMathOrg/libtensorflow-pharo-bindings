initialization
initializeLossGraph
	loss := graph
		fromBlock: [ :expected |
			expectedLabel := expected.
			(prediction - expectedLabel) squared meanOn: #(0) asInt32Tensor ]
		inputTypes: {TF_Tensor typeFloat}
		named: 'loss'.