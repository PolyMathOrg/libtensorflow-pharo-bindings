initialization
initializeGraphWithOperations
	| x y prediction |
	super initializeGraph.
	
	x := graph placeholder: 'x' type: TF_Tensor typeFloat.
	y := graph placeholder: 'y' type: TF_Tensor typeFloat.
	
	prediction := (x \* x) inverse * (x \* y).
	
	outputs := {prediction output: 0}.
	inputs := {x input: 0. y input: 0}.