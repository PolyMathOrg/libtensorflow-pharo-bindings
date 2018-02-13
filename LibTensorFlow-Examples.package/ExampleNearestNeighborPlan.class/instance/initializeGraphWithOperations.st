initialization
initializeGraphWithOperations
	| axis distance testing training prediction |
	graph := TF_Graph create.
	
	training := graph placeholder: 'training' type: TF_Tensor typeFloat.
	testing := graph placeholder: 'testing' type: TF_Tensor typeFloat.
	axis := 0 asInt32Tensor.
	
	distance := (testing - training) abs sumOn: axis.
	prediction := distance findMinOn: axis.
	
	outputs := {prediction output: 0}.
	inputs := {training input: 0. testing input: 0}.
