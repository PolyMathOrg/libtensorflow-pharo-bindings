testing operation
testPlaceholderType: type
	| graph var session result tensor abs |
	graph := TF_Graph create.
	tensor := TF_Tensor type: type shape: #().
	var := graph placeholder: 'var' type: type.
	abs := graph newOperation: 'Abs' named: 'abs' described: [:description |
		description addInput: (var output: 0)].
	session := TF_Session on: graph.
	
	result := session
		runOperation: abs
		input: (var input: 0)
		value: tensor
		output: (abs output: 0).

	result delete.
