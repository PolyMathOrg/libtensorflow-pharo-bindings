initialization
initializeForwardGraph
	| input |
	input := graph placeholder: 'Input' type: TF_Tensor typeFloat.
	
	activation := (weights * input) sigmoid.
	
	outputs := {activation output: 0}.
	inputs := {input input: 0}