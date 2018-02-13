initialization
initializeGraph
	| activation inputVariable netInput weights |
	super initializeGraph.
	inputVariable := graph placeholder: 'Input' type: TF_Tensor typeFloat.
	weights := graph placeholder: 'weights' type: TF_Tensor typeFloat.
	netInput := weights * inputVariable.
	activation := netInput sigmoid.
	outputs := {activation output: 0}.
	inputs := {inputVariable input: 0. weights input: 0}